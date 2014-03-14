/*
    Author:
        Dmitry Loac.

    Description:
        Add waypoints for AI.

    External variables:
        targetPosition
        targetSize
        freezeTime

    See:
        https://community.bistudio.com/wiki/Mission_Editor:_Waypoints
        https://community.bistudio.com/wiki/setWaypointType
*/

private [
    "_position",
    "_radius",
    "_isAI"
];

// Disable AI.
{
    _x allowFleeing 0;
    _x disableAI "AUTOTARGET";
    _x disableAI "ANIM";
    _x disableAI "FSM";
    _x disableAI "MOVE";
    _x disableAI "PATHPLAN";
} foreach allUnits;

// If AI is enabled.
if (aiEnable > 0) then {
    // Wait freezeTime is over.
    waitUntil { freezeTime < 0 };

    // Waypoints for bots.
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
            _waypoint setWaypointType "HOLD";
            // _waypoint setWaypointSpeed "FULL";
            // _waypoint setWaypointBehaviour "COMBAT";
        };

    } forEach allGroups;

    // Enable AI.
    {
        _x enableAI "AUTOTARGET";
        _x enableAI "ANIM";
        _x enableAI "FSM";
        _x enableAI "MOVE";
        _x enableAI "PATHPLAN";
    } foreach allUnits;
};




