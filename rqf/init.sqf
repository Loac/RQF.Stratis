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

    See:
        https://community.bistudio.com/wiki/6thSense.eu:EG
 */

// Public variables.

// Flag of mission complete.
completeMission = "";

if (isServer) then {
    // Flag to start mission.
    startMission = false;

    // Send variable.
    publicVariable "startMission";

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
    _handle = [] execVM "rqf\init\init_params.sqf"; waitUntil { scriptDone _handle };

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
    _handle = [] execVM "rqf\init\init_positions.sqf";

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

    // Flag to start mission.
    startMission = true;

    testVariable = 100;

    // Send variable.
    publicVariable "startMission";
    publicVariable "testVariable";
};

if (not isDedicated) then {

    /*
        Client side procedures.
    */
    _handle = [] execVM "rqf\init\init_client.sqf";

    /*
        Development magic.
    */
    _handle = [] execVM "rqf\init\init_devel.sqf";
};

// If (!IsServer) then {WaitUntil {!IsNull Player And IsPlayer Player};};
// ["bluePosition %1", bluePosition] call BIS_fnc_error;
// ["TaskSucceeded",["","Island captured!"]] call bis_fnc_showNotification;

// Посмотреть другие миссии.
// init_client - switch (side player) do { - после смерти, side возвращает сторону граждансикх.
    // Заменить на side (group player);
// Попробовать заменить waitUntil на onEachFrame, там где не нужно условие для выхода из цикла.
// Разобраться с public переменными, не думаю, что постоянно необходимо использовать publicVariable.
    // addPublicVariableEventHandler - вроде бы должен отправлять переменную всем, при ее изменении.
    // https://community.bistudio.com/wiki/ArmA_3:_Event_Handlers
    // setVariable ['startMission', true, true];
// Триггеры на смерть бойцов с одной стороны.
// init_params заменить цикл на for.
// Проверить синхронизацию JIP.
    // Например этим https://community.bistudio.com/wiki/setFog
// Проверить как отработает удаленно setDammage
    // https://community.bistudio.com/wiki/setDammage
// Переместить камеру к таргету.
// Параметры.
// Постановка задачи.
// Локализация.
// Перенос на шаблон на НА.
// Случайная погода.
// Случайное время суток.
// Свой фризтайм.
// Изображения.
// Установить тип миссии.