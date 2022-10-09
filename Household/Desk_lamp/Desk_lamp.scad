
box_external_width = 80;
box_external_depth = 60;
box_external_height = 30;

size_of_walls = 3;

box_internal_width = box_external_width-(size_of_walls*2);
box_internal_depth = box_external_depth -size_of_walls*2;
box_internal_height = box_external_height - size_of_walls;

hole_diameter = 7.7;

connector_x = 15;
connector_y = 8.6;

Connector_body_width = 10;
Connector_tube_diameter = 22;
threaded_shaft_diameter = 12;
main_body_distance_between_two_main_bodies = 29; 


module box(){
    difference(){
    cube([box_external_width,box_external_depth,box_external_height]);
    translate([(box_external_width-box_internal_width)/2,(box_external_depth-box_internal_depth)/2,(box_external_height-box_internal_height)]){cube([box_internal_width,box_internal_depth,box_internal_height]);}
    }
}
    
module holes(x_position,y_position,z_position){
    translate([x_position,y_position,z_position]){
    cylinder(h=(box_external_height-box_internal_height), r=hole_diameter/2, $fn=50);
    }
}
   
module main_body_tube(){
    difference(){
        union(){
    hull(){
    translate([(box_external_width/2)-(Connector_body_width/2),-(Connector_tube_diameter/2-2.5),(Connector_tube_diameter/2)]){
        rotate ([0,90,0]){
            cylinder(h=Connector_body_width, r=(Connector_tube_diameter)/2, $fn=50);
            translate([0,-(main_body_distance_between_two_main_bodies),0]){cylinder(h=Connector_body_width, r=(Connector_tube_diameter)/2, $fn=50);}}
    }}}
    translate([(box_external_width/2)-(Connector_body_width/2),-(Connector_tube_diameter/2-2.5),(Connector_tube_diameter/2)]){
        rotate ([0,90,0]){
            cylinder(h=Connector_body_width, r=(threaded_shaft_diameter)/2, $fn=50);
            translate([0,-(main_body_distance_between_two_main_bodies),0]){cylinder(h=Connector_body_width, r=(threaded_shaft_diameter)/2, $fn=50);}}
    }}
}



main_body_tube();
difference(){
box();

holes(10+size_of_walls,30,0);
holes(20+size_of_walls,30,0);
rotate ([0,-90,0])holes(size_of_walls+(hole_diameter/2),30,-size_of_walls);
translate([box_internal_width+size_of_walls,(box_external_depth/2)-(connector_x/2),size_of_walls]){cube([size_of_walls,connector_x,connector_y]);}    

}
translate([size_of_walls,size_of_walls,box_external_height-(size_of_walls*2)]){cube([6,box_internal_depth,3]);}
translate([(box_external_width-size_of_walls-6),size_of_walls,box_external_height-(size_of_walls*2)]){cube([6,box_internal_depth,3]);}


;