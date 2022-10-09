//measurements

//https://www.cuemath.com/measurement/length-width-height/


//main body (looking from top) in mm

Length_internal = 66.8;
Width_internal = 73.2;
Height_internal = 22.5;

External_thickness= 10;

nut_height = 8.5;
nut_width = 20;

Holding_stem_diameter = 10;

module main_body(){
    difference(){
        cube([Width_internal+External_thickness*2,Length_internal+External_thickness*2,Height_internal]);
        translate([External_thickness,External_thickness,0]){   cube([Width_internal,Length_internal,Height_internal]);}
    }
}

module nut(){
    translate([External_thickness-6,Width_internal/2+nut_width/2,Height_internal/2]){
        rotate([90,0,0]){
            rotate([0,90,0]){
                color("blue"){cylinder(h=6, r=nut_width/2, $fn=6);}
            }
        }
    }
}
module hole_for_stem(){
    translate([0,Width_internal/2+nut_width/2,Height_internal/2]){
        rotate([0,90,0]){
            cylinder(h=External_thickness, d=Holding_stem_diameter, $fn=100);
        }
    }
}


difference(){
    main_body();
    nut();
    hole_for_stem();
}