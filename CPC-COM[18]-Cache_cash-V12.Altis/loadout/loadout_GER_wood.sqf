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
	_unit forceAddUniform "CUP_U_B_GER_Flecktarn_1";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_DefusalKit";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "CUP_17Rnd_9x19_glock17";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest_3";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_TE1_Red_Tracer_556x45_G36";};
	_unit addHeadgear "H_Cap_oli_hs";
	_unit addGoggles "CUP_FR_NeckScarf";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_G36C";
	_unit addPrimaryWeaponItem "CUP_optic_CompM2_Black";
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "ACE_Vector";

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
	_unit forceAddUniform "CUP_U_B_GER_Flecktarn_1";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_DefusalKit";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "CUP_17Rnd_9x19_glock17";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest_3";
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_TE1_Red_Tracer_556x45_G36";};
	_unit addBackpack "B_AssaultPack_khk";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "CUP_30Rnd_556x45_G36";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "SmokeShellBlue";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "HandGrenade";};
	_unit addHeadgear "rhsusf_Bowman";
	_unit addGoggles "G_Shades_Black";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_G36A";
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "ACE_Vector";
	_unit addWeapon "CUP_launch_M136";

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
	_unit forceAddUniform "CUP_U_B_GER_Flecktarn_1";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_DefusalKit";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_17Rnd_9x19_glock17";
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addBackpack "CUP_B_GER_Medic_Flecktarn";
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
	_unit addHeadgear "CUP_H_FR_Cap_Headset_Green";
	_unit addGoggles "rhs_googles_black";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_G36K";
	_unit addWeapon "CUP_hgun_Glock17";

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
	_unit forceAddUniform "CUP_U_B_GER_Flecktarn_1";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_DefusalKit";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_17Rnd_9x19_glock17";
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_100Rnd_556x45_BetaCMag";};
	_unit addBackpack "B_AssaultPack_khk";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_100Rnd_556x45_BetaCMag";};
	_unit addHeadgear "H_Shemag_olive";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_MG36";
	_unit addPrimaryWeaponItem "optic_tws_mg";
	_unit addWeapon "CUP_hgun_Glock17";

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
	_unit forceAddUniform "CUP_U_B_GER_Flecktarn_1";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_DefusalKit";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_RangeCard";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhsusf_5Rnd_300winmag_xm2010";};
	_unit addBackpack "CUP_B_SLA_Medicbag";
	for "_i" from 1 to 8 do {_unit addItemToBackpack "rhsusf_5Rnd_300winmag_xm2010";};
	_unit addHeadgear "H_Shemag_olive";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_XM2010_sa";
	_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_camo";
	_unit addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4_2";
	_unit addPrimaryWeaponItem "bipod_03_F_oli";
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "ACE_Vector";

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
	_unit forceAddUniform "CUP_U_B_GER_Flecktarn_1";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_DefusalKit";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_17Rnd_9x19_glock17";
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addHeadgear "H_Shemag_olive";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_G36K";
	_unit addWeapon "CUP_launch_M47";
	_unit addWeapon "CUP_hgun_Glock17";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addsecondaryWeaponitem "CUP_Dragon_EP1_M";
	
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
	_unit forceAddUniform "CUP_U_B_GER_Flecktarn_1";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_DefusalKit";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_17Rnd_9x19_glock17";
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addBackpack "CUP_B_GER_Pack_Flecktarn";
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	for "_i" from 1 to 6 do {_unit addItemToBackpack "CUP_30Rnd_556x45_G36";};
	_unit addHeadgear "CUP_H_Ger_Boonie_Flecktarn";
	_unit addGoggles "CUP_FR_NeckScarf";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_G36K";
	_unit addWeapon "CUP_hgun_Glock17";

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
	_unit forceAddUniform "CUP_U_B_GER_Flecktarn_1";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_DefusalKit";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_6Rnd_HE_M203";};
	_unit addBackpack "CUP_B_GER_Pack_Flecktarn";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "CUP_6Rnd_HE_M203";};
	_unit addHeadgear "H_Bandanna_khk";
	_unit addGoggles "CUP_FR_NeckScarf2";

	comment "Add weapons";
	_unit addWeapon "CUP_glaunch_M32";
	_unit addWeapon "CUP_hgun_Glock17";

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
	_unit forceAddUniform "CUP_U_B_GER_Flecktarn_1";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_DefusalKit";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_17Rnd_9x19_glock17";
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addHeadgear "H_Shemag_olive";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_G36A";
	_unit addWeapon "CUP_hgun_Glock17";

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
	_unit forceAddUniform "CUP_U_B_GER_Flecktarn_1";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_DefusalKit";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_17Rnd_9x19_glock17";
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack "CUP_B_GER_Pack_Flecktarn";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "CUP_30Rnd_556x45_G36";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
	_unit addHeadgear "H_Shemag_olive";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_G36A";
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "Binocular";
	_unit addWeapon "CUP_launch_M136";

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
	_unit forceAddUniform "CUP_U_B_GER_Flecktarn_1";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_DefusalKit";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest_2";
	for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addHeadgear "CUP_H_USMC_Crew_Helmet";
	_unit addGoggles "CUP_FR_NeckScarf";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_G36C";
	_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

};