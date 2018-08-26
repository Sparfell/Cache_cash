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
private ["_rhsennemy","_nvg","_lamp","_helmet","_helmet_chef","_lunettes"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	_nvg = false;
	_lamp = false;
	if ((paramsArray select 6) in [0,2,14,17,18,19,100,106,108,109]) then {_rhsennemy = true};
	if ((paramsArray select 3) == 1) then {_nvg = true};
	if ((paramsArray select 3) == 2) then {_lamp = true};
	_helmet = [];
	_helmet_chef = [];
	_lunettes = [];
	
	
	// Altis
	if (CPC_MAP in ["altis"]) then 
	{
		_helmet = ["rhsusf_opscore_mc_pelt","rhsusf_opscore_mc_pelt_nsw","rhsusf_opscore_mc","rhsusf_opscore_mc_cover","rhsusf_opscore_mc_cover_pelt","rhsusf_opscore_mc_cover_pelt_cam"];
	};
	
	// WDL
	if (CPC_MAP in ["chernarus","chernarus_summer","fdf_isle1_a","woodland_acr","eden"]) then 
	{
		_helmet = ["rhsusf_ach_bare_wood_headset","rhsusf_ach_bare_wood","rhsusf_ach_bare_semi_headset","rhsusf_ach_bare_semi","rhsusf_ach_bare_headset","rhsusf_ach_bare"];
		_lunettes = ["G_Balaclava_blk","G_Balaclava_oli"];
	};
	
	//Desert
	if (CPC_MAP in ["pja307","takistan"]) then 
	{
		_helmet = ["rhsusf_opscore_paint","rhsusf_opscore_paint_pelt","rhsusf_opscore_paint_pelt_nsw","rhsusf_opscore_ut","rhsusf_opscore_ut_pelt","rhsusf_opscore_mc","rhsusf_opscore_mc_pelt"];
	};
	
	//Afrique
	if (CPC_MAP in ["isladuala3","sara","noe"]) then 
	{
		_helmet = ["rhsusf_protech_helmet_rhino","rhsusf_protech_helmet_rhino","rhsusf_protech_helmet_rhino_ess"];
	};
	
	// Jungle
	if (CPC_MAP in ["tanoa","pja305"]) then 
	{
		_helmet = ["H_Booniehat_oli","rhs_Booniehat_m81","H_Booniehat_khk","H_Bandanna_camo","CUP_H_FR_BandanaGreen","H_Bandanna_khk"];
		_helmet_chef = ["CUP_H_FR_Cap_Headset_Green","H_Booniehat_khk_hs","CUP_H_RUS_Bandana_HS","CUP_H_FR_Headband_Headset"];
	};
	
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

// Altis
if (CPC_MAP in ["altis"]) then 
{
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m18_green";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Yellow";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
		_unit addHeadgear "rhsusf_opscore_ut_pelt_nsw_cam";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m18_green";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Yellow";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
		_unit addBackpack "rhsusf_falconii_mc";
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";
		if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
		if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_medic";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
		_unit addItemToBackpack "ACE_personalAidKit";
		_unit addItemToBackpack "ACE_surgicalKit";
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_packingBandage";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_quikclot";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV_250";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV_500";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_tourniquet";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_rx01_nofilter";
		_unit addWeapon "rhsusf_weap_glock17g4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_mg";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 5 do {_unit addItemToVest "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m249_pip_S_vfg";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip1";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";
		_unit addItemToVest "rhsusf_100Rnd_556x45_mixed_soft_pouch";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_rx01_nofilter";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_mg";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_50Rnd_762x51";};
		_unit addBackpack "B_FieldPack_khk";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m61_ap";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m240G";
		_unit addPrimaryWeaponItem "rhsusf_acc_elcan";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m61_ap";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_D";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_rx01_nofilter";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		if (_rhsennemy) then {_unit addWeapon "rhs_weap_fgm148";_unit addsecondaryweaponitem "rhs_fgm148_magazine_AT";};
		if (!_rhsennemy) then {_unit addWeapon "CUP_launch_Javelin";_unit addsecondaryweaponitem "CUP_Javelin_M";};
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Carryall_mcamo";
		if (_rhsennemy) then {_unit addItemToBackpack "rhs_fgm148_magazine_AT";};
		if (!_rhsennemy) then {_unit addItemToBackpack "CUP_Javelin_M";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_TacticalPack_mcamo";
		_unit addItemToBackpack "ACE_M26_Clacker";
		_unit addItemToBackpack "ACE_EntrenchingTool";
		_unit addItemToBackpack "ACE_DefusalKit";
		_unit addItemToBackpack "SatchelCharge_Remote_Mag";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_rx01_nofilter";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACE_RangeCard";
		_unit addItemToVest "ACE_MapTools";
		_unit addItemToVest "ACE_Kestrel4500";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";};
		_unit addBackpack "rhsusf_falconii_mc";
		for "_i" from 1 to 8 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m118_special_Mag";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_sr25_ec";
		_unit addPrimaryWeaponItem "rhsusf_acc_SR25S";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230a_mrds";
		_unit addPrimaryWeaponItem "bipod_01_F_blk";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_grenadier";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		_unit addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 15 do {_unit addItemToBackpack "rhs_mag_M433_HEDP";};
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_mag_m713_Red";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_m320";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addWeapon "rhsusf_weap_glock17g4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Carryall_mcamo";
		for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_m67";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_mk84";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_an_m8hc";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Yellow";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_rx01_nofilter";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
		if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_rx01_nofilter";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_light";
		_unit addItemToVest "ACRE_PRC148";
		_unit addItemToVest "ACE_microDAGR";
		_unit addItemToVest "ACE_MapTools";
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		_unit addHeadgear "rhsusf_cvc_green_helmet";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACRE_PRC148";
		_unit addItemToVest "ACE_microDAGR";
		_unit addItemToVest "ACE_MapTools";
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		_unit addItemToVest "B_IR_Grenade";
		_unit addHeadgear "rhsusf_hgu56p";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addWeapon "rhsusf_weap_glock17g4";

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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_RangeCard";
		_unit addItemToUniform "ACE_microDAGR";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_Kestrel4500";
		_unit addItemToUniform "ACE_ATragMX";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 20 do {_unit addItemToVest "rhsusf_5Rnd_762x51_m118_special_Mag";};
		_unit addHeadgear "rhs_Booniehat_ocp";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m24sws_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_leupoldmk4_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
		_unit addPrimaryWeaponItem "rhsusf_acc_m24_silencer_d";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";
		_unit additemtovest "CUP_optic_AN_PVS_4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_Kestrel4500";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		_unit addItemToUniform "ACE_RangeCard";
		_unit addItemToUniform "ACE_ATragMX";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear "rhs_Booniehat_ocp";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "rhs_mag_m18_purple";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_m713_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HuntIR_M203";};
		_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
		_unit addItemToBackpack "ACRE_PRC117F";
		_unit addItemToBackpack "ACE_HuntIR_monitor";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_m320";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Laserdesignator";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
	};
};

// WDL
if (CPC_MAP in ["chernarus","fdf_isle1_a","woodland_acr"]) then 
{
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m18_green";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Yellow";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
		_unit addHeadgear "rhsusf_ach_bare_wood_headset";
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m18_green";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Yellow";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
		_unit addBackpack "B_AssaultPack_rgr";
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";
		if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
		if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_medic";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "rhsusf_assault_eagleaiii_coy";
		_unit addItemToBackpack "ACE_personalAidKit";
		_unit addItemToBackpack "ACE_surgicalKit";
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_packingBandage";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_quikclot";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV_250";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV_500";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_tourniquet";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_unit addWeapon "rhsusf_weap_glock17g4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_mg";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addBackpack "B_Kitbag_rgr";
		for "_i" from 1 to 5 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m249_pip_S_vfg";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip1";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_mg";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_50Rnd_762x51";};
		_unit addBackpack "B_FieldPack_khk";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m61_ap";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m240G";
		_unit addPrimaryWeaponItem "rhsusf_acc_elcan";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Kitbag_rgr";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m61_ap";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		if (_rhsennemy) then {_unit addWeapon "rhs_weap_fgm148";_unit addsecondaryweaponitem "rhs_fgm148_magazine_AT";};
		if (!_rhsennemy) then {_unit addWeapon "CUP_launch_Javelin";_unit addsecondaryweaponitem "CUP_Javelin_M";};
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Carryall_oli";
		if (_rhsennemy) then {_unit addItemToBackpack "rhs_fgm148_magazine_AT";};
		if (!_rhsennemy) then {_unit addItemToBackpack "CUP_Javelin_M";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_TacticalPack_oli";
		_unit addItemToBackpack "ACE_M26_Clacker";
		_unit addItemToBackpack "ACE_EntrenchingTool";
		_unit addItemToBackpack "ACE_DefusalKit";
		_unit addItemToBackpack "SatchelCharge_Remote_Mag";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACE_RangeCard";
		_unit addItemToVest "ACE_MapTools";
		_unit addItemToVest "ACE_Kestrel4500";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";};
		_unit addBackpack "B_AssaultPack_rgr";
		for "_i" from 1 to 8 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m118_special_Mag";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_sr25_ec";
		_unit addPrimaryWeaponItem "rhsusf_acc_SR25S";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230a_mrds";
		_unit addPrimaryWeaponItem "bipod_01_F_blk";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_grenadier";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		_unit addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 15 do {_unit addItemToBackpack "rhs_mag_M433_HEDP";};
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_mag_m713_Red";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10_m320";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addWeapon "rhsusf_weap_glock17g4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Carryall_khk";
		for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_m67";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_mk84";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_an_m8hc";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Yellow";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
		if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_light";
		_unit addItemToVest "ACRE_PRC148";
		_unit addItemToVest "ACE_microDAGR";
		_unit addItemToVest "ACE_MapTools";
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		_unit addHeadgear "rhsusf_cvc_green_helmet";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACRE_PRC148";
		_unit addItemToVest "ACE_microDAGR";
		_unit addItemToVest "ACE_MapTools";
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		_unit addItemToVest "B_IR_Grenade";
		_unit addHeadgear "rhsusf_hgu56p";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addWeapon "rhsusf_weap_glock17g4";

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
		_unit forceAddUniform "U_I_FullGhillie_lsh";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_RangeCard";
		_unit addItemToUniform "ACE_microDAGR";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_Kestrel4500";
		_unit addItemToUniform "ACE_ATragMX";
		_unit addItemToUniform "ACRE_PRC148";
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		_unit addVest "V_TacVest_oli";
		for "_i" from 1 to 7 do {_unit addItemToVest "rhsusf_5Rnd_300winmag_xm2010";};
		_unit addBackpack "B_AssaultPack_rgr";
		for "_i" from 1 to 7 do {_unit addItemToBackpack "rhsusf_5Rnd_300winmag_xm2010";};
		_unit addGoggles "G_Balaclava_oli";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_XM2010_sa";
		_unit addPrimaryWeaponItem "rhsusf_acc_M2010S";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16aside";
		_unit addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4_2";
		_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";
		_unit additemtoBackpack "CUP_optic_AN_PVS_4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
		_unit forceAddUniform "U_I_FullGhillie_lsh";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_Kestrel4500";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		_unit addItemToUniform "ACE_RangeCard";
		_unit addItemToUniform "ACE_ATragMX";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addVest "V_TacVest_oli";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		_unit addGoggles "G_Balaclava_oli";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "rhs_mag_m18_purple";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_m18_green";};
		_unit addBackpack "CUP_B_USMC_MOLLE_WDL";
		_unit addItemToBackpack "ACRE_PRC117F";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_m18_green";};
		_unit addHeadgear (selectrandom _helmet);
		_unit addGoggles (selectrandom _lunettes);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_hk416d10";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Laserdesignator";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
	};
};

// Desert
if (CPC_MAP in ["pja307","takistan"]) then 
{
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m18_green";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Yellow";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
		_unit addHeadgear "rhsusf_opscore_ut_pelt_nsw_cam";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds_c";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m18_green";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Yellow";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
		_unit addBackpack "rhsusf_falconii_coy";
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds_c";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";
		if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
		if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_medic";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "rhsusf_assault_eagleaiii_coy";
		_unit addItemToBackpack "ACE_personalAidKit";
		_unit addItemToBackpack "ACE_surgicalKit";
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_packingBandage";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_quikclot";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV_250";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV_500";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_tourniquet";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552_d";
		_unit addWeapon "rhsusf_weap_glock17g4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_mg";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addBackpack "rhsusf_assault_eagleaiii_coy";
		for "_i" from 1 to 5 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m249_pip_S_vfg";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip1";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds_c";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Kitbag_cbr";
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_mg";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_50Rnd_762x51";};
		_unit addBackpack "B_FieldPack_cbr";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m61_ap";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m240G";
		_unit addPrimaryWeaponItem "rhsusf_acc_elcan";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Kitbag_cbr";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m61_ap";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_acog_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		if (_rhsennemy) then {_unit addWeapon "rhs_weap_fgm148";_unit addsecondaryweaponitem "rhs_fgm148_magazine_AT";};
		if (!_rhsennemy) then {_unit addWeapon "CUP_launch_Javelin";_unit addsecondaryweaponitem "CUP_Javelin_M";};
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Carryall_cbr";
		if (_rhsennemy) then {_unit addItemToBackpack "rhs_fgm148_magazine_AT";};
		if (!_rhsennemy) then {_unit addItemToBackpack "CUP_Javelin_M";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_acog_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_MU_TacticalPack_cbr";
		_unit addItemToBackpack "ACE_M26_Clacker";
		_unit addItemToBackpack "ACE_EntrenchingTool";
		_unit addItemToBackpack "ACE_DefusalKit";
		_unit addItemToBackpack "SatchelCharge_Remote_Mag";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACE_RangeCard";
		_unit addItemToVest "ACE_MapTools";
		_unit addItemToVest "ACE_Kestrel4500";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";};
		_unit addBackpack "rhsusf_falconii_mc";
		for "_i" from 1 to 8 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m118_special_Mag";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_sr25_ec_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_sr25s_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230a_mrds";
		_unit addPrimaryWeaponItem "bipod_01_F_blk";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_grenadier";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		_unit addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 15 do {_unit addItemToBackpack "rhs_mag_M433_HEDP";};
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_mag_m713_Red";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_m203s_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_acog_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addWeapon "rhsusf_weap_glock17g4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Carryall_cbr";
		for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_m67";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_mk84";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_an_m8hc";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Yellow";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_acog_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
		if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_light";
		_unit addItemToVest "ACRE_PRC148";
		_unit addItemToVest "ACE_microDAGR";
		_unit addItemToVest "ACE_MapTools";
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		_unit addHeadgear "rhsusf_cvc_helmet";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACRE_PRC148";
		_unit addItemToVest "ACE_microDAGR";
		_unit addItemToVest "ACE_MapTools";
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		_unit addItemToVest "B_IR_Grenade";
		_unit addHeadgear "rhsusf_hgu56p";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addWeapon "rhsusf_weap_glock17g4";

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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_RangeCard";
		_unit addItemToUniform "ACE_microDAGR";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_Kestrel4500";
		_unit addItemToUniform "ACE_ATragMX";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 8 do {_unit addItemToVest "rhsusf_5Rnd_762x51_m118_special_Mag";};
		_unit addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsusf_5Rnd_762x51_m993_Mag";};
		for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsusf_5Rnd_762x51_m62_Mag";};
		_unit addHeadgear "rhs_Booniehat_ocp";
		_unit addGoggles "rhsusf_shemagh2_tan";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m24sws_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_leupoldmk4_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_m24_silencer_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";
		_unit additemtobackpack "rhsusf_acc_su230a_c";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_Kestrel4500";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		_unit addItemToUniform "ACE_RangeCard";
		_unit addItemToUniform "ACE_ATragMX";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_mbav_rifleman";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear "rhs_Booniehat_ocp";
		_unit addGoggles "rhsusf_shemagh_tan";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds_c";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
		_unit forceAddUniform "rhs_uniform_g3_mc";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "rhs_mag_m18_purple";};
		_unit addVest "rhsusf_mbav_grenadier";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_m713_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HuntIR_M203";};
		_unit addBackpack "rhsusf_assault_eagleaiii_coy";
		_unit addItemToBackpack "ACRE_PRC117F";
		_unit addItemToBackpack "ACE_HuntIR_monitor";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_m203s_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16aside";
		_unit addPrimaryWeaponItem "rhsusf_acc_su230_c";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Laserdesignator";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
	};
};

// Afrique
if (CPC_MAP in ["isladuala3","sara"]) then 
{
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m18_green";};
		_unit addVest "rhsusf_spc_squadleader";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Yellow";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
		_unit addHeadgear "rhsusf_bowman_cap";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_grip2";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m18_green";};
		_unit addVest "rhsusf_spc_squadleader";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Yellow";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
		_unit addBackpack "rhsusf_falconii_coy";
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_grip2";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";
		if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
		if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_corpsman";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "rhsusf_assault_eagleaiii_coy";
		_unit addItemToBackpack "ACE_personalAidKit";
		_unit addItemToBackpack "ACE_surgicalKit";
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_packingBandage";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_quikclot";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV_250";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV_500";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_tourniquet";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
		_unit addWeapon "rhsusf_weap_glock17g4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_mg";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addBackpack "rhsusf_assault_eagleaiii_coy";
		for "_i" from 1 to 5 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m249_pip_L_para";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V"} else {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side"};
		_unit addPrimaryWeaponItem "rhsusf_acc_acog3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_light";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_FieldPack_cbr";
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_mg";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_50Rnd_762x51";};
		_unit addBackpack "B_FieldPack_khk";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m61_ap";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m240G";
		_unit addPrimaryWeaponItem "rhsusf_acc_elcan";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_light";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Kitbag_rgr";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m61_ap";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_light";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		if (_rhsennemy) then {_unit addWeapon "rhs_weap_fgm148";_unit addsecondaryweaponitem "rhs_fgm148_magazine_AT";};
		if (!_rhsennemy) then {_unit addWeapon "CUP_launch_Javelin";_unit addsecondaryweaponitem "CUP_Javelin_M";};
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_light";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Carryall_oli";
		if (_rhsennemy) then {_unit addItemToBackpack "rhs_fgm148_magazine_AT";};
		if (!_rhsennemy) then {_unit addItemToBackpack "CUP_Javelin_M";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_light";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_TacticalPack_blk";
		_unit addItemToBackpack "ACE_M26_Clacker";
		_unit addItemToBackpack "ACE_EntrenchingTool";
		_unit addItemToBackpack "ACE_DefusalKit";
		_unit addItemToBackpack "SatchelCharge_Remote_Mag";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_light";
		_unit addItemToVest "ACE_RangeCard";
		_unit addItemToVest "ACE_MapTools";
		_unit addItemToVest "ACE_Kestrel4500";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";};
		_unit addBackpack "rhsusf_falconii_mc";
		for "_i" from 1 to 8 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m118_special_Mag";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_sr25_ec";
		_unit addPrimaryWeaponItem "rhsusf_acc_SR25S";
		_unit addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4_2";
		_unit addPrimaryWeaponItem "bipod_01_F_blk";
		if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V"} else {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side"};
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";
		_unit additemtobackpack "CUP_optic_AN_PAS_13c2";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_light";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 15 do {_unit addItemToBackpack "rhs_mag_M433_HEDP";};
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_mag_m713_Red";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_m203s";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";
		if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V"} else {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side"};
		_unit addWeapon "rhsusf_weap_glock17g4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_light";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Carryall_cbr";
		for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_m67";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_mk84";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_an_m8hc";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Yellow";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_light";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
		if (!_rhsennemy) then {_unit addWeapon "CUP_launch_M136";};

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_light";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_crewman";
		_unit addItemToVest "ACRE_PRC148";
		_unit addItemToVest "ACE_microDAGR";
		_unit addItemToVest "ACE_MapTools";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addHeadgear "rhsusf_cvc_green_helmet";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_crewman";
		_unit addItemToVest "ACRE_PRC148";
		_unit addItemToVest "ACE_microDAGR";
		_unit addItemToVest "ACE_MapTools";
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		_unit addItemToVest "B_IR_Grenade";
		_unit addHeadgear "rhsusf_hgu56p";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addWeapon "rhsusf_weap_glock17g4";

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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_RangeCard";
		_unit addItemToUniform "ACE_microDAGR";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_Kestrel4500";
		_unit addItemToUniform "ACE_ATragMX";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		_unit addVest "rhsusf_spc_marksman";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_10Rnd_STD_50BMG_M33";};
		_unit addBackpack "B_Kitbag_mcamo";
		for "_i" from 1 to 5 do {_unit addItemToBackpack "rhsusf_mag_10Rnd_STD_50BMG_M33";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsusf_mag_10Rnd_STD_50BMG_mk211";};
		_unit addHeadgear "H_Booniehat_khk";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_M107";
		_unit addPrimaryWeaponItem "rhsusf_acc_premier";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";
		_unit additemtobackpack "rhsusf_acc_premier_anpvs27";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_Kestrel4500";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		_unit addItemToUniform "ACE_RangeCard";
		_unit addItemToUniform "ACE_ATragMX";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_light";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear "rhs_Booniehat_m81";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG2";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
		_unit forceAddUniform "rhs_uniform_g3_m81";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "rhs_mag_m18_purple";};
		_unit addVest "rhsusf_spc_light";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_m713_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HuntIR_M203";};
		_unit addBackpack "rhsusf_assault_eagleaiii_coy";
		_unit addItemToBackpack "ACRE_PRC117F";
		_unit addItemToBackpack "ACE_HuntIR_monitor";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
		_unit addHeadgear "rhsusf_protech_helmet_rhino";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_m203s";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
		_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Laserdesignator";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "rhsusf_ANPVS_15";};
	};
};

// Jungle
if (CPC_MAP in ["tanoa","pja305"]) then 
{
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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m18_green";};
		_unit addVest "V_Chestrig_rgr";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Yellow";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
		_unit addHeadgear "rhsusf_Bowman";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m18_green";};
		_unit addVest "V_Chestrig_rgr";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Yellow";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
		_unit addBackpack "rhsusf_falconii";
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Kitbag_rgr";
		_unit addItemToBackpack "ACE_personalAidKit";
		_unit addItemToBackpack "ACE_surgicalKit";
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_packingBandage";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_elasticBandage";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_quikclot";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV_250";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV_500";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_tourniquet";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_unit addWeapon "rhsusf_weap_glock17g4";

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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addBackpack "B_TacticalPack_oli";
		for "_i" from 1 to 5 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m249_pip_S_para";
		if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V"} else {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16aside"};
		_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip1";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_FieldPack_oli";
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_mixed_soft_pouch";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_50Rnd_762x51";};
		_unit addBackpack "B_FieldPack_oli";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m61_ap";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m240G";
		_unit addPrimaryWeaponItem "rhsusf_acc_elcan";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Kitbag_rgr";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m61_ap";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Carryall_oli";
		_unit addHeadgear (selectrandom _helmet);
		if (_rhsennemy) then {
			for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_smaw_HEAA";};
			_unit addItemToBackpack "rhs_mag_smaw_SR";
		};
		if (!_rhsennemy) then {
			for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_SMAW_HEAA_M";};
			_unit addItemToBackpack "CUP_SMAW_Spotting";
		};

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		if (_rhsennemy) then {
			_unit addWeapon "rhs_weap_smaw_green";
			_unit addSecondaryWeaponItem "rhs_weap_optic_smaw";
		};
		if (!_rhsennemy) then {
			_unit addWeapon "CUP_launch_Mk153Mod0";
			_unit addSecondaryWeaponItem "CUP_optic_SMAW_Scope";
		};
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Carryall_oli";
		if (_rhsennemy) then {
			for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_SMAW_HEAA_M";};
			_unit addItemToBackpack "rhs_mag_smaw_SR";
		};
		if (!_rhsennemy) then {
			for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_SMAW_HEAA_M";};
			_unit addItemToBackpack "CUP_SMAW_Spotting";
		};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_TacticalPack_oli";
		_unit addItemToBackpack "ACE_M26_Clacker";
		_unit addItemToBackpack "ACE_EntrenchingTool";
		_unit addItemToBackpack "ACE_DefusalKit";
		_unit addItemToBackpack "SatchelCharge_Remote_Mag";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";

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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		_unit addItemToVest "ACE_RangeCard";
		_unit addItemToVest "ACE_MapTools";
		_unit addItemToVest "ACE_Kestrel4500";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";};
		_unit addBackpack "rhsusf_falconii";
		for "_i" from 1 to 8 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m118_special_Mag";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_sr25_ec_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_sr25s_wd";
		_unit addPrimaryWeaponItem "optic_SOS_khk_F";
		_unit addPrimaryWeaponItem "bipod_01_F_blk";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "ACE_Vector";
		_unit additemtobackpack "CUP_optic_AN_PVS_4";

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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		_unit addBackpack "B_Kitbag_rgr";
		for "_i" from 1 to 15 do {_unit addItemToBackpack "rhs_mag_M433_HEDP";};
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_mag_m713_Red";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_blockII_M203_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addWeapon "rhsusf_weap_glock17g4";

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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addBackpack "B_Carryall_oli";
		for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_m67";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_mk84";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_an_m8hc";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Yellow";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip3";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";

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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_crewman";
		_unit addItemToVest "ACRE_PRC148";
		_unit addItemToVest "ACE_microDAGR";
		_unit addItemToVest "ACE_MapTools";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		_unit addHeadgear "rhsusf_cvc_green_helmet";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addWeapon "rhsusf_weap_glock17g4";
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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "rhsusf_spc_crewman";
		_unit addItemToVest "ACRE_PRC148";
		_unit addItemToVest "ACE_microDAGR";
		_unit addItemToVest "ACE_MapTools";
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		_unit addItemToVest "B_IR_Grenade";
		_unit addHeadgear "rhsusf_hgu56p";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_carryhandle";
		_unit addWeapon "rhsusf_weap_glock17g4";

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
		_unit forceAddUniform "U_B_T_FullGhillie_tna_F";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_RangeCard";
		_unit addItemToUniform "ACE_microDAGR";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_Kestrel4500";
		_unit addItemToUniform "ACE_ATragMX";
		_unit addItemToUniform "ACRE_PRC148";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 3 do {_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhsusf_5Rnd_762x51_m118_special_Mag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_5Rnd_762x51_m62_Mag";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_5Rnd_762x51_m993_Mag";};
		_unit addBackpack "B_AssaultPack_khk";
		_unit additemtobackpack "rhsusf_acc_su230a_c";
		_unit addGoggles "rhs_balaclava";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m24sws_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_harris_swivel";
		_unit addPrimaryWeaponItem "rhsusf_acc_leupoldmk4_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_m24_silencer_wd";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "CUP_NVG_PVS7";

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
		_unit forceAddUniform "U_B_T_FullGhillie_tna_F";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACE_Kestrel4500";
		_unit addItemToUniform "ACE_MapTools";
		_unit addItemToUniform "ACE_microDAGR";
		_unit addItemToUniform "ACE_RangeCard";
		_unit addItemToUniform "ACE_ATragMX";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
		_unit addVest "V_Chestrig_rgr";
		_unit addItemToVest "ACRE_PRC148";
		for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		_unit addGoggles "rhs_balaclava";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_mk18_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
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
		_unit forceAddUniform "rhs_uniform_g3_rgr";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_EarPlugs";
		_unit addItemToUniform "ACE_Flashlight_MX991";
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_IR_Strobe_Item";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "rhs_mag_m18_purple";};
		_unit addVest "V_Chestrig_rgr";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_m713_Red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HuntIR_M203";};
		_unit addBackpack "B_Kitbag_rgr";
		_unit addItemToBackpack "ACRE_PRC117F";
		_unit addItemToBackpack "ACE_HuntIR_monitor";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
		_unit addHeadgear (selectrandom _helmet);

		comment "Add weapons";
		_unit addWeapon "rhs_weap_m4a1_blockII_M203_wd";
		_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq16a";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_unit addWeapon "rhsusf_weap_glock17g4";
		_unit addWeapon "Laserdesignator";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		if (_nvg) then {_unit linkItem "CUP_NVG_PVS7";};
	};
};