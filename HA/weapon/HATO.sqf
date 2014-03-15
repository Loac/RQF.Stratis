#include "DEFAULT.sqf"
_arr=[]; _ok = true;
//13.11.13
//Our Army (NATO)

// ====================================================================================
//weapon
//вооружение

//change NVG to FlashLight
//_Nvg="acc_flashlight";

_Form = ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest"];
_FormO = "U_B_CombatUniform_mcam_vest";
_Vest = 'V_PlateCarrier3_rgr';
_VestL = "V_PlateCarrier2_rgr";
_VestSp= 'V_Chestrig_khk';
_Helm = ['H_HelmetB_light_desert','H_HelmetB_light_grass'];
_Cap = ['H_MilCap_mcamo'];
_HelmC = 'H_HelmetCrew_I';
_HelmV = 'H_PilotHelmetHeli_B';
_HelmJ = 'H_PilotHelmetFighter_B';
_FormJ = "U_B_pilotCoveralls";
_Rucksack = 'B_TacticalPack_mcamo';

_Rifle = 'arifle_MX_F';
_RifleGL = 'arifle_MX_GL_F';
_RifleC = 'arifle_MXC_F';
_RifleMag = '30Rnd_65x39_caseless_mag';
_RifleMagT = '30Rnd_65x39_caseless_mag_Tracer';
_Optic = 'optic_Arco';
_Collim = 'optic_Holosight';

_Pistol = 'hgun_P07_F';
_PistolMag = '16Rnd_9x21_Mag';

_Rpg = 'launch_NLAW_F';
_RpgGrenade = 'NLAW_F';
_RpgGrenadeA = 'NLAW_F';

_MG = 'LMG_Mk200_F';
_MGmag = '200Rnd_65x39_cased_Box';

_SniperRifle = 'arifle_MXM_F';
_SniperOptics = 'optic_Arco';
_SniperRiflemag = '30Rnd_65x39_caseless_mag';

#include "companyHA.sqf"

///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//////////////DO NOT CHANGE AFTER THIS LINE\\\\\\\\\\\\

if (_ok) then {_arr=[_items,_weapPrim,_weapSecd,_weapHand,_uniforms,_vests,_rucks]};

_arr