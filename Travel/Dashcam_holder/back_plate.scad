include <reference_Dashcam_holder.scad>


module back_plate(){
     translate([0,5,0]){
         cube([DC_TB_Diameter_PT+thickness_object*2+5,5,DC_TB_Diameter_PT+thickness_object*2+5],center = true);
     }
}

module hole_for_screws(){
    color("green") translate([0,0,DC_TB_Radius_PT+(thickness_object/2)])rotate([270,0,0]){cylinder(h=DC_TB_Diameter_PT, d=SC_Diameter_IS, $fn=40);}


color("green")  rotate([-90,-30,0])translate([-(DC_TB_Radius_PT+(thickness_object/2)),0,0]){cylinder(h=DC_TB_Diameter_PT, d=SC_Diameter_IS, $fn=40);}
color("green")  rotate([-90,210,0])translate([-(DC_TB_Radius_PT+(thickness_object/2)),0,0]){cylinder(h=DC_TB_Diameter_PT, d=SC_Diameter_IS, $fn=40);}
    }
    
    
 module main(){
     difference(){
         back_plate();
         hole_for_screws();
     }
 }
 
 main();
 hole_for_screws();
 
 
