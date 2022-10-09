//measurements

//https://www.lofty.com/pages/how-to-measure-three-dimensional-objects-including-silver-ceramics-glass-sculpture

nut_width = 22;
cube_length = 20;

module holder_with_hole(){
    difference(){
        cylinder(h=13, r=15, $fn=40);
        cylinder(h=13, r=(9.5/2), $fn=40);
        }
    }
    
module fixation_holes(){
    difference(){
        cube([cube_length,cube_length,3]);
        translate([cube_length/2,cube_length/2,0]){
            color ("red") {cylinder(h=3, r=7/2, $fn=50);}
        }
    }
    }
module main_body(){
  difference(){
    holder_with_hole();
    color ("red") {cylinder(h=10, r=nut_width/2, $fn=6);}
    
}
    
}


main_body();
translate([nut_width/2+1,-cube_length/2,0]){fixation_holes();}
translate([-(cube_length+nut_width/2+1),-cube_length/2,0]){fixation_holes();}