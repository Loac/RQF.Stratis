/*
    Author:
        Dmitry Loac.

    Global variables:
        blueTimer
        redTimer
        blueHold
        redHold
 */

 // ["TaskSucceeded",["","Island captured!"]] call bis_fnc_showNotification;

_gameFinish = false;
_endVariant = "";

if (isServer) then {
    waitUntil {
        sleep 1;

        // Если синие захватили позицию, а карсные нет.
        if (blueHold && not redHold) then {
            blueTimer = blueTimer - 1;

            // Красные удержали цель.
            if (blueTimer < 0) then {
                _gameFinish = true;
                _endVariant = "blueHoldTarget";
            };
        };

        // Если красные захватили позицию, а синие нет.
        if (redHold && not blueHold) then {
            redTimer = redTimer - 1;

            // Красные удержали цель.
            if (redTimer < 0) then {
                _gameFinish = true;
                _endVariant = "redHoldTarget";
            };
        };

        _gameFinish;
    };
};

// TODO: Не уверен насчет такого способа финиширования миссии.

switch (_endVariant) do {
    case "blueHoldTarget" : {
        switch (side player) do {
            case west: { ["win_blueHoldTarget", true, true] call BIS_fnc_endMission; };
            case east: { ["lose_blueHoldTarget", false, true] call BIS_fnc_endMission; };
        };
    };
    case "redHoldTarget" : {
        switch (side player) do {
            case west: { ["lose_redHoldTarget", false, true] call BIS_fnc_endMission; };
            case east: { ["win_redHoldTarget", true, true] call BIS_fnc_endMission; };
        };
    };
};