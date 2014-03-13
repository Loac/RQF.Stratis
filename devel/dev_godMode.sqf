/*
    Description:
        Switch god mode.

    Example:
        _null = player addAction ["God mode", "devel\dev_godMode.sqf"];
*/

devGodMode = not devGodMode;

player enableFatigue not devGodMode;
player allowDamage not devGodMode;

player sideChat format ["God mode: %1", devGodMode];