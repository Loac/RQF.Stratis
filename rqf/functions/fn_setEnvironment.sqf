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

// Return.
// _marker;
//
//vhl1 = "C_SUV_01_F" createVehicleLocal getPos player
//     class missionDayTime
//     {
//         title = "Time of day";
//         values[] = { 1, -8, -6, 0, 8, 13, 2 };
//         texts[] = { "Random", "Early Morning", "Morning", "Noon", "Sundown", "Night with Full Moon", "Dark Night" };
//         default = false;
//         code = "missionDayTime = %1";
//     };
//
//     class missionWeather
//     {
//         title = "Weather";
//         values[] = { -1, 0, 1, 2, 3, 4 };
//         texts[] = { "Random", "Clear", "Partly Cloudy", "Cloudy", "Overcast", "Storm" };
//         default = 2;
//         code = "missionWeather = %1";
//     };
//
//     class missionFog
//     {
//         title = "Fog";
//         values[] = { -1, 0, 0.25, 0.50, 0.75, 1 };
//         texts[] = { "Random", "No", "Little", "Middle", "High", "Full" };
//         default = 0;
//         code = "missionFog = %1";
//     };
//
// _weather
// _time