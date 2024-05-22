length_object = 120;
width_object = 40;
height_object = 3;

diameter_circles_corner = (width_object/4);

module letter_fixer(translate_x,translate_y){
    translate([translate_x,translate_y,0]){ color("green")cube([1,5,height_object]);}
    
    }

module board (){
    hull(){
        translate([diameter_circles_corner/2,diameter_circles_corner/2,0]){ color("green")cylinder(h=height_object, d=diameter_circles_corner , $fn=100);}
        translate([diameter_circles_corner/2,width_object-(diameter_circles_corner/2),0]){ color("green")cylinder(h=height_object, d=diameter_circles_corner , $fn=100);}
        translate([length_object-(diameter_circles_corner/2),diameter_circles_corner/2,0]){ color("green")cylinder(h=height_object, d=diameter_circles_corner , $fn=100);}
        translate([length_object-(diameter_circles_corner/2),width_object-(diameter_circles_corner/2),0]){ color("green")cylinder(h=height_object, d=diameter_circles_corner , $fn=100);}
    }
}

module penis(){
    translate([0,0,0]){ color("green")cylinder(h=height_object, d=diameter_circles_corner , $fn=100);}
    
    translate([0,diameter_circles_corner,0]){ color("green")cylinder(h=height_object, d=diameter_circles_corner , $fn=100);}
    
    translate([0,diameter_circles_corner/2-(3),0]){ color("green")cube([30,6,height_object]);}
    
    translate([30,diameter_circles_corner/2,0]){ color("green")cylinder(h=height_object, d=diameter_circles_corner , $fn=100);}
    }


difference() {
    board();
  //cube([length_object, width_object, height_object]);
  translate([2,width_object-13, 0]) linear_extrude(height=height_object)text("Christian Geeraert ", size=10);
  translate([4,width_object/2-2, 0])scale([0.5,0.5,1])penis();
  translate([2,2, 0]) linear_extrude(height=height_object)text("+33 6 83 59 79 05 ", size=10);
}

letter_fixer(43.5,24); // letter A (1)
letter_fixer(73.5,32); // letter E (1)
letter_fixer(81,32); // letter E (2)
letter_fixer(93,24); // letter A (2)
letter_fixer(100.5,32); // letter E (3)

letter_fixer(33,0); // number 6
letter_fixer(43.5,0); // number 8 top
letter_fixer(43.5,10); // number 8 bottom
letter_fixer(69.5,10); // number 9 (1)
letter_fixer(88.5,10); // number 9 (2)
letter_fixer(100,10); // number 0 top
letter_fixer(100,0); // number 0 bottom