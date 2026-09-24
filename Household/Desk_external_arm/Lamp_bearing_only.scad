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
tube_bit_diameter = 50;//was 30.4
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
        cylinder(h=tube_screen_holder_height, r=(tube_screen_holder_diameter)/2, $fn=50);

}

module tube_bit(){
            cylinder(h=tube_bit_height, r=(tube_bit_diameter)/2, $fn=50);
}
module tube_bit_hole_inside(){
    cylinder(h=tube_bit_height+(main_body_height-bearing_height), r=(tube_bit_hole_diameter)/2, $fn=50);
}
    

module bearing(){
    cylinder(h=bearing_height, r=(bearing_diameter)/2, $fn=50);
}


module main_body(){
    difference(){

        translate([main_body_depth/2,-main_body_width/2,0]){
                tube_bit();}    
          
     translate([main_body_depth/2,-main_body_width/2,0]){bearing();}

     translate([main_body_depth/2,-main_body_width/2,bearing_height]){
        tube_bit_hole_inside();
        }
                  
color ("green") {translate([main_body_depth/2,-main_body_width/2,main_body_height+10]){ tube_screen_holder();}}
}
}

main_body();
