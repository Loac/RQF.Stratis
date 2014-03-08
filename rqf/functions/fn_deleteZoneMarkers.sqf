/*
    Author:
        Dmitry Loac.

    Description:
        Delete all palyable markers.

    Example:
        _zoneMarkers = [] execVM "rqf\functions\fn_deletePlayableMarkers.sqf";
        [] call rqf_fnc_deleteZoneMarkers;
*/

_zoneMarkers = [] call rqf_fnc_getZoneMarkers;

{
    deleteMarker _x;
} forEach _zoneMarkers;

true;