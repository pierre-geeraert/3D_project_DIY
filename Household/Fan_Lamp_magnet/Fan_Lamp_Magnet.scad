//measurements

//https://www.lofty.com/pages/how-to-measure-three-dimensional-objects-including-silver-ceramics-glass-sculpture


//hole inside magnet

hole_inside_magnet_height = 49;
hole_inside_magnet_width = 19;
hole_inside_magnet_depth = 3.4;
width_between_screws = 41.5;

//external dimension magnet

external_dimension_magnet_width = 32;

//battery holder dimension

battery_holder_length = 81.4;
battery_holder_width = 23;
battery_holder_height = 20;

//main body (looking from front)

main_body_height = 3;
main_body_width = external_dimension_magnet_width+4*battery_holder_width;
main_body_length = 90;

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
module main_plate(){
    translate([-main_body_length/2,-main_body_width/2,0]){
        cube([main_body_length,main_body_width,main_body_height]);
    }
    }

module battery_holder(translate_x,translate_y,translate_z){
    translate([translate_x,translate_y,translate_z]){
        import("1_Battery_individual.stl");
    }
}
module square_inside_magnet(){
    translate([-hole_inside_magnet_height/2,-hole_inside_magnet_width/2,main_body_height]){
        color("green"){cube([hole_inside_magnet_height,hole_inside_magnet_width,hole_inside_magnet_depth]);}
    }
    }
module main_body(){
    main_plate();
    square_inside_magnet();
    battery_holder(-battery_holder_length/2,external_dimension_magnet_width/2,main_body_height);
    battery_holder(-battery_holder_length/2,external_dimension_magnet_width/2+battery_holder_width,main_body_height);
    battery_holder(-battery_holder_length/2,-main_body_width/2+battery_holder_width,main_body_height);

    }
module old_main_body(){
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