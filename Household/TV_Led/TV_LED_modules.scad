include <../../Household/references.scad>

// Define variables for the dimensions and hole positions in millimeters

//size LED string
length_led_string = 260;
width_led_string = 16;
height_led_string = 2;

//structure
wall_thickness = 2;
gap_for_room = 2;


module hole_for_cable(){
    rotate_array_cable=[0,90,0];
    translate_array_cable=[0,(width_led_string+gap_for_room+wall_thickness)/2,(height_led_string+gap_for_room)/2];
    custom_cylinder(rotate_input=rotate_array_cable,translate_input=translate_array_cable,diameter_object=CB_RJ45_Diameter_ES,height_object=wall_thickness);
    }


module main(){
    difference() {
        cube([(length_led_string+gap_for_room+wall_thickness),width_led_string+gap_for_room+wall_thickness ,height_led_string+gap_for_room]);
        translate([(gap_for_room+wall_thickness)/2,(gap_for_room+wall_thickness)/2,(gap_for_room)]){
            cube([length_led_string,width_led_string ,height_led_string ]);
        }
        color("red")hole_for_cable();
    }
}


main();
