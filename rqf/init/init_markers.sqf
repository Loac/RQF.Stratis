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

// Set place marker for target.
_marker = ["TARGET", targetPosition, [["shape", "ELLIPSE"], ["size", [targetSize, targetSize]], ["alpha", 0.75]]] call rqf_fnc_createMarker;

// Set blue spawn marker.
_marker = ["BLUESTART", bluePosition, [["type", "b_inf"], ["color", "ColorBlue"], ["alpha", 0.75]]] call rqf_fnc_createMarker;

// Set red spawn marker.
_marker = ["REDSTART", redPosition, [["type", "o_inf"], ["color", "ColorRed"], ["alpha", 0.75]]] call rqf_fnc_createMarker;