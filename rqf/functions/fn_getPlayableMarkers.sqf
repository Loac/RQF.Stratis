/*
    Author:
        Dmitry Loac.

    Description:
        Find all palyable markers.

    Example:
        _playableMarkers = [] execVM "rqf\functions\fn_getPlayableMarkers.sqf";
 */

private [
    "_allMarkers",
    "_color",
    "_playableMarkers"
];

_allMarkers = allMapMarkers;

_playableMarkers = [];

{
    // We need only "ColorOrange" markers.
    _color = getMarkerColor _x;

    if (_color == "ColorOrange") then {
        _playableMarkers = _playableMarkers + [_x];
    };

} foreach _allMarkers;

// Return.
_playableMarkers;