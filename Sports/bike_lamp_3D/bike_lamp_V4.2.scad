include <../../Household/references.scad>

// Define variables for the dimensions and hole positions in millimeters


length_object = 18.4;   //X
width_object = 28;    //Y
height_object = 46.5;  //Z

length_perimeter = length_object +6;
width_perimeter = width_object +6;
height_perimeter = height_object +6;


module hole_for_lamp(length_parametric,width_parametric,height_parametric){
radius_circles_corner_parametric = (width_parametric/4);
    hull(){
        translate([0,(width_parametric/2)-radius_circles_corner_parametric,(height_parametric/2)-radius_circles_corner_parametric]){
            rotate([0,90,0]){
                color("green")cylinder(h=length_parametric, d=width_parametric/2 , $fn=100);
            }
        }
        translate([0,-(width_parametric/2)+radius_circles_corner_parametric,(height_parametric/2)-radius_circles_corner_parametric]){
            rotate([0,90,0]){
                color("green")cylinder(h=length_parametric, d=width_parametric/2 , $fn=100);
            }
        }
        translate([0,(width_parametric/2)-radius_circles_corner_parametric,-(height_parametric/2)+radius_circles_corner_parametric]){
            rotate([0,90,0]){
                color("green")cylinder(h=length_parametric, d=width_parametric/2 , $fn=100);
            }
        }
        translate([0,-(width_parametric/2)+radius_circles_corner_parametric,-(height_parametric/2)+radius_circles_corner_parametric]){
            rotate([0,90,0]){
                color("green")cylinder(h=length_parametric, d=width_parametric/2 , $fn=100);
            }
        }
    }
                rotate_array_battery_charger=[90,90,0];
    translate_array_battery_charger=[0,0,height_object/2-1];
    scale([1.12,1.12,1.12]){
        battery_charger(rotate_array_battery_charger,translate_array_battery_charger);
    }

}

difference() {
    hole_for_lamp(length_parametric=length_perimeter,width_parametric=width_perimeter,height_parametric=height_perimeter);
    hole_for_lamp(length_parametric=length_object,width_parametric=width_object,height_parametric=height_object);


    translate([length_object,-(width_perimeter)/2,-VT_width_PT/2]){
       
           color("red")cube([VT_height_PT,width_perimeter,VT_width_PT]);
           }
}
  