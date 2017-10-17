$fa = 5;
$fs = 0.5;
height_of_hole = 1;

//hole_for_base (height_of_hole);
//hole_for_screw_M2 (height_of_hole);
//hole_for_screw_M2_5 (height_of_hole);
//hole_for_screw_M3 (height_of_hole);
//hole_for_shaft (height_of_hole);

module hole_for_base (height_of_hole) {
    cylinder (h = height_of_hole, d = 8);
}

module hole_for_screw_M2 (height_of_hole) {
    cylinder (h = height_of_hole, d = 2.8);
}

module hole_for_screw_M2_5 (height_of_hole) {
    cylinder (h = height_of_hole, d = 3.3);
}

module hole_for_screw_M3 (height_of_hole) {
    cylinder (h = height_of_hole, d = 3.9);
}

module hole_for_shaft (height_of_hole) {
    cylinder (h = height_of_hole, d = 4.9);
}
