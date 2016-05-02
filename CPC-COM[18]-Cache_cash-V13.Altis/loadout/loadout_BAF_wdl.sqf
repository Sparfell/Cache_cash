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


hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
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
	_unit forceAddUniform "CUP_U_B_BAF_DPM_S2_UnRolled";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "CUP_15Rnd_9x19_M9";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest "CUP_V_BAF_Osprey_Mk2_DPM_Officer";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
	_unit addHeadgear "CUP_H_BAF_Officer_Beret_PRR_U";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	_unit addPrimaryWeaponItem "CUP_optic_SUSAT";
	_unit addWeapon "CUP_hgun_M9";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_HMNVS";_unit addPrimaryWeaponItem "CUP_acc_LLM";};

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
	_unit forceAddUniform "CUP_U_B_BAF_DPM_S2_UnRolled";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "CUP_15Rnd_9x19_M9";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest "CUP_V_BAF_Osprey_Mk2_DPM_Officer";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
	_unit addBackpack "B_AssaultPack_cbr";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "SmokeShellBlue";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_HandGrenade_L109A1_HE";};
	_unit addHeadgear "CUP_H_BAF_Helmet_1_DPM";
	_unit addGoggles "CUP_TK_NeckScarf";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_G";
	_unit addPrimaryWeaponItem "CUP_optic_SUSAT";
	_unit addWeapon "CUP_hgun_M9";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_HMNVS";_unit addPrimaryWeaponItem "CUP_acc_LLM";};

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
	_unit forceAddUniform "CUP_U_B_BAF_DPM_S2_UnRolled";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "CUP_15Rnd_9x19_M9";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_BAF_Osprey_Mk2_DPM_Medic";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	_unit addBackpack "CUP_B_GER_Medic_Desert";
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
	_unit addHeadgear "CUP_H_BAF_Helmet_1_DPM";
	_unit addGoggles "CUP_TK_NeckScarf";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	_unit addWeapon "CUP_hgun_M9";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_HMNVS";_unit addPrimaryWeaponItem "CUP_acc_LLM";};

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
	_unit forceAddUniform "CUP_U_B_BAF_DPM_S2_UnRolled";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "CUP_15Rnd_9x19_M9";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_BAF_Osprey_Mk2_DPM_Empty";
	_unit addItemToVest "CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1";
	_unit addBackpack "CUP_B_Bergen_BAF";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1";};
	_unit addHeadgear "CUP_H_BAF_Helmet_1_DPM";

	comment "Add weapons";
	_unit addWeapon "CUP_lmg_L110A1";
	_unit addWeapon "CUP_hgun_M9";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_HMNVS";};

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
	_unit forceAddUniform "CUP_U_B_BAF_DPM_S2_UnRolled";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_RangeCard";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_15Rnd_9x19_M9";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_BAF_Osprey_Mk2_DPM_Soldier2";
	for "_i" from 1 to 15 do {_unit addItemToVest "CUP_5Rnd_86x70_L115A1";};
	_unit addHeadgear "CUP_H_BAF_Helmet_1_DPM";

	comment "Add weapons";
	_unit addWeapon "CUP_srifle_AWM_wdl";
	_unit addPrimaryWeaponItem "CUP_optic_SB_3_12x50_PMII";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	_unit addWeapon "CUP_hgun_M9";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_HMNVS";};

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
	_unit forceAddUniform "CUP_U_B_BAF_DPM_S2_UnRolled";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "CUP_15Rnd_9x19_M9";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_BAF_Osprey_Mk2_DPM_Soldier1";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	_unit addHeadgear "CUP_H_BAF_Helmet_1_DPM";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	_unit addPrimaryWeaponItem "CUP_optic_SUSAT";
	_unit addWeapon "CUP_launch_NLAW";
	_unit addWeapon "CUP_hgun_M9";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_HMNVS";_unit addPrimaryWeaponItem "CUP_acc_LLM";};

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
	_unit forceAddUniform "CUP_U_B_BAF_DPM_S1_RolledUp";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "CUP_15Rnd_9x19_M9";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_BAF_Osprey_Mk2_DPM_Sapper";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	_unit addBackpack "B_Kitbag_cbr";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	_unit addHeadgear "CUP_H_BAF_Helmet_1_DPM";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	_unit addWeapon "CUP_hgun_M9";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_HMNVS";_unit addPrimaryWeaponItem "CUP_acc_LLM";};

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
	_unit forceAddUniform "CUP_U_B_BAF_DPM_S1_RolledUp";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "CUP_15Rnd_9x19_M9";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_BAF_Osprey_Mk2_DPM_Grenadier";
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 15 do {_unit addItemToVest "CUP_1Rnd_HEDP_M203";};
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_1Rnd_SmokeRed_M203";};
	_unit addHeadgear "CUP_H_BAF_Helmet_1_DPM";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_GL";
	_unit addPrimaryWeaponItem "CUP_optic_SUSAT";
	_unit addWeapon "CUP_hgun_M9";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_HMNVS";_unit addPrimaryWeaponItem "CUP_acc_LLM";};

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
	_unit forceAddUniform "CUP_U_B_BAF_DPM_S2_UnRolled";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "CUP_15Rnd_9x19_M9";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_BAF_Osprey_Mk2_DPM_Soldier1";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	_unit addHeadgear "CUP_H_BAF_Helmet_1_DPM";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	_unit addPrimaryWeaponItem "CUP_optic_SUSAT";
	_unit addWeapon "CUP_hgun_M9";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_HMNVS";_unit addPrimaryWeaponItem "CUP_acc_LLM";};

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
	_unit forceAddUniform "CUP_U_B_BAF_DPM_S1_RolledUp";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "CUP_15Rnd_9x19_M9";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_BAF_Osprey_Mk2_DPM_Scout";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	_unit addBackpack "CUP_B_USPack_Coyote";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_HandGrenade_L109A1_HE";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
	_unit addHeadgear "CUP_H_BAF_Helmet_1_DPM";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	_unit addPrimaryWeaponItem "CUP_optic_SUSAT";
	_unit addWeapon "CUP_hgun_M9";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_HMNVS";_unit addPrimaryWeaponItem "CUP_acc_LLM";};
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
	_unit forceAddUniform "CUP_U_B_BAF_DPM_S2_UnRolled";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "CUP_15Rnd_9x19_M9";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_BAF_Osprey_Mk2_DPM_Crewman";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	_unit addHeadgear "CUP_H_BAF_Crew_Helmet_DPM";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	_unit addWeapon "CUP_hgun_M9";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemGPS";

	
	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_HMNVS";_unit addPrimaryWeaponItem "CUP_acc_LLM";};

};
