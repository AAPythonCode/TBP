/* [Rendering options] */
// Show placeholder PCB in OpenSCAD preview
show_pcb = false;
// Lid mounting method
lid_model = "cap"; // [cap, inner-fit]
// Conditional rendering
render = "case"; // [all, case, lid]


/* [Dimensions] */
// Height of the PCB mounting stand-offs between the bottom of the case and the PCB
standoff_height = 5;
// PCB thickness
pcb_thickness = 1.6;
// Bottom layer thickness
floor_height = 1.2;
// Case wall thickness
wall_thickness = 1.2;
// Space between the top of the PCB and the top of the case
headroom = 3.4999999999999996;

/* [M2.5 screws] */
// Outer diameter for the insert
insert_M2_5_diameter = 3.27;
// Depth of the insert
insert_M2_5_depth = 3.75;

/* [Hidden] */
$fa=$preview ? 10 : 4;
$fs=0.2;
inner_height = floor_height + standoff_height + pcb_thickness + headroom;

module wall (thickness, height) {
    linear_extrude(height, convexity=10) {
        difference() {
            offset(r=thickness)
                children();
            children();
        }
    }
}

module bottom(thickness, height) {
    linear_extrude(height, convexity=3) {
        offset(r=thickness)
            children();
    }
}

module lid(thickness, height, edge) {
    linear_extrude(height, convexity=10) {
        offset(r=thickness)
            children();
    }
    translate([0,0,-edge])
    difference() {
        linear_extrude(edge, convexity=10) {
                offset(r=-0.2)
                children();
        }
        translate([0,0, -0.5])
         linear_extrude(edge+1, convexity=10) {
                offset(r=-1.2)
                children();
        }
    }
}


module box(wall_thick, bottom_layers, height) {
    if (render == "all" || render == "case") {
        translate([0,0, bottom_layers])
            wall(wall_thick, height) children();
        bottom(wall_thick, bottom_layers) children();
    }
    
    if (render == "all" || render == "lid") {
        translate([0, 0, height+bottom_layers+0.1])
        lid(wall_thick, bottom_layers, lid_model == "inner-fit" ? headroom-2.5: bottom_layers) 
            children();
    }
}

module mount(drill, space, height) {
    translate([0,0,height/2])
        difference() {
            cylinder(h=height, r=(space/2), center=true);
            cylinder(h=(height*2), r=(drill/2), center=true);
            
            translate([0, 0, height/2+0.01])
                children();
        }
        
}

module connector(min_x, min_y, max_x, max_y, height) {
    size_x = max_x - min_x;
    size_y = max_y - min_y;
    translate([(min_x + max_x)/2, (min_y + max_y)/2, height/2])
        cube([size_x, size_y, height], center=true);
}

module Cutout_TypeC_substract() {
    width = 10;
    length = 10;
    height = 3.5;
    translate([-length/2, 0, height/2])
    rotate([0,90,0])
        union() {
            translate([0, -(width/2 - height/2), 0])
                cylinder(length, height/2, height/2);
            translate([0, (width/2 - height/2), 0])
                cylinder(length, height/2, height/2);
            translate([0, 0, length/2])
                cube([height, width-height, length], center=true);
        }
}

module pcb() {
    thickness = 1.6;

    color("#009900")
    difference() {
        linear_extrude(thickness) {
            polygon(points = [[90.192378,148.75], [90.214214,110.464214], [90.23883,110.15135], [90.31209,109.84617], [90.43218999999999,109.55623], [90.59617,109.28864999999999], [90.79999,109.04999], [91.03864999999999,108.84617], [91.30623,108.68218999999999], [91.59617,108.56209], [91.90135,108.48883], [92.214214,108.464214], [171.009101,108.459962], [171.32546398559998,108.4850580624], [171.63392338559999,108.5597303152], [171.9267341136,108.6821109552], [172.196593456,108.84915049760001], [172.436740384,109.0566358384], [172.6411361152,109.2993908784], [172.80472492479998,109.5713567728], [172.9233739584,109.8657123056], [172.9941139808,110.175094576], [173.015181,110.49175], [172.984818,148.79175], [172.9631984555,149.09790507269997], [172.8937076959,149.39685930079997], [172.77807133669998,149.6811449867], [172.61914915999998,149.9437196738], [172.420909843,150.178027263], [172.18829477789998,150.37825091859997], [171.9270818918,150.53939088549998], [171.6437689209,150.6574395779], [171.3454177761,150.72947885079998], [171.039464,150.753674], [92.192378,150.75], [91.84508,150.71962], [91.50834,150.62938], [91.19238,150.48206], [90.9068,150.28208], [90.6603,150.03558], [90.46032,149.75], [90.313,149.43404], [90.22276,149.0973], [90.192378,148.75]]);
        }
    translate([92.95, 111.2, -1])
        cylinder(thickness+2, 1.25, 1.25);
    translate([92.95, 148, -1])
        cylinder(thickness+2, 1.25, 1.25);
    translate([149.45, 111.2, -1])
        cylinder(thickness+2, 1.25, 1.25);
    translate([149.4, 148.1, -1])
        cylinder(thickness+2, 1.25, 1.25);
    }
}

module case_outline() {
    polygon(points = [[89.192378,107.459962], [174.015181,107.459962], [174.015181,151.753674], [89.192378,151.753674]]);
}

module Insert_M2_5() {
    translate([0, 0, -insert_M2_5_depth])
        cylinder(insert_M2_5_depth, insert_M2_5_diameter/2, insert_M2_5_diameter/2);
    translate([0, 0, -0.3])
        cylinder(0.3, insert_M2_5_diameter/2, insert_M2_5_diameter/2+0.3);
}

rotate([render == "lid" ? 180 : 0, 0, 0])
scale([1, -1, 1])
translate([-131.6037795, -129.606818, 0]) {
    pcb_top = floor_height + standoff_height + pcb_thickness;

    difference() {
        box(wall_thickness, floor_height, inner_height) {
            case_outline();
        }

    // Substract: Unknown
    translate([123.4, 150.7, pcb_top])
        Cutout_TypeC_substract();

    }

    if (show_pcb && $preview) {
        translate([0, 0, floor_height + standoff_height])
            pcb();
    }

    if (render == "all" || render == "case") {
        // H3 [('M2.5', 2.5)]
        translate([92.95, 111.2, floor_height])
        mount(2.5, 5.5, standoff_height)
            Insert_M2_5();
        // H1 [('M2.5', 2.5)]
        translate([92.95, 148, floor_height])
        mount(2.5, 5.5, standoff_height)
            Insert_M2_5();
        // H4 [('M2.5', 2.5)]
        translate([149.45, 111.2, floor_height])
        mount(2.5, 5.5, standoff_height)
            Insert_M2_5();
        // H2 [('M2.5', 2.5)]
        translate([149.4, 148.1, floor_height])
        mount(2.5, 5.5, standoff_height)
            Insert_M2_5();
    }
}
