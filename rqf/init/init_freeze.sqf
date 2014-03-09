/*
    Author:
        Dmitry Loac.
*/

// Get this value from params.
freezeTime = 60;

// Global variable.
freezeOver = false;

// Flags for early start.
blueReady = 1;
redReady = 2;

// Init freeze timer.
[] spawn {
    waitUntil {
    	// Decrease value timer.
        freezeTime = freezeTime - 1; publicVariable "freezeTime";
        sleep 1;

        // Wait for timer is over or both sides is ready.
        (freezeTime == 0) || (blueReady == redReady);
    };

    // Freeze is over.
    freezeOver = true; publicVariable "freezeOver";
};
