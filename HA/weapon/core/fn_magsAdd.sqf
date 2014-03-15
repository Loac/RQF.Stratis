/*
Created by Vadim Shchemelinin aka badger 
2013 St.Petersburg Russia

Script for www.Our-Army.su

add to inventory items and magasines from list like ['item1',['item2',5]]
*/
private ["_unit","_arr","_type"];

_unit = [_this,0,objnull,[objnull]] call BIS_fnc_param;
_arr = [_this,1,[],[[]]] call BIS_fnc_param;
_type = [_this,2,'',['']] call BIS_fnc_param; //or uniform, vest, ruck

_fn_add = {
	private ["_unit","_item","_type"];
	
	_unit = _this select 0;
	_item = _this select 1;
	_type = _this select 2;
	
	if (_item == '') exitWith {};
	
	switch (_type) do	{
		case 'uniform': {
			if (_unit canAddItemToUniform _item) then {
				_unit addItemToUniform _item;
			}else{["Cant add '%1' to Uniform '%2'",_item,_unit] call BIS_fnc_error;};
		};
		case 'vest': {
			if (_unit canAddItemToVest _item) then {
				_unit addItemToVest _item;
			}else{["Cant add '%1' to Vest '%2'",_item,_unit] call BIS_fnc_error;};
		};
		case 'ruck': {
			if (_unit canAddItemToBackpack _item) then {
				_unit addItemToBackpack _item;
			}else{["Cant add '%1' to Backpack '%2'",_item,_unit] call BIS_fnc_error;};
		};
		default {
			if (_unit canAdd _item) then {
				if (isClass (configFile >> "CfgMagazines" >> _item)) then {_unit addMagazine _item}
				else {
					if (isClass (configFile >> "CfgWeapons" >> _item)) then {_unit addItem _item} 
					else {["'%1' not added! Can not find it in CfgMagazines and CfgWeapons",_item] call BIS_fnc_error;};
				};
			}else{["Cant add '%1' to '%2'",_item,_unit] call BIS_fnc_error;};
		};
	};
};

{
	if (typeName _x == 'STRING') then {
		[_unit,_x,_type] call _fn_add;
	};
	if (typeName _x == 'ARRAY') then {
		private ["_i"];
		_i = 0;
		while {_i < (_x select 1)} do {
			[_unit,(_x select 0),_type] call _fn_add;
			_i = _i + 1;
		};
	};
} forEach _arr;
true