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

// TODO: Добавить проверку поля "code", если его нету, то просто присвоить значение названию параметра.

for "_index" from 0 to (count paramsArray) - 1 do {
    _name = configName ((missionConfigFile >> "Params") select _index);

    if (not isNil "paramsArray") then {
        _value = paramsArray select _index;
    }
    else {
        _value = getNumber (missionConfigFile >> "Params" >> _name >> "default");
    };

    _code = getText (missionConfigFile >> "Params" >> _name >> "code");

    call compile format[_code, _value];
};