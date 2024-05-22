// Define variables for the dimensions and hole positions in millimeters

inner_circle_diameter = 13;
outer_circle_diameter = inner_circle_diameter + 10;
outer_circle_height = 100;

hole_for_screw_width = 5;
hole_for_screw_length = 5;
hole_for_screw_height = outer_circle_height;





module body(){
    difference(){
            //outside
        cylinder(d=outer_circle_diameter, h=outer_circle_height, $fn=30);
        //inside
        cylinder(d=inner_circle_diameter, h=outer_circle_height, $fn=30);
    //hole for screw
        color ("red") {
            translate([inner_circle_diameter/2-2,-hole_for_screw_width/2,0]){
                cube([(outer_circle_diameter-inner_circle_diameter),hole_for_screw_width,outer_circle_height]);}
        }
    }

}


module main(){
       body();
 
}
    

main();
