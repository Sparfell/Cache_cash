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
private ["_wdl","_des","_rhsennemy","_uniform","_helmet","_nvg","_lamp","_weapon_long","_weapon_short","_weapon_ar","_weapon_rail"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,100,106]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_uniform = [];
	_helmet = [];
	_weapon_long = "";
	_weapon_short = "";
	_weapon_ar = "";
	_weapon_rail = "";
	_des = false;
	_wdl = false;

	//WDL
	if (worldName in ["Altis","Tanoa","Chernarus","Sara","FDF_Isle1_a","Woodland_ACR","pja305","noe","eden"]) then 
	{
		_uniform = ["CUP_U_B_GER_Flecktarn_2","CUP_U_B_GER_Flecktarn_1"];
		_helmet = ["CUP_H_Ger_Boonie_Flecktarn","H_Watchcap_khk","H_Cap_oli_hs","CUP_H_PMC_EP_Headset","CUP_H_PMC_PRR_Headset"];
		_weapon_long = "CUP_arifle_G36A";
		_weapon_short = "CUP_arifle_G36K";
		_weapon_rail = "CUP_arifle_G36C";
		_weapon_ar = "CUP_arifle_MG36";
		_wdl = true;
	};
	//DES
	if (worldName in ["Takistan","IslaDuala3","pja307"]) then 
	{
		_uniform = ["CUP_U_B_GER_Tropentarn_2","CUP_U_B_GER_Tropentarn_1"];
		_helmet = ["CUP_H_Ger_Boonie_desert","H_ShemagOpen_khk","H_ShemagOpen_khk","CUP_H_PMC_Cap_PRR_Tan"];
		_weapon_long = "CUP_arifle_G36A_camo";
		_weapon_short = "CUP_arifle_G36K_camo";
		_weapon_rail = "CUP_arifle_G36C_camo";
		_weapon_ar = "CUP_arifle_MG36_camo";
		_des = true;
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest_3";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACE_MapTools";
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_TE1_Red_Tracer_556x45_G36";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_rail;
	if (_wdl) then {_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";} else {_unit addPrimaryWeaponItem "CUP_optic_HoloDesert";};
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest_3";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACE_MapTools";
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_TE1_Red_Tracer_556x45_G36";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
	_unit addBackpack "B_AssaultPack_khk";
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_long;
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "Rangefinder";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
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
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_short;
	_unit addWeapon "CUP_hgun_Glock17";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_100Rnd_556x45_BetaCMag";};
	_unit addBackpack "B_AssaultPack_khk";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag";};
	_unit addItemToBackpack "CUP_100Rnd_556x45_BetaCMag";
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_ar;
	if (_wdl) then {_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";} else {_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_d";};
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addItemToBackpack "CUP_100Rnd_556x45_BetaCMag";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addBackpack "CUP_B_GER_Pack_Flecktarn";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_100Rnd_556x45_BetaCMag";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_long;
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Vest_2";
	_unit addItemToVest "rhsusf_100Rnd_762x51";
	_unit addBackpack "B_AssaultPack_khk";
	_unit addItemToBackpack "rhsusf_100Rnd_762x51";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_100Rnd_762x51_m62_tracer";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m240G";
	_unit addPrimaryWeaponItem "CUP_optic_ElcanM145";
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addBackpack "CUP_B_GER_Pack_Flecktarn";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_100Rnd_762x51";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_100Rnd_762x51_m62_tracer";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_long;
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addBackpack "B_Carryall_oli";
	if (_rhsennemy) then {
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_smaw_HEAA";};
		_unit addItemToBackpack "rhs_mag_smaw_SR";
	};
	if (!_rhsennemy) then {
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_SMAW_HEAA_M";};
		_unit addItemToBackpack "CUP_SMAW_Spotting";
	};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_rail;
	if (_wdl) then {_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";} else {_unit addPrimaryWeaponItem "CUP_optic_HoloDesert";};
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "ACE_Vector";
	if (_rhsennemy) then {
		_unit addWeapon "rhs_weap_smaw_green";
		_unit addSecondaryWeaponItem "rhs_weap_optic_smaw";
	};
	if (!_rhsennemy) then {
		_unit addWeapon "CUP_launch_Mk153Mod0";
		_unit addSecondaryWeaponItem "CUP_optic_SMAW_Scope";
	};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addBackpack "B_Carryall_oli";
	if (_rhsennemy) then {
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_smaw_HEAA";};
		_unit addItemToBackpack "rhs_mag_smaw_SR";
	};
	if (!_rhsennemy) then {
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_SMAW_HEAA_M";};
		_unit addItemToBackpack "CUP_SMAW_Spotting";
	};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_rail;
	if (_wdl) then {_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";} else {_unit addPrimaryWeaponItem "CUP_optic_HoloDesert";};
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addBackpack "CUP_B_GER_Pack_Flecktarn";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_short;
	_unit addWeapon "CUP_hgun_Glock17";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_Kestrel4500";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";};
	_unit addBackpack "B_AssaultPack_khk";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m118_special_Mag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_sr25";
	_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
	_unit addPrimaryWeaponItem "CUP_optic_SB_11_4x20_PM";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "ACE_Vector";
	_unit additemtobackpack "rhsusf_acc_SpecterDR_A";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 6 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 4 do {_unit addItemToVest "rhsusf_mag_6Rnd_M433_HEDP";};
	_unit addBackpack "B_AssaultPack_khk";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_mag_6Rnd_M433_HEDP";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_mag_6Rnd_M713_red";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_mag_6Rnd_M585_white";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m32";
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addBackpack "CUP_B_GER_Pack_Flecktarn";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "CUP_30Rnd_556x45_G36";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Green";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_long;
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_long;
	_unit addWeapon "CUP_hgun_Glock17";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest";
	for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_long;
	_unit addWeapon "CUP_hgun_Glock17";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "CUP_V_B_GER_Carrier_Rig";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addHeadgear "H_HelmetCrew_I";

	comment "Add weapons";
	_unit addWeapon _weapon_rail;
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest "CUP_V_B_GER_Carrier_Rig";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addItemToVest "B_IR_Grenade";
	_unit addItemToVest "ACE_HandFlare_Green";
	_unit addHeadgear "H_PilotHelmetHeli_O";

	comment "Add weapons";
	_unit addWeapon _weapon_rail;
	_unit addWeapon "CUP_hgun_Glock17";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
	if (_wdl) then {_unit forceAddUniform "CUP_U_B_GER_Fleck_Ghillie";} else {_unit forceAddUniform "CUP_U_B_GER_Ghillie";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 4 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	_unit addVest "CUP_V_B_GER_Carrier_Rig";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACE_Kestrel4500";
	_unit addItemToVest "ACE_ATragMX";
	_unit addItemToVest "ACE_RangeCard";
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_5Rnd_86x70_L115A1";};
	_unit addBackpack "B_AssaultPack_khk";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "CUP_5Rnd_86x70_L115A1";};
	_unit addGoggles "G_Balaclava_oli";

	comment "Add weapons";
	if (_wdl) then {_unit addWeapon "CUP_srifle_AWM_wdl";} else {_unit addWeapon "CUP_srifle_AWM_des";};
	_unit addPrimaryWeaponItem "CUP_optic_Leupold_VX3";
	if (_wdl) then {_unit addPrimaryWeaponItem "bipod_01_F_blk";} else {_unit addPrimaryWeaponItem "bipod_01_F_snd";};
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "Rangefinder";
	_unit additemtobackpack "CUP_optic_AN_PVS_4";

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
	if (_wdl) then {_unit forceAddUniform "CUP_U_B_GER_Fleck_Ghillie";} else {_unit forceAddUniform "CUP_U_B_GER_Ghillie";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "CUP_V_B_GER_Carrier_Rig";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACE_Kestrel4500";
	_unit addItemToVest "ACE_ATragMX";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	_unit addBackpack "B_AssaultPack_khk";
	_unit addItemToBackpack "ACE_Tripod";
	_unit addItemToBackpack "ACE_SpottingScope";
	_unit addGoggles "G_Bandanna_tan";

	comment "Add weapons";
	_unit addWeapon _weapon_rail;
	if (_wdl) then {_unit addPrimaryWeaponItem "CUP_muzzle_snds_G36_black";_unit addPrimaryWeaponItem "rhsusf_acc_SpecterDR_OD";} else {_unit addPrimaryWeaponItem "CUP_muzzle_snds_G36_desert";_unit addPrimaryWeaponItem "rhsusf_acc_SpecterDR_D";};
	_unit addWeapon "CUP_hgun_Glock17";
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest "CUP_V_B_GER_Carrier_Vest_3";
	for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_556x45_G36";};
	for "_i" from 1 to 5 do {_unit addItemToVest "SmokeShellBlue";};
	_unit addBackpack "CUP_B_GER_Pack_Flecktarn";
	_unit addItemToBackpack "ACRE_PRC117F";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellPurple";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_rail;
	if (_wdl) then {_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";} else {_unit addPrimaryWeaponItem "CUP_optic_HoloDesert";};
	_unit addWeapon "CUP_hgun_Glock17";
	_unit addWeapon "Laserdesignator";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
};
