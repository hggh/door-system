union() {
	difference() {
		cube([50, 50, 3], center=true);
		cylinder(r=10, h=4, $fn=60, center=true);

		// bohrungen
		translate([31/2, 31/2, 0]) {
			cylinder(r=1.6, h=4, $fn=60, center=true);
		}
		translate([-31/2, 31/2, 0]) {
			cylinder(r=1.6, h=4, $fn=60, center=true);
		}
		translate([-31/2, -31/2, 0]) {
			cylinder(r=1.6, h=4, $fn=60, center=true);
		}
		translate([31/2, -31/2, 0]) {
			cylinder(r=1.6, h=4, $fn=60, center=true);
		}
	}
	// platte unterseite
	translate([-50/2, -50/2, 1.5]) {
		cube([3, 50, 15]);
	}

	translate([-50/2+3, -50/2, 1.5]) {
		cube([47, 1.5, 15]);
	}
	translate([-50/2+3, +(50/2 -1.5), 1.5]) {
		cube([47, 1.5, 15]);
	}

	translate([-25, 25, -1.5]) {
		befestigung();
	}
	translate([25, -25, -1.5]) {
		rotate([0, 0, 180]) befestigung();
	}
	
}


module befestigung() {
	difference() {
		cube([50, 20, 5]);
		translate([10, 13, 0]) {
			cylinder(r=1.6, h=6, $fn=60);
		}
		translate([40, 13, 0]) {
			cylinder(r=1.6, h=6, $fn=60);
		}
	}
}