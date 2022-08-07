LONG=180;
SHORT=60;
WHEEL_POSITIONING_RADIUS = 55;
WHEEL_OFFSET = 21;
SLOT=22; // Should be calculated!!
HEIGHT_L=(LONG/2+SHORT)/sqrt(3);
HEIGHT_S=2*sqrt(pow(LONG/2+SHORT,2)/3) - sqrt(3*pow(SHORT,2)/4);
H1=10;
H2=19;
R=3;

module delta_plate_outline(h) {
  hull() {
    // Outer contour
    for (a = [90:120:360]) rotate([0,0,a+60]) {
      translate([HEIGHT_L-R,-LONG/2+R/sqrt(3),0]) cylinder(r=R, h=h);
      translate([HEIGHT_L-R,LONG/2-R/sqrt(3),0]) cylinder(r=R, h=h);
    }
  }
}

module delta_plate_cutout(h) {
  hull() {
    // Inner cutout
    for (a = [90:120:360])  rotate([0,0,a]) {
      translate([HEIGHT_S-40-R,-30+R,0]) cylinder(r=R,h=h);
      translate([HEIGHT_S-40-R,30-R,0]) cylinder(r=R,h=h);
    }
  }
  for (a = [90:120:360]) rotate([0,0,a]) {
    // Room for delta arms
    hull() {
      translate([HEIGHT_S-32-R,-30+R,0]) cylinder(r=R,h=h);
      translate([HEIGHT_S-32-R,-17-R,0]) cylinder(r=R,h=h);
      translate([HEIGHT_S-40-R,-30+R,0]) cylinder(r=R,h=h);
      translate([HEIGHT_S-40-R,-17-R,0]) cylinder(r=R,h=h);
    }
    hull() {
      translate([HEIGHT_S-32-R,17+R,0]) cylinder(r=R,h=h);
      translate([HEIGHT_S-32-R,30-R,0]) cylinder(r=R,h=h);
      translate([HEIGHT_S-40-R,17+R,0]) cylinder(r=R,h=h);
      translate([HEIGHT_S-40-R,30-R,0]) cylinder(r=R,h=h);
    }
  }
}
module delta_plate_motor_cutout(h) {
  for (a = [90:120:360]) rotate([0,0,a]) {
    translate([HEIGHT_S-40,-40/2,0]) cube([40,40,h]);
  }
}

module wheel_plate_mounting(h, d=3.1) {
  for (a = [90:120:360]) {
    rotate([0,0,a+60]) {
      // Wheel plate mounting
      for (xy =[[-LONG/2+10,10],
                [-LONG/2+40,15],
                [0,15],
                [LONG/2-40,15],
                [LONG/2-10,10]]) {
        x = xy[0];
        y = xy[1];
        translate([HEIGHT_L-y,x,0]) cylinder(d=d, h=h);
      }
    }
  }
  
}

module delta_plate() {
  difference() {
    delta_plate_outline(h=H1);
    translate([0,0,-0.1]) delta_plate_cutout(h=H1+0.2);
    translate([0,0,-0.1]) wheel_plate_mounting(h=H1+0.2);
    for (a = [90:120:360]) {
      rotate([0,0,a]) {
        // Motor mounting
        for (x = [-8,-16,-32]) {
          for (y = [-6,6]) {
            translate([HEIGHT_S+x,y,-0.1]) cylinder(d=2.7, h=H1+0.2);
            translate([HEIGHT_S+x,y,-0.1]) cylinder(d=5, h=3+0.1);
            translate([HEIGHT_S+x,y,H1-3]) cylinder(d=5, h=3+0.1);
          }
        }
      }
      if (false) rotate([0,0,a+60]) {
        // Wheel fixture mounting
        translate([HEIGHT_L-10,-80,-0.1]) cylinder(d=3.1, h=H1+0.2);
        translate([HEIGHT_L-10,80,-0.1]) cylinder(d=3.1, h=H1+0.2);
        translate([HEIGHT_L-15,-50,-0.1]) cylinder(d=3.1, h=H1+0.2);
        translate([HEIGHT_L-15,0,-0.1]) cylinder(d=3.1, h=H1+0.2);
        translate([HEIGHT_L-15,50,-0.1]) cylinder(d=3.1, h=H1+0.2);
      }
    }
  }
}

module wheel_positioning(h, d, slot) {
  translate([LONG/2, slot+67,0]) {
    cylinder(d=d, h=h);
    for (b = [-180:15:0]) rotate([0,0,b]) {
     translate([WHEEL_POSITIONING_RADIUS,0,0]) cylinder(d=d, h=h);
    }
  }
}

module wheel_plate(upper) {
  H3=(H2-H1)/2;
  difference() {
    union() {
      hull() {
        // Fastening plate outline
        cube([LONG,SLOT,H3]);
        translate([(LONG-2*67)/2,SLOT+67+10-0.1,0]) cube([2*67-0.1,0.1,H3]);
      }
      // Cantilever beams
      hull() {
        cube([10,SLOT,H2/2]);
        translate([(LONG-2*67)/2,SLOT+67+10-0.1,0]) cube([10,0.1,H2/2]);
      }
      translate([LONG,0,0]) mirror([1,0,0]) hull() {
        cube([10,SLOT,H2/2]);
        translate([(LONG-2*67)/2,SLOT+67+10,0]) cube([10,0.1,H2/2]);
      }
      translate([(LONG-2*67)/2,SLOT+67,0]) hull() {
        cube([10,10,H2/2]);
        translate([(2*67-10),0,0]) cube([10,10,H2/2]);
      }
      // Wheel positioning enforcement
      wheel_positioning(h=H2/2, d=8, slot=SLOT);
    }
    // Fastening cutouts (different orientation, hence rotation)
    rotate([0,0,180]) translate([-LONG/2,HEIGHT_L-SLOT,0]) {
      translate([0,0,H3]) delta_plate_outline(h=H1);
      translate([0,0,-0.1]) delta_plate_cutout(h=H2/2+0.2);
      translate([0,0,-0.1]) delta_plate_motor_cutout(h=H2/2+0.2);
      if (upper) {
        translate([0,0,-0.1]) wheel_plate_mounting(h=3.1, d=5.6);
        translate([0,0,3.2]) wheel_plate_mounting(h=H2/2-3.1);
      } else {
        translate([0,0,-0.1]) wheel_plate_mounting(h=2.6+0.1, d=6.21, $fn=6);
        translate([0,0,2.4]) wheel_plate_mounting(h=H2/2-2.2);
      }
    }
    // Wheel positioning cutouts
    translate([0,0,-0.1]) wheel_positioning(h=H2+0.2, d=3.1, slot=SLOT);
    CORNERS = [[(LONG-2*67)/2+5,SLOT+67+5,0],
               [LONG-(LONG-2*67)/2-5,SLOT+67+5,0]];
    for (p = CORNERS) {
      if (upper) {
        translate(p+[0,0,-0.1]) cylinder(h=3.1, d=5.6);
        translate(p+[0,0,3.2]) cylinder(d=3.1, h=H2/2-3.1);
      } else {
        translate(p+[0,0,-0.1]) cylinder(h=2.6+0.1, d=6.21, $fn=6);
        translate(p+[0,0,2.4]) cylinder(d=3.1, h=H2/2-2.2);
      }
    }
  }
}

module wheel_motor_bed(h) {
  difference() {
    hull() {
      translate([0,0,0]) cylinder(d=12, h=h);
      translate([WHEEL_OFFSET,-28.5/2,0]) cube([34,28.5,h]);
      translate([WHEEL_POSITIONING_RADIUS,0,0]) cylinder(d=12, h=h);
    }
    translate([WHEEL_OFFSET,0,0]) {
      translate([11,8,-0.1]) cylinder(d=2.7, h=h);
      translate([11,8,2]) cylinder(d=5, h=h);
      translate([11,-8,-0.1]) cylinder(d=2.7, h=h);
      translate([11,-8,2]) cylinder(d=5, h=h);
      translate([11+12,8,-0.1]) cylinder(d=2.7, h=h);
      translate([11+12,8,2]) cylinder(d=5, h=h);
      translate([11+12,-8,-0.1]) cylinder(d=2.7, h=h);
      translate([11+12,-8,2]) cylinder(d=5, h=h);
    }
    translate([0,0,h-4+0.2]) cylinder(d=3.2, h=h-4);
    translate([0,0,-0.1]) cylinder(d=6.21, h=h-4, $fn=6);
    translate([WHEEL_POSITIONING_RADIUS,0,h-4+0.2]) cylinder(d=3.2, h=h-4);
    translate([WHEEL_POSITIONING_RADIUS,0,-0.1]) cylinder(d=6.21, h=h-4, $fn=6);
  }
}


_PART = undef;

$fn=100;

if (_PART == "delta-plate" || _PART == undef) {
  translate([0,HEIGHT_L,0]) delta_plate();
}

if (_PART == "wheel-fixture-upper" || _PART == undef) {
  translate([LONG/2+30,0,0]) wheel_plate(upper=true);
}

if (_PART == "wheel-fixture-lower" || _PART == undef) {
  translate([3*LONG/2+40,0,0]) wheel_plate(upper=false);
}

if (_PART == "wheel_motor_bed" || _PART == undef) {
  translate([0,-20,0]) wheel_motor_bed(h=10);
}