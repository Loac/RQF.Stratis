/*
    Author:
        Dmitry Loac.

    Description:
        Enable or disable AI.

    Example:
        _handle = [true] execVM "init\init_aiControl.sqf";
*/

_enable = _this select 0;

// Enable or disable AI.
if (_enable) then {
    // Enable AI.
    {
        _x setVariable ["BIS_noCoreConversations", true];
        _x allowFleeing 0;
        _x enableAI "AUTOTARGET";
        _x enableAI "ANIM";
        _x enableAI "FSM";
        _x enableAI "MOVE";
        _x enableAI "PATHPLAN";
    } foreach allUnits;
}
else {
    // Disable AI.
    {
        _x setVariable ["BIS_noCoreConversations", true];
        _x allowFleeing 0;
        _x disableAI "AUTOTARGET";
        _x disableAI "ANIM";
        _x disableAI "FSM";
        _x disableAI "MOVE";
        _x disableAI "PATHPLAN";
        //{_unit disableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"]};
    } foreach allUnits;
};