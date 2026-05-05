include <../Household/references.scad>

length_object = 40;
width_object = 20;
height_object = 12;

length_inserted_object = length_object;
width_inserted_object = 10;
height_inserted_object = 2.5;



//right object

height_fixation_object = 3;


module bed_insertor(){
    difference(){
        hull(){
            translate([(width_object-width_inserted_object)/2,0,0]){cube([(width_object+width_inserted_object)/2,length_object,height_object]);}
            translate([(width_object-width_inserted_object)/2,0,height_object/2]){rotate([-90,0,0]){cylinder(h=length_object, d=height_object , $fn=100);}}
        }
        translate([width_object-width_inserted_object,0,height_object/2-(height_inserted_object/2)]){color("red"){cube([width_inserted_object,length_inserted_object,height_inserted_object]);} }
    }
}
    
    


module fixation(){
    difference(){
        bed_insertor();
        translate([10,(length_object)/2,0]){color("pink"){cylinder(h=height_fixation_object, d=SC_M5_Diameter_IS , $fn=100);} }
        translate([10,(length_object)/2,2]){color("purple"){cylinder(h=height_object, d=SC_M5_Head_Diameter_ES , $fn=100);} }
        
        }
        
        
}

fixation();
