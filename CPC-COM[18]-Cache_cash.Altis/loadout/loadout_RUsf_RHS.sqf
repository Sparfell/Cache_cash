/*-----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
***	Author: Hardballer

***	Description : 
	Loadouts de la mission

*** Utilisation :
	1/ Copiez les fichiers 'loadout.sqf', 'initPlayerLocal.sqf' et 'inventory_briefing.sqf' dans le dossier de votre mission.
	2/ Modifiez le fichier loadout.sqf à votre convenance.
		- Vous pouvez creer vos loadouts dans l'arsenal virtuel de Arma 3, les exporter avec la commande ingame et les coller dans le script comme ci-dessous.
		- Une fois ceci fait, remplacez tout les 'this' par '_unit'.
	3/ Dans l'éditeur, placez la commande ci-dessous dans les init d'unités jouables pour leur attribuer le loadout souhaité :
		this setVariable ["loadout", "cc_sl"];
		
	PS :Dans l'exemple ci-dessous les lignes des commentaires issues de l'exportation avec l'arsenal vitruel ont été supprimées pour une meilleure lisibilité.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/
private ["_rhsennemy","_uniform","_helmet","_nvg","_lamp","_face","_weapon","_weapon_npz","_uniform2"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,100,106]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_uniform = "";
	_helmet = [];
	_face = [];
	_weapon = [];
	_weapon_npz = [];
	_uniform2 = "";

	//WDL
	if (worldName in ["Altis","chernarus","Chernarus","Sara","FDF_Isle1_a","Woodland_ACR","noe","eden"]) then 
	{
		_uniform = ["rhs_uniform_gorka_r_g","rhs_uniform_gorka_r_y"];
		_helmet = [""];
		_face = ["rhs_balaclava","rhs_balaclava1_olive"];
		_weapon_npz = ["rhs_weap_ak74m_camo_npz","rhs_weap_ak74m_2mag_npz","rhs_weap_ak74m_npz"];
		_weapon = ["rhs_weap_ak74m_2mag_camo","rhs_weap_ak74m_2mag","rhs_weap_ak74m"];
		_uniform2 = "U_I_FullGhillie_lsh";
	};
	//DES
	if (worldName in ["takistan","IslaDuala3","pja307"]) then 
	{
		_uniform = ["rhs_uniform_emr_des_patchless"];
		_helmet = ["H_Booniehat_tan","H_Booniehat_oli","H_Cap_oli","rhsusf_opscore_fg","rhsusf_opscore_ut","rhsusf_opscore_fg_pelt","rhsusf_opscore_ut_pelt"];
		_face = ["CUP_TK_NeckScarf","CUP_FR_NeckScarf","CUP_FR_NeckScarf2","G_Bandanna_tan","G_Bandanna_khk","",""];
		_weapon_npz = ["rhs_weap_ak74m_desert_npz","rhs_weap_ak74m_desert_npz","rhs_weap_ak74m_2mag_npz"];
		_weapon = ["rhs_weap_ak74m_2mag","rhs_weap_ak74m","rhs_weap_ak74m_desert","rhs_weap_ak74m_desert"];
		_uniform2 = "U_B_FullGhillie_sard";
	};
	//jungle
	if (worldName in ["Tanoa","pja305"]) then 
	{
		_uniform = ["rhs_uniform_emr_patchless"];
		_helmet = ["CUP_H_RUS_Bandana_HS","H_Booniehat_oli","CUP_H_FR_Headband_Headset","H_Cap_headphones","H_Cap_oli","H_Bandanna_khk_hs","H_Bandanna_camo","H_Bandanna_khk"];
		_face = [""];
		_weapon_npz = ["rhs_weap_ak74m_camo_npz","rhs_weap_ak74m_camo_npz","rhs_weap_ak74m_2mag_npz","rhs_weap_ak74m_npz"];
		_weapon = ["rhs_weap_ak74m_2mag_camo","rhs_weap_ak74m_2mag","rhs_weap_ak74m","rhs_weap_ak74m_camo"];
		_uniform2 = "U_B_T_FullGhillie_tna_F";
	};
	if ((paramsArray select 3) == 1) then {_nvg = true};
	if ((paramsArray select 3) == 2) then {_lamp = true};
	
	switch _loadout do 
	{
		case "cc_off": {[_unit] call loadoutCC_OFF}; // 1
		case "cc_tl": {[_unit] call loadoutCC_TL}; // 2
		case "cc_doc": {[_unit] call loadoutCC_DOC}; //3
		case "cc_ar": {[_unit] call loadoutCC_AR}; //4
		case "cc_aar": {[_unit] call loadoutCC_AAR}; //5
		case "cc_mg": {[_unit] call loadoutCC_MG}; //6
		case "cc_amg": {[_unit] call loadoutCC_AMG}; //7
		case "cc_at": {[_unit] call loadoutCC_AT}; //8
		case "cc_aat": {[_unit] call loadoutCC_AAT}; //9
		case "cc_demo": {[_unit] call loadoutCC_DEMO}; //10
		case "cc_m": {[_unit] call loadoutCC_M}; //11
		case "cc_gl": {[_unit] call loadoutCC_GL}; //12
		case "cc_a": {[_unit] call loadoutCC_A}; //13
		case "cc_lat": {[_unit] call loadoutCC_LAT}; //14
		case "cc_r": {[_unit] call loadoutCC_R}; //15
		case "cc_crew": {[_unit] call loadoutCC_CREW}; //16
		case "cc_pilot": {[_unit] call loadoutCC_PILOT}; //17
		case "cc_sniper": {[_unit] call loadoutCC_SNIPER}; //18
		case "cc_obs": {[_unit] call loadoutCC_OBS}; //19
		case "cc_jtac": {[_unit] call loadoutCC_JTAC}; //20
	};
};



loadoutCC_OFF = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addVest "rhs_6sh92_digi_radio";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_microDAGR";
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellPurple";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_green";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_TL = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "rhs_mag_rgo";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addVest "rhs_6sh92_digi_radio";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_green";};
	_unit addBackpack "rhs_assault_umbts";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rgo";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Green";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellPurple";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon_npz);
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "optic_Arco_blk_F";
	_unit addWeapon "rhs_pdu4";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_rpg26";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_RPG18";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_DOC = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addBackpack "rhs_assault_umbts";
	_unit addItemToBackpack "ACE_personalAidKit";
	for "_i" from 1 to 20 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 20 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_quikclot";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV_250";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_salineIV_500";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV";};
	for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_morphine";};
	for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_epinephrine";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_tourniquet";};
	_unit addItemToBackpack "ACE_surgicalKit";
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_AR = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_100Rnd_762x54mmR";};
	_unit addBackpack "rhs_assault_umbts";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pkp";
	_unit addPrimaryWeaponItem "rhs_acc_1p29";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_AAR = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addBackpack "B_Carryall_oli";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon_npz);
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "CUP_optic_MRad";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_MG = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_100Rnd_762x54mmR";};
	_unit addBackpack "rhs_assault_umbts";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pkp";
	_unit addPrimaryWeaponItem "rhs_acc_1p29";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_AMG = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addBackpack "B_Carryall_oli";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon_npz);
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "optic_Arco_blk_F";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_AT = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon_npz);
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "rhs_acc_rakursPM";
	_unit addWeapon "rhs_pdu4";
	if (_rhsennemy) then {
		_unit addWeapon "rhs_weap_rpg7";
		_unit addSecondaryWeaponItem "rhs_acc_pgo7v";
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_OG7V_mag";};
	};
	if (!_rhsennemy) then {
		_unit addWeapon "CUP_launch_RPG7V";
		_unit addSecondaryWeaponItem "CUP_optic_PGO7V3";
		_unit addBackpack "CUP_B_RPGPack_Khaki";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_PG7VM_M";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_OG7_M";};
	};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_AAT = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	if (_rhsennemy) then {
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_OG7V_mag";};
	};
	if (!_rhsennemy) then {
		_unit addBackpack "CUP_B_RPGPack_Khaki";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_PG7VL_M";};
	};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon_npz);
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "optic_Holosight_blk_F";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_DEMO = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addBackpack "rhs_assault_umbts_engineer_empty";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "rhs_acc_ekp1";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_M = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	_unit addItemToVest "ACE_Kestrel4500";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_RangeCard";
	for "_i" from 1 to 14 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_svds";
	_unit addPrimaryWeaponItem "rhs_acc_tgpv";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m2";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_GL = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi_vog";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 12 do {_unit addItemToVest "rhs_VOG25";};
	_unit addBackpack "B_FieldPack_oli";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_VG40TB";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_GRD40_Red";};
	for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_GDM40";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_VG40OP_white";};
	for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_VOG25P";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m_gp25_npz";
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	_unit addPrimaryWeaponItem "optic_Arco_blk_F";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_A = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addBackpack "B_Carryall_oli";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_rgo";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Green";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon_npz);
	_unit addPrimaryWeaponItem "CUP_optic_LeupoldMk4_CQ_T";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "rhs_acc_pkas";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_LAT = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "rhs_acc_pkas";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_rpg26";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_RPG18";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_R = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon_npz);
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "rhs_acc_rakursPM";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_CREW = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addHeadgear "rhs_tsh4_bala";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_aks74u";
	_unit addPrimaryWeaponItem "rhs_acc_pgs64_74u";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_PILOT = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform "rhs_uniform_df15_tan";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "O_IR_Grenade";
	_unit addVest "rhs_vest_commander";
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_9x19_17";};
	_unit addHeadgear "rhs_zsh7a_mike";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pya";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform _uniform2;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_ATragMX";
	_unit addItemToUniform "ACE_RangeCard";
	for "_i" from 1 to 3 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addItemToUniform "rhs_mag_rgo";
	_unit addItemToUniform "SmokeShell";
	_unit addVest "V_Chestrig_rgr";
	for "_i" from 1 to 6 do {_unit addItemToVest "5Rnd_127x108_Mag";};
	_unit addGoggles "G_Balaclava_oli";

	comment "Add weapons";
	_unit addWeapon "srifle_GM6_F";
	_unit addPrimaryWeaponItem "CUP_optic_Leupold_VX3";
	_unit addWeapon "hgun_Rook40_F";
	_unit addHandgunItem "muzzle_snds_L";
	_unit addWeapon "rhs_pdu4";
	_unit additemtoVest "CUP_optic_AN_PVS_4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform _uniform2;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_ATragMX";
	_unit addItemToUniform "ACE_RangeCard";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_Chestrig_rgr";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addBackpack "B_FieldPack_oli";
	_unit addItemToBackpack "ACE_Tripod";
	_unit addItemToBackpack "ACE_SpottingScope";
	_unit addGoggles "G_Balaclava_oli";

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon_npz);
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	_unit addPrimaryWeaponItem "rhs_acc_perst1ik";
	_unit addPrimaryWeaponItem "optic_Arco_blk_F";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "NVGoggles_OPFOR";};
};

loadoutCC_JTAC = //
{
	_unit = _this select 0;
	
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addVest "rhs_6sh92_digi";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_microDAGR";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellGreen";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellPurple";};
	_unit addBackpack "rhs_assault_umbts";
	_unit addItemToBackpack "ACRE_PRC117F";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_nspn_green";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addGoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon_npz);
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "rhs_acc_rakursPM";
	_unit addWeapon "Laserdesignator";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};
