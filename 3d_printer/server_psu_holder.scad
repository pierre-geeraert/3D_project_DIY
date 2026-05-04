include <../Household/references.scad>

SC_M3_Diameter_ES = 2.96;
SC_M3_Head_Diameter_ES = 5.90;
SC_M3_Head_Height_ES = 2.32;
//for a hole 
SC_M3_Diameter_PT = 4; 


//----M5

SC_M5_Diameter_ES = 4.86;
SC_M5_Head_Diameter_ES = 9.24;
SC_M5_Head_Height_ES = 3.0;


NB_M3_Diameter_S2S_ES = 5.30;
NB_M3_Diameter_C2C_ES = 6.0;

NB_M3_Diameter_S2S_PT = 6.30; //reducing as well
NB_M3_Diameter_C2C_PT = 7.0; //8.0 was too much 

NB_M5_Diameter_C2C_ES = 8.9;

NB_M5_Diameter_C2C_PT = 10.5; //8.0 was too much 


nut_dictionary = [
  ["example", "Diameter side to side","Nut_Height"],
  ["m3", NB_M3_Diameter_S2S_ES,1],
  ["m5", 0,0],
];

screw_dictionary = [
  ["example", "Diameter","Head_Diameter","Head_Height"],
  ["m3", SC_M3_Diameter_ES,SC_M3_Head_Diameter_ES,SC_M3_Head_Height_ES],
  ["m5", SC_M5_Diameter_ES,SC_M5_Head_Diameter_ES,SC_M5_Head_Height_ES],
];

function selector(dictionary,item) = [
  for (spec = dictionary)
  if (spec[0] == item)
  spec
];


  
module nut(type_of_nut,height_input="undefinied"){
    //retrieving from dictionary using function
    chosen_spec = selector(nut_dictionary,type_of_nut);  
    //determine nut diameter
    nut_diameter = chosen_spec[0][1];
    
    //if nut height is undefined, take the value from the dict
    object_height = (height_input == "undefined") ? chosen_spec[0][2] : height_input;

    //create the cylinder
    cylinder(d=nut_diameter ,h=object_height,$fn=6);
    
    }

nut("m3");
    
    
    
module screw(type_of_screw,height_input="undefinied"){
    //retrieving from dictionary using function
    chosen_spec = selector(screw_dictionary,type_of_screw);  
    //determine nut diameter
    screw_diameter = chosen_spec[0][1];
    
    //if screw height is undefined, take the value from the dict
    object_height = (height_input == "undefined") ? chosen_spec[0][3] : height_input;

    //create the cylinder
    cylinder(d=screw_diameter,h=object_height,$fn=60);
    
    }
    
//    screw("m5",5);
    
    