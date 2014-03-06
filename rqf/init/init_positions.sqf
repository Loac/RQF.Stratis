/*
    Author:
        Dmitry Loac.

    Description:
        Teleport unit to start positions.

    See:
        selectBestPlaces

    External variables:
        bluePosition
        redPosition
*/

// TODO: Теоретически, может не хватить места для спавна. В этом случае надо заново определять цель и искать места спавна.

private [
    "_blueUnits",
    "_redUnits",
    "_blueCount",
    "_redCount",
    "_blueIndex",
    "_redIndex"
];

_blueUnits = [];
_redUnits = [];
_blueCount = 0;
_redCount = 0;

// _blueCount = playersNumber west;
// _redCount = playersNumber east;

waitUntil { time > 2 }; // Strange pause for dedicated server.

// Count the number of units.
{
    switch (side _x) do {
        case west: { _blueCount = _blueCount + 1 };
        case east: { _redCount = _redCount + 1 };
   };
} forEach allUnits;

// Find place for teleport.
_bluePlaces = selectBestPlaces [bluePosition, 50, "meadow", 5, _blueCount];
_redPlaces = selectBestPlaces [redPosition, 50, "meadow", 5, _redCount];

// Teleport.
_blueIndex = 0;
_redIndex = 0;
{
    switch (side _x) do {
        case west: {
            _x setPos ((_bluePlaces select _blueIndex) select 0);
            _blueIndex = _blueIndex + 1;
        };
        case east: {
            _x setPos ((_redPlaces select _redIndex) select 0);
            _redIndex = _redIndex + 1;
        };
   };
} forEach allUnits;
