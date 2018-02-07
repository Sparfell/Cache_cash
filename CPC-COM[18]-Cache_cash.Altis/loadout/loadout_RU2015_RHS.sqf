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
private ["_rhsennemy","_uniform","_uniform2","_helmet","_helmet2","_wdl","_des","_nvg","_lamp","_helmetnight"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,100,106]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_wdl = false;
	_des = false;
	_uniform = "";
	_uniform2 = "";
	_helmet = [];
	_helmet2 = [];
	_helmetnight = [];

	//WDL
	if (CPC_MAP in ["altis","tanoa","chernarus","chernarus_summer","sara","FDF_Isle1_a","woodland_acr","pja305","noe","eden"]) then 
	{
		_uniform = "rhs_uniform_emr_patchless";
		_uniform2 = "rhs_uniform_df15";
		_helmet = ["rhs_6b7_1m","rhs_6b7_1m_bala1","rhs_6b7_1m_bala2","rhs_6b7_1m_ess","rhs_6b7_1m_ess_bala","rhs_6b7_1m_olive","rhs_6b7_1m_bala1_olive","rhs_6b7_1m_bala2_olive","rhs_6b7_1m_emr","rhs_6b7_1m_bala1_emr","rhs_6b7_1m_bala2_emr","rhs_6b7_1m_emr_ess","rhs_6b7_1m_emr_ess_bala"];
		_helmetnight = ["rhs_6b47","rhs_6b47_bala","rhs_6b47_ess","rhs_6b47_ess_bala"];
		_helmet2 =["rhs_tsh4","rhs_tsh4_bala"];
		_wdl = true;		
	};
	//DES
	if (CPC_MAP in ["takistan","pja307","isladuala3"]) then 
	{
		_uniform = "rhs_uniform_emr_des_patchless";
		_uniform2 = "rhs_uniform_df15_tan";
		_helmet = ["rhs_6b7_1m","rhs_6b7_1m_bala1","rhs_6b7_1m_bala2","rhs_6b7_1m_ess","rhs_6b7_1m_ess_bala","rhs_6b7_1m_olive","rhs_6b7_1m_bala1_olive","rhs_6b7_1m_bala2_olive"];
		_helmetnight = ["rhs_6b47","rhs_6b47_bala","rhs_6b47_ess","rhs_6b47_ess_bala"];
		_helmet2 =["rhs_tsh4","rhs_tsh4_bala"];
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addVest "rhs_6b23_digi_6sh92_headset_mapcase";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_green";};
	for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellOrange";};
	for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellYellow";};
	_unit addItemToVest "O_IR_Grenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "rhs_acc_1p63";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addVest "rhs_6b23_digi_6sh92_headset";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_green";};
	_unit addBackpack "rhs_assault_umbts";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_rgd5";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "rhs_acc_1p78";
	_unit addWeapon "rhs_pdu4";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_rpg26";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_RPG18";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addVest "rhs_6b23_digi_medic";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
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
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addVest "rhs_6b23_digi_rifleman";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
	_unit addItemToVest "rhs_100Rnd_762x54mmR";
	_unit addBackpack "rhs_assault_umbts";
	_unit addItemToBackpack "rhs_100Rnd_762x54mmR";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pkp";
	_unit addPrimaryWeaponItem "rhs_acc_1p29";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addVest "rhs_6b23_digi_6sh92";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	_unit addBackpack "rhs_assault_umbts";
	_unit addItemToBackpack "rhs_100Rnd_762x54mmR";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addVest "rhs_6b23_digi_rifleman";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
	_unit addItemToVest "rhs_100Rnd_762x54mmR";
	_unit addBackpack "rhs_assault_umbts";
	_unit addItemToBackpack "rhs_100Rnd_762x54mmR";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pkp";
	_unit addPrimaryWeaponItem "rhs_acc_1p29";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addVest "rhs_6b23_digi_6sh92";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	_unit addBackpack "rhs_assault_umbts";
	_unit addItemToBackpack "rhs_100Rnd_762x54mmR";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addVest "rhs_6b23_digi_6sh92";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
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
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addVest "rhs_6b23_digi_6sh92";
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
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addVest "rhs_6b23_digi_engineer";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	_unit addBackpack "rhs_assault_umbts_engineer_empty";
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest "rhs_6b23_6sh116";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
	for "_i" from 1 to 18 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_svdp";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m2";
	_unit addWeapon "rhs_pdu4";
	_unit additemtovest "rhs_acc_1pn93_1";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addVest "rhs_6b23_6sh116_vog";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_VOG25";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_GRD40_Red";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_GDM40";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m_gp25";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	_unit addPrimaryWeaponItem "rhs_acc_1p63";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addVest "rhs_6b23_digi_rifleman";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	_unit addBackpack "rhs_assault_umbts";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rgd5";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_HandFlare_Green";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addVest "rhs_6b23_6sh116";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_rpg26";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_RPG18";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addVest "rhs_6b23_6sh116";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addItemToVest "rhs_mag_rgd5";
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp or _nvg) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addPrimaryWeaponItem "rhs_acc_1p63";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
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
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addVest "rhs_6b23_digi_crew";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addHeadgear (selectrandom _helmet2);

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
	_unit forceAddUniform _uniform2;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "O_IR_Grenade";
	_unit addVest "rhs_vest_commander";
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_9x19_17";};
	_unit addHeadgear "rhs_zsh7a_mike";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pya";
	_unit addWeapon "Binocular";

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
	if (_wdl) then {_unit forceAddUniform "rhs_uniform_gorka_r_g"};
	if (_des) then {_unit forceAddUniform "rhs_uniform_gorka_r_g"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addVest "rhs_6sh92_digi_radio";
	for "_i" from 1 to 14 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
	_unit addGoggles "rhs_balaclava1_olive";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_svdp_wd";
	_unit addPrimaryWeaponItem "rhs_acc_tgpv";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m2";
	_unit addWeapon "rhs_pdu4";
	_unit additemtovest "rhs_acc_1pn93_1";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "CUP_NVG_HMNVS"};
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
	if (_wdl) then {_unit forceAddUniform "rhs_uniform_gorka_r_g"};
	if (_des) then {_unit forceAddUniform "rhs_uniform_gorka_r_g"};
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addVest "rhs_6sh92_digi_radio";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_20rnd_9x39mm_SP5";};
	_unit addBackpack "B_FieldPack_khk";
	for "_i" from 1 to 9 do {_unit addItemToBackpack "rhs_20rnd_9x39mm_SP6";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_20rnd_9x39mm_SP5";};
	if (_wdl) then {_unit addHeadgear "rhs_beanie_green"};
	if (_des) then {_unit addHeadgear "rhs_Booniehat_digi"};
	if (_wdl) then {_unit addGoggles "G_Bandanna_oli"};
	if (_des) then {_unit addGoggles "G_Bandanna_khk"};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_vss_grip";
	_unit addPrimaryWeaponItem "rhs_acc_perst1ik_ris";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m21";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "CUP_NVG_HMNVS"};
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
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
	_unit addVest "rhs_6b23_digi_6sh92_radio";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACE_MapTools";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellPurple";};
	_unit addBackpack "rhs_assault_umbts";
	_unit addItemToBackpack "ACRE_PRC117F";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
	if (_nvg) then {_unit addHeadgear (selectrandom _helmetnight)} else {_unit addHeadgear (selectrandom _helmet)};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_nvg) then {_unit addPrimaryWeaponItem "rhs_acc_perst1ik";};
	_unit addPrimaryWeaponItem "rhs_acc_1p63";
	_unit addWeapon "Laserdesignator";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "rhs_1PN138";};
};
