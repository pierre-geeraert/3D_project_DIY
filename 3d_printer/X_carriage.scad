
include <../Household/references.scad>

length_carriage_plate=60;
width_carriage_plate=3;
height_carriage_plate=90;

    
length_leg_part=20;
width_leg_part=10;
height_leg_part=height_carriage_plate;
depth_leg_part=30;
    

module holes_for_nuts(){
    color("green"){
    //position nuts 

    //top left
    position_nut_1 = [0,10,65];

    //top right
    position_nut_2 = [0,50,65];

    //bottom left
    position_nut_3 = [0,10,25];

    //bottom right
    position_nut_4 = [0,50,25];

    rotate_nuts=[0,90,0];

    for (i = [position_nut_1,position_nut_2,position_nut_3,position_nut_4]){
        custom_cylinder(
            rotate_input=rotate_nuts,
            translate_input=i,
            diameter_object=11,
            height_object=width_leg_part);
    }
}
}

module leg_part(translated_x,translated_y,translated_z){

    //top circle 
    rotate_leg_top_part=[90,0,0];
        
    //top left
    position_leg_top = [width_leg_part/2,10+length_leg_part/2,height_leg_part];

    //top right
    position_leg_bottom = [width_leg_part/2,10+length_leg_part/2,-(width_leg_part/2)];

    //bottom left
    position_leg_depth = [-depth_leg_part,10+length_leg_part/2,-(width_leg_part/2)];
    translate([translated_x,translated_y,translated_z]){
    hull(){
        custom_cylinder(
            rotate_input=rotate_leg_top_part,
            translate_input=position_leg_top,
            diameter_object=width_leg_part,
            height_object=length_leg_part);    

        custom_cylinder(
            rotate_input=rotate_leg_top_part,
            translate_input=position_leg_bottom,
            diameter_object=width_leg_part,
            height_object=length_leg_part);    
    }
    hull(){
        custom_cylinder(
            rotate_input=rotate_leg_top_part,
            translate_input=position_leg_bottom,
            diameter_object=width_leg_part,
            height_object=length_leg_part);    

        custom_cylinder(
            rotate_input=rotate_leg_top_part,
            translate_input=position_leg_depth,
            diameter_object=width_leg_part,
            height_object=length_leg_part);    
    }
}
}

module holes_for_fixation(){
    color("blue"){
        //position nuts 

    //bottom
    position_hole_fixation_1_left = [0,15,12];

    //middle
    position_hole_fixation_2_left = [0,10,45];

    //top
    position_hole_fixation_3_left = [0,15,80];

    //bottom
    position_hole_fixation_1_right = [0,45,12];

    //middle
    position_hole_fixation_2_right = [0,50,45];

    //top
    position_hole_fixation_3_right = [0,45,80];

    rotate_nuts=[0,90,0];

    for (i = [position_hole_fixation_1_left,position_hole_fixation_2_left,position_hole_fixation_3_left,position_hole_fixation_1_right,position_hole_fixation_2_right,position_hole_fixation_3_right]){
        custom_cylinder(
            rotate_input=rotate_nuts,
            translate_input=i,
            diameter_object=4,
            height_object=width_leg_part);
    }}
    }


module holes_for_Stealthburner(){
    color("red"){

    //distance between 2 bottom holes = 32,65mm
    // distance between 2 top holes 45,75mm

    //top left
    position_hole_SB_top_1 = [0,7.125,80];

    //top right
    position_hole_SB_top_2 = [0,52.875,80];

    //bottom left
    position_hole_SB_bottom_1 = [0,13.675,6];

    //bottom right
    position_hole_SB_bottom_2 = [0,46.325,6];

    rotate_nuts=[0,90,0];

    for (i = [position_hole_SB_top_1,position_hole_SB_top_2,position_hole_SB_bottom_1,position_hole_SB_bottom_2]){
        custom_cylinder(
            rotate_input=rotate_nuts,
            translate_input=i,
            diameter_object=HT_Diameter_PT,
            height_object=width_leg_part);
    }}
    }

module belt(){
    color("pink"){
        belt_height = 8;
        belt_lenth = length_carriage_plate; //big value just to succeed the difference part
        belt_width = 4;
        
        translate([-19,0,-(width_leg_part/2)-(belt_width/2)]){
            cube([belt_height,belt_lenth,belt_width]);
            }    
        
        translate([-28,0,-(width_leg_part/2)-(belt_width/2)]){
            cube([belt_height,belt_lenth,belt_width]);
            }
        }
    }

module main(){
    difference(){
        //leg left part
        //leg_part(0,0,0);
        
        //leg right part
        leg_part(0,length_carriage_plate-length_leg_part,0);
        holes_for_nuts();
        holes_for_fixation();
        holes_for_Stealthburner();
        belt();
    }
    
    }
    
    
main();