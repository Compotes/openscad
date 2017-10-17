use <Holes.scad>;
use <JMP-wheels.scad>;
$fa = 5;
$fs = 0.5;

module screw(type = 2, r1 = 15, r2 = 20, n = 7, h = 100, t = 8)
{
  linear_extrude(height = h, twist = 360*t/n, convexity = t)
  difference() {
    circle(r2);
    for (i = [0:n-1]) {
        if (type == 1) rotate(i*360/n) polygon([
            [ 2*r2, 0 ],
            [ r2, 0 ],
            [ r1*cos(180/n), r1*sin(180/n) ],
            [ r2*cos(360/n), r2*sin(360/n) ],
            [ 2*r2*cos(360/n), 2*r2*sin(360/n) ],
        ]);
        if (type == 2) rotate(i*360/n) polygon([
            [ 2*r2, 0 ],
            [ r2, 0 ],
            [ r1*cos(90/n), r1*sin(90/n) ],
            [ r1*cos(180/n), r1*sin(180/n) ],
            [ r2*cos(270/n), r2*sin(270/n) ],
            [ 2*r2*cos(270/n), 2*r2*sin(270/n) ],
        ]);
    }
  }
}

module nut(type = 2, r1 = 16, r2 = 21, r3 = 30, s = 6, n = 7, h = 100/5, t = 8/5)
{
  difference() {
    cylinder($fn = s, r = r3, h = h);
    translate([ 0, 0, -h/2 ]) screw(type, r1, r2, n, h*2, t*2);
  }
}

module hub(height){
	color([0.2, 0.2, 0.2, 1]) translate([0, 0, height/2]) difference(){
		union(){
			cube([32.37, 34.21, height], center = true);
			translate([15.345,14.32,-3.975]) difference(){
				cube([height, 5.63, 6.27], center = true);
				rotate([0, 90, 0]) translate([0,0,-1]) hole_for_screw_M3(2);

			}
			translate([15.345,-14.32,-3.975]) difference(){
				cube([height, 5.63, 6.27], center = true);
				rotate([0, 90, 0]) translate([0,0,-1]) hole_for_screw_M3(2);

			}
			translate([-15.345,14.32,-3.975]) difference(){
				cube([height, 5.63, 6.27], center = true);
				rotate([0, 90, 0]) translate([0,0,-1]) hole_for_screw_M3(2);

			}
			translate([-15.345,-14.32,-3.975]) difference(){
				cube([height, 5.63, 6.27], center = true);
				rotate([0, 90, 0]) translate([0,0,-1]) hole_for_screw_M3(2);

			}
		}
		translate([16.4625,0,0]) cube([12.245, 22.52, height+0.1], center = true);
		translate([-16.4625,0,0]) cube([12.245, 22.52, height+0.1], center = true);
		translate([0,14.32,0]) cube([10.47, 5.97, height+0.1], center = true);
		translate([0,-14.32,0]) cube([10.47, 5.97, height+0.1], center = true);
	}
}

module oska(height, diametre){
	rotate([0, 0, $t*360]){
		color([0.9, 0.9, 0.9, 1]) difference(){
			cylinder(h = height, d = diametre, $fn=6);
			translate([0, 0, 1.00]) hole_for_screw_M3(height);
			//#screw();
		}
		wheel();
	}
}

module prevodovka(h1, h2, h3){
	color([0.15, 0.15, 0.15, 1]){
		translate([0, 0, h3]) {
			translate([0, 0, h2]) {
				 cylinder(h = h1, d = 16.17);
			}
			cylinder(h = h2, d = 20.13);
		}
		translate([0, 0, h3/2]) {
			difference(){
				cube([24.77, 34.21, h3], center = true);
				translate([16.4625,0,0]) cube([12.245, 22.52, 3.15], center = true);
				translate([-16.4625,0,0]) cube([12.245, 22.52, 3.15], center = true);
				translate([0,14.32,0]) cube([10.47, 5.97, 3.15], center = true);
				translate([0,-14.32,0]) cube([10.47, 5.97, 3.15], center = true);
			}
		}
	}
}

module motor(){
	translate([3.135, 0, 16.185]) rotate([0, 90, 0]) translate([0, 0, -29.44]) {
		translate([0, 0, 29.44]) {
			translate([0, 0, 1.68]) {
				translate([0, 0, 15.17]) {
					oska(10.80, 6.92);
				}
				prevodovka(3.00, 9.12, 3.05);
			}
			hub(1.68);
		}
		color([0.3, 0.3, 0.3, 1]) cylinder(h = 29.44, d = 24.52);
	}
}

motor();
