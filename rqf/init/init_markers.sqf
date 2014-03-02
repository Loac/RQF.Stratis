/*
    Author:
        Dmitry Loac.

    Description:
		Set markers for players.

    Global variables:
        targetPosition
        bluePosition
        redPosition
 */

private [
	"_playableMarkers",
	"_marker"
];

// Удалить игровые маркеры.
_playableMarkers = [] call rqf_fnc_getPlayableMarkers;

{
    deleteMarker _x;
} forEach _playableMarkers;

// Визуально обозначить цель.
_marker = ["TARGET", targetPosition, [["shape", "ELLIPSE"], ["size", [targetSize, targetSize]]]] call rqf_fnc_createMarker;

// Поставить маркер для синих.
_marker = ["BLUESTART", bluePosition, [["type", "mil_dot"], ["color", "ColorBlue"]]] call rqf_fnc_createMarker;

// Поставить маркер для красных.
_marker = ["REDSTART", redPosition, [["type", "mil_dot"], ["color", "ColorRed"]]] call rqf_fnc_createMarker;