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

// Variable for init teleport and freeze. time
sizePosition = 50;

// Get random value for sideDeviation (max possible deviation).
if (sideDeviation < 0) then {
	sideDeviation = ["sideDeviation"] call rqf_fnc_getRandomValue;
};

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

// Flags for early start.
blueReady = false;
redReady = false;