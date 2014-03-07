/*
    Author:
        Dmitry Loac.

    Description:
        Initialize environment: fog, day time and etc.

    External variables:
        targetPosition
        bluePosition
        redPosition
*/

/*
    Fog.
*/
if (missionFog < 0) then {
    // Set random value fog.
    0 setFog [0, 0.25, 0.50, 0.75, 1] call BIS_fnc_selectRandom;
}
else {
    0 setFog missionFog;
};

/*
    Time of day.
    http://www.armaholic.com/page.php?id=7116
*/