/*
    Description:
        Define count and ratio units.

    External variables:
    	blueUnits
    	redUnits
    	blueRatio
    	redRatio
 */

blueUnits = 0;
redUnits = 0;

{
	switch (side _x) do {
		case east: { blueUnits = blueUnits + 1 };
		case west: { redUnits = redUnits + 1};
	};

} forEach allUnits;

blueRatio = blueUnits / redUnits;
redRatio = redUnits / blueUnits;

// Return;
true;