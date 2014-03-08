/*
    Author:
        Dmitry Loac.

    Description:
        Delete all palyable markers.

    Example:
        [] call rqf_fnc_deleteZoneMarkers;
*/

_zoneMarkers = [] call rqf_fnc_getZoneMarkers;

{
    deleteMarker _x;
} forEach _zoneMarkers;

true;