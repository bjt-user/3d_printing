//helper modules for cubes and squares with fillets

$fn=40;

module smooth_cube(length,width,height,filletradius) {
  platelength=length;
  platewidth=width;
  plateheight=height;
  filletradius=filletradius;

  minkowski() {
  cube(
  [platelength-filletradius*2,
  platewidth-filletradius*2,
  plateheight/2]);

  translate([filletradius,filletradius,0]) {
    cylinder(plateheight/2,
      filletradius,
      filletradius);
    }
  }
}

module smooth_square(length,width,filletradius) {
  minkowski() {
    square([length-2*filletradius,width-2*filletradius]);
    translate([filletradius,filletradius,0]) {
      circle(r=filletradius);
    }
  }
}

module smooth_centered_square(length,width,filletradius) {
  minkowski() {
    square([length-2*filletradius,width-2*filletradius],center=true);
    translate([0,0,0]) {
      circle(r=filletradius);
    }
  }
}

//smooth_square(10,10,1);

smooth_centered_square(10,10,2);
