
include <../Household/references.scad>

length_carriage_plate=50;
width_carriage_plate=3;
height_carriage_plate=100;

    
length_leg_part=10;
width_leg_part=10;
height_leg_part=100;
depth_leg_part=50;
    

module holes_for_nuts(){
    color("green"){
    //position nuts 

    //top left
    position_nut_1 = [0,20,80];

    //top right
    position_nut_2 = [0,40,80];

    //bottom left
    position_nut_3 = [0,20,20];

    //bottom right
    position_nut_4 = [0,40,20];

    rotate_nuts=[0,90,0];

    for (i = [position_nut_1,position_nut_2,position_nut_3,position_nut_4]){
        custom_cylinder(
            rotate_input=rotate_nuts,
            translate_input=i,
            diameter_object=4,
            height_object=4);
    }
}
}

module leg_part(){

    //top circle 
    rotate_leg_top_part=[90,0,0];
        
    //top left
    position_leg_top = [width_leg_part/2,20+length_leg_part/2,height_leg_part];

    //top right
    position_leg_bottom = [width_leg_part/2,20+length_leg_part/2,0];

    //bottom left
    position_leg_depth = [-depth_leg_part,20+length_leg_part/2,0];
    
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

module holes_for_fixation(){
    color("blue"){
        //position nuts 

    //top left
    position_hole_fixation_1 = [0,20,90];

    //top right
    position_hole_fixation_2 = [0,20,50];

    position_hole_fixation_3 = [0,20,10];

    rotate_nuts=[0,90,0];

    for (i = [position_hole_fixation_1,position_hole_fixation_2,position_hole_fixation_3]){
        custom_cylinder(
            rotate_input=rotate_nuts,
            translate_input=i,
            diameter_object=4,
            height_object=width_leg_part);
    }}
    }


module holes_for_stealthburner(){
    color("red"){
        //position nuts 

    //top left
    position_hole_SB_1 = [0,20,80];

    //top right
    position_hole_SB_2 = [0,40,80];

    rotate_nuts=[0,90,0];

    for (i = [position_hole_SB_1,position_hole_SB_2]){
        custom_cylinder(
            rotate_input=rotate_nuts,
            translate_input=i,
            diameter_object=4,
            height_object=4);
    }}
    }

module main(){
    difference(){
        leg_part();
        holes_for_nuts();
    }
    holes_for_fixation();
    }
    
    
main();