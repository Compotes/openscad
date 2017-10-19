use <Holes.scad>;
use <JMP-BE-3561.scad>;
use <jetson_plus_carrierboard.scad>
$fa = 5;
$fs = 0.5;


color([1, 0.5, 0, 1]) translate([-117.5, 0, 30]) sphere(d=65);
translate([0, 0, 180]) cylinder(h = 40.00, r1 = 0, r2 = 65);
color([0.1, 0.1, 0.1, 1]) cylinder(h = 5.00, d = 220.00);
translate([0, 0, 5]){
	translate([-85, 35, 50]){
		rotate([0, 0, 90]) translate([-35, -27.105, -25]) motor();
		rotate([90, 0, 0]) cylinder(h = 70.00, d = 20.00);
	}
	color([0, 0.2, 0.9, 1]) rotate([0, 0, 120]) translate([-80, 0, 34/2]) cube([27, 113, 34], center = true);
	color([0, 0.9, 0, 1]) rotate([0, 0, 120]) translate([-50, 0, 16.5]) cube([30, 66, 33], center = true);

	//#rotate([0, 0, 240]) translate([-70, 0, 28]) cube([50, 87, 56], center = true);
	rotate([0, 0, 240]) translate([-70, 0, 0]) rotate([0,0,90]) jetson_with_carrierboard();
	for(i = [0, 120, 240]){
		rotate([0, 0, i]) translate([60, 0, 0]) {
			motor();
		}
	}
}
