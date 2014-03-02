/*
    Author:
        Dmitry Loac.

    Description:
        Initialisation teleport by click on map.

    Example:
        _null = player addAction ["Teleport", "rqf\helpers\dbgClickTeleport.sqf"];
 */

openMap [true, false];

onMapSingleClick {
	player setPos _pos;
	openMap [false, false];
	onMapSingleClick {};
};