screwDiameter = 3.4;
screwHeadDiameter = 7;
screwThreadLength = 10;
nutWidth = 5.7;
nutThickness = 3;
shaftScrewsDistance = 5+screwDiameter+1;
$fn=180;

module coupler() {
    difference() {
        cylinder(d=20, h=15);
        translate([0,0,-1]) {
            cylinder(d=5, h=20);
        }
        translate([0,shaftScrewsDistance/2, 15/2])
            rotate([90,0,90])
                screw();
        translate([0,-shaftScrewsDistance/2, 15/2])
            rotate([90,0,270])
                screw();
        // cut between the two halves
        cube([0.5, 100, 100], center=true);
    }
    
}

module screw()
{
    // thread
    cylinder(d=screwDiameter, h=100, center=true);
    // head
    translate([0,0,(screwThreadLength-nutThickness)/2])
        cylinder(d=screwHeadDiameter, h=100);
    // nut
    translate([0,0,-(screwThreadLength-nutThickness)/2])
        rotate([180,0,30])
            cylinder(d=nutWidth*2*tan(30), h=100, $fn=6);
}

union() {
    coupler();
    translate([0, 0, 15 + 15/2]) {
        difference() {
            cube([8, 20, 15], center=true);
            
            cube([2.5, 20, 15], center=true);
        }
    }
}