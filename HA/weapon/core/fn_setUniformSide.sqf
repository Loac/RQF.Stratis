/*
Function for changing uniform className for using by differnt sides

Input:
1 - unit
2 - uniform classname

Output:
uniform classname for this side
*/
private ["_unit","_uniformI","_suppurtedList","_array","_newSidePrefix","_element","_uniformO"];

_unit = [_this,0,objnull,[objnull]] call BIS_fnc_param;
_uniformI = [_this,1,"",[""]] call BIS_fnc_param;

_suppurtedList = [
				"U_IG_GUERILLA1_1","U_OG_GUERILLA1_1","U_BG_GUERILLA1_1",
				"U_IG_GUERILLA2_1","U_OG_GUERILLA2_1","U_BG_GUERILLA2_1",
				"U_IG_GUERILLA2_2","U_OG_GUERILLA2_2","U_BG_GUERILLA2_2",
				"U_IG_GUERILLA2_3","U_OG_GUERILLA2_3","U_BG_GUERILLA2_3",
				"U_IG_GUERILLA3_1","U_OG_GUERILLA3_1","U_BG_GUERILLA3_1",
				"U_IG_GUERILLA3_2","U_OG_GUERILLA3_2","U_BG_GUERILLA3_2",
				"U_IG_LEADER","U_OG_LEADER","U_BG_LEADER"
				];

//if no uniform classnames for different sides
if !(toUpper(_uniformI) in _suppurtedList) exitWith {
	_uniformI
};

_newSidePrefix = switch (side _unit) do {
	case west: {"BG"};
	case east: {"OG"};
	default {"IG"};
};

_array = [_uniformI,'_'] call BIS_fnc_splitString;
_array set [1, _newSidePrefix];

private [];

_element = _array select 0;
_uniformO = _element;

for "_i" from 1 to ((count _array) - 1) do {
	_element = _array select _i;
	_uniformO = _uniformO + "_" + _element;
};

_uniformO