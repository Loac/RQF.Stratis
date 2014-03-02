/*
    Author:
        Dmitry Loac.
 */

// Global variables.

dbgMarkerIndex = 1;

// FIX: Улучшить проверку места спавна. Все еще может заспавнить на берегу или в канмях.

// Вынести в переменые настройки.

// Радиус зоны удержания.
targetSize = 50;

// Расстояние точек старта от центра зоны удержания.
targetDistance = 200;

// Максимальное отклонение позиций сторон.
sideDeviation = 40;

// Таймеры сторон.
blueTimer = 100;
redTimer = 100;

// Позиция цели.
targetPosition = [];

// Позиции сторон.
bluePosition = [];
redPosition = [];

// Флаги захвата сторон.
blueHold = false;
redHold = false;

// Init.

// Выбрать цель и стартовые позиции.
_null = [] execVM "rqf\init\init_playableZone.sqf";

// Установить триггеры.
_null = [] execVM "rqf\init\init_triggers.sqf";

// Телепортировать на позиции.
_null = [] execvm "rqf\init\init_positions.sqf";

// Добавить вейпоинты ботам.
_null = [] execvm "rqf\init\init_ai.sqf";

// Запустить "арбитра".
_null = [] execvm "rqf\init\init_arbitrator.sqf";

// Development.

_null = player addAction ["Teleport", "rqf\helpers\dbgClickTeleport.sqf"];
// _null = player addAction ["Init playable zones", "rqf\init\init_playableZone.sqf"];
// _null = player addAction ["Add triggers", "rqf\init\init_triggers.sqf"];
// _null = player addAction ["Jump", {_null = [5] execVM "rqf\functions\fnc_jumpForward.sqf"}];
// _null = player addAction ["Teleport to positions", "rqf\init\init_positions.sqf"];
_null = player addAction ["Teleport red units", "rqf\helpers\dbgUnitsTeleport.sqf"];

_null = [] execvm "rqf\helpers\dbgInfoCustom.sqf";

// Тест мультиплеера.
// Параметры.
// Перенос на шаблон на НА.
// Локализация.
// Случайная погода.
// Свой фризтайм.
// Изображения.