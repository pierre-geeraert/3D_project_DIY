Circle_radius_inside = 29;
Circle_height = 15;

Circle_radius = (Circle_radius_inside + 2.5);
//Circle_width



bracket_x = 8;
bracket_y = 5;
bracket_z = 3;
bracket_hole_x = 4;
bracket_hole_y = 3;
bracket_hole_z = 3;

//main body
module main_body(){
   color("red") {cylinder(h=Circle_height, r=Circle_radius, $fn=50);}
   ;}
module circle_inside(){

   color("green") {cylinder(h=Circle_height-5, r=Circle_radius_inside, $fn=50);}
   ;}   
module bracket(){
   difference(){
	  cube([bracket_x,bracket_y,bracket_z]);
	  translate([(bracket_x-bracket_hole_x)/2,(bracket_y-bracket_hole_y)/2,(bracket_z-bracket_hole_z)/2]){
		 cube([bracket_hole_x,bracket_hole_y,bracket_hole_z]);}
	  }
   }

module wire_hole(){
    wire_hole_radius = 4;
    translate([Circle_radius_inside/2,0,Circle_height-5]){
        color("pink")cylinder(h=5, r=wire_hole_radius, $fn=50);
        
    }
}

module main(){
    
    difference(){
        difference(){
            //main body
            main_body();
            //cube inside
            circle_inside();
        }
        wire_hole();
    }
	  
   //bracket left
   translate([-bracket_x/2,-7,Circle_height]){
	  rotate([90,0,0])     
        bracket();}
   //bracket right
   translate([-bracket_x/2,10,Circle_height]){
	  rotate([90,0,0])     
        bracket();}
	  
   
}



main();
//wire_hole();

//main_body();
//circle_inside();