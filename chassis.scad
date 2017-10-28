use <holes.scad>;
use <JMP-BE-3561.scad>;
use <MC031CG-SY-UB.scad>
use <jetson_plus_carrierboard.scad>
use <battery.scad>
use <Kicker.scad>
$fa = 5;
$fs = 0.5;

ball_imbedding = 25;
ball_radius = 37.5;
kicker_angle = 14;
chassis_radius = 107.5;

color([1, 0.5, 0, 1]) translate([-(215+65)/2+25, 0, 65/2]) sphere(d=65);
//translate([0, 0, 180]) cylinder(h = 40.00, r1 = 0, r2 = 65);
translate([0,0,4.5]) color([0.1, 0.1, 0.1, 1]) difference() {
	cylinder(h = 5.00, d = 215.00);
	for(i = [0, 120, 240]){
		rotate([0, 0, i]) translate([95, 0, 2.5]) {
			cube([30,55,10], center = true);
		}
	}
}

/*color([0.1, 0.1, 0.1, 1]) difference(){
	cylinder(h = 5.00, d = 215.00);
	translate([0,0,-0.5]) cylinder(h = 6.00, d = 190.00);
}*/
translate([0, 0, 9.5]){
	camera();
	color([0.1, 0.8, 0.1, 1]) {
		difference(){
		cylinder(h = 1.00, d = 170.00);
		for(i = [0, 120, 240]){
			rotate([0, 0, i]){
				translate([95, 0, 2.5]) cube([30,55,10], center = true);
				translate([50, 0, 2.5]) cube([35,26,10], center = true);
				translate([60, 0, 0]) cube([10, 40, 10], center = true);
			}
		}
		translate([-215/2+25, 0, 4]) rotate([0,0, 90]) {
			kicker (65/2, 14);
		}
		translate([-40, 0, 2.5]) cube([56, 25, 10], center = true);


	}
	rotate([0, 0, 120]) translate([-50, 0, 16.5]) cube([30, 66, 33], center = true);
	}
	translate([-85, 35, 50]){
		rotate([0, 0, 90]) translate([-35, -27.105, -25]) motor(false);
		rotate([90, 0, 0]) cylinder(h = 70.00, d = 20.00);
	}
	/*rotate([0, 0, 90])
	translate ([0, 110 - ball_imbedding, 13.6]) {
        construction_of_kicker (ball_imbedding, ball_radius,
                                chassis_radius, kicker_angle,
                                light_sensor_diameter,
                                PCB_column_angle, PCB_column_radius);
        kicker (ball_radius, kicker_angle);
    }*/
    translate([-215/2+25, 0, 4]) rotate([0,0, 90]) kicker (65/2, kicker_angle);
	//rotate([0, 0, 120]) translate([-80, 0, 0]) battery(11.1, 3300);

	#rotate([0, 0, 240]) translate([-70, 0, 28]) cube([50, 87, 56], center = true);
	rotate([0, 0, 240]) translate([-70, 0, 0]) rotate([0,0,90]) jetson_with_carrierboard();
	for(i = [0, 120, 240]){
		rotate([0, 0, i]) translate([60, 0, 0]) {
			motor(false);
		}
	}
}

