import numpy as np
import sys
from time import time, sleep
import logging

# Dynamixel packages
from dynamixel.model.xm430_w210_t_r import XM430_W210_T_R
import dynamixel.channel
VEL_MAX = 1022 #maximum velocity set-point (max possible value is 1022)

#server
import socket

def load_servos():
    """
    Servo load function, based on the dynamixel implementation of Anders Blomdell.
    """

    # The speed and channel numbers can be found and checked via the dynamixel software "dynamixel wizard".
    # The device can be found by e.g. lsusb, and is currently adapted for the three-color robots.
    channel = dynamixel.channel.Channel(speed=57600,device='/dev/ttyACM0')
    servos = [ XM430_W210_T_R(channel, 1),
               XM430_W210_T_R(channel, 2),
               XM430_W210_T_R(channel, 3) ]
    clear_servos(servos)
        
    return servos
  
def clear_servos(servos):
    """
    Clear whatchdog error and write maximum velocity to the servos.z
    """
    for s in servos:
        s.torque_enable.write(0)
        print(s.model_number.read(), s.id.read())
        s.velocity_limit.write(VEL_MAX+1) # +1 for padding because it seemed to struggle with negative values
        s.operating_mode.write(1)
        s.bus_watchdog.write(0) # Clear old watchdog error
        s.bus_watchdog.write(100) # 2 second timeout
        s.torque_enable.write(1)

if __name__ == "__main__":

    # Set IP (HOST) and port number (PORT)
    # "" means listening to any available IP
    HOST, PORT = "", 9998
    
    # Define loggin format
    format = "%(asctime)s: %(message)s"
    logging.basicConfig(format=format, level=logging.INFO,datefmt="%H:%M:%S")
    
    # Create socket s
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((HOST, PORT)) # Bind the socket to specified port and ip
        s.listen(1)          # Start listening for connections
        logging.info("Waiting for connection")
        while True:
            conn, addr = s.accept() # Wait for connection

            with conn:              # Connection received
                logging.info(f"Connection with {addr}")
                logging.info("Loading servos")
                servos = load_servos() # Load the servos

                while True:
                    data = conn.recv(1024)
                    if not data:
                        logging.info("Empty input, stopping connection")
                        break    

                    try:
                        inp = data.decode('utf-8')
                        logging.info(f"Received {inp}")
                        i = int(inp[0])
                        v = int(inp[2:])

                        # Check if received velocity is out of range. If so, return
                        # info that velocity was changed
                        if np.abs(v) > VEL_MAX:
                            conn.sendall(b"i:velocity")
                            v = VEL_MAX*np.sign(v)
                        else:
                            conn.sendall(data)
                        servos[i].goal_velocity.write(v)

                    except Exception as e:
                        # If an exception is encountered, send it to the client.
                        logging.info(f"Exception encountered: {e}")
                        message = "e:"+str(e)
                        conn.sendall(message.encode('utf-8'))
                    
                