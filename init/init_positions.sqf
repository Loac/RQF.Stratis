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
    "_bluePlaces",
    "_redPlaces"
];

_blueUnits = [];
_redUnits = [];

// Strange pause for dedicated server.
waitUntil { time > 1 };

// Count the number of units.
{
    if (aiEnable > 0 or isPlayer _x) then {
        switch (side _x) do {
            case west: { _blueUnits = _blueUnits + [_x] };
            case east: { _redUnits = _redUnits + [_x] };
        };
    };
} forEach allUnits;

// Find place for teleport.
_bluePlaces = selectBestPlaces [bluePosition, sizePosition, "meadow", 5, count _blueUnits];
_redPlaces = selectBestPlaces [redPosition, sizePosition, "meadow", 5, count _redUnits];

// Teleport blue side.
for "_index" from 0 to (count _blueUnits) - 1 do {
    _unit = _blueUnits select _index;
    _place = (_bluePlaces select _index) select 0;

    _unit setPos _place;
};

// Teleport red side.
for "_index" from 0 to (count _redUnits) - 1 do {
    _unit = _redUnits select _index;
    _place = (_redPlaces select _index) select 0;

    _unit setPos _place;
};