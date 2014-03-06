/*
    Author:
        Dmitry Loac.

    Description:
        Add waypoints for AI.

    External:
        targetPosition
        targetSize

    See:
        https://community.bistudio.com/wiki/Mission_Editor:_Waypoints
        https://community.bistudio.com/wiki/setWaypointType
*/

private [
    "_position",
    "_radius",
    "_isOnlyAI"
];

{
    // Add waypoints for groups without players.
    _isOnlyAI = true;

    {
        if (isPlayer _x) then {
            _isOnlyAI = false;
        };
    } forEach units _x;

    // Set random waypoints into target marker.
    if (_isOnlyAI) then {
        _waypoint = _x addWaypoint[targetPosition, targetSize];
        _waypoint setWaypointSpeed "FULL";
        _waypoint setWaypointBehaviour "COMBAT";
        _waypoint setWaypointType "HOLD";
    };

} forEach allGroups;