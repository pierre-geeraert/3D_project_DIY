include <../references.scad>

Tube_length = 30;
Handle_width = 9;
Handle_height = 20;

//Big_outter_diameter = 51.7;
//Big_inner_diameter = 51.7;
//Little_outter_diameter = 41.78;
//Little_inner_diameter = 28.4;
//Side_length = 20.4;
//Hole_for_screw_diameter = 6;
//Holding_stem_diameter = 10;
//Holding_plate_height = Holding_stem_diameter + 4;



module holding_stem(){
    rotate([0,0,0]){
        difference(){
            color("green")cylinder(h=Tube_length, d=Handle_height , $fn=100);
            color("green")cylinder(h=Tube_length, d=TR_M10_Diamater_IS , $fn=100);
        }
    }
}

module handle(){
    color("red")
    rotate([0,-90,0]){
        translate([0,0,0]){
            difference(){
                hull(){
                    cylinder(h=Handle_width, d=Handle_height, $fn=50);
                    translate([25,0,0]){
                        cylinder(h=Handle_width, d=Handle_height, $fn=50);
                        }
                }
                translate([25,0,0]){
                    cylinder(h=Handle_width, d=TR_M5_Diamater_PT, $fn=50);
                }
            }
            
        }
    }
}

module half_sphere(){
    difference(){
        sphere(d=Handle_height, $fn=100);
        translate([-(Handle_height)/2,-(Handle_height)/2,-(Handle_height)]){
            cube(Handle_height);
        }
    }
}




holding_stem();
translate([0,0,Tube_length]){half_sphere();}
translate([(Handle_height/4),0,Tube_length]){handle();}
//handle();