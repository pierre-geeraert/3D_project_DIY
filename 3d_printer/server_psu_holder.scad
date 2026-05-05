include <../Household/references.scad>


psu_height=41; 
psu_width=108;

object_length=20;
object_thickness = 5;

holes_bits_length = 30;

module object(){
    color("red"){
        translate([-(psu_width+object_thickness*2)/2,0,0]){
            cube([psu_width+object_thickness*2,object_length,psu_height+object_thickness]);
}}}

module psu(){
    color("green"){
        translate([-psu_width/2,0,0]){
            cube([psu_width,object_length,psu_height]);
}}}

module holes_bits(){
    difference(){
        color("blue"){
            cube([holes_bits_length,object_length,object_thickness]);}
        color("purple"){
            translate([holes_bits_length/2,object_length/2,0]){screw("m5","PT",object_thickness);}
        }
    }}

module main(){
    difference(){
        object();
        psu();
    }
    translate([(psu_width+object_thickness*2)/2,0,0]){holes_bits();};
    translate([-(psu_width+object_thickness*2)/2-holes_bits_length,0,0]){holes_bits();};

    }

main();