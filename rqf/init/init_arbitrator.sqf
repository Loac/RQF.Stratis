/*
    Author:
        Dmitry Loac.

    External variables:
        blueTimer
        redTimer
        blueHold
        redHold
 */

waitUntil {
    sleep 1;

    // If blue hold position, but red not.
    if (blueHold && not redHold) then {
        blueTimer = blueTimer - 1;

        // Blue hold position.
        if (blueTimer < 0) then {
            completeMission = "blueHoldTarget";
        };
    };

    // If red hold position, but blue not.
    if (redHold && not blueHold) then {
        redTimer = redTimer - 1;

        // Red hold position.
        if (redTimer < 0) then {
            completeMission = "redHoldTarget";
        };
    };

    not (completeMission == "");
};

// Send variable.
publicVariable 'completeMission';
