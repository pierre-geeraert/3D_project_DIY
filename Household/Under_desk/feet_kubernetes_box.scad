//measurements

//https://www.lofty.com/pages/how-to-measure-three-dimensional-objects-including-silver-ceramics-glass-sculpture

object_height = 30;

module holder_with_hole(){
    difference(){
        cylinder(h=object_height, d=30, $fn=40);
        cylinder(h=object_height, d=7, $fn=40);
        }
    }
    
module hole_inside(){
    color ("blue") {cylinder(h=object_height-3, d=13, $fn=40);}
    }

module main_body(){
  difference(){
    holder_with_hole();
    hole_inside();
    
}
    
}


main_body();
