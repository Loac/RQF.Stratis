/*
    Description:
        Show intro.
*/

private [
    "_colorWest",
    "_colorEast"
];

// Set side colors.
_colorWest = WEST call BIS_fnc_sideColor;
_colorEast = EAST call BIS_fnc_sideColor;

// Set transparency for colors.
{
    _x set [3, 0.73];
} forEach [_colorWest, _colorEast];

[
    markerPos "TARGET",     // Target position.
    "Hold target sector",   // SITREP text.
    targetDistance * 2,     // Altitude.
    200,                    // Radius.
    0,                      // Degrees viewing angle.
    1,                      // Clockwise movement.
    [                       // Set icons.
        ["\a3\ui_f\data\map\markers\nato\b_inf.paa", _colorWest, markerPos "BLUESTART", 1, 1, 0, "Blue side", 0],
        ["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colorEast, markerPos "REDSTART", 1, 1, 0, "Red side", 0]
    ]
] spawn BIS_fnc_establishingShot;

// FIX: Не всегда видно обе точки.
// TODO: Поставить маркер на цель.