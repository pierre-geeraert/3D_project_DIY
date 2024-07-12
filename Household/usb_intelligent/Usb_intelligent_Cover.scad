// Define variables for the dimensions and hole positions in millimeters
box_length = 140;
box_width = 55;
box_height = 20;

inside_box_length = box_length - 4;
inside_box_width = box_width - 4;
inside_box_height = box_height - 2;

usb_port_length = 16;
usb_port_width = 2;
usb_port_height = 8;

rca_hole_diameter = 9;
jack_hole_diameter = 7;


module custom_cylinder(translated_position_X, translated_position_Y,translated_position_Z,input_diameter) {
    translate([translated_position_X, translated_position_Y, translated_position_Z]){ 
        rotate([90,0,0]){
            cylinder(d=input_diameter, h=2, $fn=30);
        }
    }
}
module custom_cylinder_switch(translated_position_X, translated_position_Y,translated_position_Z) {
    translate([translated_position_X, translated_position_Y, translated_position_Z]){ 
        rotate([0,0,0]){
            cylinder(d=7, h=2, $fn=30);
        }
    }
}
module support_board(translated_position_X, translated_position_Y,translated_position_Z) {
    translate([translated_position_X, translated_position_Y, translated_position_Z]){ 
        difference(){
            cylinder(d=10, h=9, $fn=30);
            //cylinder(d=4, h=9, $fn=30);

        }
    }
}

module usb_port(translated_position_X, translated_position_Y,translated_position_Z) {
    translate([translated_position_X, translated_position_Y, translated_position_Z]){ 
            cube([usb_port_length, usb_port_width, usb_port_height]);}        
}

module main(){
    difference(){
        
    translate([-box_length/2,-box_width/2,0]){
            cube([box_length, box_width, box_height]);}
    translate([-box_length/2,-box_width/2,box_height-inside_box_height]){
            cube([box_length, box_width, box_height]);}
        //cube([inside_box_length, inside_box_width, inside_box_height]);}
        //custom_cylinder(box_length/2-20,box_width/2,box_height/2,rca_hole_diameter);
        //custom_cylinder(-box_length/2+20,box_width/2,box_height/2,rca_hole_diameter);
        //usb_port(box_length/2-(usb_port_length+15),-box_width/2,rca_hole_diameter);
        //usb_port(box_length/2-(usb_port_length+15)-20,-box_width/2,9);
        //usb_port(box_length/2-(usb_port_length+15)-40,-box_width/2,9);
        //usb_port(box_length/2-(usb_port_length+15)-60,-box_width/2,9);
        //custom_cylinder(box_length/2-(usb_port_length+15)-73,-box_width/2,9+(usb_port_height/2),jack_hole_diameter);
        //custom_cylinder(box_length/2-(usb_port_length+15)-88,-box_width/2,9+(usb_port_height/2),jack_hole_diameter); 
        //custom_cylinder_switch(box_length/2-30,box_width/2-17,0);
        //custom_cylinder_switch(-(box_length/2-30),box_width/2-17,0);
    
        }
 
}
    
difference(){
main();
support_board(box_length/2-8,(-box_width/2)+24,0);
support_board(-(box_length/2-8),(-box_width/2)+24,0);
}
