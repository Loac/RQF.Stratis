/*
    Author:
        Dmitry Loac.

    Param variables:
        targetSize
            Radius of target size.
        targetDistance
            Distance to target.
        sideDeviation
            Deviations of start positions.
        completeMission
            Flag of mission complete.
        bluePosition
        redPosition
            Coordinates of side start.
        blueTimer
        redTimer
            Side timers.
        blueHold
        redHold
            Flags of side hold positions.

 */

// Public variables.

// Flag of mission complete.
completeMission = "";

// Flag of mission start.
startMission = false;

if (isServer) then {
    // Position of target.
    targetPosition = [];

    // Coordinates of side start.
    bluePosition = [];
    redPosition = [];

    // Flags of side hold positions.
    blueHold = false;
    redHold = false;

    /*
        Set parameters.
    */
    _handle = [] execVM "rqf\init\init_parameters.sqf"; waitUntil { scriptDone _handle };

    /*
        Set spawn and target positions:
            targetPosition
            bluePosition
            redPosition
    */
    _handle = [] execVM "rqf\init\init_zones.sqf"; waitUntil { scriptDone _handle };

    /*
        Set triggers.
    */
    _handle = [] execVM "rqf\init\init_triggers.sqf";

    /*
        Teleport all unit to start positions.
    */
    _handle = [] execVM "rqf\init\init_positions.sqf"; waitUntil { scriptDone _handle };

    /*
        Set arbitr.
    */
    _handle = [] execVM "rqf\init\init_arbitrator.sqf";

    /*
        Set markers for players.
    */
    _handle = [] execVM "rqf\init\init_markers.sqf";

    /*
        Add waypoints for AI.
    */
    _null = [] execVM "rqf\init\init_ai.sqf";

    startMission = true;

    // Send variable.
    publicVariable "startMission";
};

if (not isDedicated) then {
    /*
        Client side procedures.
    */
    _handle = [] execVM "rqf\init\init_client.sqf"; waitUntil { scriptDone _handle };

    /*
        Development magic.
    */
    _handle = [] execVM "rqf\init\init_devel.sqf";
};

// If (!IsServer) then {WaitUntil {!IsNull Player And IsPlayer Player};};
// ["bluePosition %1", bluePosition] call BIS_fnc_error;
// ["TaskSucceeded",["","Island captured!"]] call bis_fnc_showNotification;

// Переместить камеру к таргету.
// Параметры.
// Постановка задачи.
// Локализация.
// Перенос на шаблон на НА.
// Случайная погода.
// Случайное время суток.
// Свой фризтайм.
// Изображения.