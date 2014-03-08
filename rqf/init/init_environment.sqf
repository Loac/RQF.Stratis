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

    // Add value to environment array.
    environment = environment + ["date", [_year, _month, _day, _hour, _minute]];

    // Broadcast variable for all clients.
    [["environment"]] call rqf_fnc_broadcast;

    // Set environment on server.
    [environment] call rqf_fnc_setEnvironment;
}

/*
    Fog.
*/
// if (missionFog < 0) then {
//     // Set random value fog.
//     0 setFog [0, 0.25, 0.50, 0.75, 1] call BIS_fnc_selectRandom;
// }
// else {
//     0 setFog missionFog;
// };

// setFog - туман - нужно выполнять для каждого клиента.
// setOvercast - облачность
// setDate - время года
// skeepTime

/*
    Time of day.
    http://www.armaholic.com/page.php?id=7116
*/

// [environment] call rqf_fnc_setEnvironment;  td = date; publicVariable "td";publicVariable "test";