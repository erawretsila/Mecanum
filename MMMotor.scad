$fn=12;

module MMMotor(){
    $fn=12;
    translate([0,-12/2,-10/2]){
        cube([9.5,12,10]);
        intersection(){
            cube([9+15,12,10]);
            rotate([0,90,0]){
                translate([-10/2,12/2,0]){
                    cylinder(9+15,d=12);
                }
            }
        }
    }
    rotate([0,270,0]){
        cylinder(9,d=4);
        cylinder(2,d=6);
    }
    rotate([0,90,0]){
        cylinder(9+15+2,d=6);
        cylinder(9+15+4.5,d=2);
    }
    translate([9+15,-12/2-6,-10/2]){
        hull(){
            cube([1.6,18,10]);
            translate([-2,-(18-18),0]){
                cube([12,18+6,15]);
            }
            translate([-2,(18+6)/2,20]){
                rotate([0,90,0]){
                    cylinder(12,d=18+9.5,$fn=6);
                }
            }
        }
    }
}
module IMU(){
    x=.8*25.4;  //convert from In to mm
    y=.5*25.4;  //Convert form In to mm
    z=1.6;      //already in MM no conversion necessary
    b=.1*25.4;   //Boarder In to MM
    translate ([-x/2,-y/2,0]){
        minkowski(){
            cube([x,y,z]);
            cylinder(z,r=b);
        }
        translate([0,0,-10]){
            translate([0,0,0]){
                cylinder(20,d=2.5);
            }
            translate([x,0,0]){
                cylinder(20,d=2.5);
            }
            translate([x,y,0]){
                cylinder(20,d=2.5);
            }
            translate([0,y,0]){
                cylinder(20,d=2.5);
            }
        }
      
    }
}
module LiPo(x=68,y=34,z=9,b=0){
    x=x+b*2;
    y=y+b*2;
    
    translate([-x/2,-y/2,.25]){
        cube([x,y,z]);
    }
}
module LiPo2(){
    rotate([90,0,0]){
        translate([0,0,-70/2]){
            hull(){
                translate([-19/2,0,0]){
                    cylinder(70,d=19);
                }
                translate([19/2,0,0]){
                    cylinder(70,d=19);
                }
            }
        }
    }
}
module Spacer(h=12,o=7,i=3){
    difference(){
        cylinder(h,d=o,$fn=6);
        cylinder(h,d=i,$fn=12);
    }
}
module Mecanum(Angle=45){
    
    rotate([0,270,0]){
        cylinder(2,d=35);
        translate([0,0,22]){
            cylinder(2,d=35);
        }
    
        for (x = [0:6]){
            rotate([0,0,(360/6)*x]){
                translate([(35/2)-2,0,24/2]){
                    rotate([Angle,0,0]){
                        translate([0,0,-24/2]){
                            cylinder(24,d=8);
                        }
                    }
                }
            }
        }
    }
}
 module MotorMountH(){
    translate([15/2-2,0,-15/2+1.5]){
         rotate([0,0,270]){
            difference(){
                union(){
                     translate([-30/2,-15/2,0]){
                         cube([30,15,3]);
                     }
                     translate([-17/2,-15/2,0]){
                         cube([17,15,13]);
                     }
                }
                rotate([0,0,90]){
                    translate([-15/2+2,0,15/2-2.5]){
                        MMMotor();
                    }
                    translate([-10/2,-12/2,-3]){
                            cube([15,12,10]);
                    }
                }
                translate([-10,0,0]){
                    cylinder(25,d=3);
                    translate([0,0,2]){
                        rotate([0,0,90]){
                            cylinder(20,d=6,$fn=6);
                        }
                    }
                }
                translate([10,0,0]){
                    cylinder(25,d=3);
                    translate([0,0,2]){
                        rotate([0,0,90]){
                            cylinder(20,d=6,$fn=6);
                        }
                    }
                }
            }
         }
     }
 } 
 module MotorMountV(){
    translate([15/2-2,0,-15/2+1.5]){
         rotate([0,0,270]){
            difference(){
                union(){
                     translate([-30/2,-15/2,0]){
                         cube([30,15,3]);
                     }
                     translate([-15/2,-15/2,0]){
                         cube([15,15,15]);
                     }
                }
                rotate([90,0,90]){
                    translate([-6,15/2-1.5,0]){
                        MMMotor();
                    }
                    translate([-4,-10,-10/2]){
                            cube([13,15,10]);
                    }
                }
                translate([-10,0,0]){
                    cylinder(5,d=3);
                    translate([0,0,2]){
                        rotate([0,0,90]){
                            cylinder(20,d=6,$fn=6);
                        }
                    }
                }
                translate([10,0,0]){
                    cylinder(5,d=3);
                    translate([0,0,2]){
                        rotate([0,0,90]){
                            cylinder(20,d=6,$fn=6);
                        }
                    }
                }
            }
         }
     }
 }
module MotorMountF(T=3){
    translate([15.5/2-2.25,0,-6]){
        rotate([0,0,90]){
            translate([-20/2,0,-10]){
                cylinder(15,d=3);
                translate([0,0,-T]){
                    cylinder(10,d=6);
                }
               translate([20,0,0]){
                    cylinder(15,d=3);
                    translate([0,0,-T]){
                        cylinder(10,d=6);
                    }
               }
           }
           
           translate([-30.5/2,-15.5/2,0]){
               cube([30.5,15.5,1.5]);
           }
        }
    }
}
module BatBox4AA(){
    x=65;
    y=68;
    z=16;
    translate([-x/2+3.5,-y/2,0]){
        minkowski(){
            cube([x-3.5*2,y,z-3.5*2]);
            rotate([-90,0,0]){
                cylinder(.01,r=3.5);
            }

        }
    }
    translate([-(x-6)/2,-(y-8)/2,0]){
        cube([(x-6)/2-2,y-8,z+5]);
    }
    translate([2,-(y-8)/2,0]){
        cube([(x-6)/2-2,y-8,z+5]);
    }
}
module Battery(){
    rotate([-90,0,0]){
        translate([-(26-16)/2,-(22-16)/2,-105/2]){
            minkowski(){
                cube([26-16,22-16,105]);
                cylinder(105,r=8);
            }
        }
    }
}
module Switch(){
    translate([0,0,-2]){
        cylinder (9,d=6);
        cylinder (2,d=12);
        translate ([0,6,0]){
            cylinder(3.5,d=2.5);
        }
        translate([-8/2,-13/2,-14]){
            cube([8,13,14]);
        }
        
    }
    translate([0,9,3]){
        linear_extrude(5){
          text("OFF",size=4, font = "Liberation Sans:sytle='bold'",halign="center",valign="center");
        }
    }
    translate([0,-9,3]){
        linear_extrude(5){
          text("ON",size=4, font = "Liberation Sans:sytle='bold'",halign="center",valign="center");
        }
    }
}
module SR04(){
    translate([-45.5/2,-20.5/2,-12]){
        cube([45.5,20.5,12]);
    }
    translate([-14/2,5.25,0]){
        cube([14,5,4]);
    }
    translate([-14/2,-20.5/2,-10]){
        cube([14,5,14]);
    }
    translate([-26/2,0,0]){
        cylinder(13,d=17);
    }
    translate([26/2,0,0]){
        cylinder(13,d=17);
    }
}
module MP2636(){
    translate([0,0,-10]){
        cylinder(20,d=3.5,$fn=12);
    }
    translate([-4,-4,0]){
        cube([35.5,30.5,1.6]);
    }
    translate([4,-4,0]){
        cube([20,30.5,4]);
    }
    translate([12,27,0]){
        cylinder(15,d=10);
        translate([-1,0,0]){
            cube([2,10,15]);
        }
    }
    
}    
LiPo2();
//MP2636();
//Battery();
//BatBox4AA();
//MotorMountH();
//MotorMountF();
//Mecanum(Angle=-45);
//rotate([90,0,0]){
//    MMMotor();
//}
//IMU(); 
//Spacer(h=3,i=2.5);
//Switch();