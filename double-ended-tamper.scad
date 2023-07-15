/*
    Double-ended (duel) Espresso Tamper
    https://github.com/GeoMaciolek/double-ended-espresso-tamper


/*  *********************
    Customizable Settings
    ********************* */

/* [Tamper A] */

// Tamper A's Diameter (mm)
tamper_a_diameter_mm=58.0; // 0.1

// Tamper A's Thickness (mm)
tamper_a_thickness_mm=15.0; // 0.1

/* [Tamper B] */

// Tamper B's Diameter (mm)
tamper_b_diameter_mm=53.0; // 0.1

// Tamper B's Thickness (mm)
tamper_b_thickness_mm=15.0; // 0.1

/* [Shaft] */

// Shaft's Length (mm)
shaft_length_mm=30.0; // 0.1

// // Shaft's Diameter (mm) - should be the same as smaller B's Diameter
// shaft_diameter_mm=53.0; // 0.1

/*  **************************
    End Settings, Begin Script
    ************************** */

// Number of segments / fineness of the circles/cylinders

$fn=200;

// Select the shaft diameter - the same as the smaller tamper diameter
    shaft_diameter_mm = (tamper_a_diameter_mm > tamper_b_diameter_mm) ? tamper_b_diameter_mm : tamper_a_diameter_mm;


// Combine these objects
union() {

// Create Tamper A
cylinder(r = tamper_a_diameter_mm/2, h = tamper_a_thickness_mm);

// Create Shaft between tamper A and tamper B
translate([0,0,tamper_a_thickness_mm]) cylinder(r = shaft_diameter_mm/2, h = shaft_length_mm);

// Create Tamper B
translate([0,0,tamper_a_thickness_mm+shaft_length_mm]) cylinder(r = tamper_b_diameter_mm/2, h = tamper_b_thickness_mm);
};
