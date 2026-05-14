include <../Household/references.scad>

width_object = 20;
length_object = 20;
height_object = 21.3;

width_material_to_block_screw = 3; //3 mm should be enough to maintain the screw

module block(){
    //difference(){
        cube([width_object,length_object,height_object]);
        
    //}
    }
    
    
difference(){    
hull(){
    //adding width_material_to_block_screw and SC_M5_Head_Height_PT to the height, the piece was too big but it would work if it was cut to the top of the screw head 
translate([0,0,-height_object+width_material_to_block_screw+SC_M5_Head_Height_PT]){    
block();
  
    }
    
rotate([0,166.12,0]){
    translate([-width_object,0,-height_object]){
        block();
        }
        }    
    }
translate([0,0,-height_object-SC_M5_Thread_Height_PT+width_material_to_block_screw+width_material_to_block_screw+SC_M5_Head_Height_PT]){    
    
    translate([width_object/2,length_object/2,0]){
        //add 2 mm on top to take into account printing ringing
        screw("m5",type_of_dimension="PT",height_head_input=SC_M5_Head_Height_PT+2);
        }
    translate([width_object/2,length_object/2,(SC_M5_Thread_Height_PT)*2+SC_M5_Head_Height_PT]){
        rotate([180,0,0]){
            color("pink"){screw("m5",height_thread_input=100,type_of_dimension="PT");}
        }
        }    
        
    for (i = [width_object/2:20]){
        translate([i,length_object/2,0]){
        //add 2 mm on top to take into account printing ringing
        screw("m5",type_of_dimension="PT",height_head_input=SC_M5_Head_Height_PT+2);
        }
    }   
      
      
    }



rotate([0,166.12,0]){
    translate([-width_object,0,-height_object-SC_M5_Thread_Height_PT+width_material_to_block_screw]){
        translate([width_object/2,length_object/2,0]){
    screw("m5",type_of_dimension="PT");
            }
                translate([width_object/2,length_object/2,(SC_M5_Thread_Height_PT)*2+SC_M5_Head_Height_PT]){
        rotate([180,0,0]){
            color("pink"){screw("m5",height_thread_input=100,type_of_dimension="PT");}
        }
        }
    for (i = [width_object/2:20]){
        translate([i,length_object/2,0]){
        screw("m5",type_of_dimension="PT");
        }
    }
      
        }
        }    
    }