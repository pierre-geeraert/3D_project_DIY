include <../Household/references.scad>

length_object = 100;
width_object = 20;
height_object = 12;

length_inserted_object = length_object;
width_inserted_object = 10;
height_inserted_object = 2.5;

//left object
/*
length_fixation_object = 54;
width_fixation_object = 20;
height_fixation_object = 3;
distance_between_holes=41.7;
*/

//right object
length_fixation_object = 67.4;
width_fixation_object = 20;
height_fixation_object = 3;
distance_between_holes=55;


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
        //cube([width_fixation_object,length_fixation_object,height_fixation_object]);
        translate([10,(length_object-distance_between_holes)/2,0]){color("red"){cylinder(h=height_fixation_object, d=SC_M5_Diamater_IS , $fn=100);} }
        translate([10,(length_object-distance_between_holes)/2,2]){color("purple"){cylinder(h=height_object, d=SC_M5_Head_Diameter_ES , $fn=100);} }
        translate([10,(length_object+distance_between_holes)/2,0]){color("blue"){cylinder(h=height_fixation_object, d=SC_M5_Diamater_IS , $fn=100);} }
        translate([10,(length_object+distance_between_holes)/2,2]){color("green"){cylinder(h=height_object, d=SC_M5_Head_Diameter_ES , $fn=100);} }
        }
        
        
}


module fixation2(){
    difference(){
        cube([width_fixation_object,length_fixation_object,height_fixation_object]);
        translate([10,(length_fixation_object-distance_between_holes)/2,0]){color("red"){cylinder(h=height_fixation_object, d=5 , $fn=100);} }
       translate([10,(length_fixation_object+distance_between_holes)/2,0]){color("blue"){cylinder(h=height_fixation_object, d=5 , $fn=100);} }
        }
}


// left object
/*
bed_insertor();
translate([-width_fixation_object,length_object/2-length_fixation_object/2,0]){fixation();}


*/

// right object


fixation();
//translate([-width_fixation_object,length_object/2-length_fixation_object/2,0]){fixation2();}


