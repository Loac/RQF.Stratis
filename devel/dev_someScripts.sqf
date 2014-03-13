/*
	Определить netId игрока для того, чтобы что-то выполнить с ним от лица сервера.
*/
netId player;
_obj = objectFromNetId "2:20";


// ["bluePosition %1", bluePosition] call BIS_fnc_error;
// ["TaskSucceeded",["","Island captured!"]] call bis_fnc_showNotification;

/*
    Teleport red team to marker "TARGET".
*/
{
    switch (side _x) do {
        case east: {
            _x setPos (getMarkerPos "TARGET");
        };
   };
} forEach allUnits;
