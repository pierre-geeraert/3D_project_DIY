include <../../Household/references.scad>

// Define variables for the dimensions and hole positions in millimeters

//size LED string
length_led_string = 100;
width_led_string = 5;
height_led_string = 2;

//structure
wall_thickness = 2;
gap_for_room = 2;

module main(){
    cube([length_led_string,width_led_string ,gap_for_room ]);
        }
    



main();
