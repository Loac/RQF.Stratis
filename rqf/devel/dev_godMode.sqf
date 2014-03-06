devGodMode = not devGodMode;

player enableFatigue not devGodMode;
player allowDamage not devGodMode;

player sideChat format ["God mode: %1", devGodMode];