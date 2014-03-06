/*
    Author:
        Dmitry Loac.

    External variables:
        blueTimer
        redTimer
        blueHold
        redHold
*/

private [
    "_winner",
    "_scenario"
];

_winner = sideLogic;
_scenario = "";

waitUntil {
    sleep 1;

    // Update ratio.
    _null = [] call rqf_fnc_updateRatio;

    // If blue dominate. Ratios in percent.
    if (redRatio < 51) then {
        _scenario = "blueDominate";
        _winner = west;
    };

    // // If red dominate.
    if (blueRatio < 51) then {
        _scenario = "redDominate";
        _winner = east;
    };

    // Check trigger "TARGET" state.

    // If blue hold position, but red not.
    if (blueHold && not redHold) then {
        blueTimer = blueTimer - 1;

        // Blue hold position.
        if (blueTimer < 0) then {
            _scenario = "blueHoldTarget";
            _winner = west;
        };
    };

    // If red hold position, but blue not.
    if (redHold && not blueHold) then {
        redTimer = redTimer - 1;

        // Red hold position.
        if (redTimer < 0) then {
            _scenario = "redHoldTarget";
            _winner = east;
        };
    };

    // Wait while _winner is not defined.
    not (_winner == sideLogic);
};

// End of misson.
[[_winner, _scenario], "rqf_fnc_endMission"] spawn BIS_fnc_MP;