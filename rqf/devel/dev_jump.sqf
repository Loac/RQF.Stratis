/*
    Author:
        Dmitry Privalov.

    Description:
        Jump forward and check valid position.

    Example:
        _null = [10] execVM "rqf\devel\dev_jump.sqf";
 */

_distance = _this select 0;

_position = position player;
_direction = getDir player;

player setPos [
    (_position select 0) + (sin _direction * _distance),
    (_position select 1) + (cos _direction * _distance)
];

// Check valid position.

_isFlat = (position player) isFlatEmpty [
    0.0001,                  // Minimal distance from another object.
    0,                       // If 0, just check position. If > 0, select new one.
    0.7,                     // Max gradient.
    (sizeof typeof player),  // Gradient area.
    0,                       // 0 for restricted water, 2 for required water.
    false,                   // True if some water can be in 25m radius.
    player                   // Ignored object.
];

if (count _isFlat == 0) then {
    player sideChat "Bad position";
}
else {
    player sideChat "Good position";
}

