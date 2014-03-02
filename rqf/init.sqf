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

// Позиция цели.
targetPosition = [];

publicVariable "bluePosition";

// Позиции сторон.
bluePosition = [];
redPosition = [];

// Флаги захвата сторон.
blueHold = false;
redHold = false;

// Отключить переговоры (теоретически).
// player setVariable ["BIS_noCoreConversations", true];

// Выключить сохранения.
enableSaving [false, false];

// Init.

// Загрузить параметры.
// _null = [] execVM "rqf\init\init_params.sqf";

// Выбрать цель и стартовые позиции (server).
_handle = [] execVM "rqf\init\init_zones.sqf";
waitUntil { scriptDone _handle };


// Magic.
// If (!IsServer) Then {WaitUntil {!IsNull Player And IsPlayer Player};};
// ["bluePosition %1", bluePosition] call BIS_fnc_error;

// Выбрать цель и стартовые позиции (all).
_null = [] execVM "rqf\init\init_markers.sqf";

// Установить триггеры (server).
_null = [] execVM "rqf\init\init_triggers.sqf";

// Телепортировать на позиции (server).
_null = [] execvm "rqf\init\init_positions.sqf";

// Добавить вейпоинты ботам (server).
_null = [] execvm "rqf\init\init_ai.sqf";

// Запустить "арбитра" (server).
_null = [] execvm "rqf\init\init_arbitrator.sqf";

// Development.


_null = player addAction ["Teleport", "rqf\helpers\dbgClickTeleport.sqf"];

// _null = player addAction ["Init playable zones", "rqf\init\init_playableZone.sqf"];
// _null = player addAction ["Add triggers", "rqf\init\init_triggers.sqf"];
// _null = player addAction ["Jump", {_null = [5] execVM "rqf\functions\fnc_jumpForward.sqf"}];
// _null = player addAction ["Teleport to positions", "rqf\init\init_positions.sqf"];
// _null = player addAction ["Teleport red units", "rqf\helpers\dbgUnitsTeleport.sqf"];

_null = [] execvm "rqf\helpers\dbgInfoCustom.sqf";

// Тест мультиплеера.
// Параметры.
// Перенос на шаблон на НА.
// Локализация.
// Случайная погода.
// Свой фризтайм.
// Изображения.