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
    "_blueLeader",
    "_redLeader"
];

// Wait init_positions complited, because bots can't move by setPos after disable ANIM.
waitUntil { time > 1 };

// Disable AI.
[false] execVM "init\init_aiControl.sqf";

// If AI is enabled.
if (aiEnable > 0) then {

    // Flags: player is leader of side.
    _blueLeader = false;
    _redLeader = false;

    // Check leaders of groups.
    {
        if (isPlayer (leader _x)) then {
            // If player leader at least one group, then he responsible ready side.
            switch (side _x) do {
                case west: { _blueLeader = true };
                case east: { _redLeader = true };
            };
        }
        else {
            // If leader group is AI, set random waypoints into target marker.
            _waypoint = _x addWaypoint[targetPosition, targetSize];
            _waypoint setWaypointType "HOLD";

            _x setBehaviour "COMBAT";
            _x setSpeedMode "FULL";
        };
    } forEach allGroups;

    // If no blue player leader.
    if (not _blueLeader) then {
        [["blueReady", true]] call rqf_fnc_broadcast;
    };

    // If no red player leader.
    if (not _redLeader) then {
        [["redReady", true]] call rqf_fnc_broadcast;
    };

    // Wait freezeTime is over.
    waitUntil { freezeTime < 0 };

    // Enable AI.
    [true] execVM "init\init_aiControl.sqf";
};