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
private ["_rhsennemy","_uniform","_vest","_headgear","_nvg","_lamp","_weapon"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,100,106]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_uniform =[];
	_vest =[];
	_headgear =[];
	_weapon = ["rhs_weap_akm","rhs_weap_akms"];
	_uniform =["CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Partug_03","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_01","CUP_O_TKI_Khet_Partug_05","CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_07","CUP_O_TKI_Khet_Partug_08"];
	_vest =["CUP_V_OI_TKI_Jacket4_01","CUP_V_OI_TKI_Jacket4_02","CUP_V_OI_TKI_Jacket4_03","CUP_V_OI_TKI_Jacket4_04","CUP_V_OI_TKI_Jacket4_05","CUP_V_OI_TKI_Jacket4_06","CUP_V_OI_TKI_Jacket3_01","CUP_V_OI_TKI_Jacket3_02","CUP_V_OI_TKI_Jacket3_03","CUP_V_OI_TKI_Jacket3_04","CUP_V_OI_TKI_Jacket3_05","CUP_V_OI_TKI_Jacket3_06","CUP_V_OI_TKI_Jacket2_01","CUP_V_OI_TKI_Jacket2_02","CUP_V_OI_TKI_Jacket2_03","CUP_V_OI_TKI_Jacket2_04","CUP_V_OI_TKI_Jacket2_05","CUP_V_OI_TKI_Jacket2_06"];
	_headgear =["CUP_H_TKI_Lungee_Open_01","CUP_H_TKI_Lungee_Open_02","CUP_H_TKI_Lungee_Open_03","CUP_H_TKI_Lungee_Open_04","CUP_H_TKI_Lungee_Open_05","CUP_H_TKI_Lungee_Open_06","CUP_H_TKI_Lungee_01","CUP_H_TKI_Lungee_02","CUP_H_TKI_Lungee_03","CUP_H_TKI_Lungee_04","CUP_H_TKI_Lungee_05","CUP_H_TKI_Lungee_06","CUP_H_TKI_Pakol_2_01","CUP_H_TKI_Pakol_2_02","CUP_H_TKI_Pakol_2_03","CUP_H_TKI_Pakol_2_04","CUP_H_TKI_Pakol_2_05","CUP_H_TKI_Pakol_2_06","CUP_H_TKI_Pakol_1_01","CUP_H_TKI_Pakol_1_02","CUP_H_TKI_Pakol_1_03","CUP_H_TKI_Pakol_1_04","CUP_H_TKI_Pakol_1_05","CUP_H_TKI_Pakol_1_06","CUP_H_TKI_SkullCap_01","CUP_H_TKI_SkullCap_02","CUP_H_TKI_SkullCap_03","CUP_H_TKI_SkullCap_04","CUP_H_TKI_SkullCap_05","CUP_H_TKI_SkullCap_06"];		

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
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack "CUP_B_AlicePack_Khaki";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_30Rnd_762x39mm";};
	for "_i" from 1 to 6 do {_unit addItemToBackpack "ACE_HandFlare_White";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_rpg26";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_RPG18";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
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
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	_unit addBackpack "CUP_B_CivPack_WDL";
	for "_i" from 1 to 5 do {_unit addItemToBackpack "CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_RPK74";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack "CUP_B_RUS_Backpack";
	for "_i" from 1 to 5 do {_unit addItemToBackpack "CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	_unit addItemToVest "rhs_100Rnd_762x54mmR";
	_unit addBackpack "CUP_B_CivPack_WDL";
	_unit addItemToBackpack "rhs_100Rnd_762x54mmR";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pkm";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_10x_303_M";};
	_unit addBackpack "CUP_B_CivPack_WDL";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "CUP_srifle_LeeEnfield";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_rhsennemy) then {
		_unit addWeapon "rhs_weap_rpg7";
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
	};
	if (!_rhsennemy) then {
		_unit addBackpack "CUP_B_RPGPack_Khaki";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_PG7VM_M";};
		_unit addWeapon "CUP_launch_RPG7V";
		_unit addItemToBackpack "CUP_PG7VM_M";
	};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	if (_rhsennemy) then {
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
	};
	if (!_rhsennemy) then {
		_unit addBackpack "CUP_B_RPGPack_Khaki";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_PG7VM_M";};
	};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack "CUP_B_AlicePack_Khaki";
	_unit addItemToBackpack "ACE_Cellphone";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_PipeBomb_M";};
	_unit addItemToBackpack "CUP_IED_V1_M";
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 13 do {_unit addItemToVest "CUP_10Rnd_762x54_SVD_M";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "CUP_srifle_SVD";
	_unit addPrimaryWeaponItem "CUP_optic_PSO_1";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addItemToUniform "CUP_1Rnd_HE_M203";
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 12 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_FlareRed_M203";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "CUP_glaunch_M79";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 11 do {_unit addItemToVest "CUP_10x_303_M";};
	_unit addBackpack "CUP_B_SLA_Medicbag";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_30Rnd_762x39mm";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "CUP_HandGrenade_RGD5";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 6 do {_unit addItemToBackpack "ACE_HandFlare_White";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "CUP_srifle_LeeEnfield";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_rpg26";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_RPG18";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_10x_303_M";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "CUP_srifle_LeeEnfield_rail";
	_unit addPrimaryWeaponItem "CUP_optic_Leupold_VX3";
	_unit addWeapon "ACE_Yardage450";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "ACE_MapTools";
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addvest (selectrandom _vest);
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addheadgear (selectrandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};
