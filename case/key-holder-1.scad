$fn=190;


SIZE_RING_HOLDER = 13;


difference() {
    cylinder(d=SIZE_RING_HOLDER, h=6);
    cylinder(d=SIZE_RING_HOLDER-4, h=6);
    
    translate([-SIZE_RING_HOLDER/2, 0, 0]) cube([SIZE_RING_HOLDER/2, 10, 10]);
    translate([0, 2, 0]) cube([SIZE_RING_HOLDER/2, 10, 10]);
    
}
translate([-SIZE_RING_HOLDER/2 + (4/2) - 55, 0, 0]) {
    difference() {
        union() {
            cube([55, 3, 6]);
            translate([30, 0, 0]) {
                cylinder(d=7, h=6);
            }
            cube([7, 6, 6]);
        }
        translate([30, 0, 0]) {
            cylinder(d=3.5, h=6);
        }
        translate([1.2, 1.2, 0]) cube([5, 5, 10]);
    }
}




translate([0, 60, 0]) {
    cube([50, 30, 1.2]);
    // mounting holes
    translate([30, (30 - (6 + 1 + 4))/2, 1.2]) {
        difference() {
            cube([10, 6 + 1 + 4, 18]);
            translate([0, 2, 0]) cube([10, 6 + 1, 19]);
            translate([10/2, 0, 10]) rotate([270, 0, 0])cylinder(d=3.2, h=20);
        }
    }
    //blocker to limit high point
    translate([15, (30 - (6 + 1 + 4))/2, 1.2]) {
        difference() {
            cube([7, 6 + 1 + 4, 20]);
            translate([0, 2, 0]) cube([7, 6 + 1, 20]);
        }
    }
    translate([5, 0, 1.2]) {
        difference() {
            cube([10, 30, 9]);
            translate([4.5, 0, 2]) cube([1, 30, 20]);
            translate([5, (30-20)/2, 4]) rotate([270, 0, 0]) cylinder(d=3, h=20);
            translate([2, 0, 3]) cube([6, 30, 10]);
        }
    }
        

}

translate([0, 100, 0]) {
    cube([7, 6 + 1 + 4, 2]);
}

