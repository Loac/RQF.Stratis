/*
    Author:
        Dmitry Loac.

    Description:
        Initialize environment: fog, day time and etc.

    External variables:
        targetPosition
        bluePosition
        redPosition

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
    "_fog"
];

/*
    Set date and day time.
*/
if (missionDayTime < 0 ) then {
    _year = 2014;
    _month = 7; // Jule. TODO: It must to be random or selectable value.
    _day = 1;
    _hour = 12;
    _minute = 0;

    // Get available values for hour.
    _availableValues = getArray (missionConfigFile >> "Params" >> "missionDayTime" >> "values");

    // Select random value from array, exclude first position with random flag (-1).
    _hour = _availableValues select ([1, (count _availableValues - 2)] call BIS_fnc_randomInt);
}
else {
    // Set hour from selected value.
    _hour = missionDayTime;
};

// Add value to environment array.
environment = environment + [["date", [_year, _month, _day, _hour, _minute]]];

/*
    Set fog.
*/
if (missionFog < 0) then {
    _availableValues = getArray (missionConfigFile >> "Params" >> "missionFog" >> "values");

    _fog = _availableValues select ([1, (count _availableValues - 2)] call BIS_fnc_randomInt);
}
else {
    _fog = missionFog;
};

// Add value to environment array.
environment = environment + [["fog", _fog]];

/*
    Accept variable.
*/
// Broadcast variable for all clients.
[["environment"]] call rqf_fnc_broadcast;

// Set environment on server.
[environment] call rqf_fnc_setEnvironment;