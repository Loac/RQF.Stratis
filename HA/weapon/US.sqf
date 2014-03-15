#include "DEFAULT.sqf"
_arr=[]; _ok = true;
//15.09.13
//US Army (NATO)

// ====================================================================================
//weapon
//вооружение
_Form = 'U_B_CombatUniform_mcam';
_FormS = 'U_B_CombatUniform_mcam_tshirt';
_Vest = 'V_PlateCarrierGL_rgr';
_VestSp= 'V_TacVest_oli';
_Helm = 'H_HelmetIA';
_Cap = 'H_MilCap_dgtl';
_Bandana = 'H_BandMask_khk';
_Rucksack = 'B_TacticalPack_oli';

_Rifle = 'arifle_MX_Holo_pointer_F';
_RifleM = 'arifle_MXM_Hamr_pointer_F';
_RifleRCO = 'arifle_MX_Hamr_pointer_F';
_RifleGL = 'arifle_MX_GL_F';
_RifleACOGL = 'arifle_MX_GL_Hamr_pointer_F';
_Optic = 'optic_Aco';
_OpticH = 'optic_Holosight';
_ARifle = 'LMG_Mk200_F';
_ARifleRCO = 'LMG_Mk200_MRCO_F';
_SNRifle = 'srifle_LRR_F';
_SNRifleSOS = 'srifle_LRR_SOS_F';
_SniperOptics = 'optic_SOS';
_RifleS = 'arifle_MXC_Holo_pointer_snds_F';

_Pistol = 'hgun_ACPC2_F';
_PistolMag = '9Rnd_45ACP_Mag';

_RifleMag = '30Rnd_65x39_caseless_mag';
_RifleMagT = '30Rnd_65x39_caseless_mag_Tracer';
_SNRifleMag = '7Rnd_408_Mag';
_ARifleMag = '200Rnd_65x39_cased_Box';
_ARifleMagT = '200Rnd_65x39_cased_Box_Tracer';

_Rpg = 'launch_NLAW_F';
_RpgGrenade = 'NLAW_F';
_RpgS = 'launch_B_Titan_short_F';
_RpgSMagF = 'Titan_AP';
_RpgSMagT = 'Titan_AT';

// ====================================================================================
//base soldier
//базовое снаряжение
_items = [_M,_C,_W,_R];
_weapPrim = [_Rifle,[_OpticH]];
_weapSecd = ['',[]];
_weapHand = ['',[]];
_uniforms = [[_Form,_FormS],[ 
				_Bandage,
				_LightGreen
			]];
_vests = [_Vest,[
				[_RifleMag, 4],
				[_Smokegrenade, 2],
				[_Grenade, 2]
			]];
_rucks = ['',[]];

// ====================================================================================
//soldiers types
//типы бойцов
switch _this do {
	//Company Commander
	//ком роты / зам ком роты
	case "KR" : {
		_items = _items+[_Cap,_Binocular,_G];
		_weapHand = [_Pistol,[]];
		_uniforms set [1, (_uniforms select 1)+[
				_RadioKV,
				[_PistolMag, 2]
			]];
	};
	//Platoon Commander
	//ком взвода / зам ком взвода
	case "KV" : {
		_items = _items+[_Helm,_Binocular,_G];
		_weapHand = [_Pistol,[]];
		_uniforms set [1, (_uniforms select 1)+[
				_RadioKV,
				[_PistolMag, 2]
			]];
		_vests = 
			[_Vest,(_vests select 1)+[
				[_RifleMagT, 2]
			]];
		_rucks = 
			[_Rucksack,[
				[_RifleMag, 4],
				[_RifleMagT, 2],
				[_Grenade, 2],
				[_Smokegrenade, 2],
				[_Bandage, 2],
				_Nvg
			]];
	};
	//Platoon Sniper
	//снайпер
	case "SN" : {
		_items = _items+[_Helm,_Binocular];
		_weapPrim = [_SNRifle,[_SniperOptics]];
		_weapHand = [_PistolN,[]];
		_uniforms set [1, (_uniforms select 1)+[
				_RadioKV,
				[_PistolMag, 2]
			]];
		_vests = 
			[_Vest,[
				[_Smokegrenade, 2],
				[_SNRifleMag, 6],
				[_Grenade, 2]
			]];
		_rucks = 
			[_Rucksack,[
				[_SNRifleMag, 4],
				[_PistolMag, 2],
				[_Grenade, 2],
				[_Smokegrenade, 2],
				[_Bandage, 2],
				_Apm,
				_Nvg
			]];
	};
	//RTO
	//радист
	case "R" : {
		_items = _items+[_Helm];
		_uniforms set [1, (_uniforms select 1)+[
				_RadioKV
			]];		
		_vests = 
			[_Vest,(_vests select 1)+[
				[_RifleMagT, 2]
			]];
		_rucks = 
			[_Rucksack,[
				_RadioDV,
				[_Bandage, 2],
				_Nvg
			]];
	};
	//Medic
	//санитар
	case "M" : {
		_items = _items+[_Helm];
		_vests = 
			[_Vest,(_vests select 1)+[
				[_RifleMag, 2],
				[_Smokegrenade, 2],
				[_Bandage, 4]
			]];
		_rucks = 
			[_Rucksack,[
				[_Smokegrenade, 2],
				[_Bandage, 7],
				_Nvg
			]];
	};
	//Squad leader
	//ком отделения
	case "KO" : {
		_items = _items+[_Helm,_Binocular,_G];
		_weapPrim = [_RifleACOGL,[_Optic]];
		_uniforms set [1, (_uniforms select 1)+[
				_RadioKV
			]];
		_vests = 
			[_Vest,(_vests select 1)+[
				[_GLgrenade, 2],
				[_GLsmokeRed, 3],
				[_GLsmokeP, 3],
				[_RifleMagT, 2]
			]];
		_rucks = 
			[_Rucksack,[
				[_GLgrenade, 14],
				[_RifleMag, 4],
				[_RifleMagT, 2],
				[_grenade, 2],
				[_smokegrenade, 2],
				[_bandage, 2],
				_Nvg
			]];
	};
	//AR Gunner
	//Автоматчик 
	case "A" : {
		_items = _items+[_Helm];
		_weapPrim = [_ARifle,[]];		
		_vests = 
			[_Vest,[
				[_ARifleMag, 2], 
				[_Smokegrenade, 2],
				[_Grenade, 2]
			]];
		_rucks = 
			[_Rucksack,[
				[_ARifleMag, 3],
				[_Grenade, 2],
				[_Smokegrenade, 2],
				[_Bandage, 2],
				_Nvg
			]];
	};
	//Team leader
	//старший стрелок
	case "FTL" : {
		_items = _items+[_Helm,_Binocular];
		_weapPrim = [_RifleACOGL,[_Optic]];
		_vests = 
			[_Vest,(_vests select 1)+[
				[_GLgrenade, 8],
				[_RifleMagT, 2]
			]];
		_rucks = 
			[_Rucksack,[
				[_GL, 14],
				[_RifleMag, 4],
				[_RifleMagT, 2],
				[_GLgrenade, 8],
				[_GLsmokeRed, 3],
				[_GLsmokeGP, 3],
				[_Grenade, 2],
				[_Smokegrenade, 2],
				[_Bandage, 2],
				_Nvg
			]];
	};
	//AT Soldier
	//гранатомётчик
	case "G" : {
		_items = _items+[_Helm];
		_weapPrim = [_Rifle,[_Optic]];
		_weapSecd = [_Rpg,[]];
		_rucks = 
			[_Rucksack,[
				[_RpgGrenade, 2],
				[_Bandage, 2],
				_Nvg
			]];
	};
	//AT Soldier Assist.
	//помошник гранатомётчик
	case "PG" : {
		_items = _items+[_Helm];
		_vests = 
			[_Vest,(_vests select 1)+[
				[_RifleMagT, 2]
			]];
		_rucks = 
			[_Rucksack,[
				[_RifleMag, 2],
				[_Smokegrenade, 2],
				[_RpgGrenade, 2],
				[_Bandage, 2],
				_Nvg
			]];
	};
	//Rifleman
	//стрелок
	case "S" : {
		_items = _items+[_Helm];
		_vests = 
			[_Vest,(_vests select 1)+[
				_RifleMag,
				[_RifleMagT, 2]
			]];
		_rucks = 
			[_Rucksack,[
				[_RifleMag, 5],
				[_RifleMagT, 2],
				[_Grenade, 2],
				[_Smokegrenade, 2],
				[_Bandage, 2],
				_Nvg
			]];
	};
	//Marksman
	//Марксмен
	case "MA" : {
		_items = _items+[_Helm];
		_weapPrim = [_RifleM,[_Optic]];
		_vests = 
			[_Vest,(_vests select 1)+[
				_RifleMag,
				[_RifleMagT, 2]
			]];
		_rucks = 
			[_Rucksack,[
				[_RifleMag, 5],
				[_RifleMagT, 2],
				[_Grenade, 2],
				[_Smokegrenade, 2],
				[_Bandage, 2],
				_Nvg
			]];
	};	
	//SpecOp Com
	//Ком. спецназа
	case "SK" : {
		_items = _items+[_Cap,_Binocular,_G];
		_weapPrim = [_RifleS,[_Optic]];
		_uniforms set [1, (_uniforms select 1)+[
				[_Smokegrenade, 2]
			]];
		_vests = 
			[_VestSp,[
				[_Smokegrenade, 2],
				[_RifleMag, 5],
				[_RifleMagT, 2],
				[_Grenade, 2]
			]];
		_rucks = 
			[_Rucksack,[
				[_RifleMag, 5],
				[_RifleMagT, 2],
				[_Smokegrenade, 2],
				[_Apm, 4],
				[_Pipe, 2],
				[_Bandage, 2],
				_Nvg
			]];
	};
///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//////////////DO NOT CHANGE AFTER THIS LINE\\\\\\\\\\\\

	default {_ok = false};
};
if (_ok) then {_arr=[_items,_weapPrim,_weapSecd,_weapHand,_uniforms,_vests,_rucks]};

_arr