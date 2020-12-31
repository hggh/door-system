


SWITCH_SIZE_X = 13.8;
SWITCH_SIZE_Y = 6.5;
SWITCH_SIZE_Z = 5;


module switch() {
    cube([SWITCH_SIZE_X, SWITCH_SIZE_Y, SWITCH_SIZE_Z]);
    translate([0, SWITCH_SIZE_Y/2-1, -5]) {
        cube([SWITCH_SIZE_X, 2, 5]);
    }
    
}

//switch();

difference() {
    cube([20, 9, 28]);
    translate([(20-4-SWITCH_SIZE_X), 1.5, 25]) switch();
    translate([(20-4-SWITCH_SIZE_X),5, 16]) cube([SWITCH_SIZE_X, 20, 6]);
    
    translate([4, -1, 6]) cube([14, 20, 5]);
}
