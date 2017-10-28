$fn = 200;


module universal_batery(a, b, c){
	translate ([0, a/2-b/2, 0]) {
		color ([0.004, 0.298, 0.745, 1]) cylinder (h = c, d = a);
		color ([0.9, 0.1, 0.1, 1]) translate ([4, -4, c]) cylinder(h = 5, d = 8);
		color ([0.1, 0.1, 0.1, 1]) translate ([-4, -4, c]) cylinder(h = 5, d = 8);
		translate ([-a/2, 0, 0]){
			color ([0.004, 0.298, 0.745, 1]) cube ([a, b-a/2, c]);
			color([0.8, 0.8, 0.8, 1]) translate ([0.5, 0.5, -0.05]) cube ([a-1, b-a/2-1, c+0.1]);
		}
	}
}

module battery(voltage, capacity){
	if(voltage == 11.1 && capacity == 3300){
		universal_batery(23.44, 135.77, 42.30);
	} else if(voltage == 11.1 && capacity == 4000){
		universal_batery(28.11, 135.77, 42.30);
	} else if(voltage == 11.1 && capacity == 1100){
		universal_batery(15, 100, 39);//needs to be measured
	}
}

battery(11.1, 3300);
