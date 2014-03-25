#include "DEFAULT.sqf"
_arr=[]; _ok = true;
//13.11.13
//Our Army (AAF)

// ====================================================================================
//weapon
//вооружение

//change NVG to FlashLight
//_Nvg="acc_flashlight";

_Form = ["U_O_CombatUniform_ocamo"];
_FormO = "U_O_OfficerUniform_ocamo";
_Vest = 'V_HarnessO_gry';
_VestL = "V_HarnessO_gry";
_VestSp= 'V_HarnessO_gry';
_Helm = ['H_HelmetO_ocamo','H_HelmetLeaderO_ocamo'];
_Cap = ['H_MilCap_oucamo'];
_HelmC = 'H_HelmetCrew_O';
_HelmV = 'H_CrewHelmetHeli_O';
_HelmJ = 'H_PilotHelmetFighter_O';
_FormJ = "U_O_PilotCoveralls";
_Rucksack = 'B_TacticalPack_ocamo';

_Rifle = 'arifle_Katiba_F';
_RifleGL = 'arifle_Katiba_GL_F';
_RifleC = 'arifle_Katiba_C_F';
_RifleMag = '30Rnd_65x39_caseless_green';
_RifleMagT = '30Rnd_65x39_caseless_green_mag_Tracer';
_Optic = 'optic_Hamr';
_Collim = 'optic_ACO_grn';

_Pistol = 'hgun_Rook40_F';
_PistolMag = '16Rnd_9x21_Mag';

_Rpg = 'launch_RPG32_F';
_RpgGrenade = 'RPG32_F';
_RpgGrenadeA = 'RPG32_HE_F';

_MG = 'LMG_Zafir_F';
_MGmag = '150Rnd_762x51_Box';

_SniperRifle = 'srifle_DMR_01_F';
_SniperOptics = 'optic_DMS';
_SniperRiflemag = '10Rnd_762x51_Mag';

#include "companyHA.sqf"

///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//////////////DO NOT CHANGE AFTER THIS LINE\\\\\\\\\\\\

if (_ok) then {_arr=[_items,_weapPrim,_weapSecd,_weapHand,_uniforms,_vests,_rucks]};

_arr