#include "DEFAULT.sqf"
_arr=[]; _ok = true;
//13.11.13
//Our Army (PMC)

// ====================================================================================
//weapon
//вооружение

//change NVG to FlashLight
//_Nvg="acc_flashlight";

_Form = ["U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3"];
_FormO = "U_IG_Guerilla2_3";
_Vest = 'V_TacVest_oli';
_VestL = "V_TacVest_oli";
_VestSp= 'V_Chestrig_blk';
_Helm = ["H_Cap_headphones","H_Watchcap_blk","H_Watchcap_camo","H_Watchcap_khk","H_Cap_blk"];
_Cap = ['H_Cap_blk_ION'];
_HelmC = 'H_HelmetCrew_I';
_HelmV = 'H_PilotHelmetHeli_I';
_HelmJ = 'H_PilotHelmetFighter_I';
_FormJ = "U_I_pilotCoveralls";
_Rucksack = 'B_TacticalPack_blk';

_Rifle = 'arifle_TRG21_F';
_RifleGL = 'arifle_TRG21_GL_F';
_RifleC = 'arifle_TRG20_F';
_RifleMag = '30Rnd_556x45_Stanag';
_RifleMagT = '30Rnd_556x45_Stanag_Tracer_Red';
_Optic = 'optic_Hamr';
_Collim = 'optic_ACO';

_Pistol = 'hgun_P07_F';
_PistolMag = '16Rnd_9x21_Mag';

_Rpg = 'launch_NLAW_F';
_RpgGrenade = 'NLAW_F';
_RpgGrenadeA = 'NLAW_F';

_MG = 'LMG_Mk200_F';
_MGmag = '200Rnd_65x39_cased_Box';

_SniperRifle = 'srifle_EBR_F';
_SniperOptics = 'optic_Hamr';
_SniperRiflemag = '20Rnd_762x51_Mag';

#include "companyHA.sqf"

///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//////////////DO NOT CHANGE AFTER THIS LINE\\\\\\\\\\\\

if (_ok) then {_arr=[_items,_weapPrim,_weapSecd,_weapHand,_uniforms,_vests,_rucks]};

_arr