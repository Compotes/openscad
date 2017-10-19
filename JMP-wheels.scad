use <Holes.scad>;
$fa = 5;
$fs = 0.5;

module rubber_wheel(r1, r2, h1, k){
	color([1, 1, 1, 1]) difference(){
		resize(newsize=[r2, r2, k]) sphere(r = 10); //r1 = 8.6; h1 = 15 =>27 copmicated mathematics #cylinder(h = h1, d= r1, center = true);
		translate([0, 0, h1]) cylinder(h = h1, d= r2+1, center = true);
		translate([0, 0, -h1]) cylinder(h = h1, d= r2+1, center = true);
	}
}

module half_of_wheel(){
	color([0.2, 0.9, 0.2, 1]) difference(){
		cylinder(h = 8, d = 55,  $fn = 6);
		translate([0, 0, -0.5]) cylinder(h = 9, d = 25);
		for(i = [0:60:359]){
			rotate([0, 0, i]){
				translate([25-10.3/2, 0, 10.3/2]) rotate([90, 0, 0]) rubber_wheel(8.6, 12, 16, 27);
				translate([55/2, 0, 5]) cube(16 , center = true);
				rotate([0, 0, 90]){
					translate([55/2, 0, 13.8]) rotate([0, -60, 0]) cube(16, center = true);
					translate([55/2, 0, -4]) rotate([0, 45, 0]) cube(16, center = true);
					translate([55/2, 0, -2]) rotate([0, 0, 45]) cube(10.4, center = true);
				}
			}
		}
	}
	for(i = [0:60:359]) rotate([0, 0, i]) {
		translate([25-10.3/2, 0, 5]) rotate([90, 0, 0]) rubber_wheel(8.6, 10.3, 15, 27);
		color([0.5, 0.5, 0.5, 1]) rotate([0, 0, 90]) translate([15, 0, 8]) cylinder(h = 0.5, d = 2);
	}
}

module hub(){
	color([0.2, 0.9, 0.2, 1]) difference(){
		union(){
			for(i = [0:60:179]) rotate([0, 0, i]) translate([0, 0, 12/2+10]) cube([26, 2, 12], center = true);
			cylinder(h = 22, d = 12);
		}
		translate([0, 0, -1]) rotate([0, 0, 90]) cylinder(h = 13, d = 7, $fn = 6);
		translate([0, 0, 22-7]) cylinder(h = 8, d = 8);
		translate([0, 0, 22-9]) cube([5, 2, 6], center = true);
		translate([0, 0, 22-9]) cube([2, 5, 6], center = true);
	}

}

module wheel(){
	translate([0, 0, 16]){
		half_of_wheel();
		rotate([0, 180, 90]) half_of_wheel();
	}
	hub();
}

wheel();
