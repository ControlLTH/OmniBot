# general
from time import sleep

#server
import socket
        
class ServoClient(object):
    """
    A class that implements a servo-client which is capable of sending servo speed-settings
    to an omnibot. 

    HOST: Host name of server (string)
    PORT: Port to connect to (int)
    verbose: choose level of chit-chat (boolean)
    """
    def __init__(self,HOST,PORT,verbose=False):
        self.HOST = HOST
        self.PORT = PORT
        self.verbose=verbose
        self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    def __enter__(self):
        """
        Boot up the socket and connect to the servo server
        """
        if self.verbose:
            print("Connecting to HOST: " + str(self.HOST) + ", PORT: " + str(self.PORT))

        self.s.connect((self.HOST, self.PORT)) # Connect to the robot
        if self.verbose:
            print("Connection successful.")

        sleep(0.1)# sleep to let servos boot
        return self
    
    def __exit__(self, exc_type, exc_value, exc_tb):
        """
        Close down the socket after closing the client
        """
        if self.verbose:
            print("Closing down socket")
        self.s.close()
    
    def get_max_velocity(self):
        """TODO: function for retreving max velocity of servos"""
        pass

    def set_speed(self,i,v):
        """
        Set the speed of servo i to v
        """
        package = str(i)+":"+str(v)
        if self.verbose:
            print("Sending " + package)

        # Send the package                      
        self.s.sendall(bytes(package,'utf-8'))
        # Receive confirmation
        ret=self.s.recv(1024).decode('utf-8')
        if ret[0] == "e":
            raise Exception(ret)
        elif self.verbose:
            print(ret)
