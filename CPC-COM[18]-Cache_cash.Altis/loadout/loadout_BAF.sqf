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
private ["_rhsennemy","_uniform","_helmet","_helmetcrew","_dpm","_ddpm","_nvg","_lamp","_sac","_vest_r","_vest_sac","_vest_empty","_vest_pilot","_vest_gl"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,100,106]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_dpm = false;
	_ddpm = false;
	_uniform = "";
	_helmet = [];
	_helmetnight = "";
	_helmetcrew = "";
	_vest_r = "";
	_vest_sac = "";
	_vest_empty = "";
	_vest_pilot = "";
	_vest_gl = "";
	_sac = "";

	//DPM
	if (worldName in ["Sara","Altis","Tanoa","chernarus","Chernarus","FDF_Isle1_a","Woodland_ACR","pja305","noe","eden"]) then 
	{
		_uniform = ["CUP_U_B_BAF_DPM_S2_UnRolled","CUP_U_B_BAF_DPM_S1_RolledUp","CUP_U_B_BAF_DPM_Tshirt"];
		_helmet = ["CUP_H_BAF_Helmet_1_DPM","CUP_H_BAF_Helmet_Net_2_DPM","CUP_H_BAF_Helmet_2_DPM","CUP_H_BAF_Helmet_3_DPM","CUP_H_BAF_Helmet_4_DPM"];
		_helmetnight = ["CUP_H_BAF_Helmet_1_DPM"];
		_helmetcrew = "CUP_H_BAF_Crew_Helmet_DPM";
		_vest_r = "CUP_V_BAF_Osprey_Mk2_DPM_Soldier1";
		_vest_sac = "CUP_V_BAF_Osprey_Mk2_DPM_Sapper";
		_vest_empty = "CUP_V_BAF_Osprey_Mk2_DPM_Empty";
		_vest_pilot = "CUP_V_BAF_Osprey_Mk2_DPM_Pilot";
		_vest_gl = "CUP_V_BAF_Osprey_Mk2_DPM_Grenadier";
		_sac = "B_TacticalPack_oli";
		_dpm = true;		
	};
	//DDPM
	if (worldName in ["IslaDuala3","takistan","pja307"]) then 
	{
		_uniform = ["CUP_U_B_BAF_DDPM_S2_UnRolled","CUP_U_B_BAF_DDPM_S1_RolledUp","CUP_U_B_BAF_DDPM_Tshirt"];
		_helmet = ["CUP_H_BAF_Helmet_1_DDPM","CUP_H_BAF_Helmet_Net_2_DDPM","CUP_H_BAF_Helmet_2_DDPM","CUP_H_BAF_Helmet_3_DDPM","CUP_H_BAF_Helmet_4_DDPM"];
		_helmetnight = ["CUP_H_BAF_Helmet_1_DDPM"];
		_helmetcrew = "CUP_H_BAF_Crew_Helmet_DDPM";
		_vest_r = "CUP_V_BAF_Osprey_Mk2_DDPM_Soldier1";
		_vest_sac = "CUP_V_BAF_Osprey_Mk2_DDPM_Sapper";
		_vest_empty = "CUP_V_BAF_Osprey_Mk2_DDPM_Empty";
		_vest_pilot = "CUP_V_BAF_Osprey_Mk2_DDPM_Pilot";
		_vest_gl = "CUP_V_BAF_Osprey_Mk2_DDPM_Grenadier";
		_sac = "B_MU_TacticalPack_cbr";
		_ddpm = true;
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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest _vest_r;
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellPurple";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
	_unit addHeadgear "CUP_H_BAF_Officer_Beret_PRR_O";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	if (_nvg) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_ACOG";
	_unit addWeapon "ACE_Vector";
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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest _vest_sac;
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
	_unit addBackpack _sac;
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_G";
	if (_nvg) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_ACOG";
	_unit addWeapon "ACE_Vector";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_sac;
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	_unit addBackpack _sac;
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
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	if (_nvg) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";

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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_empty;
	_unit addItemToVest "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";
	_unit addItemToVest "CUP_HandGrenade_L109A1_HE";
	_unit addBackpack _sac;
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_lmg_L110A1";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addWeapon "ACE_Vector";

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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_sac;
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	_unit addBackpack _sac;
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	if (_nvg) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";
	_unit addWeapon "ACE_Vector";

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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_empty;
	_unit addItemToVest "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";
	_unit addItemToVest "CUP_HandGrenade_L109A1_HE";
	_unit addBackpack _sac;
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_lmg_L7A2";
	_unit addPrimaryWeaponItem "CUP_optic_ElcanM145";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_sac;
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	_unit addBackpack _sac;
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	if (_nvg) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_SUSAT";
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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_r;
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	if (_nvg) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";
	_unit addWeapon "CUP_launch_NLAW";

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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_r;
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	if (_nvg) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_SUSAT";
	_unit addWeapon "CUP_launch_NLAW";

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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_sac;
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	_unit addBackpack _sac;
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	if (_nvg) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";

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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_RangeCard";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_r;
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	for "_i" from 1 to 10 do {_unit addItemToVest "20Rnd_762x51_Mag";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_srifle_L129A1_HG";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_SB_11_4x20_PM";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_L109A1_HE";
	_unit addVest _vest_gl;
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 15 do {_unit addItemToVest "CUP_1Rnd_HEDP_M203";};
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_1Rnd_SmokeRed_M203";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_GL";
	if (_nvg) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_SUSAT";

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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_sac;
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	_unit addBackpack _sac;
	for "_i" from 1 to 10 do {_unit addItemToBackpack "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "CUP_HandGrenade_L109A1_HE";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Green";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	if (_nvg) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_SUSAT";

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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_r;
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	if (_nvg) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";
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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_r;
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	if (_nvg) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";

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
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_sac;
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_microDAGR";
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	_unit addHeadgear _helmetcrew;

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2";
	_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	if (_dpm) then {_unit forceAddUniform "CUP_U_B_BAF_DPM_S2_UnRolled"};
	if (_ddpm) then {_unit forceAddUniform "CUP_U_B_BAF_DDPM_S2_UnRolled"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest _vest_pilot;
	for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_9x19_MP5";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_7Rnd_45ACP_1911";};
	_unit addItemToVest "B_IR_Grenade";
	_unit addHeadgear "CUP_H_BAF_Helmet_Pilot";

	comment "Add weapons";
	_unit addWeapon "CUP_smg_MP5A5";
	_unit addWeapon "CUP_hgun_Colt1911";

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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_ATragMX";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_r;
	for "_i" from 1 to 3 do {_unit addItemToVest "CUP_7Rnd_45ACP_1911";};
	for "_i" from 1 to 5 do {_unit addItemToVest "CUP_5Rnd_86x70_L115A1";};
	if (_dpm) then {_unit addBackpack "B_AssaultPack_khk";};
	if (_ddpm) then {_unit addBackpack "B_AssaultPack_cbr";};
	for "_i" from 1 to 12 do {_unit addItemToBackpack "CUP_5Rnd_86x70_L115A1";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_hgun_Colt1911";
	if (_dpm) then {_unit addWeapon "CUP_srifle_AWM_wdl";};
	if (_ddpm) then {_unit addWeapon "CUP_srifle_AWM_des";};
	_unit addPrimaryWeaponItem "CUP_optic_SB_3_12x50_PMII";
	if (_dpm) then {_unit addPrimaryWeaponItem "bipod_01_F_blk";};
	if (_ddpm) then {_unit addPrimaryWeaponItem "bipod_01_F_snd";};
	_unit addWeapon "Rangefinder";
	_unit addItemToVest "CUP_optic_AN_PVS_4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_ATragMX";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest _vest_r;
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_G";
	_unit addPrimaryWeaponItem "CUP_muzzle_snds_L85";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	_unit addPrimaryWeaponItem "CUP_optic_ACOG";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "rhsusf_ANPVS_14";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addVest _vest_sac;
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_L109A1_HE";};
	for "_i" from 1 to 8 do {_unit addItemToVest "SmokeShellPurple";};
	if (_dpm) then {_unit addBackpack "B_AssaultPack_khk";};
	if (_ddpm) then {_unit addBackpack "B_AssaultPack_cbr";};
	_unit addItemToBackpack "ACRE_PRC117F";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
	_unit addHeadgear "rhsusf_Bowman";

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_L85A2_NG";
	if (_nvg) then {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";
	_unit addWeapon "Laserdesignator";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
};
