/*
    Author:
        Dmitry Loac.

    Description:
        Teleport red team to marker "TARGET".

     Example:
      	_null = player addAction ["Teleport red team", "rqf\devel\dev_unitsTeleport.sqf"];
*/

{
    switch (side _x) do {
        case east: {
            _x setPos (getMarkerPos "TARGET");
        };
   };
} forEach allUnits;
