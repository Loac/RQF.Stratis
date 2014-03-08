/*
    Author:
        Dmitry Loac.

    Description:
        Add waypoints for AI.

    External variables:
        targetPosition
        targetSize

    See:
        https://community.bistudio.com/wiki/Mission_Editor:_Waypoints
        https://community.bistudio.com/wiki/setWaypointType
*/

private [
    "_position",
    "_radius",
    "_isAI"
];

{
    // Add waypoints for groups where player not leader.
    _isAI = true;

    // Check all units in group.
    {
        if (isPlayer _x && isFormationLeader _x) then {
            _isAI = false;
        };

        // No reason check next unit.
        if (_isAI) exitWith {};
    } forEach units _x;

    // Set random waypoints into target marker.
    if (_isAI) then {
        _waypoint = _x addWaypoint[targetPosition, targetSize];
        _waypoint setWaypointSpeed "FULL";
        // _waypoint setWaypointBehaviour "COMBAT";
        _waypoint setWaypointType "HOLD";
    };

} forEach allGroups;