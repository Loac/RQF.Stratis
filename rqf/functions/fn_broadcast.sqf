/*
    Author:
        Dmitry Loac.

    Description:
        Send public variables to all clients.

    See:
        publicVariable

    External variables:
        blueTimer
        redTimer
        bluePosition
        redPosition

    Example:
        _null = [["missionComplete", true], ["blueTimer", 0]] call rqf_fnc_broadcast;
*/

private [
    "_name",
    "_value"
];

{
    _name = _x select 0;
    _value = _x select 1;

    missionNamespace setVariable [_name, _value];
    publicVariable _name;
} forEach _this;

true;