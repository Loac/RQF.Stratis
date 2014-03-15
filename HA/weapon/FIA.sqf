#include "DEFAULT.sqf"
_arr=[]; _ok = true;
//13.11.13
//Our Army (FIA)

// ====================================================================================
//weapon
//вооружение

//change NVG to FlashLight
//_Nvg="acc_flashlight";

_Form = ["U_IG_Guerilla1_1","U_IG_leader"];
_FormO = "U_IG_leader";
_Vest = 'V_TacVest_camo';
_VestL = "V_TacVest_camo";
_VestSp= 'V_Chestrig_khk';
_Helm = ["H_Shemag_olive","H_Shemag_khk","H_Booniehat_dirty"];
_Cap = ['H_Cap_blk_Raven'];
_HelmC = 'H_HelmetCrew_I';
_HelmV = 'H_PilotHelmetHeli_I';
_HelmJ = 'H_PilotHelmetFighter_I';
_FormJ = "U_I_pilotCoveralls";
_Rucksack = 'B_TacticalPack_mcamo';

_Rifle = 'arifle_Mk20_plain_F';
_RifleGL = 'arifle_Mk20_GL_plain_F';
_RifleC = 'arifle_Mk20C_plain_F';
_RifleMag = '30Rnd_556x45_Stanag';
_RifleMagT = '30Rnd_556x45_Stanag_Tracer_Red';
_Optic = 'optic_Arco';
_Collim = 'optic_ACO';

_Pistol = 'hgun_P07_F';
_PistolMag = '16Rnd_9x21_Mag';

_Rpg = 'launch_RPG32_F';
_RpgGrenade = 'RPG32_F';
_RpgGrenadeA = 'RPG32_HE_F';

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