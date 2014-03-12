/*
    Author:
        Dmitry Loac.

    Description:
        Add freeze timer.
*/

// Init freeze timer.
waitUntil {
    // Decrease value timer.
    _handle = [["freezeTime", freezeTime - 1]] call rqf_fnc_broadcast;

    // Skip freeze time if both sides agree.
    if (freezeTime > 5 and blueReady and redReady) then {
        _handle = [["freezeTime", 5]] call rqf_fnc_broadcast;
    };

    sleep 1;

    // Wait for timer is over or both sides is ready.
    freezeTime < 0;
};