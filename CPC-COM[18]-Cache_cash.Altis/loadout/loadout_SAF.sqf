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
private ["_rhsennemy","_nvg","_lamp","_helmet","_wdl"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	_nvg = false;
	_lamp = false;
	_wdl = false;
	if ((paramsArray select 6) in [0,2,14,17,18,19,100,106,108,109]) then {_rhsennemy = true};
	if ((paramsArray select 3) == 1) then {_nvg = true};
	if ((paramsArray select 3) == 2) then {_lamp = true};
	_helmet = [];
	//WDL
	if (CPC_MAP in ["altis","tanoa","chernarus","chernarus_summer","sara","fdf_isle1_a","woodland_acr","pja305","noe","eden"]) then 
	{
		_helmet = [];
		_wdl = true;
	};
	//DES
	if (CPC_MAP in ["takistan","isladuala3","pja307"]) then 
	{
		_helmet = [];
	};
	
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "rhssaf_mag_br_m84";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellPurple";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_White";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21_t";};
	_unit addHeadgear "rhssaf_beret_green";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m21s_pr";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_DAGR";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21";};
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21_t";};
	if (_wdl) then {_unit addBackpack "rhssaf_kitbag_digital";} else {_unit addBackpack "rhssaf_kitbag_smb";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellPurple";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_HandFlare_Green";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsgref_30rnd_556x45_m21";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsgref_30rnd_556x45_m21_t";};
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m21a_pr";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_m80";} else {_unit addWeapon "CUP_launch_M72A6";};
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21";};
	if (_wdl) then {_unit addBackpack "rhssaf_kitbag_digital";} else {_unit addBackpack "rhssaf_kitbag_smb";};
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
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m21a";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	_unit addVest "rhssaf_vest_md98_md2camo";
	if (_wdl) then {_unit addBackpack "rhssaf_kitbag_digital";} else {_unit addBackpack "rhssaf_kitbag_smb";};
	for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_minimi_para_railed";
	_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";_unit addPrimaryWeaponItem "rhs_acc_2dpZenit_ris";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit_ris";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21";};
	if (_wdl) then {_unit addBackpack "rhssaf_kitbag_digital";} else {_unit addBackpack "rhssaf_kitbag_smb";};
	for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m21a";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	_unit addVest "rhssaf_vest_md98_md2camo";
	if (_wdl) then {_unit addBackpack "rhssaf_kitbag_digital";} else {_unit addBackpack "rhssaf_kitbag_smb";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m84";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21";};
	if (_wdl) then {_unit addBackpack "rhssaf_kitbag_digital";} else {_unit addBackpack "rhssaf_kitbag_smb";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m21a";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21";};
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m21a";
	if (_rhsennemy) then {
		_unit addWeapon "rhs_weap_rpg7";
		_unit addSecondaryWeaponItem "rhs_acc_pgo7v3";
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7V_mag";};
	} else {
		_unit addBackpack "CUP_B_RPGPack_Khaki";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_PG7VL_M";};
		_unit addWeapon "CUP_launch_RPG7V";
		_unit addSecondaryWeaponItem "CUP_optic_PGO7V3";
		_unit addItemToBackpack "CUP_PG7VL_M";
	};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21";};
	if (_rhsennemy) then {
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_OG7V_mag";};
	} else {
		_unit addBackpack "CUP_B_RPGPack_Khaki";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_PG7VM_M";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_OG7_M";};
	};
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m21a";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21";};
	if (_wdl) then {_unit addBackpack "rhssaf_kitbag_digital";} else {_unit addBackpack "rhssaf_kitbag_smb";};
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_M26_Clacker";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m21s";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	for "_i" from 1 to 12 do {_unit addItemToVest "rhsgref_10Rnd_792x57_m76";};
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m76";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m2";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	_unit addItemToUniform "rhsgref_30rnd_556x45_m21";
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21";};
	for "_i" from 1 to 9 do {_unit addItemToVest "rhs_VOG25";};
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m21a_pbg40";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21";};
	if (_wdl) then {_unit addBackpack "rhssaf_kitbag_digital";} else {_unit addBackpack "rhssaf_kitbag_smb";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhssaf_mag_br_m84";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_White";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "rhsgref_30rnd_556x45_m21";};
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m21a_pr";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21";};
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m21a";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_m80";} else {_unit addWeapon "CUP_launch_M72A6";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21";};
	if (_wdl) then {_unit addHeadgear "rhssaf_helmet_m97_digital";} else {_unit addHeadgear "rhssaf_helmet_m97_olive_nocamo";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m21a";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_DAGR";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addHeadgear "rhs_tsh4";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m92";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_microDAGR";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addHeadgear "rhssaf_helmet_hgu56p";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m92";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "rhsusf_ANPVS_15";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital_summer";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_ATragMX";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	_unit addItemToUniform "rhs_mag_9x19_17";
	if (_wdl) then {_unit addVest "rhssaf_vest_md99_digital_rifleman";} else {_unit addVest "rhssaf_vest_md99_woodland_rifleman";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_9x19_17";};
	for "_i" from 1 to 7 do {_unit addItemToVest "rhsusf_10Rnd_762x51_m118_special_Mag";};
	for "_i" from 1 to 7 do {_unit addItemToVest "rhsusf_10Rnd_762x51_m993_Mag";};
	_unit addBackpack "rhssaf_kitbag_md2camo";
	_unit additemtobackpack "rhsusf_acc_premier_anpvs27";
	_unit additemtobackpack "rhsusf_acc_anpeq15side_bk";
	if (_wdl) then {_unit addHeadgear "rhssaf_booniehat_digital";} else {_unit addHeadgear "H_Booniehat_khk";};
	if (_wdl) then {_unit addGoggles "G_Bandanna_khk";} else {_unit addGoggles "G_Bandanna_tan";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m40a5";
	_unit addPrimaryWeaponItem "rhsusf_acc_M8541_low";
	_unit addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
	_unit addWeapon "rhs_weap_pya";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "CUP_NVG_PVS7";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital_summer";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_ATragMX";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhssaf_mag_br_m84";};
	_unit addItemToUniform "rhs_mag_9x19_17";
	if (_wdl) then {_unit addVest "rhssaf_vest_md99_digital_rifleman";} else {_unit addVest "rhssaf_vest_md99_woodland_rifleman";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_9x19_17";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 9 do {_unit addItemToVest "rhssaf_30rnd_556x45_MDIM_G36";};
	_unit addBackpack "rhssaf_kitbag_md2camo";
	_unit addItemToBackpack "ACE_SpottingScope";
	_unit addItemToBackpack "ACE_Tripod";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	if (_wdl) then {_unit addHeadgear "rhssaf_booniehat_digital";} else {_unit addHeadgear "H_Booniehat_khk";};
	if (_wdl) then {_unit addGoggles "G_Bandanna_khk";} else {_unit addGoggles "G_Bandanna_tan";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_g36c_grip3";
	_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
	_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
	_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
	_unit addWeapon "rhs_weap_pya";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "CUP_NVG_PVS7";};
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
	if (_wdl) then {_unit forceAddUniform "rhssaf_uniform_m10_digital";} else {_unit forceAddUniform "rhssaf_uniform_m10_digital_desert"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "rhssaf_mag_br_m84";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Green";};
	if (_wdl) then {_unit addVest "rhssaf_vest_md12_digital";} else {_unit addVest "rhssaf_vest_md12_digital_desert";};
	for "_i" from 1 to 6 do {_unit addItemToVest "rhsgref_30rnd_556x45_m21_t";};
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_GRD40_Red";};
	if (_wdl) then {_unit addBackpack "rhssaf_kitbag_digital";} else {_unit addBackpack "rhssaf_kitbag_smb";};
	_unit addItemToBackpack "ACRE_PRC117F";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_GRD40_Red";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_VG40OP_green";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_VG40OP_red";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
	if (_wdl) then {_unit addHeadgear "rhssaf_booniehat_digital";} else {_unit addHeadgear "H_Booniehat_khk";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m21a_pr_pbg40";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";
	_unit addWeapon "Laserdesignator";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "CUP_NVG_PVS7";};
};