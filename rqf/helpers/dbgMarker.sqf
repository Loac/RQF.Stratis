/*
    Author:
        Dmitry Loac.

     Example:
     	_null = [_redPosition, ("RED-" + str(dbgMarkerIndex))] execVM "rqf\helpers\dbgMarker.sqf";
 */

_markerPos = _this select 0;
_markerText = _this select 1;

_marker = createMarker ["DEBUG" + str(dbgMarkerIndex), _markerPos];
_marker setMarkerType "mil_dot";
_marker setMarkerColor "ColorBlack";
_marker setMarkerText _markerText;

dbgMarkerIndex = dbgMarkerIndex + 1;