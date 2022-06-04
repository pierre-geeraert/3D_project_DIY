//measurements

//https://www.lofty.com/pages/how-to-measure-three-dimensional-objects-including-silver-ceramics-glass-sculpture


//main body (looking from front)

main_body_height = 22;
main_body_width = 120;
main_body_depth = 51;

//main body tube
main_body_tube_diameter = 22;
//Tube bit

tube_bit_height = 60;
tube_bit_diameter = 30.4;
tube_bit_hole_diameter = 17;

//bearing

bearing_diameter = 40;
bearing_height = 12;

//nut
nut_height = 8.3;
nut_width = 16;


 

//threaded shaft
threaded_shaft_diameter = 12;



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
    cylinder(h=nut_height, r=nut_width/2, $fn=6);
    }


module main_body(){
    difference(){//difference to insert tube bit hole inside
        difference(){ // difference to put the bearing on
            union(){
                hull(){ // hull to join the 2 tubes
                    main_body_tube();
                    translate([29,0,0]){//move the tube 
                        main_body_tube();
                    }
                }
                translate([main_body_depth/2,-main_body_width/2,main_body_height]){
                tube_bit();}
            }

            translate([main_body_depth/2,-main_body_width/2,0]){

                bearing();
            }
        }
        translate([main_body_depth/2,-main_body_width/2,bearing_height])
        tube_bit_hole_inside();
        }
}

main_body();
