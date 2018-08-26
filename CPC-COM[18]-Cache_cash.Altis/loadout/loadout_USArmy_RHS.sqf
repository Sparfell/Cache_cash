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
private ["_rhsennemy","_uniform","_helmet","_ocp","_ucp","_nvg","_lamp"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,17,18,19,100,106,108,109]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_ucp = false;
	_ocp = false;
	_uniform = "";
	_helmet = [];

	//OCP
	if (CPC_MAP in ["altis","tanoa","chernarus","chernarus_summer","isladuala3","sara","fdf_isle1_a","woodland_acr","pja305","pja307","noe","eden"]) then 
	{
		_uniform = "rhs_uniform_cu_ocp";
		_helmet = ["rhsusf_ach_helmet_ocp","rhsusf_ach_helmet_ocp","rhsusf_ach_helmet_ocp","rhsusf_ach_helmet_camo_ocp"];
		_ocp = true;		
	};
	//UCP
	if (CPC_MAP in ["takistan"]) then 
	{
		_uniform = "rhs_uniform_acu_ucp";
		_helmet = ["rhsusf_ach_helmet_ucp","rhsusf_ach_helmet_ucp"];
		_ucp = true;
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m18_green";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_squadleader";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_squadleader";};
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_purple";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_White";};
	if (_ocp) then {_unit addHeadgear "rhsusf_ach_helmet_headset_ocp";};
	if (_ucp) then {_unit addHeadgear "rhsusf_ach_helmet_headset_ucp";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_carryhandle";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m18_green";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_teamleader_alt";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_teamleader_alt";};
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_green";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_White";};
	_unit addBackpack "B_AssaultPack_mcamo";
	if (_ocp) then {_unit addHeadgear "rhsusf_ach_helmet_headset_ocp";};
	if (_ucp) then {_unit addHeadgear "rhsusf_ach_helmet_headset_ucp";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_carryhandle";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_medic";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_medic";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	if (_ocp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ocp";};
	if (_ucp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ucp";};
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
	_unit addWeapon "rhs_weap_m4_carryhandle";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
	_unit addWeapon "Binocular";

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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_saw";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_saw";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_200rnd_556x45_M_SAW";};
	if (_ocp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ocp";};
	if (_ucp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ucp";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
	if (_ocp) then {_unit addHeadgear "rhsusf_ach_helmet_headset_ocp";};
	if (_ucp) then {_unit addHeadgear "rhsusf_ach_helmet_headset_ucp";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m249_pip_L";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_ELCAN";
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_rifleman_alt";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_rifleman_alt";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	if (_ocp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ocp";};
	if (_ucp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ucp";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_carryhandle";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_machinegunner";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_machinegunner";};
	if (_ocp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ocp";};
	if (_ucp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ucp";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m240B_CAP";
	_unit addPrimaryWeaponItem "rhsusf_acc_elcan";
	_unit addWeapon "ACE_Vector";
	_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";

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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_rifleman_alt";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_rifleman_alt";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	if (_ocp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ocp";};
	if (_ucp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ucp";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsusf_50Rnd_762x51_m62_tracer";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_carryhandle";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_rifleman_alt";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_rifleman_alt";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addBackpack "B_Carryall_mcamo";
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
	_unit addWeapon "rhs_weap_m4_carryhandle";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_rifleman_alt";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_rifleman_alt";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addBackpack "B_Carryall_mcamo";
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
	_unit addWeapon "rhs_weap_m4_carryhandle";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
	_unit addWeapon "ACE_Vector";

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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_rifleman_alt";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_rifleman_alt";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	if (_ocp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ocp";};
	if (_ucp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ucp";};
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	if (_ocp) then {_unit addHeadgear "rhsusf_ach_helmet_headset_ocp";};
	if (_ucp) then {_unit addHeadgear "rhsusf_ach_helmet_headset_ucp";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_carryhandle";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_sniper";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_sniper";};
	_unit addItemToVest "ACE_Kestrel4500";
	_unit addItemToVest "ACE_RangeCard";
	for "_i" from 1 to 11 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m14ebrri";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_SpecterDR_A"; _unit additemtovest "rhsusf_acc_LEUPOLDMK4";} else {_unit addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4"};

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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_grenadier";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_grenadier";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_m713_Red";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_m320";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";

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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_rifleman_alt";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_rifleman_alt";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	if (_ocp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ocp";};
	if (_ucp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ucp";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_m67";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_HandFlare_White";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_carryhandle";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG";

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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_rifleman_alt";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_rifleman_alt";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_carryhandle";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_rifleman_alt";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_rifleman_alt";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_carryhandle";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";

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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_crewman";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_crewman";};
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACE_MapTools";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addHeadgear "rhsusf_cvc_green_helmet";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_carryhandle";
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addWeapon "Binocular";

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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_crewman";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_crewman";};
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_IR_Strobe_Item";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addHeadgear "rhsusf_hgu56p";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_carryhandle";
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_ATragMX";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_sniper";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_sniper";};
	for "_i" from 1 to 7 do {_unit addItemToVest "rhsusf_5Rnd_300winmag_xm2010";};
	for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_7x45acp_MHP";};
	if (_ocp) then {_unit addHeadgear "rhs_Booniehat_ocp";_unit addGoggles "rhsusf_shemagh2_tan";};
	if (_ucp) then {_unit addHeadgear "rhs_Booniehat_ucp";_unit addGoggles "rhsusf_shemagh2_od";};

	comment "Add weapons";
	_unit addWeapon "rhsusf_weap_m1911a1";
	_unit addWeapon "rhs_weap_XM2010_sa";
	_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side";
	_unit addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4_2";
	_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
	_unit addWeapon "Rangefinder";
	_unit additemtovest "CUP_optic_AN_PVS_4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit forceAddUniform _uniform;
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_ATragMX";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_an_m8hc";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_teamleader";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_teamleader";};
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
	_unit addBackpack "B_AssaultPack_mcamo";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_Tripod";
	_unit addItemToBackpack "ACE_SpottingScope";
	for "_i" from 1 to 5 do {_unit addItemToBackpack "rhsusf_5Rnd_300winmag_xm2010";};
	if (_ocp) then {_unit addHeadgear "rhs_Booniehat_ocp";_unit addGoggles "rhsusf_shemagh_tan";};
	if (_ucp) then {_unit addHeadgear "rhs_Booniehat_ucp";_unit addGoggles "rhsusf_shemagh_od";};

	comment "Add weapons";
	_unit addWeapon "rhs_weap_mk18";
	_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
	_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_top";
	_unit addPrimaryWeaponItem "rhsusf_acc_SpecterDR";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	for "_i" from 1 to 4 do {_unit addItemToUniform "rhs_mag_m18_purple";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
	if (_ocp) then {_unit addVest "rhsusf_spcs_ocp_teamleader_alt";};
	if (_ucp) then {_unit addVest "rhsusf_spcs_ucp_teamleader_alt";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_m713_Red";};
	for "_i" from 1 to 4 do {_unit addItemToVest "ACE_HuntIR_M203";};
	for "_i" from 1 to 2 do {_unit addItemToVest "B_IR_Grenade";};
	if (_ocp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ocp";};
	if (_ucp) then {_unit addBackpack "rhsusf_assault_eagleaiii_ucp";};
	_unit addItemToBackpack "ACRE_PRC117F";
	_unit addItemToBackpack "ACE_HuntIR_monitor";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
	_unit addHeadgear "rhsusf_Bowman";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m4_m203S";
	if (_nvg) then {_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side";};
	if (_lamp) then {_unit addPrimaryWeaponItem "rhsusf_acc_M952V";};
	_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
	_unit addWeapon "Laserdesignator";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};
