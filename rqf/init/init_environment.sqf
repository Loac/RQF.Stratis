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
    "_availableValues",
    "_seasons"
];

// Environment name parameters.
_envParams = [
    "envSeason",
    "envTime",
    "envFog",
    "envOvercast",
    "envRain"
];

// Month by seasons.
_seasons = [[12, 1, 2], [3, 4, 5], [6, 7, 8], [9, 10, 11]];

// Default date.
_year = 2014;
_month = [1, 12] call BIS_fnc_randomInt;
_day = [1, 27] call BIS_fnc_randomInt;
_hour = [1, 23] call BIS_fnc_randomInt;
_minute = [1, 59] call BIS_fnc_randomInt;

{
    // Name of environment.
    _envName = _x;

    // Value environment.
    _envValue = missionNamespace getVariable _envName;

    // If value less 0, then it random environment.
    // Env params "envSeason" and "envTime" will be in environment array, but "fn_setEnvironment" just ignore it.
    if (_envValue < 0) then {
        // Get available values.
        _availableValues = getArray (missionConfigFile >> "Params" >> _envName >> "values");

        // Select one.
        _envValue = _availableValues select ([1, (count _availableValues - 1)] call BIS_fnc_randomInt);
    }
    else {
        // Replace random values.
        switch _envName do {
            // Get random month in selected season.
            case "envSeason": { _month = (_seasons select _envValue) select ([0, 2] call BIS_fnc_randomInt) };
            case "envTime": { _hour = _envValue + ([0, 3] call BIS_fnc_randomInt) };
        };
    };

    // Add value to environment array.
    environment = environment + [[_envName, _envValue]];

} forEach _envParams;

// Date and time manually set.
environment = environment + [["envDate", [_year, _month, _day, _hour, _minute]]];

// Broadcast variable for all clients.
[["environment"]] call rqf_fnc_broadcast;

// Set environment on server.
[environment] call rqf_fnc_setEnvironment;