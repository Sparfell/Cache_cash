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
		this setVariable ["loadout", "aaf_officer"];
		
	PS :Dans l'exemple ci-dessous les lignes des commentaires issues de l'exportation avec l'arsenal vitruel ont été supprimées pour une meilleure lisibilité.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/


hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_helmet = ["rhs_6b27m_ml","rhs_6b27m_ml_bala","rhs_6b27m_ml_ess","rhs_6b27m_ML_ess_bala"];
	_helmetcrew = ["rhs_tsh4","rhs_tsh4_bala","rhs_tsh4_ess","rhs_tsh4_ess_bala"];
	
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
	_unit forceAddUniform "rhs_uniform_mflora_patchless";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	for "_i" from 1 to 3 do {_unit addItemToUniform "SmokeShellOrange";};
	_unit addVest "rhs_6b23_ML_6sh92_headset_mapcase";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_green";};
	_unit addHeadgear "rhs_fieldcap_ml";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	_unit addPrimaryWeaponItem "rhs_acc_1p63";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7"; _unit addprimaryweaponitem "rhs_acc_perst1ik";};
	if ((paramsArray select 3) == 2) then {_unit addprimaryweaponitem "rhs_acc_2dpZenit";};

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
	_unit forceAddUniform "rhs_uniform_mflora_patchless";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	_unit addVest "rhs_6b23_ML_6sh92_radio";
	_unit addItemToVest "rhs_mag_rdg2_white";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_green";};
	_unit addBackpack "rhs_sidor";
	for "_i" from 1 to 8 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_HandFlare_Green";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	_unit addPrimaryWeaponItem "rhs_acc_1p78";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15"; _unit addprimaryweaponitem "rhs_acc_perst1ik";};
	if ((paramsArray select 3) == 2) then {_unit addprimaryweaponitem "rhs_acc_2dpZenit";};

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
	_unit forceAddUniform "rhs_uniform_mflora_patchless";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	_unit addVest "rhs_6b23_ML_medic";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
	for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_rdg2_white";};
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

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addprimaryweaponitem "rhs_acc_2dpZenit";};

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
	_unit forceAddUniform "rhs_uniform_mflora_patchless";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	_unit addVest "rhs_6b23_ML_engineer";
	_unit addItemToVest "rhs_100Rnd_762x54mmR_green";
	_unit addBackpack "rhs_sidor";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pkp";
	_unit addPrimaryWeaponItem "rhs_acc_1p29";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "rhs_100Rnd_762x54mmR_green";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addprimaryweaponitem "rhs_acc_2dpZenit";};

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
	_unit forceAddUniform "rhs_uniform_mflora_patchless";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	_unit addVest "rhs_6b23_ML_sniper";
	for "_i" from 1 to 17 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_svdp_wd";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m2";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
	_unit forceAddUniform "rhs_uniform_mflora_patchless";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	_unit addVest "rhs_6b23_ML_6sh92";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
	_unit addItemToVest "rhs_mag_rdg2_white";
	_unit addBackpack "rhs_rpg_empty";
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	_unit addWeapon "rhs_weap_rpg7";
	_unit addSecondaryWeaponItem "rhs_acc_pgo7v";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
	_unit addItemToBackpack "rhs_rpg7_OG7V_mag";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addprimaryweaponitem "rhs_acc_2dpZenit";};

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
	_unit forceAddUniform "rhs_uniform_mflora_patchless";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	_unit addVest "rhs_6b23_ML_6sh92";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
	_unit addItemToVest "rhs_mag_rdg2_white";
	_unit addBackpack "rhs_assault_umbts_engineer_empty";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addprimaryweaponitem "rhs_acc_2dpZenit";};

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
	_unit forceAddUniform "rhs_uniform_mflora_patchless";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	_unit addVest "rhs_6b23_ML_6sh92_vog";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
	for "_i" from 1 to 11 do {_unit addItemToVest "rhs_VOG25";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_GRD40_Red";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m_gp25";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addprimaryweaponitem "rhs_acc_2dpZenit";};

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
	_unit forceAddUniform "rhs_uniform_mflora_patchless";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	_unit addVest "rhs_6b23_ML_6sh92";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
	_unit addItemToVest "rhs_mag_rdg2_white";
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addprimaryweaponitem "rhs_acc_2dpZenit";};

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
	_unit forceAddUniform "rhs_uniform_mflora_patchless";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgd5";};
	_unit addVest "rhs_6b23_ML_6sh92";
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
	_unit addItemToVest "rhs_mag_rdg2_white";
	_unit addBackpack "CUP_B_CivPack_WDL";
	for "_i" from 1 to 8 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
	_unit addItemToBackpack "rhs_rpg7_OG7V_mag";
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addprimaryweaponitem "rhs_acc_2dpZenit";};

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
	_unit forceAddUniform "rhs_uniform_mflora_patchless";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "rhs_mag_rdg2_white";
	_unit addItemToUniform "rhs_mag_rgd5";
	_unit addVest "rhs_6b23_ML_crew";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
	_unit addHeadgear (selectrandom _helmetcrew);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addprimaryweaponitem "rhs_acc_2dpZenit";};

};
