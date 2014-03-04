/*
    Author:
        Dmitry Loac.
 */

// FIX: Улучшить проверку места спавна. Все еще может заспавнить на берегу или в канмях.

// Вынести в переменые настройки.

// Радиус зоны удержания.
targetSize = 50;

// Расстояние точек старта от центра зоны удержания.
targetDistance = 200;

// Максимальное отклонение позиций сторон.
sideDeviation = 40;

// Таймеры сторон.
blueTimer = 30;
redTimer = 30;

// Public variables.

// Позиция цели.
targetPosition = [];

// Позиции сторон.
bluePosition = [];
redPosition = [];

// Флаги захвата сторон.
blueHold = false;
redHold = false;

// Отключить переговоры (теоретически).
// player setVariable ["BIS_noCoreConversations", true];

// Initialization mission.
// finishMissionInit;

if (isServer) then {

    /*
        Set parameters.
    */
    // _handle = [] execVM "rqf\init\init_params.sqf"; waitUntil { scriptDone _handle };

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
    //_null = [] execVM "rqf\init\init_ai.sqf";
};

f_quickfight = 1;
f_param_startdelay = 3;
if (not isDedicated) then {
    // Magic.
    // If (!IsServer) then {WaitUntil {!IsNull Player And IsPlayer Player};};

    // Disable saving.
    enableSaving [false, false];

    // Delete playable markers.
    _playableMarkers = [] call rqf_fnc_getPlayableMarkers;

    {
        deleteMarker _x;
    } forEach _playableMarkers;

    sleep 0.01;
    _cam = "camera" camCreate (position player);
    _cam cameraEffect ["internal", "BACK"];
    _cam camCommit 0;
    cutText ["A long time ago in a galaxy far,\nfar away...","BLACK FADED", 120];
    enableRadio false;

    waitUntil { (f_quickfight == 1 && time > f_param_startdelay) || time > 60 };

    cutText ["","BLACK IN",2];
    _cam cameraEffect ["terminate", "BACK"];
    _cam camCommit 0;
    camDestroy _cam;
    enableRadio true;

    // Development.

    _null = player addAction ["Teleport", "rqf\helpers\dbgClickTeleport.sqf"];
    _null = player addAction ["Teleport red units", "rqf\helpers\dbgUnitsTeleport.sqf"];

    // _null = player addAction ["Init playable zones", "rqf\init\init_playableZone.sqf"];
    // _null = player addAction ["Add triggers", "rqf\init\init_triggers.sqf"];
    // _null = player addAction ["Jump", {_null = [5] execVM "rqf\functions\fnc_jumpForward.sqf"}];
    // _null = player addAction ["Teleport to positions", "rqf\init\init_positions.sqf"];

    // _null = [] execVM "rqf\helpers\dbgInfoCustom.sqf";
};

// Magic.
// If (!IsServer) Then {WaitUntil {!IsNull Player And IsPlayer Player};};
// ["bluePosition %1", bluePosition] call BIS_fnc_error;



// Тест мультиплеера.
    // Проверить постановку локальных маркеров.
    // Проверить работу финиша.

// Переместить камеру к таргету.
// Параметры.
// Локализация.
// Перенос на шаблон на НА.
// Случайная погода.
// Случайное время суток.
// Свой фризтайм.
// Изображения.