/*
    Author:
        Dmitry Loac.

    Description:
        Add helper actions.
*/

devGodMode = false;
devShowInfo = false;

_null = player addAction ["Teleport", "devel\dev_clickTeleport.sqf"];
_null = player addAction ["God mode", "devel\dev_godMode.sqf"];
_null = player addAction ["Show info", "devel\dev_info.sqf"];
// _null = player addAction ["Jump", "devel\dev_jump.sqf"];