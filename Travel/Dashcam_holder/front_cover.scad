//measurements

//https://www.lofty.com/pages/how-to-measure-three-dimensional-objects-including-silver-ceramics-glass-sculpture
include <reference_Dashcam_holder.scad>
object_height = 30;




module ball(){
    difference(){

        sphere(d = DC_TB_Diameter_PT+(thickness_object*2), $fn=100); 
        sphere(d = DC_TB_Diameter_PT, $fn=100);         
    }
    
}



module half_squared(){
    
     difference(){

    ball();
    color("blue") translate([-(DC_TB_Diameter_PT+(thickness_object*2)), -(DC_TB_Diameter_PT+(thickness_object*2)), -(DC_TB_Diameter_PT+(thickness_object*2))]){
        cube([(DC_TB_Diameter_PT+(thickness_object*2))*2,DC_TB_Diameter_PT+(thickness_object*2),(DC_TB_Diameter_PT+(thickness_object*2))*2],false);
        }
    color("green") translate([0,0,0])rotate([270,0,0]){cylinder(h=100, d=DC_LE_Diameter_ES*2, $fn=40);}
    }    
}

module hole_for_screws(){
    color("green") translate([0,0,DC_TB_Radius_PT+(thickness_object/2)])rotate([270,0,0]){cylinder(h=DC_TB_Diameter_PT, d=SC_Diameter_IS, $fn=40);}

color("green")  rotate([-90,-30,0])translate([-(DC_TB_Radius_PT+(thickness_object/2)),0,0]){cylinder(h=DC_TB_Diameter_PT, d=SC_Diameter_IS, $fn=40);}
color("green")  rotate([-90,210,0])translate([-(DC_TB_Radius_PT+(thickness_object/2)),0,0]){cylinder(h=DC_TB_Diameter_PT, d=SC_Diameter_IS, $fn=40);}
    }

module main_body(){
    difference(){
        half_squared();
        hole_for_screws();
    }
    
}

main_body();
        

 