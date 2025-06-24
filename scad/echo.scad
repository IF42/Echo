
module alu_2020(length) {
    color("gray") {
        translate([0, 0, length/2]) {
            cube([20, 20, length],center=true);
        }
    }
}

module alu_2040(length) {
    color("gray") {
        translate([0, 0, length/2]) {
            cube([20, 40, length], center=true);
        }
    }
}


module echo_frame() {
    translate([-496/2, 496/2+10, 20]) {
        rotate([90, 0, 90]) {
            alu_2040(496);
        }
    }
    
    translate([-496/2, -496/2-10, 20]) {
        rotate([90, 0, 90]) {
            alu_2040(496);
        }
    }
  
    translate([-496/2-20, -496/2, 10]) {
        rotate([0, 90, 90]) {
            alu_2040(496);
        }
    }
    
    translate([496/2+20, -496/2, 10]) {
        rotate([0, 90, 90]) {
            alu_2040(496);
        }
    }
    
    translate([-496/2-20, 496/2+10, 0]) {
        rotate([0, 0, 90]) {
            alu_2040(560);
        }
    }
    
    translate([-496/2-20, -496/2-10, 0]) {
        rotate([0, 0, 90]) {
            alu_2040(560);
        }
    }
    
    translate([496/2+20, 496/2+10, 0]) {
        rotate([0, 0, 90]) {
            alu_2040(560);
        }
    }
    
    translate([496/2+20, -496/2-10, 0]) {
        rotate([0, 0, 90]) {
            alu_2040(560);
        }
    }
    
    translate([496/2+20, 0, 20]) {
        rotate([0, 0, 90]) {
            alu_2040(442);
        }
    }
    
    translate([-496/2-20, 0, 20]) {
        rotate([0, 0, 90]) {
            alu_2040(442);
        }
    }
    
    translate([-496/2-20, -496/2, 442+30]) {
        rotate([0, 90, 90]) {
            alu_2040(496);
        }
    }
    
    translate([496/2+20, -496/2, 442+30]) {
        rotate([0, 90, 90]) {
            alu_2040(496);
        }
    }
    
    translate([-496/2-20, -496/2, 560-10]) {
        rotate([0, 90, 90]) {
            alu_2040(496);
        }
    }
    
    translate([496/2+20, -496/2, 560-10]) {
        rotate([0, 90, 90]) {
            alu_2040(496);
        }
    }
    
    translate([-496/2, -496/2-10, 560-20]) {
        rotate([90, 0, 90]) {
            alu_2040(496);
        }
    }
}  


module nema17(height) {
    difference() {
        intersection() {
            translate([0, 0, height/2]) {
                cube([42.3, 42.3, height], center=true);
            }
            
            cylinder(d=55, h=height, $fn=100);
        }
        
        for(i=[0:1:4]) {
            rotate([0, 0, 360/4*i]) {
                translate([31/2, 31/2, height-9]) {
                    cylinder(d=3, h=10, $fn=30);
                }
            }
        }
    }
    
    translate([0, 0, height]) {
        cylinder(d=22, h=1.5, $fn=50);
    }
    
    difference() {
        cylinder(d=5, h=height+24, $fn=30);
        
        translate([5/1.3, 0, (height+24)/2]) {
            cube([5,5,height+24], center=true);
        }
    }
}


module mgn12_rail(length) {
    difference() {
        translate([0, length/2, 4]) {
            cube([12, length, 8], center=true);
        }
        
        for(i = [12.5:25:length]) {
            translate([0, i, 0]) {
                cylinder(d=3.5, h=24, $fn=20, center=true);
            }
        }
    }
}

module mgn12_carriage() {
    translate([0, 45.4/2, 0]) {
        difference() {
            translate([0, 0, 5]) {
                cube([27, 45.4, 10], center=true); 
            }
            
            for(i = [0: 1: 4]) {
                rotate([0, 0, 360/4*i]) {
                    translate([10, 10, 5.5]) {
                        cylinder(d=3.5, h=5, $fn=20);
                    }
                }
            }
        }
    }
}


module mgn12(length, position) {
    color("silver") {
        mgn12_rail(length);
    }
    color("green") {
        translate([0, position, 3]) {
            mgn12_carriage();
        }
    }
}


module echo_x_axis(position) {
    translate([-230, 0, 560 - 10]) {
        rotate([0, 90, 0]) {
            alu_2020(460);
        }
    }
    
    translate([200, 0, 560]) {
        rotate([0, 0, 90]) {
            mgn12(400, position);
        }
    }
}


module echo_xy_axis(x_position, y_position) {
    translate([496/2, -200, 560-10]) {
        rotate([0, -90, 0]) {
            mgn12(400, y_position);
        }
    }
    
    translate([-496/2, -200, 560 - 10]) {
        rotate([0, 90, 0]) {
            mgn12(400, y_position);
        }
    }
    
    translate([0, y_position- 200 + 45.4/2, 0]) {
        echo_x_axis(x_position-45.4/2);
    }
}


module echo_z_axis_frame() {
    translate([-405/2, 300/2+10, 0]) {
        rotate([0, 90, 0]) {
            alu_2020(405);
        }
    }
    
    translate([-405/2, -300/2-10, 0]) {
        rotate([0, 90, 0]) {
            alu_2020(405);
        }
    }
    
    translate([405/2-10, 300/2, 0]) {
        rotate([90, 0, 0]) {
            alu_2020(300);
        }
    }
    
    translate([-405/2+10, 300/2, 0]) {
        rotate([90, 0, 0]) {
            alu_2020(300);
        }
    }
}


module echo_build_plate() {
    translate([0, 0, 1.5]) {
        cube([310, 310, 3], center=true);
    }
}


module echo_z_axis(position) {
    translate([-496/2, 0, 460+20]) {
        rotate([90,180,90]) {
            mgn12(400, position);
        }
    }
    
    translate([496/2, 0, 460+20]) {
        rotate([90,180,-90]) {
            mgn12(400, position);
        }
    }
    
    translate([0, 0, 460+20 - 45.4/2 - position]) {
        echo_z_axis_frame();
        translate([0, 0, 10]) {
            echo_build_plate();
        }
    }
}


module echo_construction() {
    echo_frame();
    echo_xy_axis(200, 150);
    echo_z_axis(100);
    
}

echo_construction();
//mgn12(400, 350);
//frame();
//nema17(40);


