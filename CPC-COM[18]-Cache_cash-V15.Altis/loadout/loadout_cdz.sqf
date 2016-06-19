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
	
	_uniform =["CUP_U_O_CHDKZ_Kam_01","CUP_U_O_CHDKZ_Kam_02","CUP_U_O_CHDKZ_Kam_03","CUP_U_O_CHDKZ_Kam_04"];
	_headgear =["CUP_H_ChDKZ_Beanie","CUP_H_SLA_BeanieGreen","CUP_H_C_Beanie_02","H_Bandanna_camo"];
	
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
	_unit forceAddUniform "CUP_U_O_CHDKZ_Commander";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addVest "CUP_V_RUS_Smersh_2";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
	for "_i" from 1 to 5 do {_unit addItemToVest "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M";};
	_unit addHeadgear "CUP_H_ChDKZ_Beret";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKS74U";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addVest "CUP_V_RUS_Smersh_2";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
	for "_i" from 1 to 5 do {_unit addItemToVest "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M";};
	_unit addBackpack "CUP_B_AlicePack_Khaki";
	for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "SmokeShellGreen";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_HandGrenade_RGD5";};
	_unit addHeadgear (selectRandom _headgear);

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKS74";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_RUS_Smersh_1";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
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
	_unit addHeadgear (selectRandom _headgear);

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AK74";

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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_Ins_Carrier_Rig_MG";
	_unit addItemToVest "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";
	_unit addGoggles (selectrandom ["G_Balaclava_oli","G_Balaclava_blk"]);

	comment "Add weapons";
	_unit addWeapon "CUP_lmg_PKM";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";
	
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_RUS_Smersh_1";
	for "_i" from 1 to 22 do {_unit addItemToVest "CUP_10Rnd_762x54_SVD_M";};
	_unit addGoggles (selectrandom ["G_Balaclava_oli","G_Balaclava_blk"]);

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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_Ins_Carrier_Rig_Light";
	for "_i" from 1 to 9 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
	_unit addBackpack "CUP_B_RPGPack_Khaki";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_PG7VL_M";};
	_unit addGoggles (selectrandom ["G_Balaclava_oli","G_Balaclava_blk"]);

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKS74";
	_unit addWeapon "CUP_launch_RPG7V";
	_unit addSecondaryWeaponItem "CUP_optic_PGO7V2";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToBackpack "CUP_PG7VL_M";
	
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_RUS_Smersh_1";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
	_unit addBackpack "CUP_B_AlicePack_Khaki";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_Clacker";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addHeadgear (selectRandom _headgear);

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AK74";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_RUS_Smersh_1";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
	for "_i" from 1 to 7 do {_unit addItemToVest "CUP_1Rnd_HE_GP25_M";};
	_unit addBackpack "CUP_B_CivPack_WDL";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "CUP_1Rnd_HE_GP25_M";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "CUP_IlumFlareWhite_GP25_M";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "CUP_1Rnd_SmokeRed_GP25_M";};
	for "_i" from 1 to 6 do {_unit addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
	_unit addHeadgear (selectRandom _headgear);

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AK74_GL";

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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_RUS_Smersh_1";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
	_unit addHeadgear (selectRandom _headgear);

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AK74";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_O_Ins_Carrier_Rig";
	for "_i" from 1 to 9 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
	_unit addBackpack "B_Carryall_oli";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_HandGrenade_RGD5";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";};
	_unit addGoggles (selectrandom ["G_Balaclava_oli","G_Balaclava_blk"]);

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKS74";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_RUS_Smersh_2";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
	_unit addHeadgear "CUP_H_RUS_TSH_4_Brown";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_AKS74U";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

};
