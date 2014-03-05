/*
    Author:
        Dmitry Loac.

    Description:
        Client side procedures.

    External variables:
        startMission
 */

private [
    "_camera",
    "_playableMarkers"
];

// Disable saving.
enableSaving [false, false];

// Delete playable markers.
_playableMarkers = [] call rqf_fnc_getPlayableMarkers;

{
    deleteMarker _x;
} forEach _playableMarkers;

sleep 0.01;

// Fade out player screen.
// Try this https://community.bistudio.com/wiki/titleCut
// And this https://community.bistudio.com/wiki/startLoadingScreen
_camera = "camera" camCreate (position player);
_camera cameraEffect ["internal", "BACK"];
_camera camCommit 0;
cutText ["A long time ago in a galaxy far,\nfar away...", "BLACK FADED", 120];

// Radio off.
enableRadio false;

// Wait start mission. Set start positions, teleport and etc.
waitUntil { (startMission && time > 3)  || time > 60 };

// Fade out player screen.
cutText ["", "BLACK IN", 2];
_camera cameraEffect ["terminate", "BACK"];
_camera camCommit 0;
camDestroy _camera;

// Radio on.
enableRadio true;

// Wait misson complete.
[] spawn {
    waitUntil {
        sleep 1;

        switch (completeMission) do {
            case "blueHoldTarget" : {
                switch (side player) do {
                    case west: { ["win_blueHoldTarget", true, true] call BIS_fnc_endMission };
                    case east: { ["lose_blueHoldTarget", false, true] call BIS_fnc_endMission };
                };
            };
            case "redHoldTarget" : {
                switch (side player) do {
                    case west: { ["lose_redHoldTarget", false, true] call BIS_fnc_endMission };
                    case east: { ["win_redHoldTarget", true, true] call BIS_fnc_endMission };
                };
            };
        };

        not (completeMission == "");
    };
}
