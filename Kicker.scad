$fn = 200;
ball_radius = 40;
ball_imbedding = 25;
dribler_height = 57;
dribler_roller_radius = 13;
dribler_width = 24;
chassis_radius = 107.5;
light_sensor_diameter = 156;
kicker_angle = 60;
PCB_column_angle = 15;
PCB_column_radius = 58.5;

module kicker (ball_radius, kicker_angle) {
    translate ([0, ball_radius, ball_radius - 13.6]) {
        rotate ([kicker_angle, 0, 0]) {
            translate ([0, -ball_radius, 0]) {
                color ([0.729, 0.729, 0.729, 1]) {

                //reel

                    translate ([0, -48.83, 0]) {
                        rotate ([270, 30, 0]) {
                            cylinder (h = 39.3, d = 19.5);
                            translate ([0, 0, 39.3]) {
                                cylinder (h = 9.53, d = 14);
                            }
                            translate ([0, 0, 44]) {
                                cylinder (h = 4.8, d = 19.6, $fn = 6);
                            }

                //grain

                            translate ([0, 0, -22.47]) {
                                cylinder (h = 30.5, d = 8);
                            }
                            translate ([0, 0, 8.03]) {
                                cylinder (h = 5.3, d1 = 8, d2 = 2.5);
                            }
                            translate ([0, 0, 13.33]) {
                                cylinder (h = 35.5, d = 2.5);
                            }
                        }
                    }
                }
            }
        }
    }
}

kicker (ball_radius, kicker_angle);
