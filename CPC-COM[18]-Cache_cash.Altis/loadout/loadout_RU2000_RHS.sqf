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
private ["_mountain","_des","_flora","_rhsennemy","_uniform","_helmet","_nvg","_lamp","_cap","_vest_r","_vest_doc","_vest_l","_vest_tl","_vest_off","_vest_m","_vest_gl"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,17,18,19,100,106,108,109]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_uniform = "";
	_helmet = [];
	_cap = "";
	_vest_r = "";
	_vest_doc = "";
	_vest_l = "";
	_vest_tl = "";
	_vest_off = "";
	_vest_m = "";
	_vest_gl = "";
	_mountain = false;
	_des = false;
	_flora = false;

	//Mountain
	if (CPC_MAP in ["altis","isladuala3","pja307"]) then 
	{
		_uniform = "rhs_uniform_mflora_patchless";
		_helmet = ["rhs_6b27m_ml","rhs_6b27m_ml_bala","rhs_6b27m_ml_ess","rhs_6b27m_ml_ess_bala"];
		_cap = "rhs_fieldcap_ml";
		_vest_r = "rhs_6b23_ML_6sh92";
		_vest_doc = "rhs_6b23_ML_medic";
		_vest_l = "rhs_6b23_ML_rifleman";
		_vest_tl = "rhs_6b23_ML_6sh92_headset";
		_vest_off = "rhs_6b23_ML_6sh92_radio";
		_vest_m = "rhs_6b23_ML_sniper";
		_vest_gl = "rhs_6b23_ML_6sh92_vog";
		_mountain = true;
	};
	//Desert
	if (CPC_MAP in ["takistan"]) then 
	{
		_uniform = "rhs_uniform_m88_patchless";
		_helmet = ["rhs_6b27m_green","rhs_6b27m_green_bala","rhs_6b27m_green_ess","rhs_6b27m_green_ess_bala"];
		_cap = "rhs_fieldcap_khk";
		_vest_r = "rhs_6b23_6sh92";
		_vest_doc = "rhs_6b23_medic";
		_vest_l = "rhs_6b23_rifleman";
		_vest_tl = "rhs_6b23_6sh92_headset";
		_vest_off = "rhs_6b23_6sh92_radio";
		_vest_m = "rhs_6b23_sniper";
		_vest_gl = "rhs_6b23_6sh92_vog";
		_des = true;
	};
	//Flora
	if (CPC_MAP in ["tanoa","chernarus","chernarus_summer","sara","fdf_isle1_a","woodland_acr","pja305","noe","eden"]) then 
	{
		_uniform = "rhs_uniform_flora_patchless";
		_helmet = ["rhs_6b26","rhs_6b26_bala","rhs_6b26_ess","rhs_6b26_ess_bala"];
		_cap = "rhs_fieldcap";
		_vest_r = "rhs_6b23_6sh92";
		_vest_doc = "rhs_6b23_medic";
		_vest_l = "rhs_6b23_rifleman";
		_vest_tl = "rhs_6b23_6sh92_headset";
		_vest_off = "rhs_6b23_6sh92_radio";
		_vest_m = "rhs_6b23_sniper";
		_vest_gl = "rhs_6b23_6sh92_vog";
		_flora = true;
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_off;
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_microDAGR";
	for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellOrange";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_green";};
	_unit addHeadgear _cap;

	comment "Add weapons";
	_unit addWeapon "rhs_weap_aks74u";
	_unit addPrimaryWeaponItem "rhs_acc_pgs64_74u";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_tl;
	_unit addItemToVest "ACE_DAGR";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_green";};
	_unit addBackpack "rhs_assault_umbts";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_30Rnd_545x39_AK_green";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_rgd5";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellOrange";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_HandFlare_White";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "rhs_acc_1p29";
	_unit addWeapon "rhs_pdu4";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_rpg26";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_RPG18";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_doc;
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	_unit addBackpack "rhs_assault_umbts";
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
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_l;
	_unit addItemToVest "rhs_mag_rgd5";
	for "_i" from 1 to 3 do {_unit addItemToVest "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	_unit addBackpack "rhs_sidor";
	for "_i" from 1 to 7 do {_unit addItemToBackpack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_RPK74M";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_r;
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	_unit addBackpack "rhs_sidor";
	for "_i" from 1 to 7 do {_unit addItemToBackpack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_l;
	_unit addItemToVest "rhs_mag_rgd5";
	_unit addItemToVest "rhs_100Rnd_762x54mmR";
	_unit addBackpack "rhs_sidor";
	_unit addItemToBackpack "rhs_100Rnd_762x54mmR";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pkp";
	_unit addPrimaryWeaponItem "rhs_acc_1p29";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_r;
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	_unit addBackpack "rhs_sidor";
	_unit addItemToBackpack "rhs_100Rnd_762x54mmR";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_r;
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_rhsennemy) then {
		_unit addWeapon "rhs_weap_rpg7";
		_unit addSecondaryWeaponItem "rhs_acc_pgo7v3";
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_OG7V_mag";};
	};
	if (!_rhsennemy) then {
		_unit addWeapon "CUP_launch_RPG7V";
		_unit addSecondaryWeaponItem "CUP_optic_PGO7V3";
		_unit addBackpack "CUP_B_RPGPack_Khaki";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_PG7VM_M";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_OG7_M";};
	};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_r;
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	if (_rhsennemy) then {
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_OG7V_mag";};
	};
	if (!_rhsennemy) then {
		_unit addBackpack "CUP_B_RPGPack_Khaki";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_PG7VL_M";};
	};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_l;
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	_unit addBackpack "rhs_assault_umbts_engineer_empty";
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_DefusalKit";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_PipeBomb_M";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_m;
	for "_i" from 1 to 12 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_svdp";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m2";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_gl;
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_VOG25";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_GRD40_Red";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m_gp25";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_r;
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	_unit addBackpack "rhs_assault_umbts";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_rgd5";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_r;
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_rpg26";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_RPG18";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_r;
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_l;
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_DAGR";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "rhs_mag_rgd5";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addHeadgear "rhs_tsh4";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_aks74u";
	_unit addPrimaryWeaponItem "rhs_acc_pgs64_74u";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform "rhs_uniform_df15";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellOrange";};
	_unit addVest "rhs_vest_commander";
	_unit addItemToVest "ACE_IR_Strobe_Item";
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_9x18_8_57N181S";};
	_unit addHeadgear "rhs_zsh7a_mike";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_makarov_pm";

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
	if (_mountain or _des) then {_unit forceAddUniform "rhs_uniform_gorka_r_y";} else {_unit forceAddUniform "rhs_uniform_gorka_r_g";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_RangeCard";
	if (_mountain or _des) then {_unit addVest "rhsgref_6b23_khaki_sniper";} else {_unit addVest "rhs_6b23_sniper";};
	for "_i" from 1 to 12 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
	_unit addBackpack "CUP_B_RUS_Backpack";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rgd5";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
	_unit addGoggles "rhs_balaclava";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_svdp_wd";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m2";
	_unit addWeapon "rhs_pdu4";
	_unit additemtobackpack "rhs_acc_1pn93_1";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	if (_mountain or _des) then {_unit forceAddUniform "rhs_uniform_gorka_r_y";} else {_unit forceAddUniform "rhs_uniform_gorka_r_g";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	if (_mountain or _des) then {_unit addVest "rhsgref_6b23_khaki_sniper";} else {_unit addVest "rhs_6b23_sniper";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_10rnd_9x39mm_SP5";};
	_unit addBackpack "CUP_B_RUS_Backpack";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rgd5";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
	for "_i" from 1 to 7 do {_unit addItemToBackpack "rhs_10rnd_9x39mm_SP5";};
	_unit addGoggles "rhs_balaclava";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_vss_grip";
	_unit addPrimaryWeaponItem "rhs_acc_perst1ik_ris";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m21";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "CUP_NVG_HMNVS";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest _vest_off;
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellOrange";};
	_unit addBackpack "rhs_assault_umbts";
	_unit addItemToBackpack "ACRE_PRC117F";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Green";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Laserdesignator";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "CUP_NVG_HMNVS";};
};
