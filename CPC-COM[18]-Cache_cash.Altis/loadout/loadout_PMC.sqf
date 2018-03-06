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
	if ((paramsArray select 6) in [0,2,14,17,18,19,100,106,108,109]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_uniform = ["CUP_I_B_PMC_Unit_24","CUP_I_B_PMC_Unit_23","CUP_I_B_PMC_Unit_22","CUP_I_B_PMC_Unit_21","CUP_I_B_PMC_Unit_20","CUP_I_B_PMC_Unit_19","CUP_I_B_PMC_Unit_17","CUP_I_B_PMC_Unit_16","CUP_I_B_PMC_Unit_15","CUP_I_B_PMC_Unit_14","CUP_I_B_PMC_Unit_13","CUP_I_B_PMC_Unit_12","CUP_I_B_PMC_Unit_11","CUP_I_B_PMC_Unit_10","CUP_I_B_PMC_Unit_9","CUP_I_B_PMC_Unit_8","CUP_I_B_PMC_Unit_7","CUP_I_B_PMC_Unit_6","CUP_I_B_PMC_Unit_5","CUP_I_B_PMC_Unit_4","CUP_I_B_PMC_Unit_3","CUP_I_B_PMC_Unit_2","CUP_I_B_PMC_Unit_1"];
	_helmet = ["CUP_H_PMC_Cap_Burberry","CUP_H_PMC_Cap_Grey","CUP_H_PMC_Cap_Tan","CUP_H_PMC_Cap_Back_EP_Grey","CUP_H_PMC_Cap_Back_EP_Tan","CUP_H_PMC_Cap_Back_PRR_Burberry","CUP_H_PMC_Cap_Back_PRR_Grey","CUP_H_PMC_Cap_Back_PRR_Tan","CUP_H_PMC_Cap_EP_Grey","CUP_H_PMC_Cap_EP_Tan","CUP_H_FR_Cap_Headset_Green","CUP_H_PMC_Cap_PRR_Burberry","CUP_H_PMC_Cap_PRR_Grey","CUP_H_PMC_Cap_PRR_Tan","CUP_H_PMC_EP_Headset","CUP_H_PMC_PRR_Headset"];
	_vest = ["CUP_V_PMC_CIRAS_Black_Patrol","CUP_V_PMC_CIRAS_Coyote_Patrol","CUP_V_PMC_IOTV_Black_Patrol","CUP_V_PMC_IOTV_Coyote_Patrol"];
	_vest_l = ["CUP_V_PMC_CIRAS_Black_Veh","CUP_V_PMC_CIRAS_Coyote_Veh"];
	_vest_tl = ["CUP_V_PMC_CIRAS_Black_TL","CUP_V_PMC_CIRAS_Coyote_TL","CUP_V_PMC_IOTV_Black_TL","CUP_V_PMC_IOTV_Coyote_TL"];
	_weapon = ["rhs_weap_m4_carryhandle","rhs_weap_m4_carryhandle","rhs_weap_m4_carryhandle_mstock"];
	_scope = ["rhsusf_acc_eotech_552","rhsusf_acc_compm4","rhsusf_acc_eotech_552","rhsusf_acc_compm4","rhsusf_acc_ACOG","rhsusf_acc_ELCAN"];
	_flash = ["acc_flashlight","rhs_acc_2dpZenit_ris","rhsusf_acc_M952V","rhsusf_acc_wmx"];
	_handguard = ["rhsusf_acc_grip2","rhs_acc_grip_ffg2","rhsusf_acc_grip1","rhsusf_acc_grip3","","",""];
	_sac = ["B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_cbr","B_TacticalPack_blk","B_TacticalPack_oli","B_MU_TacticalPack_cbr"];
	_nvg_item = ["CUP_NVG_PVS14","CUP_NVG_PVS7","CUP_NVG_HMNVS"];
	
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
	for "_i" from 1 to 3 do {_unit addItemToUniform "SmokeShellBlue";};
	for "_i" from 1 to 3 do {_unit addItemToUniform "SmokeShellPurple";};
	_unit addVest (selectrandom _vest_tl);
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_IR_Strobe_Item";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem (selectrandom _scope);
	_unit addPrimaryWeaponItem (selectrandom _handguard);
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst3";};
	if (_lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
	for "_i" from 1 to 3 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest (selectrandom _vest_tl);
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_IR_Strobe_Item";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem (selectrandom _scope);
	_unit addPrimaryWeaponItem (selectrandom _handguard);
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst3";};
	if (_lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
	_unit addVest (selectrandom _vest_l);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addBackpack (selectrandom _sac);
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
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem (selectrandom _scope);
	_unit addPrimaryWeaponItem (selectrandom _handguard);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "rhsusf_weap_m9";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest "CUP_V_PMC_IOTV_Black_AR";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_200rnd_556x45_M_SAW";};
	_unit addBackpack (selectrandom _sac);
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m249_pip_S_para";
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest (selectrandom _vest);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addBackpack (selectrandom _sac);
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_200rnd_556x45_M_SAW";};

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem (selectrandom _scope);
	_unit addPrimaryWeaponItem (selectrandom _handguard);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest "CUP_V_PMC_IOTV_Black_AR";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_50Rnd_762x51";};
	_unit addBackpack (selectrandom _sac);
	for "_i" from 1 to 5 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m240B_CAP";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_MDO";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest (selectrandom _vest);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addBackpack (selectrandom _sac);
	for "_i" from 1 to 6 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";};

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem (selectrandom _scope);
	_unit addPrimaryWeaponItem (selectrandom _handguard);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "SmokeShell";
	_unit addItemToUniform "CUP_HandGrenade_M67";
	for "_i" from 1 to 4 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addVest "CUP_V_PMC_CIRAS_Coyote_Empty";
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem (selectrandom _scope);
	_unit addPrimaryWeaponItem (selectrandom _handguard);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	if (!_rhsennemy) then {
		_unit addBackpack (selectrandom _sac);
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_SMAW_HEAA_M";};
		_unit addWeapon "CUP_launch_Mk153Mod0";
		_unit addSecondaryWeaponItem "CUP_optic_SMAW_Scope";
	} else {
		_unit addBackpack "B_Carryall_khk";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_smaw_HEAA";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_smaw_SR";};
		_unit addWeapon "rhs_weap_smaw_green";
		_unit addSecondaryWeaponItem "rhs_weap_optic_smaw";
	};
	_unit addWeapon "Binocular";
	_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
	_unit addVest (selectrandom _vest_l);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addHeadgear (selectrandom _helmet);
	if (!_rhsennemy) then {
		_unit addBackpack (selectrandom _sac);
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_SMAW_HEAA_M";};
	} else {
		_unit addBackpack "B_Carryall_cbr";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_smaw_HEAA";};
	};

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem (selectrandom _scope);
	_unit addPrimaryWeaponItem (selectrandom _handguard);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "rhsusf_weap_m1911a1";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addVest (selectrandom _vest_l);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addBackpack (selectrandom _sac);
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_Clacker";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem (selectrandom _scope);
	_unit addPrimaryWeaponItem (selectrandom _handguard);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "rhsusf_weap_glock17g4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest (selectrandom _vest_l);
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";};
	_unit addBackpack "B_AssaultPack_mcamo";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m118_special_Mag";};
	for "_i" from 1 to 5 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m993_Mag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_sr25_ec";
	_unit addPrimaryWeaponItem "rhsusf_acc_SpecterDR_A";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst3";};
	if (_lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest "CUP_V_PMC_CIRAS_Black_Grenadier";
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
	_unit addBackpack (selectrandom _sac);
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	for "_i" from 1 to 11 do {_unit addItemToBackpack "rhs_mag_M433_HEDP";};
	for "_i" from 1 to 5 do {_unit addItemToBackpack "rhs_mag_m713_Red";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_m203S";
	_unit addPrimaryWeaponItem (selectrandom _scope);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest (selectrandom _vest);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addBackpack (selectrandom _sac);
	for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "CUP_HandGrenade_M67";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Green";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem (selectrandom _scope);
	_unit addPrimaryWeaponItem (selectrandom _handguard);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest (selectrandom _vest);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem (selectrandom _scope);
	_unit addPrimaryWeaponItem (selectrandom _handguard);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest (selectrandom _vest);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem (selectrandom _scope);
	_unit addPrimaryWeaponItem (selectrandom _handguard);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_M67";
	for "_i" from 1 to 3 do {_unit addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
	_unit addVest (selectrandom _vest_l);
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addHeadgear "CUP_H_PMC_EP_Headset";

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "rhsusf_weap_m9";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemGPS";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_M67";
	for "_i" from 1 to 3 do {_unit addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
	_unit addVest (selectrandom _vest_l);
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addHeadgear "CUP_H_PMC_EP_Headset";

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "rhsusf_weap_m9";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemGPS";
	if (_nvg or _lamp) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_ATragMX";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "SmokeShell";
	_unit addItemToUniform "CUP_HandGrenade_M67";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addVest (selectrandom _vest_l);
	_unit addItemToVest "rhsusf_mag_10Rnd_STD_50BMG_M33";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
	_unit addBackpack "B_Kitbag_mcamo";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsusf_mag_10Rnd_STD_50BMG_M33";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_M107";
	_unit addPrimaryWeaponItem "rhsusf_acc_premier";
	_unit addWeapon "rhsusf_weap_glock17g4";
	_unit addHandgunItem "rhsusf_acc_omega9k";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "CUP_NVG_PVS7";};
	if (_nvg or _lamp) then {_unit addItemToBackpack "rhsusf_acc_premier_anpvs27";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_ATragMX";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest (selectrandom _vest);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	_unit addBackpack "B_Kitbag_rgr";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_mag_10Rnd_STD_50BMG_M33";};
	for "_i" from 1 to 5 do {_unit addItemToBackpack "rhsusf_mag_10Rnd_STD_50BMG_mk211";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d10";
	_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
	_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
	_unit addPrimaryWeaponItem "rhsusf_acc_grip1";
	_unit addWeapon "Laserdesignator";

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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_M67";};
	_unit addVest "CUP_V_PMC_CIRAS_Black_Grenadier";
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_m713_Red";};
	_unit addBackpack (selectrandom _sac);
	_unit addItemToBackpack "ACRE_PRC117F";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_mag_m713_Red";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
	for "_i" from 1 to 5 do {_unit addItemToBackpack "SmokeShellBlue";};
	for "_i" from 1 to 5 do {_unit addItemToBackpack "SmokeShellPurple";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
	_unit addHeadgear "CUP_H_PMC_PRR_Headset";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_m203S";
	_unit addPrimaryWeaponItem (selectrandom _scope);
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst3";};
	if (_lamp) then {_unit addPrimaryWeaponItem (selectrandom _flash);};
	_unit addWeapon "Laserdesignator";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem (selectrandom _nvg_item);};
};
