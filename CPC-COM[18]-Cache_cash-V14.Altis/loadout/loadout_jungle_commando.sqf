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
	_unit forceAddUniform "CUP_U_B_FR_Scout";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_7Rnd_45ACP_1911";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest "CUP_V_B_RRV_TL";
	for "_i" from 1 to 4 do {_unit addItemToVest "ACE_HandFlare_Green";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
	_unit addHeadgear "H_Cap_oli_hs";
	_unit addGoggles "G_Shades_Black";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_camo";
	_unit addPrimaryWeaponItem "CUP_optic_HoloWdl";
	_unit addWeapon "CUP_hgun_Colt1911";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";_unit addPrimaryWeaponItem "acc_flashlight";};

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
	_unit forceAddUniform "CUP_U_B_FR_Scout";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_7Rnd_45ACP_1911";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest "CUP_V_B_RRV_TL";
	for "_i" from 1 to 4 do {_unit addItemToVest "ACE_HandFlare_Green";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
	_unit addBackpack "CUP_B_USMC_MOLLE_WDL";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "SmokeShellBlue";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Red";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_HandGrenade_M67";};
	_unit addItemToBackpack "ACE_PreloadedMissileDummy_CUP";
	_unit addHeadgear "CUP_H_FR_Headband_Headset";
	_unit addGoggles "CUP_FR_NeckScarf";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_camo";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Woodland2";
	_unit addWeapon "CUP_launch_M136";
	_unit addWeapon "CUP_hgun_Colt1911";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";_unit addPrimaryWeaponItem "acc_flashlight";};

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
	_unit forceAddUniform "CUP_U_B_FR_Scout";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest "CUP_V_B_RRV_Medic";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
	_unit addBackpack "CUP_B_USMC_AssaultPack";
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
	_unit addHeadgear "H_Bandanna_sgg";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_camo";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Woodland2";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";_unit addPrimaryWeaponItem "acc_flashlight";};

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
	_unit forceAddUniform "CUP_U_B_FR_Scout";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest "CUP_V_B_RRV_MG";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
	_unit addItemToVest "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";
	_unit addBackpack "CUP_B_USMC_MOLLE_WDL";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";};
	_unit addHeadgear "CUP_H_FR_BandanaWdl";
	_unit addGoggles "CUP_FR_NeckScarf";

	comment "Add weapons";
	_unit addWeapon "CUP_lmg_M60E4";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";_unit addPrimaryWeaponItem "acc_flashlight";};

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
	_unit forceAddUniform "CUP_U_B_FR_Scout";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_RangeCard";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest "CUP_V_B_RRV_Medic";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_20Rnd_762x51_DMR";};
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR";};
	_unit addHeadgear "H_Booniehat_oli";
	_unit addGoggles "CUP_FR_NeckScarf2";

	comment "Add weapons";
	_unit addWeapon "CUP_srifle_M14_DMR";
	_unit addPrimaryWeaponItem "CUP_optic_LeupoldMk4";
	_unit addPrimaryWeaponItem "CUP_bipod_Harris_1A2_L";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";_unit addPrimaryWeaponItem "acc_flashlight";};

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
	_unit forceAddUniform "CUP_U_B_FR_Scout";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest "CUP_V_B_RRV_Medic";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
	_unit addBackpack "CUP_B_USMC_MOLLE_WDL";
	_unit addHeadgear "H_Booniehat_khk";
	_unit addGoggles "rhs_googles_clear";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_camo";
	_unit addPrimaryWeaponItem "CUP_optic_HoloWdl";
	_unit addWeapon "CUP_launch_M136";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";_unit addPrimaryWeaponItem "acc_flashlight";};

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
	_unit forceAddUniform "CUP_U_B_FR_Scout";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest "CUP_V_B_RRV_Medic";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
	_unit addBackpack "CUP_B_AlicePack_Khaki";
	_unit addItemToBackpack "ACE_Clacker";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addHeadgear "CUP_H_FR_BoonieWDL";
	_unit addGoggles "CUP_FR_NeckScarf2";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_camo";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Woodland2";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";_unit addPrimaryWeaponItem "acc_flashlight";};

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
	_unit forceAddUniform "CUP_U_B_FR_Scout";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "30Rnd_556x45_Stanag";};
	_unit addVest "CUP_V_B_RRV_Scout2";
	for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 11 do {_unit addItemToVest "CUP_1Rnd_HE_M203";};
	for "_i" from 1 to 11 do {_unit addItemToVest "CUP_FlareRed_M203";};
	_unit addHeadgear "CUP_H_FR_BandanaGreen";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_BUIS_camo_GL";
	_unit addPrimaryWeaponItem "CUP_optic_HoloWdl";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";_unit addPrimaryWeaponItem "acc_flashlight";};

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
	_unit forceAddUniform "CUP_U_B_FR_Scout";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest "CUP_V_B_RRV_Medic";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
	_unit addHeadgear "rhs_Booniehat_m81";
	_unit addGoggles "CUP_FR_NeckScarf";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_camo";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Woodland2";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";_unit addPrimaryWeaponItem "acc_flashlight";};

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
	_unit forceAddUniform "CUP_U_B_FR_Scout";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest "CUP_V_B_RRV_Medic";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
	_unit addBackpack "CUP_B_AlicePack_Khaki";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_HandGrenade_M67";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";};
	_unit addHeadgear "H_Booniehat_oli";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_camo";
	_unit addPrimaryWeaponItem "CUP_optic_HoloWdl";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";_unit addPrimaryWeaponItem "acc_flashlight";};
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
	_unit forceAddUniform "CUP_U_B_FR_Scout";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest "V_TacVest_camo";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
	_unit addHeadgear "H_HelmetCrew_I";
	_unit addGoggles "G_Lowprofile";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_M4A1_camo";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Woodland2";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";_unit addPrimaryWeaponItem "acc_flashlight";};

};
