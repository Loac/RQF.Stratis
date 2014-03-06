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

    // Update ratio.
    _null = [] call rqf_fnc_updateRatio;

    // If blue dominate. Ratios in percent.
    if (redRatio < 51) then {
        completeMission = "redDominate";
    };

    // // If red dominate.
    if (blueRatio < 51) then {
        completeMission = "blueDominate";
    };

    // Check trigger "TARGET" state.

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

    // Wait while completeMission is empty.
    not (completeMission == "");
};

// Send variable.
publicVariable 'completeMission';
