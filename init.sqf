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
        environment
            Array with environment settings.
        blueReady
        redReady
            Flags for ready sides.
        sizePosition
            Size of start side positions. Need for teleport and freeze time.

    See:
        https://community.bistudio.com/wiki/6thSense.eu:EG
*/

if (isServer) then {
    /*
        Set parameters.
    */
    _handle = [] execVM "init\init_params.sqf"; waitUntil { scriptDone _handle };

    // Set and broadcast flag startMission and targetDistance value.
    _handle = [
        ["startMission", false],
        ["blueReady", false],
        ["redReady", false],
        ["environment", []],
        ["targetDistance"],
        ["freezeTime"],
        ["sizePosition"]
    ] call rqf_fnc_broadcast;

    /*
        Set spawn and target positions:
            targetPosition
            bluePosition
            redPosition
    */
    _handle = [] execVM "init\init_zones.sqf"; waitUntil { scriptDone _handle };

    /*
        Initialize environment: fog, time and etc.
    */
    _handle = [] execVM "init\init_environment.sqf";

    /*
        Set triggers.
    */
    _handle = [] execVM "init\init_triggers.sqf";

    /*
        Teleport all units to start positions.
    */
    _handle = [] execVM "init\init_positions.sqf";

    /*
        Set arbiter.
    */
    _handle = [] execVM "init\init_arbiter.sqf";

    /*
        Set markers for players.
    */
    _handle = [] execVM "init\init_markers.sqf";

    /*
        Add waypoints for AI.
    */
    _handle = [] execVM "init\init_ai.sqf";

    /*
        Init freeze time.
    */
    if (freezeTime > 0) then {
        _handle = execVM "init\init_freeze.sqf";
    };

    // Flag to start mission.
    _handle = [["startMission", true]] call rqf_fnc_broadcast;
};

if (not isDedicated) then {
    /*
        Magic.
    */
    waitUntil { not isNull Player and isPlayer Player };

    /*
        Client side procedures.
    */
    _handle = [] execVM "init\init_client.sqf";

    /*
        Development.
    */
    if (not isMultiplayer) then {
        _handle = [] execVM "init\init_devel.sqf";
    };
};

// Переместить камеру к таргету.

// Добавить параметры дальности, травы, вида от третьего лица.
    // Приверить как это работат в мультиплеере.

// Брифинг.

// Локализация.

// Перенос на шаблон на НА.

// Телепорт группами.

// Показывать ники союзников.
    // www.dropbox.com/s/si233oug5vd3tz7/zlt_playertags.sqf

// Больше разных сообщений в дебрифинг.

// Спрятать позицию игрока на карте.

// Доработать ботов.

// Создание техники.

// Проверить работу setPlayable.

// Добавить случайность для других параметров, расстояние, отклонение и так далее.

// Ручная установка цели.

// Возможно стоит переделать работу параметра sideDeviation.