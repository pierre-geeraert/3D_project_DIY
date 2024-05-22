// Define variables for the dimensions and hole positions in millimeters
outer_circle_diameter = 32;
outer_circle_height = 5;
inner_circle_diameter = 29;
inner_circle_height = 10;



rca_hole_diameter = 9;
switch_hole_diameter = 7;



module custom_cylinder(translated_position_X, translated_position_Y,translated_position_Z,input_diameter) {
    translate([translated_position_X, translated_position_Y, translated_position_Z]){ 
        rotate([0,0,0]){
            cylinder(d=input_diameter, h=outer_circle_height, $fn=30);
        }
    }
}

module body(){
    //outside
    cylinder(d=outer_circle_diameter, h=outer_circle_height, $fn=30);
    //inside
    difference(){
        translate([0,0,outer_circle_height]){ 
            cylinder(d=inner_circle_diameter, h=inner_circle_height, $fn=30);}
        translate([0,0,outer_circle_height]){ 
            cylinder(d=inner_circle_diameter-3, h=inner_circle_height, $fn=30);
        }
    }
}


module main(){
    difference(){
       body();
       color("blue"){custom_cylinder(9,0,0,rca_hole_diameter);}
       color("green"){custom_cylinder(-9,0,0,rca_hole_diameter);}
       color("red"){custom_cylinder(0,(inner_circle_diameter-3)/4,0,switch_hole_diameter);}
   
    }
 
}
    

main();
//body();
