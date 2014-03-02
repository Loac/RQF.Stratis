for "_i" from 0 to ((count paramsArray) - 1) do {

    _name = (configName ((missionConfigFile >> "Params") select _i));

    _value = (paramsArray select _i);

    _values = getArray (missionConfigFile >> "Params" >> _name >> "values");

    _texts = getArray (missionConfigFile >> "Params" >> _name >> "texts");

    _selected = str(_texts select (_values find _value));

    call (compile (format["%1 = %2", _name, _value]));

    call (compile (format["%1_str = %2", _name, _selected]));

    player sideChat format["MISSION PARAMETER: %1 : %2", _name, _value];

    player sideChat format["MISSION PARAMETER: %1 : %2", (_name + "_str"), _selected];
};