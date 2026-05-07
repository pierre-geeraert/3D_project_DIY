include <../Household/references.scad>

width_object = 20;
length_object = 20;
height_object = 21.3;

width_material_to_block_screw = 3; //3 mm should be enough to maintain the screw

module block(){
    difference(){
        cube([width_object,length_object,height_object]);
        translate([width_object/2,length_object/2,-SC_M5_Thread_Height_PT+width_material_to_block_screw]){screw("m5",height_head_input=height_object+100,type_of_dimension="PT");};
    }
    }
    
rotate([0,166.12,0]){
    translate([-width_object,0,-height_object]){
        block();
        }
        }    

translate([0,0,-height_object]){    
block();}