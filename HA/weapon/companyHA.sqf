//THIS IS NOT ARE AMMUNITION TEMPLATE!!!
//USE IT ONLY AS STRUCTURE!!!
//VARS DEFINING IS NESESSARY!!!

// ====================================================================================
//base soldier
//������� ����������
_items = [_M,_C,_W,_R];
_weapPrim = [_Rifle,[_Collim]];
_weapSecd = ['',[]];
_weapHand = ['',[]];
_uniforms = [_Form,[ 
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
//���� ������
switch _this do {
	//Company Commander
	//��� ���� / ��� ��� ����
	case "KR" : {
		_items = _items+[_Cap,_Binocular,_G];
		_weapHand = [_Pistol,[]];
		_uniforms = [_FormO, (_uniforms select 1)+[
				"G_Aviator",
				_RadioKV,
				[_PistolMag, 2]
			]];
		_vests set [0,_VestL];
	};
	//Platoon Commander
	//��� ������ / ��� ��� ������
	case "KV" : {
		_items = _items+[_Helm+_Cap,_Binocular,_G];
		_weapHand = [_Pistol,[]];
		_uniforms = [_FormO, (_uniforms select 1)+[
				_RadioKV,
				[_PistolMag, 2]
			]];	
		_vests = 
			[_VestL,(_vests select 1)+[
				[_RifleMagT, 1]
			]];
		_rucks = 
			[_Rucksack,[
				[_RifleMag, 3],
				[_RifleMagT, 3],
				[_Grenade, 2],
				[_Smokegrenade, 2],
				[_Bandage, 2],
				_Nvg
			]];
	};
	//Platoon Sniper
	//�������
	case "SN" : {
		_items = _items+[_Helm,_Binocular];
		_weapPrim = [_SniperRifle,[_SniperOptics]];
		_weapHand = [_Pistol,[]];
		_uniforms set [1, (_uniforms select 1)+[
				_RadioKV,
				[_PistolMag, 2]
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
				[_PistolMag, 2],
				[_Grenade, 2],
				[_Smokegrenade, 2],
				[_Bandage, 2],
				_Apm,
				_Nvg
			]];
	};
	//RTO
	//������
	case "R" : {
		_items = _items+[_Helm];
		_uniforms set [1, (_uniforms select 1)+[_RadioKV]];
		_vests = 
			[_Vest,(_vests select 1)+[
				[_RifleMagT, 1]
			]];
		_rucks = 
			[_Rucksack,[
				_RadioDV,
				[_Bandage, 2],
				_Nvg
			]];
	};
	//Medic
	//�������
	case "M" : {
		_items = _items+[_Helm];
		_vests = 
			[_Vest,(_vests select 1)+[
				[_RifleMag, 2],
				[_Smokegrenade, 2],
				[_Bandage, 2]
			]];
		_rucks = 
			[_Rucksack,[
				"Medikit",
				[_Smokegrenade, 2],
				[_Bandage, 10],
				_Nvg
			]];
	};
	//Squad leader
	//��� ���������
	case "KO" : {
		_items = _items+[_Helm,_Binocular,_G];
		_weapPrim = [_RifleGL,[_Collim]];
		_uniforms set [1, (_uniforms select 1)+[
				_RadioKV
			]];
		_vests = 
			[_Vest,(_vests select 1)+[
				[_GLgrenade, 2],
				[_GLsmokeRed, 3],
				[_GLsmokeGreen, 3],
				[_RifleMagT, 1]
			]];
		_rucks = 
			[_Rucksack,[
				[_MGmag, 2],
				[_GLgrenade, 14],
				[_RifleMag, 3],
				[_RifleMagT, 3],
				[_grenade, 2],
				[_smokegrenade, 2],
				[_bandage, 2],
				_Nvg
			]];
	};
	//Mashine Gunner
	//���������� 
	case "P" : {
		_items = _items+[_Helm];
		_weapPrim = [_MG,[_Collim]];
		_vests = 
			[_Vest,[
				[_MGmag, 2], 
				[_Smokegrenade, 2],
				[_Grenade, 1]
			]];
		_rucks = 
			[_Rucksack,[
				[_MGmag, 3],
				[_Grenade, 3],
				[_Smokegrenade, 2],
				[_Bandage, 2],
				_Nvg
			]];
	};
	//AR Gunner
	//���������� 
	case "A" : {
		_items = _items+[_Helm];
		_weapPrim = [_MG,[_Collim]];		
		_vests = 
			[_Vest,[
				[_MGmag, 2], 
				[_Smokegrenade, 2],
				[_Grenade, 1]
			]];
		_rucks = 
			[_Rucksack,[
				[_MGmag, 3],
				[_Grenade, 3],
				[_Smokegrenade, 2],
				[_Bandage, 2],
				_Nvg
			]];
	};
	//Team leader
	//������� �������
	case "SS" : {
		_items = _items+[_Helm,_Binocular];
		_weapPrim = [_RifleGL,[_optic]];
		_vests = 
			[_Vest,(_vests select 1)+[
				[_GLgrenade, 8],
				[_RifleMagT, 1]
			]];
		_rucks = 
			[_Rucksack,[
				[_RifleMag, 4],
				[_RifleMagT, 3],
				[_GLgrenade, 8],
				[_GLsmokeRed, 3],
				[_GLsmokeGreen, 3],
				[_Grenade, 2],
				[_Smokegrenade, 2],
				[_Bandage, 2],
				_Nvg
			]];
	};
	//AT Soldier
	//������������
	case "G" : {
		_items = _items+[_Helm];
		_weapSecd = [_RPG,[]];
		_rucks = 
			[_Rucksack,[
				[_RpgGrenade, 1],
				[_RpgGrenadeA, 1],
				[_Bandage, 2],
				_Nvg
			]];
	};
	//AT Soldier Assist.
	//�������� ������������
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
				[_RpgGrenade, 1],
				[_RpgGrenadeA, 1],
				[_Bandage, 2],
				_Nvg
			]];
	};
	//Rifleman
	//�������
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
	//Crewman
	//�������
	case "T" : {
		_items = _items+[_HelmC];
		_weapPrim = [_RifleC,[]];
		_vests = 
			[_VestL,(_vests select 1)+[
				[_Bandage, 2],
				_Nvg
			]];
	};	
	//Heli Pilot
	//����������
	case "V" : {
		_items = _items+[_HelmV,_G];
		_weapPrim = [_RifleC,[]];
		_weapHand = [_Pistol,[]];
		_uniforms set [1, (_uniforms select 1)+[
				_RadioKV,
				[_PistolMag, 2],
				_Cap
			]];
		_vests = 
			[_VestL,(_vests select 1)+[
				_RifleMagT,
				[_Bandage, 2],
				_Nvg
			]];
	};
	//Jet Pilot
	//˸����
	case "L" : {
		_items = _items+[_HelmJ,_G];
		_weapPrim = ["",[]];
		_weapHand = [_Pistol,[]];
		_uniforms = [_FormJ, (_uniforms select 1)+[
				_RadioKV,
				[_PistolMag, 2],
				_Cap
			]];
		_vests = ["",[]];
	};	
	//Seaman
	//�����
	case "SM" : {
		_items = _items+["H_Beret_blk"];
		_weapPrim = [_RifleC,[]];
		_vests = 
			[_VestL,(_vests select 1)+[
				[_Bandage, 2],
				_Nvg
			]];
	};
///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//////////////DO NOT CHANGE AFTER THIS LINE\\\\\\\\\\\\

	default {_ok = false};
};