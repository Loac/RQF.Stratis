/*
    Description:
        Define count and ratio units.

    External variables:
        blueUnits
        redUnits
        blueRatio
        redRatio

    See:
        player addEventHandler ["Killed"]
        countSide
        playableUnits
*/

blueUnits = 0;
redUnits = 0;

{
    switch (side _x) do {
        case west: { blueUnits = blueUnits + 1 };
        case east: { redUnits = redUnits + 1};
    };

} forEach allUnits;

// Ratio by percent.
redRatio = 100 / blueUnits * redUnits;
blueRatio = 100 / redUnits * blueUnits;

// Return;
true;