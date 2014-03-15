/*
Created by Vadim Shchemelinin aka badger
2013 St.Petersburg Russia

Script for www.Our-Army.su

Function for load template with ammo to unit

Example of using #1
(Unit start with needed loadout)
Text for unit init line:
["HA","S",this] call bgr_fnc_ammoLoad;

Example of using #2
(Unit start with default weapon, but can get 'his' loadout)
Text for unit init line:
this setVariable ["bgrWeaponTemplate",["HA","S"]];
Text for give weapon trigger for example:
[player] call bgr_fnc_ammoLoad;
*/
private ["_unitParId","_unit","_unitsTemplate","_file","_type","_compiled"];

_unitParId = (count _this)-1;
_unit = [_this,_unitParId,objnull,[objnull]] call BIS_fnc_param;

//for possibity to load saving weapon
_unitsTemplate = _unit getVariable ["bgrWeaponTemplate",['','']];
_file = (_unitsTemplate select 0);
_type = (_unitsTemplate select 1);

if ((count _this)>1) then {
	_file = [_this,0,'',['']] call BIS_fnc_param;
	_type = [_this,1,'',['']] call BIS_fnc_param;
};

//save loadout info
_unit setVariable ["bgrWeaponTemplate",[_file,_type]];

if !(local _unit) exitwith {["%1 is not local.",_unit] call BIS_fnc_error; false};

if (isNil "bgrWeaponUsingFilesList") then {bgrWeaponUsingFilesList = []};
if !(_file in bgrWeaponUsingFilesList) then {
	//_file call f_bgrWeaponCompile;  no need call init
	_compiled = false;
	_compiled = call compile format ["f_bgrWeaponList_%1 = compile preProcessFileLineNumbers 'HA\weapon\%1.sqf'; true",_file]; //!
	if !(_compiled) exitWith {["File parametr = '%1'. Template 'HA\weapon\%1.sqf' can not be compiled!",_file] call BIS_fnc_error; false};
	bgrWeaponUsingFilesList = bgrWeaponUsingFilesList + [_file];
};

////////////////////////////////////////
//    get loadout from template file  //
////////////////////////////////////////
private ["_code","_arr","_items","_item","_weaponP","_w1","_w1Equip","_weaponS","_w2","_w2Equip","_weaponH","_w3","_w3Equip","_uniform","_u","_vest","_v","_ruck","_r"];

_code = call compile format ["f_bgrWeaponList_%1",_file];
if (isNil "_code") exitWith {["Function f_bgrWeaponList_%1 not compiled!",_file] call BIS_fnc_error; false};

_type = toUpper (_type);
_arr = [];
_arr = _type call _code;

//Expect: _arr=[_items,_weaponP,_weaponS,_weaponH,_uniform,_vest,_ruck];
if (count _arr == 0) exitWith {["Can not find loadout '%2' in template '%1.sqf'",_file,_type] call BIS_fnc_error; false};

_items = [_arr,0,[],[[]]] call BIS_fnc_param;
_weaponP = [_arr,1,[],[[]]] call BIS_fnc_param;
_weaponS = [_arr,2,[],[[]]] call BIS_fnc_param;
_weaponH = [_arr,3,[],[[]]] call BIS_fnc_param;
_uniform = [_arr,4,[],[[]]] call BIS_fnc_param;
_vest = [_arr,5,[],[[]]] call BIS_fnc_param;
_ruck = [_arr,6,[],[[]]] call BIS_fnc_param;

////////////////////////////////////////
//     Clear the unit's inventory     //
////////////////////////////////////////

removeAllWeapons _unit;
//removeGoggles _unit; for profile googles
_goggles = goggles _unit;
removeVest _unit;
removeHeadgear _unit;
removeUniform _unit;
removeBackpack _unit;
removeAllAssignedItems _unit;
removeAllItems _unit;

///////////////////////

//ruck
_r = [_ruck,0,'',['',[]]] call BIS_fnc_param;
//if we have ruck array for random select
if (typeName _r == "ARRAY") then {_r = _r call BIS_fnc_selectRandom;};
if (_r != '') then {
	if (isclass (configfile >> "cfgVehicles" >> _r)) then {
		_unit addBackpack _r;
		0 = [_unit,([_ruck,1,[]] call BIS_fnc_param),'ruck'] call bgr_fnc_magsAdd;
	} else {
		["Backpack '%1' does not exist in CfgVehicles",_r] call BIS_fnc_error;
	};
};

//vest
_v = [_vest,0,'',['',[]]] call BIS_fnc_param;
//if we have vest array for random select
if (typeName _v == "ARRAY") then {_v = _v call BIS_fnc_selectRandom;};
if (_v != '') then {
	if (isclass (configfile >> "cfgWeapons" >> _v)) then {
		_unit addVest _v;
		0 = [_unit,([_vest,1,[]] call BIS_fnc_param),'vest'] call bgr_fnc_magsAdd;
	} else {
		["Vest '%1' does not exist in CfgWeapons",_v] call BIS_fnc_error;
	};
};

//uniform
_u = [_uniform,0,'',[[],'']] call BIS_fnc_param;
//if we have uniform array for random select
if (typeName _u == "ARRAY") then {_u = _u call BIS_fnc_selectRandom;};
if (_u != '') then {
	if (isclass (configfile >> "cfgWeapons" >> _u)) then {
	//if (_unit canAdd _u) then {
		_u = [_unit,_u] call bgr_fnc_setUniformSide;
		_unit adduniform _u;
		0 = [_unit,([_uniform,1,[]] call BIS_fnc_param),'uniform'] call bgr_fnc_magsAdd;
	} else {
		//["Uniform '%1' does not exist in CfgWeapons",_u] call BIS_fnc_error;
		["Uniform '%1' cant be added to %2",_u,_unit] call BIS_fnc_error;
	};
};

//weapons
_w1 = [_weaponP,0,'',['']] call BIS_fnc_param;
_w1Equip = [_weaponP,1,[],[[]]] call BIS_fnc_param;
_w2 = [_weaponS,0,'',['']] call BIS_fnc_param;
_w2Equip = [_weaponS,1,[],[[]]] call BIS_fnc_param;
_w3 = [_weaponH,0,'',['']] call BIS_fnc_param;
_w3Equip = [_weaponH,1,[],[[]]] call BIS_fnc_param;
{
	if (_x != '') then {
		if (isclass (configfile >> "cfgWeapons" >> _x)) then {
			_unit addWeapon _x;
		} else {
			["Weapon '%1' does not exist in CfgWeapons",_x] call BIS_fnc_error;
		};
	};
} forEach [_w1,_w2,_w3];

{if (_x != '') then {_unit addPrimaryWeaponItem _x}} forEach _w1Equip;
{if (_x != '') then {_unit addSecondaryWeaponItem _x}} forEach _w2Equip;
{if (_x != '') then {_unit addHandgunItem _x}} forEach _w3Equip;

_unit selectWeapon primaryWeapon _unit;

//items
// if unit have googles in his profile, save them.
if (_goggles != "") then {_unit addGoggles _goggles;};
{
	_item = _x;
	//if we have itrms array for random select (helmets, caps for example)
	if (typeName _item == "ARRAY") then {_item = _item call BIS_fnc_selectRandom;};
	if (_item != '') then {
		switch true do {
			case (isclass (configfile >> "cfgglasses" >> _item)): {
					_unit addGoggles _item;
				};
			case (getnumber (configfile >> "cfgweapons" >> _item >> "iteminfo" >> "type")==605): {
					_unit addHeadgear _item;
				};
			case (isclass (configfile >> "cfgweapons" >> _item >> "itemInfo")): {
					_unit addItem _item;
					_unit assignItem _item;
				};
			default {
					_unit addWeapon _item;
				};
		};
	};
} forEach _items;

true