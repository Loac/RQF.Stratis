/*
    Description:
        Load parameters from config file.
 */

private [
    "_index",
    "_name",
    "_value",
    "_code"
];

_index = 0;

{
    _name = configName ((missionConfigFile >> "Params") select _index);

    if (not isNil "paramsArray") then {
        _value = paramsArray select _index;
    }
    else {
        _value = getNumber (missionConfigFile >> "Params" >> _name >> "default");
    };

    _code = getText (missionConfigFile >> "Params" >> _name >> "code");

    call compile format[_code, _value];

    _index = _index +1;
} forEach paramsArray;