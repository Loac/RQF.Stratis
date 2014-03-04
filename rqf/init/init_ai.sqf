/*
    Author:
        Dmitry Loac.

    Description:
        Add waypoints for AI.

    See:
        https://community.bistudio.com/wiki/Mission_Editor:_Waypoints
        https://community.bistudio.com/wiki/setWaypointType
 */

private [
    "_position",
    "_radius",
    "_isGroupPlayable"
];

{
    // Add waypoints for groups without players.
    _isGroupPlayable = false;

    {
        if (isPlayer _x) then {
            _isGroupPlayable = true;
        };
    } forEach units _x;

    if (not _isGroupPlayable) then {
        _position = getMarkerPos "TARGET";
        _radius = getMarkerSize "TARGET" select 0;
        _waypoint = _x addWaypoint[_position, _radius];
        _waypoint setWaypointSpeed "FULL";
        _waypoint setWaypointBehaviour "COMBAT";
        _waypoint setWaypointType "HOLD";

    };

} forEach allGroups;