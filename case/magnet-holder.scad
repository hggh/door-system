MAGNET_SIZE_D = 2;
MAGNET_SIZE_Y = 1;

MAGNET_HOLE_Y = MAGNET_SIZE_Y + 0.1 + 1;

difference() {
    translate([-30/2, -4.5/2]) cube([30, 4.5, 1.3]);
    translate([-2.5, 0, -1]) cylinder(h=MAGNET_HOLE_Y, d=2, $fn=180);
    translate([0, 0, -1]) cylinder(h=MAGNET_HOLE_Y, d=2, $fn=180);
    translate([2.5, 0, -1]) cylinder(h=MAGNET_HOLE_Y, d=2, $fn=180);
}
