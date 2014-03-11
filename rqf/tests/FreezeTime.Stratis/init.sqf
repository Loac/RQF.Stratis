// Get this value from params.
freezeTime = 60;

// Global variable.
freezeOver = false;

// Flags for early start.
blueReady = 1;
redReady = 2;

// Init server side.
if (isServer) then {
    // Set parameters.
    _handle = [] execVM "init\init_params.sqf"; waitUntil { scriptDone _handle };

    // Init freeze time.
    _null = execVM "init\init_freeze.sqf";
};

// Init client side.
if (not isDedicated) then {
    // Magic.
    waitUntil { not isNull Player and isPlayer Player };

    _null = execVM "init\init_clientRadio.sqf";
    _null = execVM "init\init_clientFreeze.sqf";
};