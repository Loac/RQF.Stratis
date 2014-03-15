/*
Created by Vadim Shchemelinin aka badger 
2013 St.Petersburg Russia

Script for www.Our-Army.su

Function for unarm unit (just uniform) and saving his profession

Example of using #1:
Text for unit init line:
[this] call bgr_fnc_ammoClear;

Example of using #2:
Text for unit init line:
["HA","S",this] call bgr_fnc_ammoClear;
*/
private ["_unitParId","_unit","_file","_type"];

_unitParId = (count _this)-1;
_unit = [_this,_unitParId,objnull,[objnull]] call BIS_fnc_param;

if ((count _this)>1) then {
	_file = [_this,0,'',['']] call BIS_fnc_param;
	_type = [_this,1,'',['']] call BIS_fnc_param;
	
	//save loadout info
	_unit setVariable ["bgrWeaponTemplate",[_file,_type]];
};

if !(local _unit) exitwith {["%1 is not local.",_unit] call BIS_fnc_error; false};

removeAllWeapons _unit; 
removeVest _unit; 
removeHeadgear _unit; 
removeBackpack _unit; 

true