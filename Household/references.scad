// Size
//Naming
// _PT = printable
// _ES = exact size
// _IS = insertable with force but no gaps

//--------------threaded rod  (TR)

//----M5

TR_M5_Diameter_ES = 5.8;
//for a hole 
TR_M5_Diamater_IS = 6;
TR_M5_Diamater_PT = 7;


//----M10

TR_M10_Diameter_ES = 9.6;
//for a hole 
TR_M10_Diamater_IS = 10;
TR_M10_Diamater_PT = 12;

//--------------Screw (SC)
//----M3

SC_M3_Diameter_ES = 2.96;
SC_M3_Head_Diameter_ES = 5.90;
SC_M3_Head_Height_ES = 2.32;
//for a hole 
SC_M3_Diameter_PT = 4; 


//----M5

SC_M5_Diameter_ES = 4.86;
SC_M5_Head_Diameter_ES = 9.24;
SC_M5_Head_Height_ES = 3.0;
//for a hole 
SC_M5_Diamater_IS = 5;
SC_M5_Diamater_PT = 0; //inconnu pour le moment


//--------------Nut Bolt (NB)

module nut_M3(height_input){
    cylinder(d=NB_M3_Diameter_C2C_PT,h=height_input,$fn=6);
    
    }

//----M3
// Side to side = from 2 paralelle faces S2S
// corner to corner = from 2 corners C2C


NB_M3_Diameter_S2S_ES = 5.30;
NB_M3_Diameter_C2C_ES = 6.0;

NB_M3_Diameter_S2S_PT = 7.30;
NB_M3_Diameter_C2C_PT = 8.0;


//--------------Zip ties (ZT)

//Big zip ties I got    

ZT_length_ES = 300;
ZT_width_ES = 4.8;
ZT_height_ES = 1;

ZT_width_PT = 7;
ZT_height_PT = 3;


//--------------Switch (SW)
//switch from castorama 
SW_length_ES = 13;
SW_width_ES = 8;
SW_height_ES = 14;

SW_length_PT = 15;
SW_width_PT = 10;
SW_height_PT = 16;


//switch from aliexpress
SW_AL_tube_width_ES = 5.7;
SW_AL_tube_width_PT = 7;

module custom_cylinder_switch(translated_position_X, translated_position_Y,translated_position_Z,heigh_input) {
    translate([translated_position_X, translated_position_Y, translated_position_Z]){ 
        rotate([90,0,0]){
            cylinder(d=SW_AL_tube_width_PT, h=heigh_input, $fn=30);
        }
    }
}

//https://d138zd1ktt9iqe.cloudfront.net/media/seo_landing_files/length-width-height-01-1646654708.png