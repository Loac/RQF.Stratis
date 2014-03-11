/*
    Author:
        Dmitry Loac.
*/

// Init freeze timer.
waitUntil {
	// Decrease value timer.
    freezeTime = freezeTime - 1; publicVariable "freezeTime";
    sleep 1;

    // Wait for timer is over or both sides is ready.
    (freezeTime == 0) || (blueReady == redReady);
};

// Freeze is over.
freezeOver = true;

// Broadcast variable.
publicVariable "freezeOver";