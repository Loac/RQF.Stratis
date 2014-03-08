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

    See:
        https://community.bistudio.com/wiki/6thSense.eu:EG
*/

if (isServer) then {
    /*
        Set parameters.
    */
    _handle = [] execVM "rqf\init\init_params.sqf"; waitUntil { scriptDone _handle };

    // Set and broadcast flag start mission and targetDistance value.
    _null = [
        ["startMission", false],
        ["environment", []],
        ["targetDistance"]
    ] call rqf_fnc_broadcast;

    /*
        Set spawn and target positions:
            targetPosition
            bluePosition
            redPosition
    */
    _handle = [] execVM "rqf\init\init_zones.sqf"; waitUntil { scriptDone _handle };

    /*
        Initialize environment: fog, time and etc.
    */
    _handle = [] execVM "rqf\init\init_environment.sqf";

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

// Проверить синхронизацию JIP.
    // Постановку маркеров для JIP пользователей.

// Постановка задачи.
// Создание задания.
   // http://arma3.ru/forums/topic/2402-sozdat-zadanie/
   // Если включены сюрпризы вроде мин или случайной техники, упомянуть об этом в задании.

// Локализация.

// Свой фризтайм.

// Перенос на шаблон на НА.

// Изображения.

// Телепорт группами.
    // После телепорта группы, поставить на нее маркер.

// Показывать ники союзников
    // www.dropbox.com/s/si233oug5vd3tz7/zlt_playertags.sqf

// Больше разных сообщений в дебрифинг.

// Спрятать позицию игрока на карте.

// Проверить работу ботов в МП.
    // Сделать проверку на расстановку вейпоинтов, если игрок не командир.

// Создание техники

// Проверить работу setPlayable

// Если маркер зоны только один, скрипт выдает ошибку.