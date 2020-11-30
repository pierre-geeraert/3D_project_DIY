lamp_x = 20;
lamp_y = 10;
lamp_z = 20;

lamp_inside_x = (lamp_x - 5);
lamp_inside_y = (lamp_y - 5);
lamp_inside_z = (lamp_z - 5);





//main body
module main_body(){
   cube([lamp_x,lamp_y,lamp_z]);}
module cube_inside(x,y,z,inside_x,inside_y,inside_z){
   lamp_pos_x = (x-inside_x)/2;
   lamp_pos_y = (y-inside_y);
   lamp_pos_z = (z-inside_z)/2;
   
   translate([lamp_pos_x,lamp_pos_y,lamp_pos_z]){
	  cube([inside_x,inside_y,inside_z]);}
   ;}   
module main(){
   difference(){
	  main_body();
	  cube_inside(lamp_x,lamp_y,lamp_z,lamp_inside_x,lamp_inside_y,lamp_inside_z);}
}

main();