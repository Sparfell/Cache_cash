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
private ["_rhsennemy","_uniform","_helmet","_nvg","_lamp","_face"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,17,18,19,100,106,108,109]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_uniform = ["U_MU_B_soldier_wdl","U_MU_B_soldier_wdl","U_MU_B_soldier_wdl_vest"];
	_helmet = ["rhssaf_helmet_m97_woodland_black_ess","rhssaf_helmet_m97_woodland_black_ess","rhssaf_helmet_m97_woodland_black_ess_bare"];
	_face = ["","CUP_FR_NeckScarf","CUP_FR_NeckScarf2","","","",""];
	if ((paramsArray select 3) == 1) then {
		_nvg = true;
		_helmet = ["rhssaf_helmet_m97_woodland"];
	};
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
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "HandGrenade";
	_unit addItemToUniform "rhs_m136_mag";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addVest "rhssaf_vest_otv_md2camo";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
	_unit addItemToVest "B_IR_Grenade";
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d10_LMT";
	_unit addPrimaryWeaponItem "optic_MRCO";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "HandGrenade";
	_unit addItemToUniform "rhs_m136_mag";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addVest "rhssaf_vest_otv_md2camo";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
	_unit addBackpack "rhssaf_kitbag_md2camo";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Yellow";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d145";
	_unit addPrimaryWeaponItem "optic_MRCO";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addItemToVest "HandGrenade";
	_unit addBackpack "rhssaf_kitbag_md2camo";
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
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d145";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_200rnd_556x45_M_SAW";};
	_unit addBackpack "rhssaf_kitbag_md2camo";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m249_pip_S_para";
	_unit addPrimaryWeaponItem "optic_MRCO";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addItemToVest "HandGrenade";
	_unit addBackpack "rhssaf_kitbag_md2camo";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d145";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_100Rnd_762x51_m62_tracer";};
	_unit addBackpack "rhssaf_kitbag_md2camo";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_100Rnd_762x51_m62_tracer";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m240G";
	_unit addPrimaryWeaponItem "optic_tws_mg";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "rhsusf_ANPVS_14";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addItemToVest "HandGrenade";
	_unit addBackpack "rhssaf_kitbag_md2camo";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsusf_100Rnd_762x51_m62_tracer";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d145";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "optic_MRCO";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addItemToVest "HandGrenade";
	_unit addBackpack "rhssaf_kitbag_md2camo";
	_unit addItemToBackpack "CUP_Dragon_EP1_M";
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d145";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	_unit addWeapon "CUP_launch_M47";
	_unit addItemToBackpack "CUP_Dragon_EP1_M";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};

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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addItemToVest "HandGrenade";
	_unit addBackpack "rhssaf_kitbag_md2camo";
	_unit addItemToBackpack "CUP_Dragon_EP1_M";
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d145";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "optic_MRCO";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addItemToVest "HandGrenade";
	_unit addBackpack "rhssaf_kitbag_md2camo";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_M26_Clacker";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d145";
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_Kestrel4500";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	for "_i" from 1 to 9 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d145";
	_unit addPrimaryWeaponItem "optic_tws";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
	_unit addBackpack "rhssaf_kitbag_md2camo";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_M433_HEDP";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "UGL_FlareWhite_F";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d145_m320";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "optic_MRCO";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addItemToVest "HandGrenade";
	_unit addBackpack "rhssaf_kitbag_md2camo";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_HandFlare_Yellow";};
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d145";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "optic_MRCO";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addItemToVest "HandGrenade";
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d145";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addItemToVest "HandGrenade";
	_unit addHeadgear (selectrandom _helmet);
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d145";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "V_TacVest_oli";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_microDAGR";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addHeadgear "H_HelmetCrew_I";
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d10";
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "V_TacVest_oli";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_microDAGR";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Yellow";};
	_unit addHeadgear "H_PilotHelmetHeli_O";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d10";
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};

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
	_unit forceAddUniform "U_B_FullGhillie_sard";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_ATragMX";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_15Rnd_9x19_M9";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_Chestrig_rgr";
	for "_i" from 1 to 6 do {_unit addItemToVest "5Rnd_127x108_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "5Rnd_127x108_APDS_Mag";};
	_unit addBackpack "B_AssaultPack_rgr";
	_unit additemToBackpack "CUP_optic_AN_PVS_4";
	_unit addGoggles "G_Balaclava_oli";

	comment "Add weapons";
	_unit addWeapon "srifle_GM6_F";
	_unit addPrimaryWeaponItem "rhsusf_acc_premier";
	_unit addWeapon "CUP_hgun_M9";
	_unit addHandgunItem "CUP_muzzle_snds_M9";
	_unit addWeapon "Rangefinder";

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
	_unit forceAddUniform "U_B_FullGhillie_sard";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_ATragMX";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_15Rnd_9x19_M9";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_Chestrig_rgr";
	_unit addItemToVest "ACE_SpottingScope";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack "B_AssaultPack_rgr";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "5Rnd_127x108_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "5Rnd_127x108_APDS_Mag";};
	_unit addGoggles "G_Balaclava_oli";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d10";
	_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
	_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
	_unit addPrimaryWeaponItem "optic_tws";
	_unit addPrimaryWeaponItem "rhsusf_acc_grip1";
	_unit addWeapon "CUP_hgun_M9";
	_unit addHandgunItem "CUP_muzzle_snds_M9";
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
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "rhssaf_vest_otv_md2camo";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACE_IR_Strobe_Item";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addItemToVest "HandGrenade";
	_unit addItemToVest "B_IR_Grenade";
	_unit addBackpack "B_AssaultPack_rgr";
	_unit addItemToBackpack "ACRE_PRC117F";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellPurple";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellGreen";};
	_unit addHeadgear "rhssaf_booniehat_woodland";
	_unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_hk416d145";
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addWeapon "Laserdesignator";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
};
