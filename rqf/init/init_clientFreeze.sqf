/*
    Author:
        Dmitry Loac.

    Description:
    	Client side procedures in freeze time.
*/

/*
	Control player position.
*/

// Get marker of start position.
switch (playerSide) do {
	case west: { _startMarker = "BLUESTART" };
	case east: { _startMarker = "REDSTART" };
};

// Get marker parameters.
_freezePosition = getMarkerPos "BLUESTART";
_freezeRange = (getMarkerSize "BLUESTART") select 0;

// Wait flag "freezeOver".
waitUntil {
    _playerPosition = position player;

    // If player leave of the freeze area.
    if (_playerPosition distance _freezePosition > _freezeRange) then {

        // Fade out screen.
        cutText ["Please, wait to start mission.", "BLACK OUT", 1];

        // Wait fade out, before set position.
        sleep 1;

        // Hold player.
        _camera = "camera" camCreate (position player);
        _camera cameraEffect ["internal", "BACK"];
        //_camera camCommit 0;

        // Get direction to center of start position.
       _freezeDir = ([_playerPosition, _freezePosition] call bis_fnc_dirTo);

       // Move player back.
        player setPos [
            ((_freezePosition select 0) + (sin (_freezeDir + 180)) * (_freezeRange - 10)),
            ((_freezePosition select 1) + (cos (_freezeDir + 180)) * (_freezeRange - 10)),
            0
        ];

        // Wait for message.
        sleep 2;

        // Fade in screen.
        _camera cameraEffect ["terminate", "BACK"];
	    //_camera camCommit 0;
    	camDestroy _camera;
        cutText ["", "BLACK IN", 2];
    };

    hint format["To start mission: %1", freezeTime];

    // No need to a lot of checks.
    sleep 1;

    freezeOver;
};