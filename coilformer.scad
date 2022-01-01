$fn=40;

BOTTOML=25; //bottom length
BOTTOMW=25; //bottom width
BOTTOMH=2;  //bottom height
WLENGTH=2.5;  //length of the wire pockets
WWIDTH=2.5;  //width of the wire pockets
WDISTANCE=6;  //distance between the wire pockets
FERRITEW=10.5;  //width of the ferrite core
FERRITEWALL=3; //thickness of the ferrite wall
BODYH=20; //height of the holed_cylinder module
INNERR=5.25; //radius of the ferrite middle part
OUTTERR=7.5;  //outter radius of the holed_cylinder
TOPR=11;  //outter radius of the top part

module holed_cylinder() {
  linear_extrude(BODYH) {
    difference() {
      circle(r = OUTTERR);
      circle(r = INNERR);
    }
  }
}

translate([0,0,BOTTOMH]) {
  holed_cylinder();
}

module bottom() {
  linear_extrude(BOTTOMH) {
    difference() {
      translate([BOTTOML/4,0,0]) {
        square([BOTTOML/2,BOTTOMW], center=true);
      }
      
      translate([BOTTOML/2-WLENGTH/2,WDISTANCE,0]) {
        square([WLENGTH,WWIDTH], center=true);
      }
      translate([BOTTOML/2-WLENGTH/2,0,0]) {
        square([WLENGTH,WWIDTH], center=true);
      }
      translate([BOTTOML/2-WLENGTH/2,-WDISTANCE,0]) {
        square([WLENGTH,WWIDTH], center=true);
      }
      
      translate([0,BOTTOMW/2-FERRITEWALL,0]) {
        square([FERRITEW/2,FERRITEWALL]);
      }
      translate([0,-BOTTOMW/2,0]) {
        square([FERRITEW/2,FERRITEWALL]);
      }
      circle(r = INNERR);
    }
  }
}

bottom();

mirror([1,0,0]) {
  bottom();
}

module top() {
  translate([0,0,BOTTOMH+BODYH]) {
    difference() {
      linear_extrude(2) {
        difference() {
          circle(r = TOPR);
          circle(r = INNERR);
        }
      }
      translate([0,0,1]) {
        linear_extrude(1) {
          square([FERRITEW,TOPR*2],center = true);
        }
      }
    }
  }
}

top();