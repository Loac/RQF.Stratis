/*
    Author:
        Dmitry Privalov.

    Description:
        Определить игровую зону, в которой будут размещены Цель и отряды.

    Example:
        _playableZone = [] execVM "rqf\functions\fnc_getPlayableZone.sqf";
 */

// Найти все маркеры, в которых возможна игра.
_playableMarkers = [] call rqf_getPlayableMarkers;

// Выбрать случайный маркер.
_index = floor random count _playableMarkers;
_playableMarker = _playableMarkers select _index;

_playableMarker = "zone1";

// Выбрать случайную позицию в пределах этого маркера.

// Направление смещения позиции.
_i = 0;
//while {_i < 1000} do {
    _newDegrees = random 360;

    // Cмещение от центра маркера, но не далее его радиуса.
    _newDistance = random (getMarkerSize _playableMarker select 0);

    // Координаты.
    _newPositionX = (getMarkerPos _playableMarker select 0) + (sin _newDegrees * _newDistance);
    _newPositionY = (getMarkerPos _playableMarker select 1) + (cos _newDegrees * _newDistance);

    _newPosition = [_newPositionX, _newPositionY];


    // Убедится в корректности территории.

//     _newPosition = [
//         _newPosition, // center position.
//         0,            // minimum distance from the center position.
//         25,          // maximum distance from the center position.
//         10,           // minimum distance from the nearest object.
//         0,            // water mode (0: can't be in water).
//         0.4,          // maximum terrain gradient.
//         0,            // shore mode (0: does not have to be at a shore).
//         [],
//         [[0,0],[0,0]]
//     ] call BIS_fnc_findSafePos;

    _newPosition = [[[getMarkerPos _playableMarker, getMarkerSize _playableMarker select 0]]] call BIS_fnc_randomPos;

    if ((_newPosition select 0) != 0) then {
        _marker = ["MARKER" + str(_i), _newPosition, [["type", "mil_dot"]]] call rqf_createMarker;
    };

    _i = _i + 1;
//}


// selectBestPlaces
// findEmptyPosition

// Телепортация.

// player setPos _newPosition;

// dbg:
// player sideChat format["%1", _newPosition];

//newPos = [position player, 0, 50, 15, 0, 0.3, 0, [], [[0,0],[0,0]]] call BIS_fnc_findSafePos;  player setPos newPos;

// return;
// _playableMarker;

// Из игровых маркеров необходимо выбрать один.
// dbg:
// player sideChat format["%1 -> %2 -> %3", _playableMarkers, _index, _playableMarker];
