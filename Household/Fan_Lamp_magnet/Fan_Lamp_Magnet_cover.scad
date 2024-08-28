//measurements
include <../references.scad>

//https://www.lofty.com/pages/how-to-measure-three-dimensional-objects-including-silver-ceramics-glass-sculpture


//hole inside magnet

hole_inside_magnet_height = 49;
hole_inside_magnet_width = 19;
hole_inside_magnet_depth = 3.4;
width_between_screws = 41.5;
screw_diameter_ES = 2.94;
screw_diameter_PT = 3.5;
screw_head_diameter_ES = 5.4;
screw_head_diameter_PT = 6.5;

//flexible lamp 

flexible_lamp_diameter_PT = 13;
//external dimension magnet

external_dimension_magnet_width = 32;

//battery holder dimension

battery_holder_length = 81.4;
battery_holder_width = 23;
battery_holder_height = 20;

//main body (looking from top)

main_body_height = 3;
main_body_width = external_dimension_magnet_width+3*battery_holder_width;
main_body_length = 90;

//square_base

square_base_length = main_body_width;
square_base_width = main_body_width;
square_base_height = 25;
square_base_wall_thickness = 2; 

//square_base_inside

square_base_inside_length = square_base_length-(square_base_wall_thickness*2);
square_base_inside_width = square_base_width-(square_base_wall_thickness*2);
square_base_inside_height = square_base_height-(square_base_wall_thickness);

//magnet 
magnet_holder_length = 36; 
magnet_holder_width = 19;
magnet_holder_height = 10;
magnet_height = 6;



module corner_cut(translate_x,translate_y,translate_z){
    translate([translate_x,translate_y,translate_z]){
        color("green"){
            rotate([0,0,45]){
                translate([-5,-5,0]){
                    cube([10,10,square_base_height]);
                }
            }
            }
        }
    }
    

module square_base(){
    difference(){
         translate([-square_base_length/2,-square_base_width/2,0]){
            
                cube([square_base_length, square_base_width, square_base_height]);
                
        }
    corner_cut(square_base_length/2,square_base_length/2,0);
    corner_cut(-square_base_length/2,square_base_length/2,0);
    corner_cut(square_base_length/2,-square_base_length/2,0);
    corner_cut(-square_base_length/2,-square_base_length/2,0);
    }

    
}
module hole_for_screw_heads(translated_position_X, translated_position_Y,translated_position_Z){
    translate([translated_position_X, translated_position_Y, translated_position_Z]){ 
        rotate([0,0,0]){
            color("pink"){cylinder(d=screw_head_diameter_PT, h=square_base_wall_thickness, $fn=30);}
        }
    }
    
    }

module hole_for_screw(translated_position_X, translated_position_Y,translated_position_Z){
    translate([translated_position_X, translated_position_Y, translated_position_Z]){ 
        rotate([0,0,0]){
            color("pink"){cylinder(d=screw_diameter_PT, h=hole_inside_magnet_depth, $fn=30);}
        }
    }
    
    }
module hole_for_cable_or_flexible_lamp(translated_position_X, translated_position_Y,translated_position_Z){
    translate([translated_position_X, translated_position_Y, translated_position_Z]){ 
        rotate([0,0,0]){
            color("pink"){cylinder(d=flexible_lamp_diameter_PT, h=square_base_wall_thickness, $fn=30);}
        }
    }
    
    }




module main_object(){
    difference(){
        color("blue"){    resize([0,0,square_base_wall_thickness]){square_base();}}
        hole_for_screw_heads(width_between_screws/2,0,0);
        hole_for_screw_heads(-width_between_screws/2,0,0);

        hole_for_cable_or_flexible_lamp(0,square_base_length/4,0);
        hole_for_cable_or_flexible_lamp(0,-square_base_length/4,0);



            
        translate([square_base_inside_width/2-(NB_M3_Diameter_C2C_PT/2),square_base_inside_length/2-(NB_M3_Diameter_C2C_PT),0]){
        body_M3(10);
        }
    translate([-((square_base_inside_width/2)-(NB_M3_Diameter_C2C_PT/2)),square_base_inside_length/2-(NB_M3_Diameter_C2C_PT),0]){
        body_M3(10);
        }
    translate([square_base_inside_width/2-(NB_M3_Diameter_C2C_PT/2),-(square_base_inside_length/2-(NB_M3_Diameter_C2C_PT)),0]){
        body_M3(10);
        }
    translate([-(square_base_inside_width/2-(NB_M3_Diameter_C2C_PT/2)),-(square_base_inside_length/2-(NB_M3_Diameter_C2C_PT)),0]){
        body_M3(10);
        }
    
    }
    
}



module square_inside_magnet(){
    translate([-hole_inside_magnet_height/2,-hole_inside_magnet_width/2,square_base_wall_thickness]){
        color("green"){cube([hole_inside_magnet_height,hole_inside_magnet_width,hole_inside_magnet_depth]);}
    }
    }
    
//holes if you want to make an open wall
module hexagon_Y(y_input,z_input){
    for (i = [-main_body_width/2:12: main_body_width/2]){
        translate([i,y_input,z_input]){
            rotate([90,0,0]){
                color("purple"){cylinder(r=5,h=square_base_wall_thickness,$fn=6);}
            }
        }
    }
}

module main_body(){
    main_object();
    difference(){
        square_inside_magnet();
        hole_for_screw(width_between_screws/2,0,square_base_wall_thickness);
        hole_for_screw(-width_between_screws/2,0,square_base_wall_thickness);
    }


}



main_body();

