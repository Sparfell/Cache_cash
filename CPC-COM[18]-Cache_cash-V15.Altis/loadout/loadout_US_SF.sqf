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
	_unit forceAddUniform "CUP_U_B_FR_DirAction2";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
	_unit addItemToUniform "B_IR_Grenade";
	_unit addVest "CUP_V_B_RRV_DA2";
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_M67";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_30Rnd_556x45_Stanag_Tracer_Dim";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	_unit addGoggles "CUP_FR_NeckScarf2";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_desert";
	_unit addPrimaryWeaponItem "CUP_muzzle_snds_M16";
	_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_desert";
	_unit addPrimaryWeaponItem "CUP_optic_ACOG";
	_unit addWeapon "hgun_Pistol_heavy_01_F";
	_unit addHandgunItem "muzzle_snds_acp";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
	_unit forceAddUniform "CUP_U_B_FR_DirAction2";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
	_unit addItemToUniform "B_IR_Grenade";
	_unit addVest "CUP_V_B_RRV_DA1";
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_M67";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_30Rnd_556x45_Stanag_Tracer_Dim";};
	_unit addBackpack "B_AssaultPack_cbr";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_HandGrenade_M67";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	_unit addGoggles "CUP_TK_NeckScarf";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_desert";
	_unit addPrimaryWeaponItem "CUP_muzzle_snds_M16";
	_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_desert";
	_unit addPrimaryWeaponItem "CUP_optic_ACOG";
	_unit addWeapon "CUP_launch_M136";
	_unit addWeapon "hgun_Pistol_heavy_01_F";
	_unit addHandgunItem "muzzle_snds_acp";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
	_unit forceAddUniform "CUP_U_B_FR_DirAction2";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
	_unit addVest "CUP_V_B_RRV_DA1";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_M67";};
	_unit addBackpack "B_Kitbag_mcamo";
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
	_unit addHeadgear "rhsusf_opscore_mc_cover";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_desert";
	_unit addPrimaryWeaponItem "CUP_muzzle_snds_M16";
	_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_desert";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
	_unit addWeapon "hgun_Pistol_heavy_01_F";
	_unit addHandgunItem "muzzle_snds_acp";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
	_unit forceAddUniform "CUP_U_B_FR_DirAction2";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
	_unit addVest "CUP_V_B_RRV_DA1";
	_unit addItemToVest "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_M67";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	_unit addBackpack "B_TacticalPack_mcamo";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";};
	_unit addHeadgear "rhsusf_opscore_mc_cover";
	_unit addGoggles "CUP_FR_NeckScarf2";

	comment "Add weapons";
	_unit addWeapon "CUP_lmg_Mk48_des";
	_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_desert";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
	_unit addWeapon "hgun_Pistol_heavy_01_F";
	_unit addHandgunItem "muzzle_snds_acp";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
	_unit forceAddUniform "CUP_U_B_FR_DirAction2";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_RangeCard";
	for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_B_RRV_DA2";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_20Rnd_762x51_B_M110";};
	_unit addHeadgear "rhsusf_opscore_mc_cover";
	_unit addGoggles "G_Bandanna_khk";

	comment "Add weapons";
	_unit addWeapon "CUP_srifle_M110";
	_unit addPrimaryWeaponItem "CUP_muzzle_snds_M110";
	_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";
	_unit addPrimaryWeaponItem "CUP_optic_AN_PVS_10";
	_unit addPrimaryWeaponItem "bipod_02_F_hex";
	_unit addWeapon "hgun_Pistol_heavy_01_F";
	_unit addHandgunItem "muzzle_snds_acp";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
	_unit forceAddUniform "CUP_U_B_FR_DirAction2";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
	_unit addVest "CUP_V_B_RRV_DA1";
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_M67";};
	_unit addBackpack "CUP_B_USMC_MOLLE";
	_unit addHeadgear "rhsusf_opscore_mc_cover";
	_unit addGoggles "CUP_TK_NeckScarf";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_desert";
	_unit addPrimaryWeaponItem "CUP_muzzle_snds_M16";
	_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_desert";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
	_unit addWeapon "CUP_launch_Javelin";
	_unit addWeapon "hgun_Pistol_heavy_01_F";
	_unit addHandgunItem "muzzle_snds_acp";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addsecondaryWeaponitem "CUP_Javelin_M";
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
	_unit forceAddUniform "CUP_U_B_FR_DirAction2";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
	_unit addVest "CUP_V_B_RRV_DA1";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_M67";};
	_unit addBackpack "CUP_B_USMC_MOLLE";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addHeadgear "rhsusf_opscore_mc_cover";
	_unit addGoggles "G_Bandanna_khk";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_desert";
	_unit addPrimaryWeaponItem "CUP_muzzle_snds_M16";
	_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_desert";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
	_unit addWeapon "hgun_Pistol_heavy_01_F";
	_unit addHandgunItem "muzzle_snds_acp";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
	_unit forceAddUniform "CUP_U_B_FR_DirAction2";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_B_RRV_DA1";
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 12 do {_unit addItemToVest "CUP_1Rnd_HEDP_M203";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_1Rnd_SmokeRed_M203";};
	_unit addHeadgear "rhsusf_opscore_mc_cover";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_BUIS_desert_GL";
	_unit addPrimaryWeaponItem "CUP_muzzle_snds_M16";
	_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_desert";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
	_unit addWeapon "hgun_Pistol_heavy_01_F";
	_unit addHandgunItem "muzzle_snds_acp";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

};

loadoutCC_R = //
{
	_unit = _this select 0;
	
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform "CUP_U_B_FR_DirAction2";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
	_unit addVest "CUP_V_B_RRV_DA2";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_M67";};
	_unit addHeadgear "rhsusf_opscore_mc_cover";
	_unit addGoggles "CUP_FR_NeckScarf";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_desert";
	_unit addPrimaryWeaponItem "CUP_muzzle_snds_M16";
	_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_desert";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
	_unit addWeapon "hgun_Pistol_heavy_01_F";
	_unit addHandgunItem "muzzle_snds_acp";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
	_unit forceAddUniform "CUP_U_B_FR_DirAction2";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
	_unit addVest "CUP_V_B_RRV_DA1";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_M67";};
	_unit addBackpack "B_TacticalPack_mcamo";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_HandGrenade_M67";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";};
	_unit addHeadgear "rhsusf_opscore_mc_cover";
	_unit addGoggles "CUP_TK_NeckScarf";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_desert";
	_unit addPrimaryWeaponItem "CUP_muzzle_snds_M16";
	_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_desert";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
	_unit addWeapon "hgun_Pistol_heavy_01_F";
	_unit addHandgunItem "muzzle_snds_acp";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
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
	_unit forceAddUniform "CUP_U_B_FR_DirAction2";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
	_unit addVest "CUP_V_B_RRV_DA2";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_M67";};
	_unit addHeadgear "rhsusf_opscore_mc_cover_pelt";
	_unit addGoggles "G_Bandanna_khk";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_desert";
	_unit addPrimaryWeaponItem "CUP_muzzle_snds_M16";
	_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_desert";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
	_unit addWeapon "hgun_Pistol_heavy_01_F";
	_unit addHandgunItem "muzzle_snds_acp";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

};