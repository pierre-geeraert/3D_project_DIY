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
module hole_for_magnets(translated_position_X, translated_position_Y,translated_position_Z){
    translate([translated_position_X, translated_position_Y, translated_position_Z]){ 
        rotate([0,0,0]){
            color("pink"){cylinder(d=15, h=magnet_holder_height, $fn=30);}
        }
    }
    
    }



module magnet_holder(){
    difference(){
        translate([-magnet_holder_length/2,square_base_inside_width/2-(battery_holder_width*4),square_base_wall_thickness]){
                
                    color("green"){cube([magnet_holder_length, magnet_holder_width, magnet_holder_height]);}
                    
            }
                    hole_for_magnets(magnet_holder_length/4,(square_base_inside_width/2-(battery_holder_width*4))+magnet_holder_width/2,square_base_wall_thickness);
        hole_for_magnets(-magnet_holder_length/4,(square_base_inside_width/2-(battery_holder_width*4))+magnet_holder_width/2,square_base_wall_thickness);
        }
    }

module main_object(){
    difference(){
        square_base();
        translate([0,0,square_base_wall_thickness]){
            color("blue"){    resize([square_base_inside_length,square_base_inside_width,square_base_inside_height]){square_base();}}
            
                

        }
    color("red"){custom_cylinder_switch(-square_base_inside_length/2+square_base_inside_length*(2/3),-square_base_inside_width/2,square_base_inside_height/2);}
    color("red"){custom_cylinder_switch(-square_base_inside_length/2+square_base_inside_length*(1/3),-square_base_inside_width/2,square_base_inside_height/2);}
    
    hole_for_magnets(magnet_holder_length/4,(square_base_inside_width/2-(battery_holder_width*4))+magnet_holder_width/2,square_base_wall_thickness/2);
    hole_for_magnets(-magnet_holder_length/4,(square_base_inside_width/2-(battery_holder_width*4))+magnet_holder_width/2,square_base_wall_thickness/2);
    
    
    }
    
}

module custom_cylinder_switch(translated_position_X, translated_position_Y,translated_position_Z) {
    translate([translated_position_X, translated_position_Y, translated_position_Z]){ 
        rotate([90,0,0]){
            cylinder(d=7, h=square_base_wall_thickness+10, $fn=30);
        }
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
    main_object();
    //magnet_holder();
    

    
//    square_inside_magnet();
        battery_holder(-battery_holder_length/2,square_base_inside_width/2-(battery_holder_width),square_base_wall_thickness-3);
        battery_holder(-battery_holder_length/2,square_base_inside_width/2-(battery_holder_width*2),square_base_wall_thickness-3);
        battery_holder(-battery_holder_length/2,square_base_inside_width/2-(battery_holder_width*3),square_base_wall_thickness-3);



}



main_body();

