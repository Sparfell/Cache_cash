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
private ["_rhsennemy","_uniform","_helmet","_nvg","_lamp"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,100,106]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_uniform = ["CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo"];
	_helmet = [];
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
	_unit forceAddUniform "CUP_U_O_TK_Officer";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_DAGR";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addVest "CUP_V_O_TK_OfficerBelt2";
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
	_unit addHeadgear "CUP_H_TK_Beret";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKS74U";
	_unit addWeapon "CUP_hgun_Makarov";
	_unit addWeapon "Binocular";
	_unit addItemToVest "CUP_30Rnd_545x39_AK_M";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addVest "CUP_V_O_TK_Vest_1";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_MapTools";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_20Rnd_762x51_FNFAL_M";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
	_unit addBackpack "CUP_B_AlicePack_Khaki";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_rpg26";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_RPG18";};
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_FNFAL";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_TK_Vest_2";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_20Rnd_762x51_FNFAL_M";};
	_unit addBackpack "CUP_B_AlicePack_Khaki";
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
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_FNFAL";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_TK_Vest_1";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_RPK74_45";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
	_unit addItemToVest "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_TK_Vest_2";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_20Rnd_762x51_FNFAL_M";};
	_unit addBackpack "CUP_B_CivPack_WDL";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_FNFAL";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_Ins_Carrier_Rig_MG";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pkm";
	_unit addItemToVest "rhs_100Rnd_762x54mmR_green";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_TK_Vest_2";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_20Rnd_762x51_FNFAL_M";};
	_unit addBackpack "CUP_B_CivPack_WDL";
	for "_i" from 1 to 5 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_FNFAL";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_TK_Vest_2";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_20Rnd_762x51_FNFAL_M";};
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_FNFAL";
	if (_rhsennemy) then {
		_unit addWeapon "rhs_weap_rpg7";
		_unit addSecondaryWeaponItem "rhs_acc_pgo7v3";
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
	};
	if (!_rhsennemy) then {
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
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_TK_Vest_2";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_20Rnd_762x51_FNFAL_M";};
	if (_rhsennemy) then {
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_OG7V_mag";};
	};
	if (!_rhsennemy) then {
		_unit addBackpack "CUP_B_RPGPack_Khaki";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_PG7VM_M";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_OG7_M";};
	};
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_FNFAL";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_TK_Vest_2";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_20Rnd_762x51_FNFAL_M";};
	_unit addBackpack "CUP_B_AlicePack_Khaki";
	_unit addItemToBackpack "ACE_Clacker";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_DefusalKit";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "CUP_PipeBomb_M";};
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_FNFAL";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_TK_Vest_1";
	for "_i" from 1 to 12 do {_unit addItemToVest "CUP_20Rnd_762x51_FNFAL_M";};
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_FNFAL_railed";
	_unit addPrimaryWeaponItem "CUP_optic_LeupoldM3LR";
	_unit addWeapon "ACE_Yardage450";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_TK_Vest_1";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 16 do {_unit addItemToVest "CUP_1Rnd_HE_M203";};
	for "_i" from 1 to 4 do {_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_FlareGreen_M203";};
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M16A2_GL";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_TK_Vest_2";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_20Rnd_762x51_FNFAL_M";};
	_unit addBackpack "CUP_B_CivPack_WDL";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "CUP_20Rnd_762x51_FNFAL_M";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "CUP_HandGrenade_RGD5";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Red";};
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_FNFAL";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_TK_Vest_1";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_20Rnd_762x51_FNFAL_M";};
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_FNFAL";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_rpg26";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_RPG18";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_TK_Vest_1";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_20Rnd_762x51_FNFAL_M";};
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_FNFAL";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_8Rnd_9x18_Makarov_M";};
	_unit addVest "CUP_V_O_TK_CrewBelt";
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
	_unit addHeadgear "CUP_H_TK_TankerHelmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKS74U";
	_unit addWeapon "CUP_hgun_Makarov";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_8Rnd_9x18_Makarov_M";};
	_unit addVest "CUP_V_O_TK_OfficerBelt";
	_unit addItemToVest "ACE_DAGR";
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
	_unit addHeadgear "CUP_H_TK_PilotHelmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKS74U";
	_unit addWeapon "CUP_hgun_Makarov";
	_unit addWeapon "Binocular";
	_unit addItemToVest "CUP_30Rnd_545x39_AK_M";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform "CUP_U_O_TK_Ghillie_Top";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest "CUP_V_B_GER_Carrier_Rig_3_Brown";
	for "_i" from 1 to 16 do {_unit addItemToVest "CUP_10Rnd_762x54_SVD_M";};
	_unit addGoggles "G_Bandanna_tan";

	comment "Add weapons";
	_unit addWeapon "CUP_srifle_SVD_des";
	_unit addPrimaryWeaponItem "CUP_SVD_camo_d";
	_unit addPrimaryWeaponItem "CUP_optic_PSO_1";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform "CUP_U_O_TK_Ghillie_Top";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest "CUP_V_B_GER_Carrier_Rig_3_Brown";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
	_unit addGoggles "G_Bandanna_tan";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKS74U";
	_unit addPrimaryWeaponItem "CUP_muzzle_PBS4";
	_unit addPrimaryWeaponItem "CUP_optic_Kobra";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_DAGR";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_TK_Vest_1";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_20Rnd_762x51_FNFAL_M";};
	for "_i" from 1 to 6 do {_unit addItemToVest "SmokeShellGreen";};
	for "_i" from 1 to 6 do {_unit addItemToVest "SmokeShellPurple";};
	_unit addBackpack "CUP_B_CivPack_WDL";
	_unit addItemToBackpack "ACRE_PRC117F";
	_unit addHeadgear "CUP_H_TK_Helmet";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_FNFAL";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
};
