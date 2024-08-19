//measurements

//https://www.lofty.com/pages/how-to-measure-three-dimensional-objects-including-silver-ceramics-glass-sculpture


//main body (looking from front)

main_body_height = 22;
main_body_width = 120;
main_body_depth = 51;
main_body_distance_between_two_main_bodies = 29; 

//main body tube
main_body_tube_diameter = 22;

//connection_plate
connection_plate_length=65.50;
connection_plate_width=65.50;
connection_plate_depth=5;

//Tube bit

tube_bit_height = connection_plate_width;
tube_bit_diameter = 50;
tube_bit_hole_diameter = 18;


//bearing

bearing_diameter = 41;
bearing_height = 13;

//screw
screw_length=100;
screw_diameter=7;
screw_cap_diameter=11;
screw_cap_length=5;


//space_for_head_screw
space_for_head_screw_diameter=10;
space_for_head_screw_length=5;


module connection_plate(){
    rotate([90,0,0]){
        cube([connection_plate_length, connection_plate_width, connection_plate_depth]);}
    }

module tube_bit(){
            cylinder(h=tube_bit_height, r=(tube_bit_diameter)/2, $fn=50);
}
module space_for_head_screw(position_x,position_z){
    translate([position_x,0,position_z]){
        rotate([90,0,0]){
            cylinder(h=space_for_head_screw_length,d=space_for_head_screw_diameter,$fn=50);
            }
        }
    }
module tube_bit_hole_inside(){
    cylinder(h=tube_bit_height+(main_body_height-bearing_height), r=(tube_bit_hole_diameter)/2, $fn=50);
}
    
module screw(position_x,position_y,position_z){   
    translate([position_x,position_y,position_z]){
        rotate([-90,0,0]){
            cylinder(h=screw_length,d=screw_diameter,$fn=50);
            cylinder(h=screw_cap_length,d=screw_cap_diameter,$fn=50);
        }
        }
    
    }


module bearing(){
    //translate([main_body_depth/2,-main_body_width/2,0])
    cylinder(h=bearing_height, r=(bearing_diameter)/2, $fn=50);
}
module main_body(){
    difference(){

        hull(){ // hull to join the 2 tubes
            color("green"){connection_plate();}
            translate([connection_plate_width/2,-(tube_bit_diameter/2),0]){
                tube_bit();}    
        }
        
        translate([connection_plate_width/2,-(tube_bit_diameter/2),0]){bearing();}
        
        translate([connection_plate_width/2,-(tube_bit_diameter/2),0]){tube_bit_hole_inside();}

        space_for_head_screw(12.75,12.90);
        space_for_head_screw(12.75,52.60);
        space_for_head_screw(52.75,12.90);
        space_for_head_screw(52.75,52.60);

        color("red"){screw(42.75,-(tube_bit_diameter),32.75);}
        color("blue"){screw(22.75,-(tube_bit_diameter),32.75);}
        color("green"){screw(32.75,-60,52.60);}
        color("pink"){screw(32.75,-60,22.75);}
        color("black"){screw(12.75,-(tube_bit_diameter)+5,32.75);}
        color("yellow"){screw(52.75,-(tube_bit_diameter)+5,32.75);}

    }
}
//space_for_head_screw(1,1);
    main_body();

 //color("yellow"){screw(52.75,-(tube_bit_diameter)+5,32.75);}
