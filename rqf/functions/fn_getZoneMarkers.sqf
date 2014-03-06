/*
    Author:
        Dmitry Loac.

    Description:
        Find all palyable markers.

    Example:
        _zoneMarkers = [] execVM "rqf\functions\fn_getPlayableMarkers.sqf";
 */

private [
    "_allMarkers",
    "_color",
    "_zoneMarkers"
];

_allMarkers = allMapMarkers;

_zoneMarkers = [];

{
    // We need only "ColorOrange" markers.
    _color = getMarkerColor _x;

    if (_color == "ColorOrange") then {
        _zoneMarkers = _zoneMarkers + [_x];
    };

} foreach _allMarkers;

// Return.
_zoneMarkers;