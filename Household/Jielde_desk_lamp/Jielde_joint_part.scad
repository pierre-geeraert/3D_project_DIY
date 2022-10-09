Big_outter_diameter = 51.7;
Big_inner_diameter = 45.5;
Little_outter_diameter = 41.78;
Little_inner_diameter = 28.4;
Side_length = 20.4;
Hole_for_screw_diameter = 6;
Holding_stem_diameter = 10;
Holding_plate_height = Holding_stem_diameter + 4;
    
module joint(minus_thickness){
    hull(){
            translate([0,0,Side_length]){
                cylinder(h=1, r=Little_outter_diameter/2-minus_thickness, $fn=50);}
            cylinder(h=1, r=Big_outter_diameter/2-minus_thickness, $fn=100);
            }
        }
module joint_with_hole(){
    difference(){
        joint(0);
        joint(3);
    }
}

module holding_plate(){
    difference(){
        joint(0);
        translate([0,0,Holding_plate_height]){
            cylinder(h=10, d=Big_outter_diameter, $fn=100);
        }
        //add the hole
        cylinder(h=Holding_plate_height,d=Hole_for_screw_diameter,$fn=50);
    }
}

module holding_stem(){
    translate([-(Hole_for_screw_diameter+(Holding_stem_diameter/2)),Big_outter_diameter/2,(Holding_stem_diameter/2)+2]){
        rotate([90,0,0]){
            color("green")cylinder(h=Big_outter_diameter, d=Holding_stem_diameter , $fn=100);
        }
    }
}

module joint_with_plate(){
    holding_plate();
    joint_with_hole();    
}
//main

difference(){
    joint_with_plate();    
    holding_stem();
}