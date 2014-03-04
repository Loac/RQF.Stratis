/*
    Author:
        Dmitry Loac.

    Description:
        Load parameters from config file.
 */

private [
	"_index",
	"_name"
];

_index = 0;

{
    _name = configName ((missionConfigFile >> "Params") select _index);

    call compile format["%1 = %2", _name, _x];

    _index = _index + 1;

} forEach paramsArray;
