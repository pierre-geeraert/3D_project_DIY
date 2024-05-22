//measurements

//https://www.lofty.com/pages/how-to-measure-three-dimensional-objects-including-silver-ceramics-glass-sculpture


//main body (looking from front)

main_body_height = 22;
main_body_width = 120;
main_body_depth = 51;
main_body_distance_between_two_main_bodies = 29; 

//main body tube
main_body_tube_diameter = 22;
//Tube bit

tube_bit_height = 60;
tube_bit_diameter = 45;//was 30.4
tube_bit_hole_diameter = 18;

//tube screen holder
tube_screen_holder_height = tube_bit_height-10;
tube_screen_holder_diameter = 36; //+1mm
tube_screen_holder_hole_diameter = 29;


//bearing

bearing_diameter = 41;
bearing_height = 13;

nut_height = 8.5;
nut_width = 20;


 

//threaded shaft
threaded_shaft_diameter = 12;

module tube_screen_holder(){
    difference(){
        cylinder(h=tube_screen_holder_height, r=(tube_screen_holder_diameter)/2, $fn=50);
        cylinder(h=tube_screen_holder_height, r=(tube_screen_holder_hole_diameter)/2, $fn=50);
    }
}

module tube_bit(){
            cylinder(h=tube_bit_height, r=(tube_bit_diameter)/2, $fn=50);
}
module tube_bit_hole_inside(){
    cylinder(h=tube_bit_height+(main_body_height-bearing_height), r=(tube_bit_hole_diameter)/2, $fn=50);
}
    
module main_body_tube(){
    translate([main_body_height/2,0,main_body_height/2]){
        rotate ([90,0,0])
            cylinder(h=main_body_width, r=(main_body_tube_diameter)/2, $fn=50);
    }
}
module bearing(){
    //translate([main_body_depth/2,-main_body_width/2,0])
    cylinder(h=bearing_height, r=(bearing_diameter)/2, $fn=50);
}
module nut(){
    cylinder(h=bearing_diameter+(nut_height*2), r=nut_width/2, $fn=6);
   }

module holes_for_threaded_shaft(){
     translate([main_body_height/2,0,main_body_height/2]){
        rotate ([90,0,0])
            cylinder(h=main_body_width, r=(threaded_shaft_diameter)/2, $fn=50);
    }
    translate([(main_body_height/2)+main_body_distance_between_two_main_bodies,0,main_body_height/2]){
        rotate ([90,0,0])
            cylinder(h=main_body_width, r=(threaded_shaft_diameter)/2, $fn=50);
    }
}

module nut_negative(x_offset,y_offset,z_offset){
    translate([main_body_height/2+x_offset,0+y_offset,(main_body_height/2)+z_offset]){
        rotate ([90,0,0])
            nut();
    }
}
module main_body(){
  difference(){
    cylinder(h=30, d=20, $fn=40);
    translate([0,0,0]){cylinder(h=30, r=(9.5/2), $fn=50);}
  }
//color ("red") {nut_negative(0,-((main_body_width/2)-(bearing_diameter/2)-nut_height),0);}         
}


main_body();
