/*
    Author:
        Dmitry Loac.

    Description:
        Client side procedures.

    See:
        https://community.bistudio.com/wiki/titleCut
        titleText
        titleRsc
        startLoadingScreen
        BIS_fnc_dynamicText


    External variables:
        startMission
*/

private [
    "_camera",
    "_zoneMarkers"
];

// Disable saving.
enableSaving [false, false];

// Delete zone markers.
_zoneMarkers = [] call rqf_fnc_getZoneMarkers;

{
    deleteMarker _x;
} forEach _zoneMarkers;

disableserialization;
_mapDisplay = findDisplay 12;
_mapCtrl = _mapDisplay displayCtrl 51;
_mapCtrl ctrlMapAnimAdd [0, 0.1, position player];
ctrlMapAnimCommit _mapCtrl;

// Show intro.
_handle = [] call compile preprocessFileLineNumbers "rqf\init\init_clientIntro.sqf";
waitUntil { scriptDone _handle };

// Disable player actions.
// player enablesimulation false;

// Fade out screen.
cutText ["Please, stand by.", "BLACK FADED", 120];
_camera = "camera" camCreate (position player);
_camera cameraEffect ["internal", "BACK"];
_camera camCommit 0;

// Radio off.
enableRadio false;

// Wait start mission. Set start positions, teleport and etc.
waitUntil { startMission && time > 3 };

// Enable player.
// player enablesimulation true;

// Fade in screen.
_camera cameraEffect ["terminate", "BACK"];
_camera camCommit 0;
camDestroy _camera;
cutText ["", "BLACK IN", 2];

// Radio on.
enableRadio true;

// Wait misson complete.
_null = [] execVM "rqf\init\init_clientOutro.sqf";
