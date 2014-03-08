/*
    Author:
        Dmitry Loac.

    Description:
        Initialize environment: fog, day time and etc.

        envDate not declare in cfgParams and get value from envSeason and envTime.

    External variables:
        environment

    See:
        BIS_fnc_selectRandom
        BIS_fnc_randomInt
        http://killzonekid.com/arma-scripting-tutorials-arrays-part-2/
*/

private [
    "_year",
    "_month",
    "_day",
    "_hour",
    "_minute",
    "_envName",
    "_envValue",
    "_availableValues"
];

// Environment name parameters.
_envParams = [
    "envSeason",
    "envTime",
    "envFog",
    "envOvercast",
    "envRain"
];

// Default date.
_year = 2014;
_month = 7;
_day = 1;
_hour = 12;
_minute = 0;

{
    // Name of environment.
    _envName = _x;

    // Value environment.
    _envValue = missionNamespace getVariable _envName;

    // If value less 0, then it random environment.
    if (_envValue < 0) then {

        // Get available values.
        _availableValues = getArray (missionConfigFile >> "Params" >> _envName >> "values");

        // Select one.
        _envValue = _availableValues select ([1, (count _availableValues - 1)] call BIS_fnc_randomInt);
    };

    // Make environment excludes for some variables.
    switch _envName do {
        case "envSeason": { _month = _envValue };
        case "envTime": { _hour = _envValue };

        default {
            // Add value to environment array.
            environment = environment + [[_envName, _envValue]];
        };
    };


} forEach _envParams;

// Date and time manually set.
environment = environment + [["envDate", [_year, _month, _day, _hour, _minute]]];

// Broadcast variable for all clients.
[["environment"]] call rqf_fnc_broadcast;

// Set environment on server.
[environment] call rqf_fnc_setEnvironment;