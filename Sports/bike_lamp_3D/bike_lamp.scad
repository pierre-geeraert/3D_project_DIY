lamp_x = 20;
lamp_y = 10;
lamp_z = 20;

lamp_inside_x = (lamp_x - 5);
lamp_inside_y = (lamp_y - 5);
lamp_inside_z = (lamp_z - 5);

bracket_x = 8;
bracket_y = 5;
bracket_z = 3;
bracket_hole_x = 4;
bracket_hole_y = 3;
bracket_hole_z = 3;

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
module bracket(){
   difference(){
	  cube([bracket_x,bracket_y,bracket_z]);
	  translate([(bracket_x-bracket_hole_x)/2,(bracket_y-bracket_hole_y)/2,(bracket_z-bracket_hole_z)/2]){
		 cube([bracket_hole_x,bracket_hole_y,bracket_hole_z]);}
	  }
   }

module wire_hole(){
   rotate([90,0,0]){
	  cylinder(h=(lamp_y-lamp_inside_y), r=1, $fn=50);
	  }
   }

module main(){
   difference(){
	  //main body
	  #main_body();
	  //cube inside
	  cube_inside(lamp_x,lamp_y,lamp_z,lamp_inside_x,lamp_inside_y,lamp_inside_z);}
	  
   //bracket down
   translate([(lamp_x-bracket_x)/2,-bracket_y,0]){
	  bracket();}
   //bracket up
   translate([(lamp_x-bracket_x)/2,-bracket_y,lamp_z-bracket_z]){
		 bracket();}
	  
   
}



#main();
wire_hole();