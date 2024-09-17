//measurements
include <../../Household/references.scad>

//https://www.lofty.com/pages/how-to-measure-three-dimensional-objects-including-silver-ceramics-glass-sculpture


wall_thickness = 2;

//battery holder dimension

battery_pack_length = BV_CP_length_PT;
battery_pack_width = BV_CP_width_PT*2;
battery_pack_height = BV_CP_height_PT;

//main body (looking from top)

main_body_height = battery_pack_height + wall_thickness;//+ others elements after 
main_body_width = 1.5*battery_pack_width;
main_body_length = main_body_width;

//square_base

//main_body_length = main_body_width;
//main_body_width = main_body_width;
//main_body_height = battery_pack_height; 
 

//square_base_inside

square_base_inside_length = main_body_length-(wall_thickness*2);
square_base_inside_width = main_body_width-(wall_thickness*2);
square_base_inside_height = main_body_height-(wall_thickness);


module battery_display(){
    rotate_array=[0,90,0];
    translate_array=[-(battery_pack_length/2),(main_body_width/2)-(BV_CP_width_PT/2)-wall_thickness,(BV_CP_width_PT/2)+wall_thickness];
    translate_array2=[-(battery_pack_length/2),-(main_body_width/2)+(BV_CP_width_PT/2)+wall_thickness,(BV_CP_width_PT/2)+wall_thickness];
    
    vapes_battery(BV_CP_PT,rotate_array,translate_array);
    vapes_battery(BV_CP_PT,rotate_array,translate_array2);

    }

module corner_cut(translate_x,translate_y,translate_z){
    translate([translate_x,translate_y,translate_z]){
        color("green"){
            rotate([0,0,45]){
                translate([-5,-5,0]){
                    cube([10,10,main_body_height]);
                }
            }
            }
        }
    }
    

module square_base(){
    difference(){
         translate([-main_body_length/2,-main_body_width/2,0]){
            
                cube([main_body_length, main_body_width, main_body_height]);
                
        }
    corner_cut(main_body_length/2,main_body_length/2,0);
    corner_cut(-main_body_length/2,main_body_length/2,0);
    corner_cut(main_body_length/2,-main_body_length/2,0);
    corner_cut(-main_body_length/2,-main_body_length/2,0);
    }

    
}





module main_object(){
    difference(){
        square_base();
        translate([0,0,wall_thickness]){
            color("blue"){    resize([square_base_inside_length,square_base_inside_width,square_base_inside_height]){square_base();}}
            
                

        }
  
    
        translate([square_base_inside_width/2-(NB_M3_Diameter_C2C_PT/2),square_base_inside_length/2-(NB_M3_Diameter_C2C_PT),0]){
        nut_M3(10);
        }
    translate([-((square_base_inside_width/2)-(NB_M3_Diameter_C2C_PT/2)),square_base_inside_length/2-(NB_M3_Diameter_C2C_PT),0]){
        nut_M3(10);
        }
    translate([square_base_inside_width/2-(NB_M3_Diameter_C2C_PT/2),-(square_base_inside_length/2-(NB_M3_Diameter_C2C_PT)),0]){
        nut_M3(10);
        }
    translate([-(square_base_inside_width/2-(NB_M3_Diameter_C2C_PT/2)),-(square_base_inside_length/2-(NB_M3_Diameter_C2C_PT)),0]){
        nut_M3(10);
        }
    
            rotate_array_battery_charger=[90,0,0];
    translate_array_battery_charger=[-(main_body_width/2)+4,BC_TP_height_from_bottom_ES,2];
    scale([1.12,1.12,1.12]){
    battery_charger(rotate_array_battery_charger,translate_array_battery_charger);
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
    
battery_display();


}



main_body();
