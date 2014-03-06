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
        startMission
            Flag to start mission.

    See:
        https://community.bistudio.com/wiki/6thSense.eu:EG
*/

if (isServer) then {
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

    // Set and broadcast flag start mission and targetDistance value.
    _null = [["startMission", false], ["targetDistance"]] call rqf_fnc_broadcast;

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
    _null = [["startMission", true]] call rqf_fnc_broadcast;
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

// Переместить камеру к таргету.

// Посмотреть другие миссии.
    // https://www.dropbox.com/s/eh0as3bo0oqmvql/wog_140_Defence_Atira_9f.Altis.zip

// Проверить синхронизацию JIP.
    // Например этим https://community.bistudio.com/wiki/setFog
    // Постановку маркеров для JIP пользователей.

// Разобраться с public переменными, не думаю, что постоянно необходимо использовать publicVariable.
    // addPublicVariableEventHandler - вроде бы должен отправлять переменную всем, при ее изменении.

// Триггеры на смерть бойцов с одной стороны.
    // https://www.dropbox.com/s/knt79565bel9hsf/losses.zip Zealot Scripts

// Создание задания.
   // http://arma3.ru/forums/topic/2402-sozdat-zadanie/

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

// Изменить дистанцию камеры во время старта в зависимости от дистанции

// Проверить работу ботов в МП.
    // Сделать проверку на расстановку вейпоинтов, если игрок не командир.