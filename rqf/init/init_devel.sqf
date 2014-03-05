devGodMode = false;

_null = player addAction ["Teleport", "rqf\devel\dev_clickTeleport.sqf"];
_null = player addAction ["God mode", "rqf\devel\dev_godMode.sqf"];

_null = [] execVM "rqf\devel\dev_infoCustom.sqf";


// _null = player addAction ["Teleport red units", "rqf\devel\dbgUnitsTeleport.sqf"];

// _null = player addAction ["Init playable zones", "rqf\init\init_playableZone.sqf"];
// _null = player addAction ["Add triggers", "rqf\init\init_triggers.sqf"];
// _null = player addAction ["Jump", {_null = [5] execVM "rqf\functions\fnc_jumpForward.sqf"}];
// _null = player addAction ["Teleport to positions", "rqf\init\init_positions.sqf"];

