//Adding some standart classnames
#include "DEFAULT.sqf"
_arr=[]; _ok = true;

// ====================================================================================
//Additional weapon classnames
_SniperRifle = 'srifle_EBR_F';
_SniperOptics = 'optic_SOS';
_SniperRiflemag = '20Rnd_762x51_Mag';
_FormO = 'U_I_OfficerUniform';

// ====================================================================================
//base soldier
//базовое снаряжение
_items = [_M,_C,_W,_R];
_weapPrim = ["arifle_Katiba_F",[]];
_weapSecd = ['',[]];
_weapHand = ['',[]];
_uniforms = ["U_I_CombatUniform",[ 
				_Bandage,
				_LightGreen
			]];
_vests = [_Vest,[
				["30Rnd_65x39_caseless_green", 4],
				[_Smokegrenade, 2],
				[_Grenade, 2]
			]];
_rucks = ['',[]];
// ====================================================================================
//////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//////////////DO NOT CHANGE AFTER THIS LINE\\\\\\\\\\\\

switch _this do {
/////////////DO NOT CHANGE BEFORE THIS LINE////////////
///////////////////////////////////////////////////////
// ====================================================================================
//Types of soldiers
	//soldiers equipment type 1
	case "S1" : {	//CODE FOR UNIT LINE ["EXAMPLE","S1",this] call bgr_fnc_ammoLoad;
		_items = _items+["H_HelmetIA",_Binocular,_Nvg];
		_weapPrim = [_SniperRifle,[_SniperOptics]];
		_weapHand = ["hgun_ACPC2_F",[]];
		_uniforms = 
			[_Form,(_uniforms select 1)+[
				_RadioKV,
				["9Rnd_45ACP_Mag", 2]
			]];
		_vests = 
			[_Vest,[
				[_Smokegrenade, 2],
				[_SniperRiflemag, 6],
				[_Grenade, 2]
			]];
		_rucks = 
			[_Rucksack,[
				[_SniperRiflemag, 4],
				["9Rnd_45ACP_Mag", 2],
				[_Grenade, 2],
				[_Smokegrenade, 2],
				[_Bandage, 2],
				_Apm
			]];
	};
	//soldiers equipment type 2
	case "S2" : {	//CODE FOR UNIT LINE ["EXAMPLE","S2",this] call bgr_fnc_ammoLoad;
		_items = _items+["H_HelmetIA",_Binocular];
		_weapHand = ["hgun_ACPC2_F",[]];
		_uniforms = 
			[_FormO,(_uniforms select 1)+[
				_RadioKV,
				["9Rnd_45ACP_Mag", 2]
			]];
	};
	
///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//////////////DO NOT CHANGE AFTER THIS LINE\\\\\\\\\\\\

	default {_ok = false};
};
if (_ok) then {_arr=[_items,_weapPrim,_weapSecd,_weapHand,_uniforms,_vests,_rucks]};

_arr