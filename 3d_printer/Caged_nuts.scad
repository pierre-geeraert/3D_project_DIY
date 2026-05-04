include <../Household/references.scad>

length_carriage_cage=15;
width_carriage_cage=11;
height_carriage_cage=4;

module part(){
    cube([width_carriage_cage,length_carriage_cage,height_carriage_cage]);   
    }

module main(){
    difference(){
        part();
        translate([width_carriage_cage/2,length_carriage_cage/2,0]){nut_M5(height_carriage_cage);};
    }
}
main();
    