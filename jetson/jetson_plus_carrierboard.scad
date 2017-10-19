$fn = 360;

function cc(x) = x/255;

module heat_sink() {
    rotate([0, 180, 0]) {
        translate([0, 0, -20]) {
            
            // aluminium part 
            color([cc(250), cc(250), cc(250), 1]) {
                difference() {
                    translate([10,0,0]) {
                        difference() {
                            
                            // main body
                            union() {
                                cube([65.96, 50, 20], 0);
                                translate([-10, 10, 0]) {
                                    cube([87, 30, 20], 0);
                                }
                            }                        
                            
                            // all lines
                            union() {
                                translate([0, 1, 0]) {
                                    for(i = [0:12]) {
                                        translate([-11, 3.75*i, -1]) {
                                            cube([89, 3, 17],0);
                                        }
                                    }
                                }
                                
                                translate([-0.01, -2, -1]) {
                                    cube([1.85, 53, 17], 0);
                                }
                                translate([-0.01+64, -2, -1]) {
                                    cube([2, 53, 17], 0);
                                }
                            }
                        }
                    }
                    
                    // cut for fan
                    translate([20, -1, -1]) {
                        cube([46.5, 53, 11], 0);
                    }
                }
            }
            
            
            // fan
            color([cc(33), cc(33), cc(33), 1]) {
                // fan inner 
                translate([43, 25, 1]) {
                    cylinder(8, 9.5, 9.5,0);
                }
                
                // fan
                difference() {
                    union() {
                        translate([23, 4.97, 0.5]) {
                            cube([40, 40, 9], 0);
                        }
                    }
                    
                    translate([43, 25, -2]) {
                        cylinder(13, 17, 17, 0);
                    }
                }
                
                // fan blades
                translate([43,25,4]) {
                    linear_extrude(height=5, center = true, twist = -30) {
                        for(i=[0:6]) {
                            rotate((360/7)*i+($t*1000%360)) {
                                square([16.5,1]);
                            }
                        }
                    }
                }
            }
        }
    }
}

module jetson() {
    difference() {
        // jetson body50
        union() {
            // TTP - grey - top
            translate([0,0, 3+1.16]) {
                color([cc(130), cc(130), cc(130), 1]) {
                    cube([87,50, 6.25]);
                }
            }

            // PCB - green
            translate([0,0, 3]) {
                color([cc(0), cc(130), cc(0), 1]) {
                    cube([87,50, 1.16]);
                }
            }
            
            // TTP - bottom
            union() {
                color([cc(250),cc(250),cc(250)]) {
                    translate([7, 0, 0]) {
                        cube([73, 36.6, 3]);
                    }
                    
                    translate([0, 7.5, 0]) {
                        cube([87, 30, 3]);    
                    }
                }
            }
            
            // 400 pin connector
            union() {
                color([0,0,0]) {
                    translate([8.2, 48-10, -2.4]) {
                        cube([70, 10.8, 5.4]);
                    }
                }
            }
            
            
            // Stlpiky
            translate([0, 0, -3.16]) {
                union() {            
                    translate([1.64/2+3.5, 1.64+3.5, -1]) {
                        rotate([0, 0, 90]) {
                            cylinder(7.2, 4.4/2, 4.4/2, $fn=6);
                        }
                    }
                               
                    translate([87-1.64/2-3.5, 1.64+3.5 , -1]) {
                        rotate([0,0,90]) {
                            cylinder(7.2, 4.4/2, 4.4/2, $fn=6);
                        }
                    }
                    
                    translate([1.64/2+3.5, 50-1.64-3.5, -1]) {
                        cylinder(7.2, 4.4/2, 4.4/2, $fn=6);
                    }
                    
                    translate([87-1.64/2-3.5, 50-1.64-3.5, -1]) {
                        cylinder(7.2, 4.4/2, 4.4/2, $fn=6);
                    }
                }
            }
        }
        
        // holes
        union() {
            translate([1.64/2+3.5, 1.64+3.5, -5]) {
                cylinder(16, 3.5/2, 3.5/2);
            }
                       
            translate([87-1.64/2-3.5, 1.64+3.5 , -5]) {
                cylinder(16,3.5/2,3.5/2);
            }
            
            translate([1.64/2+3.5, 50-1.64-3.5, -5]) {
                cylinder(16, 3.5/2, 3.5/2);
            }
                       
            translate([87-1.64/2-3.5, 50-1.64-3.5, -5]) {
                cylinder(16,3.5/2,3.5/2);
            }
        }
    }    
}

module carrier_board() {
    
}

translate([87,0, 6.25+1.16+7.2])
    heat_sink();

translate([0, 0, 4.2])
    jetson();

carrier_board();
