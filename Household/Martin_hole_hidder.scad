// Define variables for the dimensions and hole positions in millimeters
length = 80;
width = 70;
height = 3;
hole_radius = 3;
hole_x1 = 21; // Inverted X and Y positions
hole_y1 = 35; // Inverted X and Y positions
hole_x2 = 64; // Inverted X and Y positions
hole_y2 = 35; // Inverted X and Y positions

// Define a module for the holes with parameters
module hole(translated_position_X, translated_position_Y) {
    translate([translated_position_X, translated_position_Y, 0]) cylinder(r=hole_radius, h=height, $fn=30);
}

// Subtract both holes from the rectangle
difference() {
    // Generate the rectangle with specific length and width dimensions
    cube([length, width, height]);

    // Create the first hole
    hole(translated_position_X=hole_x1, translated_position_Y=hole_y1);

    // Create the second hole
    hole(translated_position_X=hole_x2, translated_position_Y=hole_y2);
}
