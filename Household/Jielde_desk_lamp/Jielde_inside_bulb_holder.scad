include <../references.scad>

Tube_length = 15;
Tube_diameter = 27.3;
Hole_diameter = 5;


//Big_outter_diameter = 51.7;
//Big_inner_diameter = 51.7;
//Little_outter_diameter = 41.78;
//Little_inner_diameter = 28.4;
//Side_length = 20.4;
//Hole_for_screw_diameter = 6;
//Holding_stem_diameter = 10;
//Holding_plate_height = Holding_stem_diameter + 4;



module support(){
    rotate([0,0,0]){
            color("green")cylinder(h=Tube_length, d=Tube_diameter , $fn=100);
    }
}

module holes(position_x,position_y,position_z,percentage_of_length){
    translate([position_x,position_y,position_z]){
        color("blue")cylinder(h=Tube_length*(percentage_of_length/100), d=Hole_diameter , $fn=100);
    }
}

module switch_square(){
    translate([-SW_length_PT/2,-SW_width_PT/2,0]){
        color("purple")cube([SW_length_PT,SW_width_PT,SW_height_PT]);
    }}

module holes_for_cables(position_x,position_y,position_z){
    translate([position_x,position_y,position_z]){
        rotate([0,-90,0]){
            color("brown")cylinder(h=Tube_diameter, d=Hole_diameter , $fn=100);
        }
    }
}

difference(){
    support();
    holes(9,0,0,100);
    holes(-9,0,0,100);
    switch_square();

    rotate([0,0,110.78]){
//    holes_for_cables(14,0,Tube_length/2);
        color("red"){
            hull(){
                holes(11,0,Tube_length-(Tube_length*(33/100)),33);
                holes(13,0,Tube_length-(Tube_length*(33/100)),33);
                }
            hull(){
                holes(-11,0,Tube_length-(Tube_length*(33/100)),33);
                holes(-13,0,Tube_length-(Tube_length*(33/100)),33);
                }
        }
    }
    rotate([0,0,-110.78]){
        color("pink"){
            hull(){
                holes(6,0,Tube_length-(Tube_length*(33/100)),33);
                holes(13,0,Tube_length-(Tube_length*(33/100)),33);
                }
            hull(){
                holes(-6,0,Tube_length-(Tube_length*(33/100)),33);
                holes(-13,0,Tube_length-(Tube_length*(33/100)),33);
                }
        }
    }


}

//was :                 holes(11,0,Tube_length-(Tube_length*(33/100)),33);
