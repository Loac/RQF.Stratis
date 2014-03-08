/*
    Author:
        Dmitry Loac.

    Description:
        Spawn random vehicles.

    See:
        attachTo
        createVehicle_array
        BIS_fnc_spawnVehicle
        addWeaponCargo

    External variables:
        -

    Example:

    Spawn chemlight and attach it to player:
        chemlight = "Chemlight_yellow" createVehicle getPos player;
        chemlight attachTo [player, [1,0,0]];

    Spawn AK47 on the ground.
        ak47 = "GroundWeaponHolder" createVehicle position player;
        ak47 addWeaponCargo ["srifle_EBR_F", 1];
        ak47 addMagazineCargo ["20Rnd_762x51_Mag", 1];

    Spawn Jeep:
        jeep = createVehicle ["C_SUV_01_F", getPos player, [], 0, "NONE"];

    Spawn Light:
        light = "#lightpoint" createvehicle position player;
        light setLightBrightness 1;
        light setLightAmbient [1, 1, 1];
        light setLightColor [1, 1, 1];
        light setpos [4314.7, 4328.57, 0.1];

*/