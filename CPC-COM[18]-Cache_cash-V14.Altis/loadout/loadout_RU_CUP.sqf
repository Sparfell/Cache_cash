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
_unit forceAddUniform "CUP_U_O_RUS_EMR_1_VDV";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACRE_PRC148";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_HandFlare_Yellow";};
_unit addVest "CUP_V_RUS_6B3_1";
for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_8Rnd_9x18_Makarov_M";};
for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_RGD5";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
_unit addBackpack "CUP_B_HikingPack_Civ";
for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
_unit addHeadgear "CUP_H_ChDKZ_Cap";

comment "Add weapons";
_unit addWeapon "CUP_arifle_AK74M";
_unit addWeapon "CUP_hgun_Makarov";
_unit addWeapon "CUP_Vector21Nite";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
_unit forceAddUniform "CUP_U_O_RUS_EMR_1_VDV";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACRE_PRC148";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_HandFlare_Yellow";};
_unit addVest "CUP_V_RUS_6B3_1";
for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_8Rnd_9x18_Makarov_M";};
for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_RGD5";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
_unit addBackpack "CUP_B_HikingPack_Civ";
for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
_unit addHeadgear "CUP_H_RUS_6B27";

comment "Add weapons";
_unit addWeapon "CUP_arifle_AK74M";
_unit addWeapon "CUP_hgun_Makarov";
_unit addWeapon "CUP_Vector21Nite";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
_unit forceAddUniform "CUP_U_O_RUS_EMR_1_VDV";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Yellow";};
for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_8Rnd_9x18_Makarov_M";};
_unit addVest "CUP_V_RUS_6B3_1";
for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_rdg2_white";};
_unit addBackpack "CUP_B_HikingPack_Civ";
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
_unit addItemToBackpack "ACE_personalAidKit";
_unit addItemToBackpack "ACE_surgicalKit";
_unit addHeadgear "CUP_H_RUS_6B27";

comment "Add weapons";
_unit addWeapon "CUP_arifle_AK74M";
_unit addWeapon "CUP_hgun_Makarov";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";


_unit addItemToUniform "CUP_8Rnd_9x18_Makarov_M";
_unit addItemToVest "CUP_30Rnd_545x39_AK_M";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
_unit forceAddUniform "CUP_U_O_RUS_EMR_1_VDV";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_HandFlare_Yellow";};
_unit addVest "CUP_V_RUS_6B3_3";
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_8Rnd_9x18_Makarov_M";};
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_HandGrenade_RGD5";};
_unit addItemToVest "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";
_unit addBackpack "CUP_B_HikingPack_Civ";
for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";};
_unit addHeadgear "CUP_H_RUS_6B27";

comment "Add weapons";
_unit addWeapon "CUP_lmg_PKM";
_unit addWeapon "CUP_hgun_Makarov";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

_unit addItemToVest "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
_unit forceAddUniform "CUP_U_O_RUS_EMR_1_VDV";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "ACE_Kestrel4500";
_unit addItemToUniform "ACE_RangeCard";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Yellow";};
for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_8Rnd_9x18_Makarov_M";};
_unit addVest "CUP_V_RUS_6B3_1";
for "_i" from 1 to 13 do {_unit addItemToVest "CUP_10Rnd_762x54_SVD_M";};
for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_RGD5";};
for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_rdg2_white";};
_unit addHeadgear "CUP_H_RUS_6B27_olive";
_unit addGoggles "rhs_balaclava1_olive";

comment "Add weapons";
_unit addWeapon "CUP_srifle_SVD";
_unit addPrimaryWeaponItem "CUP_optic_PSO_1";
_unit addWeapon "CUP_hgun_Makarov";
_unit addWeapon "CUP_Vector21Nite";

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
_unit forceAddUniform "CUP_U_O_RUS_EMR_1_VDV";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Yellow";};
_unit addVest "CUP_V_RUS_6B3_2";
for "_i" from 1 to 8 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_8Rnd_9x18_Makarov_M";};
for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_RGD5";};
_unit addBackpack "CUP_B_RPGPack_Khaki";
for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_PG7VL_M";};
_unit addHeadgear "CUP_H_RUS_6B27";

comment "Add weapons";
_unit addWeapon "CUP_arifle_AK74M";
_unit addWeapon "CUP_launch_RPG7V";
_unit addSecondaryWeaponItem "CUP_optic_PGO7V3";
_unit addWeapon "CUP_hgun_Makarov";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

sleep 1.0;
_unit addItemToVest "CUP_30Rnd_545x39_AK_M";
_unit addItemToBackpack "CUP_PG7VL_M";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
_unit forceAddUniform "CUP_U_O_RUS_EMR_1_VDV";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Yellow";};
_unit addVest "CUP_V_RUS_6B3_1";
for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_8Rnd_9x18_Makarov_M";};
for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_RGD5";};
_unit addBackpack "CUP_B_HikingPack_Civ";
for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
_unit addItemToBackpack "ACE_DefusalKit";
_unit addItemToBackpack "ACE_M26_Clacker";
_unit addItemToBackpack "SatchelCharge_Remote_Mag";
for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_Clacker";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addHeadgear "CUP_H_RUS_6B27_olive";
_unit addGoggles "rhs_balaclava1_olive";

comment "Add weapons";
_unit addWeapon "CUP_arifle_AK74M";
_unit addWeapon "CUP_hgun_Makarov";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
_unit forceAddUniform "CUP_U_O_RUS_EMR_1_VDV";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Yellow";};
_unit addVest "CUP_V_RUS_6B3_1";
for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_RGD5";};
for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_8Rnd_9x18_Makarov_M";};
_unit addBackpack "CUP_B_HikingPack_Civ";
for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
for "_i" from 1 to 15 do {_unit addItemToBackpack "CUP_1Rnd_HE_GP25_M";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "CUP_1Rnd_SmokeRed_GP25_M";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_IlumFlareWhite_GP25_M";};
_unit addHeadgear "CUP_H_RUS_6B27";

comment "Add weapons";
_unit addWeapon "CUP_arifle_AK74M_GL";
_unit addWeapon "CUP_hgun_Makarov";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
_unit forceAddUniform "CUP_U_O_RUS_EMR_1_VDV";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Yellow";};
_unit addVest "CUP_V_RUS_6B3_1";
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_8Rnd_9x18_Makarov_M";};
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_HandGrenade_RGD5";};
for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
_unit addBackpack "CUP_B_HikingPack_Civ";
for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
_unit addHeadgear "CUP_H_RUS_6B27";

comment "Add weapons";
_unit addWeapon "CUP_arifle_AK74M";
_unit addWeapon "CUP_hgun_Makarov";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
_unit forceAddUniform "CUP_U_O_RUS_EMR_1_VDV";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Yellow";};
_unit addVest "CUP_V_RUS_6B3_1";
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_8Rnd_9x18_Makarov_M";};
for "_i" from 1 to 2 do {_unit addItemToVest "CUP_HandGrenade_RGD5";};
for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
_unit addBackpack "CUP_B_HikingPack_Civ";
for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_OG7_M";};
_unit addHeadgear "CUP_H_RUS_6B27";

comment "Add weapons";
_unit addWeapon "CUP_arifle_AK74M";
_unit addWeapon "CUP_hgun_Makarov";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};

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
_unit forceAddUniform "CUP_U_O_RUS_EMR_1";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_KSF1";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACRE_PRC148";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Yellow";};
_unit addVest "CUP_V_RUS_6B3_4";
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_8Rnd_9x18_Makarov_M";};
for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_545x39_AK_M";};
_unit addHeadgear "CUP_H_RUS_TSH_4_Brown";
_unit addGoggles "G_Balaclava_blk";

comment "Add weapons";
_unit addWeapon "CUP_arifle_AKS74U";
_unit addWeapon "CUP_hgun_Makarov";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_HMNVS";};

};
