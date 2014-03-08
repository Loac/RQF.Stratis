/*
    Author:
        Dmitry Loac.

    Description:
        Find all palyable markers.

    Example:
        [] call rqf_fnc_getZoneMarkers;
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

} forEach _allMarkers;

// Return.
_zoneMarkers;