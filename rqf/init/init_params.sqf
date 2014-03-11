/*
    Author:
        Dmitry Loac.

    Description:
        Load parameters from config file.
 */

private [
    "_value",
    "_name"
];

for "_index" from 0 to (count paramsArray) - 1 do {
    _name = configName ((missionConfigFile >> "Params") select _index);
    _value = paramsArray select _index;

    call compile format["%1 = %2", _name, _value];
};

// Position of target.
targetPosition = [];

// Coordinates of side start.
bluePosition = [];
redPosition = [];

// Flags of side hold positions.
blueHold = false;
redHold = false;

// Count units by side.
blueUnits = 0;
redUnits = 0;

// Timers.
blueTimer = sideTimer;
redTimer = sideTimer;