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
        case west: { blueUnits = blueUnits + 1 };
        case east: { redUnits = redUnits + 1};
    };

} forEach allUnits;

// Ratio by percent for exclude zero divided.
blueRatio = 100 / blueUnits * redUnits;
redRatio = 100 / redUnits * blueUnits;

// Return;
true;