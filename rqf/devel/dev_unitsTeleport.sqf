/*
    Author:
        Dmitry Loac.

     Example:
      	_null = player addAction ["Teleport", "rqf\helpers\dbgMoveEnemy.sqf"];
 */

{
    switch (side _x) do {
        case east: {
            _x setPos (getMarkerPos "TARGET");
        };
   };
} forEach allUnits;
