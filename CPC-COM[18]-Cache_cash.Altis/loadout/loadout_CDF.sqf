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
private ["_rhsennemy","_uniform","_helmet","_nvg","_lamp","_wdl","_des"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,17,18,19,100,106,108,109]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_wdl = false;
	_des = false;
	//WDL
	if (CPC_MAP in ["altis","tanoa","chernarus","chernarus_summer","sara","fdf_isle1_a","woodland_acr","pja305","noe","eden"]) then 
	{
		_wdl = true;
	};
	//DES
	if (CPC_MAP in ["takistan","isladuala3","pja307"]) then 
	{
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5_officer";} else {_unit addVest "rhs_6b5_officer_khaki";};
	_unit addItemToVest "ACE_DAGR";
	_unit addItemToVest "rhs_mag_9x18_8_57N181S";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Yellow";};
	if (_wdl) then {_unit addHeadgear "rhsgref_fieldcap_ttsko_mountain";} else {_unit addHeadgear "rhs_fieldcap_khk";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m92";
	_unit addWeapon "rhs_weap_makarov_pm";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then  {_unit linkitem "CUP_NVG_PVS7";};
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5";} else {_unit addVest "rhs_6b5_khaki";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm_tracer";};
	_unit addBackpack "CUP_B_SLA_Medicbag";
	for "_i" from 1 to 8 do {_unit addItemToBackpack "rhs_30Rnd_762x39mm";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rgd5";};
	_unit addHeadgear "rhsgref_fieldcap_ttsko_mountain";
	if (_wdl) then {_unit addHeadgear "rhsgref_fieldcap_ttsko_mountain";} else {_unit addHeadgear "rhs_fieldcap_khk";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m70ab2";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_rpg75";} else {_unit addWeapon "CUP_launch_RPG18";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then  {_unit linkitem "CUP_NVG_PVS7";};
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5_medic";} else {_unit addVest "rhs_6b5_medic_khaki";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack "rhs_sidor";
	_unit addItemToBackpack "ACE_personalAidKit";
	_unit addItemToBackpack "ACE_surgicalKit";
	for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_quikclot";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV_250";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_salineIV_500";};
	for "_i" from 1 to 1 do {_unit addItemToBackpack "ACE_salineIV";};
	for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_morphine";};
	for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_epinephrine";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_tourniquet";};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m70b1";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5";} else {_unit addVest "rhs_6b5_khaki";};
	_unit addItemToVest "rhs_100Rnd_762x54mmR_green";
	_unit addBackpack "rhs_sidor";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pkm";
	_unit addWeapon "Binocular";
	_unit addItem "rhs_100Rnd_762x54mmR_green";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5";} else {_unit addVest "rhs_6b5_khaki";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack "rhs_sidor";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m70b1";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5";} else {_unit addVest "rhs_6b5_khaki";};
	_unit addItemToVest "rhs_100Rnd_762x54mmR_green";
	_unit addBackpack "rhs_sidor";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pkm";
	_unit addWeapon "Binocular";
	_unit addItem "rhs_100Rnd_762x54mmR_green";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5";} else {_unit addVest "rhs_6b5_khaki";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack "rhs_sidor";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m70b1";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5";} else {_unit addVest "rhs_6b5_khaki";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m70ab2";
	if (_rhsennemy) then {
		_unit addWeapon "rhs_weap_rpg7";
		_unit addSecondaryWeaponItem "rhs_acc_pgo7v3";
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7V_mag";};
	} else {
		_unit addWeapon "CUP_launch_RPG7V";
		_unit addSecondaryWeaponItem "CUP_optic_PGO7V3";
		_unit addBackpack "CUP_B_RPGPack_Khaki";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_PG7VM_M";};
	};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5";} else {_unit addVest "rhs_6b5_khaki";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	if (_rhsennemy) then {
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7V_mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_OG7V_mag";};
	} else {
		_unit addBackpack "CUP_B_RPGPack_Khaki";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_PG7VM_M";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_OG7_M";};
	};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m70ab2";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5";} else {_unit addVest "rhs_6b5_khaki";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack "CUP_B_CivPack_WDL";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_Clacker";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m70ab2";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5_sniper";} else {_unit addVest "rhs_6b5_sniper_khaki";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhsgref_10Rnd_792x57_m76";};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m76";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m2";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5";} else {_unit addVest "rhs_6b5_khaki";};
	for "_i" from 1 to 3 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_VOG25";};
	_unit addBackpack "rhs_sidor";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
	for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_30Rnd_762x39mm";};
	for "_i" from 1 to 8 do {_unit addItemToBackpack "rhs_VOG25";};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m70b3n_pbg40";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5";} else {_unit addVest "rhs_6b5_khaki";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack "rhs_sidor";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_30Rnd_762x39mm";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m70b1";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5";} else {_unit addVest "rhs_6b5_khaki";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m70b1";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_rpg75";} else {_unit addWeapon "CUP_launch_RPG18";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5";} else {_unit addVest "rhs_6b5_khaki";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m70b1";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	_unit addItemToUniform "rhs_mag_rgd5";
	if (_wdl) then {_unit addVest "rhs_6b5";} else {_unit addVest "rhs_6b5_khaki";};
	_unit addItemToVest "ACRE_PRC343";
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addHeadgear "rhs_tsh4";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m92";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then  {_unit linkitem "CUP_NVG_PVS7";};
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_DAGR";
	_unit addVest "rhs_vest_commander";
	_unit addItemToVest "rhs_mag_9x18_8_57N181S";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addHeadgear "rhs_zsh7a_mike_green";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m92";
	_unit addWeapon "rhs_weap_makarov_pm";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then  {_unit linkitem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	_unit addItemToUniform "rhs_mag_rgd5";
	_unit addVest "rhsgref_6b23_khaki_sniper";
	_unit addItemToVest "ACE_Kestrel4500";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_RangeCard";
	for "_i" from 1 to 14 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
	if (_wdl) then {_unit addHeadgear "rhs_beanie_green";} else {_unit addHeadgear "rhs_fieldcap_khk";};
	_unit addGoggles "rhs_scarf";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_svdp_wd";
	_unit addPrimaryWeaponItem "rhs_acc_tgpv";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m2";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then  {_unit linkitem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	_unit addItemToUniform "rhs_mag_rgd5";
	_unit addVest "rhsgref_6b23_khaki_sniper";
	_unit addItemToVest "ACE_Kestrel4500";
	_unit addItemToVest "ACE_MapTools";
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_10rnd_9x39mm_SP5";};
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_10rnd_9x39mm_SP6";};
	if (_wdl) then {_unit addHeadgear "rhs_beanie_green";} else {_unit addHeadgear "rhs_fieldcap_khk";};
	_unit addGoggles "rhs_scarf";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_vss";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m21";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then  {_unit linkitem "CUP_NVG_PVS7";};
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
	if (_wdl) then {_unit forceAddUniform "rhsgref_uniform_ttsko_forest";} else {_unit forceAddUniform "rhs_uniform_m88_patchless";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	if (_wdl) then {_unit addVest "rhs_6b5_officer";} else {_unit addVest "rhs_6b5_officer_khaki";};
	_unit addItemToVest "ACE_DAGR";
	_unit addItemToVest "rhs_mag_9x18_8_57N181S";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Yellow";};
	for "_i" from 1 to 3 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack "rhs_sidor";
	_unit addItemToBackpack "ACRE_PRC117F";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_30Rnd_762x39mm";};
	_unit addHeadgear "rhs_ssh68";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m70b1";
	_unit addWeapon "rhs_weap_makarov_pm";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then  {_unit linkitem "CUP_NVG_PVS7";};
};
