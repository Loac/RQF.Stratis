/*
    Author:
        Dmitry Loac.

    Description:
        Set markers for players.

    External variables:
        targetPosition
        bluePosition
        redPosition
 */

private [
    "_zoneMarkers",
    "_marker"
];

// Delete playable markers.
_zoneMarkers = [] call rqf_fnc_getZoneMarkers;

{
    deleteMarker _x;
} forEach _zoneMarkers;

// Set place marker for target.
_marker = ["TARGET", targetPosition, [["shape", "ELLIPSE"], ["size", [targetSize, targetSize]]]] call rqf_fnc_createMarker;

// Set blue spawn marker.
_marker = ["BLUESTART", bluePosition, [["type", "mil_dot"], ["color", "ColorBlue"]]] call rqf_fnc_createMarker;

// Set red spawn marker.
_marker = ["REDSTART", redPosition, [["type", "mil_dot"], ["color", "ColorRed"]]] call rqf_fnc_createMarker;