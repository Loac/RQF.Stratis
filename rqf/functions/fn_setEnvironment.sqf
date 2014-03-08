/*
    Author:
        Dmitry Loac.

    Description:
        Set environment: fog, day time and etc.

    External variables:
        targetPosition
        bluePosition
        redPosition

    Example:
        dayTime, weather, fog
        [["fog", 1], ["overcast", 1]] call rqf_fnc_setEnvironment;
*/


private [
    "_markerName",
    "_markerPos",
    "_params",
    "_name",
    "_value"
];

{
    _name = _x select 0;
    _value = _x select 1;

    switch (_name) do {
        case "date": { setDate _value };                // [year, month, day, hour, minute]
        case "wind": { setWind _value };                // [x, z, forced]
        case "fog": { 0 setFog _value };                // 0 to 1
        case "overcast": { 0 setOvercast _value };      // 0 to 1
        case "rain": { 0 setRain _value };              // 0 or 1
        case "rainbow": { 0 setRainbow _value };        // 0 or 1
    };

} foreach _this;

// Return.
true;