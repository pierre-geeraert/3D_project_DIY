include <../Household/references.scad>

// Define variables for the dimensions and hole positions in millimeters

//main
extra_thickness = 5;

//head
length_object = 55.8;   //X
width_object = length_object;    //Y
height_object = 20;  //Z

Length_hole_screw = 3;
length_hole_screwHead = length_object;

translate_array_holes_X_side_1=[8.1+extra_thickness,0,height_object/2];
translate_array_holes_X_side_2=[27.1+extra_thickness,0,height_object/2];
translate_array_holes_X_side_3=[46.1+extra_thickness,0,height_object/2];
translate_array_holes_Y_side_1=[0,8.1,height_object/2];
translate_array_holes_Y_side_2=[0,27.1,height_object/2];
translate_array_holes_Y_side_3=[0,46.1,height_object/2];

translate_array_holes_ScrewHead_X_side_1=[8.1+extra_thickness,Length_hole_screw,height_object/2];
translate_array_holes_ScrewHead_X_side_2=[27.1+extra_thickness,Length_hole_screw,height_object/2];
translate_array_holes_ScrewHead_X_side_3=[46.1+extra_thickness,Length_hole_screw,height_object/2];
translate_array_holes_ScrewHead_Y_side_1=[Length_hole_screw,8.1,height_object/2];
translate_array_holes_ScrewHead_Y_side_2=[Length_hole_screw,27.1,height_object/2];
translate_array_holes_ScrewHead_Y_side_3=[Length_hole_screw,46.1,height_object/2];



rotate_array_holes_X_side=[270,0,0];
rotate_array_holes_Y_side=[0,90,0];




module triangle(length_triangle,width_triangle,height_triangle){
    linear_extrude(height = height_triangle) {
        polygon(points=[[0,0], [length_triangle,0], [0,width_triangle]]);
    }    
}

module main(){
    //triangle generation
    difference(){
    triangle(length_object,width_object,height_object);
        color("red")
    custom_cylinder(rotate_input=rotate_array_holes_X_side,translate_input=translate_array_holes_X_side_1,diameter_object=SC_M5_Diameter_PT,height_object=Length_hole_screw);
    color("red")    
    custom_cylinder(
        rotate_input=rotate_array_holes_X_side,
        translate_input=translate_array_holes_X_side_2,
        diameter_object=SC_M5_Diameter_PT,
        height_object=Length_hole_screw);
        
    color("red")
    custom_cylinder(rotate_input=rotate_array_holes_X_side,translate_input=translate_array_holes_X_side_3,diameter_object=SC_M5_Diameter_PT,height_object=Length_hole_screw);
    
    color("red")
    custom_cylinder(rotate_input=rotate_array_holes_Y_side,translate_input=translate_array_holes_Y_side_1,diameter_object=SC_M5_Diameter_PT,height_object=Length_hole_screw);
    color("red")    
    custom_cylinder(rotate_input=rotate_array_holes_Y_side,translate_input=translate_array_holes_Y_side_2,diameter_object=SC_M5_Diameter_PT,height_object=Length_hole_screw);
    color("red")
    custom_cylinder(rotate_input=rotate_array_holes_Y_side,translate_input=translate_array_holes_Y_side_3,diameter_object=SC_M5_Diameter_PT,height_object=Length_hole_screw);
    
    
          color("green")
    custom_cylinder(rotate_input=rotate_array_holes_X_side,translate_input=translate_array_holes_ScrewHead_X_side_1,diameter_object=SC_M5_Head_Diameter_PT,height_object=length_hole_screwHead);
    color("green")    
    custom_cylinder(rotate_input=rotate_array_holes_X_side,translate_input=translate_array_holes_ScrewHead_X_side_2,diameter_object=SC_M5_Head_Diameter_PT,height_object=length_hole_screwHead);
    color("green")
    custom_cylinder(rotate_input=rotate_array_holes_X_side,translate_input=translate_array_holes_ScrewHead_X_side_3,diameter_object=SC_M5_Head_Diameter_PT,height_object=length_hole_screwHead);
    
    color("green")
    custom_cylinder(rotate_input=rotate_array_holes_Y_side,translate_input=translate_array_holes_ScrewHead_Y_side_1,diameter_object=SC_M5_Head_Diameter_PT,height_object=length_hole_screwHead);
    color("green")    
    custom_cylinder(rotate_input=rotate_array_holes_Y_side,translate_input=translate_array_holes_ScrewHead_Y_side_2,diameter_object=SC_M5_Head_Diameter_PT,height_object=length_hole_screwHead);
    color("green")
    custom_cylinder(rotate_input=rotate_array_holes_Y_side,translate_input=translate_array_holes_ScrewHead_Y_side_3,diameter_object=SC_M5_Head_Diameter_PT,height_object=length_hole_screwHead);

    }
}
main();    
