/*
    Author:
        Dmitry Loac.

    Description:
        Add waypoints for AI.

    External variables:
        targetPosition
        targetSize
        freezeTime
        aiEnable

    See:
        https://community.bistudio.com/wiki/Mission_Editor:_Waypoints
        https://community.bistudio.com/wiki/ArmA:_AI_Combat_Modes
        setWaypointType
        CfgAISkill
*/

private [
    "_position",
    "_radius",
    "_isAI"
];

// Wait init_positions complited, because bots can't move by setPos after disable ANIM.
waitUntil { time > 1 };

// Disable AI.
_handle = [false] execVM "init\init_aiControl.sqf";

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

            _x setBehaviour "COMBAT";
            _x setSpeedMode "FULL";
        };

    } forEach allGroups;

    _handle = [true] execVM "init\init_aiControl.sqf";
};