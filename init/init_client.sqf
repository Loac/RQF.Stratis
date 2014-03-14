/*
    Author:
        Dmitry Loac.

    Description:
        Client side procedures.

    See:
        titleCut
        titleText
        titleRsc
        startLoadingScreen
        BIS_fnc_dynamicText
        enablesimulation

    External variables:
        startMission
        environment
*/

private [
    "_camera",
    "_zoneMarkers"
];

// Disable saving.
enableSaving [false, false];

// Delete zone markers.
[] call rqf_fnc_deleteZoneMarkers;

// Disable AI.
_handle = [false] execVM "init\init_aiControl.sqf";

// Init briefing.
_handle = [] execVM "init\init_briefing.sqf";

// Wait variable environment and set it.
waitUntil { count environment > 0 };
[environment] call rqf_fnc_setEnvironment;

// Focus on target marker.
// disableserialization;
// _mapDisplay = findDisplay 12;
// _mapCtrl = _mapDisplay displayCtrl 51;
// _mapCtrl ctrlMapAnimAdd [0, 0.1, position player];
// ctrlMapAnimCommit _mapCtrl;

// Show intro.
_handle = [] call compile preprocessFileLineNumbers "init\init_clientIntro.sqf";
waitUntil { scriptDone _handle };

// Fade out screen.
cutText ["Please, stand by.", "BLACK FADED", 120];
_camera = "camera" camCreate (position player);
_camera cameraEffect ["internal", "BACK"];
_camera camCommit 0;

// Radio off.
enableRadio false;

// Wait start mission. Set start positions, teleport and etc.
waitUntil { startMission && time > 3 };

// Fade in screen.
_camera cameraEffect ["terminate", "BACK"];
_camera camCommit 0;
camDestroy _camera;
cutText ["", "BLACK IN", 2];

// Radio on.
enableRadio true;

// Add radio commands.
_handle = execVM "init\init_clientRadio.sqf";

// If freeze time is enabled.
if (freezeTime > 0) then {
    // Init freeze.
    _handle = execVM "init\init_clientFreeze.sqf"; waitUntil { scriptDone _handle };
};

// If AI enabled.
if (aiEnable > 0) then {
    _handle = [true] execVM "init\init_aiControl.sqf";
};