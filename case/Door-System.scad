
module schliesszylinder() {
    union() {
        rotate([90, 0, 0]) cylinder(h=40, d=16.9, $fn=99);
        translate([-9.9/2, -40, 0]) {
            cube([9.9, 40, 33 -16.9/2 ]);
        }
    }
}


rotate([90,0, 0]) schliesszylinder();


difference() {
    cube([80, 42, 3], center=true);
    // NEMA 17 crews
    for(i=[0:3]){
        rotate([0, 0, 90*i]) {
            translate([15.5, 15.5, -10]) {
                cylinder(h=30, d=4.2, $fn=24);
            }
        }
    }
    // NEMA 17 plate
    cylinder(d=27, h=30, center=true);
    
    // crews to fit it to the MDF
    translate([70/2, 31/2, -10]) cylinder(h=30, d=4.2, $fn=24);
    translate([70/2, -31/2, -10]) cylinder(h=30, d=4.2, $fn=24);
    translate([-70/2, 31/2, -10]) cylinder(h=30, d=4.2, $fn=24);
    translate([-70/2, -31/2, -10]) cylinder(h=30, d=4.2, $fn=24);
}