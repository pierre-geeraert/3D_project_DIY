include <../references.scad>

//Dimension de profile

main_body_height = 56;
main_body_length = 40;
main_body_width = 20;

insert_height = 56;
insert_length = 20;
insert_width = 4.5;
module main_body(){ 
 hull(){   
    color("pink"){
        cube([main_body_length-main_body_width,main_body_width,main_body_height]);
    }
    color("red"){
        translate([main_body_length-(insert_length/2),main_body_width/2,0]){cylinder(h=main_body_height, r=main_body_width/2, $fn=50);}
        }
}}

module G_insert(){
    color("green"){
        cube([insert_length,insert_width,insert_height]);
    }
}

module threaded_shaft_hole(){
    color("red"){
        cylinder(h=main_body_height, r=(TR_M10_Diamater_PT)/2, $fn=50);
    }
}
module zip_ties_hole(){
    color("purple"){
        //flip 90° the measurements
        cube([ZT_height_PT,main_body_width,ZT_width_PT]);
    }
}

difference(){
    main_body();
    translate([0,main_body_width/2-insert_width/2,0]){
        G_insert();}
        
    translate([main_body_length-(insert_length/2),main_body_width/2,0]){
        threaded_shaft_hole();}
    translate([main_body_length-ZT_height_PT-0.5,0,main_body_height/3-(ZT_width_PT/2)]){
        zip_ties_hole();}
    translate([main_body_length-ZT_height_PT-0.5,0,(main_body_height/3)*2-(ZT_width_PT/2)]){
        zip_ties_hole();}
        
    }
