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
		this setVariable ["loadout", "aaf_officer"];
		
	PS :Dans l'exemple ci-dessous les lignes des commentaires issues de l'exportation avec l'arsenal vitruel ont été supprimées pour une meilleure lisibilité.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/


hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_uniform =["CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Partug_03","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_01","CUP_O_TKI_Khet_Partug_05","CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_07","CUP_O_TKI_Khet_Partug_08"];
	_vest =["CUP_V_OI_TKI_Jacket4_01","CUP_V_OI_TKI_Jacket4_02","CUP_V_OI_TKI_Jacket4_03","CUP_V_OI_TKI_Jacket4_04","CUP_V_OI_TKI_Jacket4_05","CUP_V_OI_TKI_Jacket4_06","CUP_V_OI_TKI_Jacket3_01","CUP_V_OI_TKI_Jacket3_02","CUP_V_OI_TKI_Jacket3_03","CUP_V_OI_TKI_Jacket3_04","CUP_V_OI_TKI_Jacket3_05","CUP_V_OI_TKI_Jacket3_06","CUP_V_OI_TKI_Jacket2_01","CUP_V_OI_TKI_Jacket2_02","CUP_V_OI_TKI_Jacket2_03","CUP_V_OI_TKI_Jacket2_04","CUP_V_OI_TKI_Jacket2_05","CUP_V_OI_TKI_Jacket2_06"];
	_headgear =["CUP_H_TKI_Lungee_Open_01","CUP_H_TKI_Lungee_Open_02","CUP_H_TKI_Lungee_Open_03","CUP_H_TKI_Lungee_Open_04","CUP_H_TKI_Lungee_Open_05","CUP_H_TKI_Lungee_Open_06","CUP_H_TKI_Lungee_01","CUP_H_TKI_Lungee_02","CUP_H_TKI_Lungee_03","CUP_H_TKI_Lungee_04","CUP_H_TKI_Lungee_05","CUP_H_TKI_Lungee_06","CUP_H_TKI_Pakol_2_01","CUP_H_TKI_Pakol_2_02","CUP_H_TKI_Pakol_2_03","CUP_H_TKI_Pakol_2_04","CUP_H_TKI_Pakol_2_05","CUP_H_TKI_Pakol_2_06","CUP_H_TKI_Pakol_1_01","CUP_H_TKI_Pakol_1_02","CUP_H_TKI_Pakol_1_03","CUP_H_TKI_Pakol_1_04","CUP_H_TKI_Pakol_1_05","CUP_H_TKI_Pakol_1_06","CUP_H_TKI_SkullCap_01","CUP_H_TKI_SkullCap_02","CUP_H_TKI_SkullCap_03","CUP_H_TKI_SkullCap_04","CUP_H_TKI_SkullCap_05","CUP_H_TKI_SkullCap_06"];
	
	
	switch _loadout do 
	{
		case "cc_sl": {[_unit] call loadoutCC_SL};
		case "cc_tl": {[_unit] call loadoutCC_TL};
		case "cc_doc": {[_unit] call loadoutCC_DOC};
		case "cc_mg": {[_unit] call loadoutCC_MG};
		case "cc_m": {[_unit] call loadoutCC_M};
		case "cc_at": {[_unit] call loadoutCC_AT};
		case "cc_demo": {[_unit] call loadoutCC_DEMO};
		case "cc_gl": {[_unit] call loadoutCC_GL};
		case "cc_r": {[_unit] call loadoutCC_R};
		case "cc_a": {[_unit] call loadoutCC_A};
		case "cc_crew": {[_unit] call loadoutCC_CREW};
	};
};



loadoutCC_SL = //
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
	_unit forceAddUniform (selectRandom _uniform);

	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addItemToUniform "SmokeShell";
	_unit addvest (selectRandom _vest);

	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";};
	_unit addheadgear (selectRandom _headgear);


	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKS";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform (selectRandom _uniform);

	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addItemToUniform "SmokeShell";
	_unit addvest (selectRandom _vest);

	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";};
	_unit addheadgear (selectRandom _headgear);


	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKM";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform (selectRandom _uniform);

	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	for "_i" from 1 to 3 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_10x_303_M";
	_unit addvest (selectRandom _vest);

	for "_i" from 1 to 11 do {_unit addItemToVest "CUP_10x_303_M";};
	_unit addBackpack "CUP_B_SLA_Medicbag";
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
	_unit addheadgear (selectRandom _headgear);


	comment "Add weapons";
	_unit addWeapon "CUP_srifle_LeeEnfield";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform (selectRandom _uniform);

	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addvest (selectRandom _vest);

	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	_unit addBackpack "CUP_B_CivPack_WDL";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	_unit addheadgear (selectRandom _headgear);


	comment "Add weapons";
	_unit addWeapon "CUP_arifle_RPK74";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform (selectRandom _uniform);

	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addvest (selectRandom _vest);

	for "_i" from 1 to 13 do {_unit addItemToVest "CUP_10Rnd_762x54_SVD_M";};
	_unit addheadgear (selectRandom _headgear);


	comment "Add weapons";
	_unit addWeapon "CUP_srifle_SVD";
	_unit addPrimaryWeaponItem "CUP_optic_PSO_1";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform (selectRandom _uniform);

	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addItemToUniform "SmokeShell";
	_unit addItemToUniform "CUP_30Rnd_762x39_AK47_M";
	_unit addvest (selectRandom _vest);

	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";};
	_unit addBackpack "CUP_B_RPGPack_Khaki";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_PG7VM_M";};
	_unit addheadgear (selectRandom _headgear);


	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKS";
	_unit addWeapon "CUP_launch_RPG7V";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";
	_unit addItemToBackpack "CUP_PG7VM_M";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform (selectRandom _uniform);

	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addItemToUniform "SmokeShell";
	_unit addItemToUniform "CUP_30Rnd_762x39_AK47_M";
	_unit addvest (selectRandom _vest);

	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";};
	_unit addBackpack "CUP_B_AlicePack_Khaki";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_Cellphone";
	_unit addItemToBackpack "CUP_IED_V1_M";
	_unit addItemToBackpack "CUP_IED_V2_M";
	_unit addheadgear (selectRandom _headgear);


	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AK47";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform (selectRandom _uniform);

	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 6 do {_unit addItemToUniform "CUP_1Rnd_HE_M203";};
	_unit addvest (selectRandom _vest);

	for "_i" from 1 to 14 do {_unit addItemToVest "CUP_1Rnd_HE_M203";};
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_FlareGreen_M203";};
	_unit addheadgear (selectRandom _headgear);


	comment "Add weapons";
	_unit addWeapon "CUP_glaunch_M79";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform (selectRandom _uniform);

	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addItemToUniform "SmokeShell";
	_unit addItemToUniform "CUP_30Rnd_762x39_AK47_M";
	_unit addvest (selectRandom _vest);

	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";};
	_unit addheadgear (selectRandom _headgear);


	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKM";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform (selectRandom _uniform);

	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addItemToUniform "SmokeShell";
	_unit addItemToUniform "CUP_30Rnd_762x39_AK47_M";
	_unit addvest (selectRandom _vest);

	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";};
	_unit addheadgear (selectRandom _headgear);
	_unit addBackpack "CUP_B_CivPack_WDL";
	for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_30Rnd_762x39_AK47_M";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_HandGrenade_RGD5";};
	_unit addItemToBackpack "CUP_PG7VM_M";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKM";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform (selectRandom _uniform);

	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addItemToUniform "SmokeShell";
	_unit addvest (selectRandom _vest);

	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";};
	_unit addheadgear (selectRandom _headgear);


	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AK47";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "CUP_30Rnd_762x39_AK47_M";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};
};
