/*
    Author:
        Dmitry Loac.

    Description:
        Switch god mode.

    See:
        getPosATL
        getDir
        velocity
        assignedTarget cursorTarget
        dayTime
        windStr
        windDir

    Example:
        _null = player addAction ["God mode", "rqf\devel\dev_info.sqf"];
*/

private [
    "_hint",
    "_strings"
];

// Switch variable.
devShowInfo = not devShowInfo;

waitUntil {
    // Strings.
    _hint = "";
    _strings = [
        ["Blue timer (hold): %1 (%2)", blueTimer, blueHold],
        ["Red timer (hold): %1 (%2)", redTimer, redHold],
        ["Ratio (B:R): %1:%2", blueUnits, redUnits]
    ];

    // Make debug info.
    {
        _hint = _hint + (format _x) + "\n";
    } forEach _strings;

    // Show hint.
    hintSilent _hint;

    // Wait.
    sleep 0.5;

    // Show info while devShowInfo == true.
    not devShowInfo;
};

if (not devShowInfo) then {
    hintSilent "";
};