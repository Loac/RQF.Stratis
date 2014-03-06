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
*/

// {
//      publicVariable _this;
// } forEach _this;
//
// // or.
//
// publicVariable "blueTimer";
// publicVariable "redTimer";
// publicVariable "bluePosition";
// publicVariable "redPosition";


// [["missionComplete", true], ["blueTimer", 0]] call rqf_fnc_broadcast;

_variables =  _this select 0

{
    _name = _x select 0;
    _value = _x select 1;

    // Возможно получится сделать переменную глобальной через третий параметр.
    missionNamespace setVariable [_name, _value];
    publicVariable _name;

} forEach _variables;