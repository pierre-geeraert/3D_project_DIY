x=27;
y=22;
z=14;

difference(){
    cube([x,y,z]);

    translate([x/2,y,(z/2)]){
        rotate([90,0,0]){
            cylinder(h=(y), r=4, $fn=50);
          }}
}