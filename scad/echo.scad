
module alu_2020(length) {
    translate([0, 0, length/2]) {
        cube([20, 20, length],center=true);
    }
}

module alu_2040(length) {
    color("gray") {
        translate([0, 0, length/2]) {
            cube([20, 40, length], center=true);
        }
    }
}


module frame() {
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


//frame();
nema17(40);


