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

module body_M3(height_input){
    cylinder(d=SC_M3_Diameter_PT,h=height_input,$fn=60);
    
    }
    
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

NB_M3_Diameter_S2S_PT = 6.30; //reducing as well
NB_M3_Diameter_C2C_PT = 7.0; //8.0 was too much 


//--------------Zip ties (ZT)

//Big zip ties I got    

ZT_length_ES = 300;
ZT_width_ES = 4.8;
ZT_height_ES = 1;

ZT_width_PT = 7;
ZT_height_PT = 3;

//--------------Velcro tape (VT)



VT_length_ES = 300;
VT_width_ES = 10;
VT_height_ES = 1;

VT_width_PT = 12;
VT_height_PT = 3;



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

//--------------generic connectors (GC)
// USB C (USB-C)
GC_USB_C_length_ES = 7.3;
GC_USB_C_width_ES = 8.8;
GC_USB_C_height_ES = 3;

module USB_C(rotate_input,translate_input){
    translate(translate_input){
    rotate(rotate_input){
        hull(){
    cylinder(d=GC_USB_C_height_ES,h=GC_USB_C_length_ES,$fn=60);
translate([0,GC_USB_C_width_ES-GC_USB_C_height_ES,0]){
    cylinder(d=GC_USB_C_height_ES,h=GC_USB_C_length_ES,$fn=60);
}
}
    }
}
}

//--------------battery from vapes (BV)

//vapes crystal pro battery (CP)
BV_CP_length_ES = 34;
BV_CP_width_ES = 20;
BV_CP_height_ES = BV_CP_width_ES; //(because it's a cylinder)

BV_CP_length_PT = 37;
BV_CP_width_PT = 22;
BV_CP_height_PT = BV_CP_width_ES; //(because it's a cylinder)

//dimension list [legnth, width, height]
//BV_CP_PT=[37,22,22];
BV_CP_PT=[BV_CP_length_PT,BV_CP_width_PT,BV_CP_height_PT];

module vapes_battery(input_list,rotate_input,translate_input){
translate(translate_input){
    rotate(rotate_input){
        color("green")cylinder(d=input_list[1],h=input_list[0],$fn=60);
    }
    }
}


//--------------battery charger (BC)
//Board Charger TP4056 Module  (TP)

//https://www.az-delivery.uk/cdn/shop/products/tp4056-batterieladungsmodul-usb-typ-c-schutzschaltung-led-anzeigen-fur-ihre-li-ion-oder-lipo-einzelzellenbatterien-126337.jpg?v=1694708173


BC_TP_length_ES = 28;
BC_TP_full_length_ES = 28; //usb C end included
BC_TP_width_ES = 17;
BC_TP_height_ES = 1.3; //without USB C
BC_TP_full_height_ES = 5; //with USB C



//usb C connector position
BC_TP_width_from_side_ES = 8.44;//center of USB C connector from bottom (view from the top )
BC_TP_height_from_bottom_ES = 3.4;//center of USB C connector from bottom (view from the top )
BC_TP_negative_length_ES = 2;//center of USB C connector from bottom 

module battery_charger(rotate_input,translate_input){
    translate(translate_input){
    rotate(rotate_input){
        color("green"){
            cube([BC_TP_full_length_ES,BC_TP_width_ES,BC_TP_height_ES]);

                rotate_array_USB_C=[0,90,0];
    translate_array_USB_C=[-BC_TP_negative_length_ES,BC_TP_width_ES/2-(GC_USB_C_width_ES-GC_USB_C_height_ES)/2,GC_USB_C_height_ES/2+BC_TP_height_ES];
    
    USB_C(rotate_array_USB_C,translate_array_USB_C);

            
            }
    }
}
    
    }


//https://www.alectrofag.co.uk/cdn/shop/files/Hayati_Pro_Max_4000_Puffs_Disposable_Vape.jpg?v=1725012272




//https://d138zd1ktt9iqe.cloudfront.net/media/seo_landing_files/length-width-height-01-1646654708.png