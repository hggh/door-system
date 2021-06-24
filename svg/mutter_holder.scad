

difference() {
    translate([0, -1, 0]) cube([11, 12, 6]);
    translate([5,5, 0]) {
        cylinder(r = 7 / 2 / cos(180 / 6) + 0.05, h=4.1, $fn=6);
        cylinder(d=4.2, h=20, $fn=190);
    }
}
