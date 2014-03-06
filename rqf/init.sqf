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
        blueUnits
        redUnits
        blueRatio
        redRatio

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

    // Count units by side.
    blueUnits = 0;
    redUnits = 0;

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
        Set arbiter.
    */
    _handle = [] execVM "rqf\init\init_arbiter.sqf";

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
        Magic.
    */
    waitUntil { not isNull Player and isPlayer Player };

    /*
        Client side procedures.
    */
    _handle = [] execVM "rqf\init\init_client.sqf";

    /*
        Development.
    */
    if (not isMultiplayer) then {
        _handle = [] execVM "rqf\init\init_devel.sqf";
    }
};

// ["bluePosition %1", bluePosition] call BIS_fnc_error;
// ["TaskSucceeded",["","Island captured!"]] call bis_fnc_showNotification;

// Посмотреть другие миссии.
    // https://www.dropbox.com/s/eh0as3bo0oqmvql/wog_140_Defence_Atira_9f.Altis.zip
// Проверить постановку маркеров для JIP пользователей.
// Попробовать заменить waitUntil на onEachFrame, там где не нужно условие для выхода из цикла.

// Разобраться с public переменными, не думаю, что постоянно необходимо использовать publicVariable.
    // addPublicVariableEventHandler - вроде бы должен отправлять переменную всем, при ее изменении.

// Триггеры на смерть бойцов с одной стороны.
    // https://www.dropbox.com/s/knt79565bel9hsf/losses.zip Zealot Scripts
    // Попробовать сделть подсчет живых при помощи player addEventHandler ["Killed"], а не бесконечного пересчета. игроков.
// init_params заменить цикл на for.
// Проверить синхронизацию JIP.
    // Например этим https://community.bistudio.com/wiki/setFog
// Проверить как отработает удаленно setDammage
    // https://community.bistudio.com/wiki/setDammage
// Переместить камеру к таргету.
// Создание задания.
   // http://arma3.ru/forums/topic/2402-sozdat-zadanie/
// Ожидание входа игрока в игру
   // waitUntil { player == player && time > 0 };
// Параметры.
// Постановка задачи.
// Локализация.
// Перенос на шаблон на НА.
// Случайная погода.
// Случайное время суток.
// Свой фризтайм.
// Изображения.
// Телепорт группами.
    // После телепорта группы, поставить на нее маркер.
// Показывать ники союзников
    // www.dropbox.com/s/si233oug5vd3tz7/zlt_playertags.sqf

// Больше разных сообщений в дебрифинг.
// Спрятать позицию игрока на карте.



// Проверить финишь миссии после смерти.
            // init_client - switch (side player) do { - после смерти, side возвращает сторону граждансикх.
            // Заменить на side (group player);
