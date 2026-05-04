include <../Household/references.scad>

length_carriage_cage=20;
width_carriage_cage=17;
height_carriage_cage=3;

length_slot=length_carriage_cage;
width_slot=4;
height_slot=1;


module part(){
    cube([width_carriage_cage,length_carriage_cage,height_carriage_cage]);   
    }

module slots(){
    color("green"){
        translate([width_carriage_cage/2-(width_slot/2),0,0]){cube([width_slot,length_slot,height_slot]);}; 
        //translate([width_carriage_cage/2-(width_slot/2),0,height_carriage_cage-height_slot]){cube([width_slot,length_slot,height_slot]);}; 

    }
    }

module holes_for_screw(){
    color("red"){
    position_hole = [width_carriage_cage/2,length_carriage_cage/2,0];
    rotate_nuts=[0,0,0];
    custom_cylinder(
            rotate_input=rotate_nuts,
            translate_input=position_hole,
            diameter_object=4,
            height_object=height_carriage_cage);
    }
    }
module main(){
    difference(){
        part();
        holes_for_screw();
        slots();
    }

}
main();
    