
include <../Household/references.scad>

//main
extra_thickness = 5;

//head
length_object = 55.8;   //X
width_object = length_object;    //Y
height_object = 20;  //Z

Length_hole_screw = 5;
length_hole_screwHead = length_object;

translate_array_holes_X_side_1=[0,20,8.1+extra_thickness];
translate_array_holes_X_side_2=[0,20,27.1+extra_thickness];
translate_array_holes_X_side_3=[0,20,46.1+extra_thickness];
translate_array_holes_Y_side_1=[-8.1-extra_thickness,20,0];
translate_array_holes_Y_side_2=[-27.1-extra_thickness,20,0];
translate_array_holes_Y_side_3=[-46.1-extra_thickness,20,0];

rotate_array_holes_X_side=[0,270,0];
rotate_array_holes_Y_side=[0,0,0];

module replace_holes(){
    import("g1.stl");
translate([-30,0,20]){
    color("red")
    cube([10,5,10]);
}


translate([-5,5,5]){
    color("blue")
    cube([5,30,60]);
}

translate([-65,5,0]){
    color("pink")
    cube([60,30,5]);
}
}

module new_holes(){
    custom_cylinder(rotate_input=rotate_array_holes_X_side,translate_input=translate_array_holes_X_side_1,diameter_object=SC_M5_Diameter_PT,height_object=Length_hole_screw);
    color("red")    
    custom_cylinder(rotate_input=rotate_array_holes_X_side,translate_input=translate_array_holes_X_side_2,diameter_object=SC_M5_Diameter_PT,height_object=Length_hole_screw);
    color("red")
    custom_cylinder(rotate_input=rotate_array_holes_X_side,translate_input=translate_array_holes_X_side_3,diameter_object=SC_M5_Diameter_PT,height_object=Length_hole_screw);
    
    color("green")
    custom_cylinder(rotate_input=rotate_array_holes_Y_side,translate_input=translate_array_holes_Y_side_1,diameter_object=SC_M5_Diameter_PT,height_object=Length_hole_screw);
    color("green")    
    custom_cylinder(rotate_input=rotate_array_holes_Y_side,translate_input=translate_array_holes_Y_side_2,diameter_object=SC_M5_Diameter_PT,height_object=Length_hole_screw);
    color("green")
    custom_cylinder(rotate_input=rotate_array_holes_Y_side,translate_input=translate_array_holes_Y_side_3,diameter_object=SC_M5_Diameter_PT,height_object=Length_hole_screw);
    
    
    }

module main(){
    difference(){
    replace_holes();  
    new_holes(); 
    }
    }
    
mirror()    
main();