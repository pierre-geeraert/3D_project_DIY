include <../references.scad>

//fan

width_between_fan_holes = 104;
diameter_holes_screw_PT = 6;
width_fan_external = 30;
width_fan_ES = 26;
length_fan = 120;
distance_between_screw_and_bottom = 8;


//handle
width_between_handle_squares = 58;
width_handle_squares = 7;
height_handle_squares = 15;

//2 parts
distance_between_fan_holes_and_square_handle_center = 20;



module main_object(){
    //handle
    translate([-(width_between_handle_squares+2*width_handle_squares)/2,-(height_handle_squares+6)/2,0]){
                cube([width_between_handle_squares+2*width_handle_squares,height_handle_squares+6,height_handle_squares+6]);
        }
  
 
        
    hull(){
        translate([-(width_between_handle_squares+2*width_handle_squares)/2,-(height_handle_squares+6)/2,height_handle_squares+6]){
                cube([width_between_handle_squares+2*width_handle_squares,height_handle_squares+6,1]);
                }


            
        //fan
        translate([-(length_fan)/2,-(width_fan_external)/2,(height_handle_squares+6)+distance_between_fan_holes_and_square_handle_center]){
                cube([length_fan,width_fan_external,width_fan_external]);
                }    
            }
}
module main(){
    difference(){
        main_object();
                translate([width_between_handle_squares/2,-(height_handle_squares/2),((height_handle_squares+6)/2)-(height_handle_squares/2)]){
            cube([width_handle_squares,height_handle_squares,height_handle_squares]);
            }
        translate([-((width_between_handle_squares/2)+(width_handle_squares)),-(height_handle_squares/2),((height_handle_squares+6)/2)-(height_handle_squares/2)]){
            cube([width_handle_squares,height_handle_squares,height_handle_squares]);
            }
        
        
translate([-(length_fan/2),-(width_fan_ES/2),(height_handle_squares+6)+distance_between_fan_holes_and_square_handle_center+distance_between_screw_and_bottom]){
    color("red"){cube([length_fan,width_fan_ES,width_fan_external-distance_between_screw_and_bottom]);}
    }

        translate([width_between_fan_holes/2,width_fan_external/2,(height_handle_squares+6)+distance_between_fan_holes_and_square_handle_center+distance_between_screw_and_bottom*2]){
        rotate([90,0,0]){body_M3(width_fan_external);}
        }
        translate([-(width_between_fan_holes/2),width_fan_external/2,(height_handle_squares+6)+distance_between_fan_holes_and_square_handle_center+distance_between_screw_and_bottom*2]){
        rotate([90,0,0]){body_M3(width_fan_external);}
        }
    }    
    }
main();
//main_object();