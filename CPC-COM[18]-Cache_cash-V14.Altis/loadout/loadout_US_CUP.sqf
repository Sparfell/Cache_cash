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
_unit forceAddUniform "CUP_U_B_USArmy_TwoKnee";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACRE_PRC148";
_unit addItemToUniform "ACE_microDAGR";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addVest "CUP_V_B_IOTV_SL";
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_15Rnd_9x19_M9";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addBackpack "CUP_B_AssaultPack_ACU";
for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_30Rnd_556x45_Stanag";};
_unit addHeadgear "CUP_H_USArmy_HelmetMICH_earpro";

comment "Add weapons";
_unit addWeapon "CUP_arifle_M4A1_black";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";
_unit addPrimaryWeaponItem "CUP_optic_ACOG";
_unit addWeapon "CUP_hgun_M9";
_unit addWeapon "CUP_Vector21Nite";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

_unit addItemToVest "CUP_30Rnd_556x45_Stanag";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_HMNVS";};

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
_unit forceAddUniform "CUP_U_B_USArmy_TwoKnee";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACRE_PRC148";
_unit addItemToUniform "ACE_microDAGR";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addVest "CUP_V_B_IOTV_tl";
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_15Rnd_9x19_M9";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addBackpack "CUP_B_AssaultPack_ACU";
for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_30Rnd_556x45_Stanag";};
_unit addHeadgear "CUP_H_USArmy_HelmetMICH_earpro";

comment "Add weapons";
_unit addWeapon "CUP_arifle_M4A1_black";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";
_unit addPrimaryWeaponItem "CUP_optic_ACOG";
_unit addWeapon "CUP_launch_M136";
_unit addWeapon "CUP_hgun_M9";
_unit addWeapon "CUP_Vector21Nite";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

_unit addItemToVest "CUP_30Rnd_556x45_Stanag";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_HMNVS";};

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
_unit forceAddUniform "CUP_U_B_USArmy_TwoKnee";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACE_IR_Strobe_Item";
for "_i" from 1 to 4 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Green";};
_unit addVest "CUP_V_B_IOTV_Medic";
_unit addItemToVest "ACE_surgicalKit";
for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
_unit addItemToVest "CUP_15Rnd_9x19_M9";
_unit addBackpack "CUP_B_MedicPack_ACU";
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
_unit addHeadgear "CUP_H_USArmy_HelmetMICH";

comment "Add weapons";
_unit addWeapon "CUP_arifle_M4A1_black";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";
_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";
_unit addWeapon "CUP_hgun_M9";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 2 do {_unit addItemToVest "CUP_15Rnd_9x19_M9";};
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_HMNVS";};

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
_unit forceAddUniform "CUP_U_B_USArmy_TwoKnee";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACE_IR_Strobe_Item";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Green";};
_unit addItemToUniform "CUP_15Rnd_9x19_M9";
_unit addVest "CUP_V_B_IOTV_MG";
_unit addItemToVest "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "CUP_15Rnd_9x19_M9";};
_unit addBackpack "CUP_B_AssaultPack_ACU";
for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";};
_unit addHeadgear "CUP_H_USArmy_HelmetMICH_ESS";

comment "Add weapons";
_unit addWeapon "CUP_lmg_m249_pip1";
_unit addPrimaryWeaponItem "CUP_optic_ElcanM145";
_unit addWeapon "CUP_hgun_M9";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_HMNVS";};

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
_unit forceAddUniform "CUP_U_B_USArmy_TwoKnee";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACE_RangeCard";
_unit addItemToUniform "ACE_Kestrel4500";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Green";};
_unit addVest "CUP_V_B_IOTV_Rifleman";
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 5 do {_unit addItemToVest "CUP_20Rnd_762x51_DMR";};
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_15Rnd_9x19_M9";};
_unit addBackpack "CUP_B_AssaultPack_ACU";
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "CUP_20Rnd_762x51_DMR";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_15Rnd_9x19_M9";};
_unit addHeadgear "CUP_H_USArmy_HelmetMICH";

comment "Add weapons";
_unit addWeapon "CUP_srifle_M14_DMR";
_unit addPrimaryWeaponItem "CUP_optic_LeupoldMk4";
_unit addPrimaryWeaponItem "CUP_bipod_Harris_1A2_L";
_unit addWeapon "CUP_hgun_M9";
_unit addWeapon "CUP_Vector21Nite";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

_unit addItemToVest "CUP_20Rnd_762x51_DMR";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_HMNVS";};

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
_unit forceAddUniform "CUP_U_B_USArmy_TwoKnee";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Green";};
_unit addVest "CUP_V_B_IOTV_AT";
for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "CUP_15Rnd_9x19_M9";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
_unit addBackpack "CUP_B_AssaultPack_ACU";
_unit addItemToBackpack "CUP_MAAWS_HEAT_M";
_unit addItemToBackpack "CUP_MAAWS_HEDP_M";
_unit addHeadgear "CUP_H_USArmy_HelmetMICH_ESS";

comment "Add weapons";
_unit addWeapon "CUP_arifle_M4A1_black";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";
_unit addPrimaryWeaponItem "CUP_optic_CompM2_Black";
_unit addWeapon "CUP_launch_MAAWS";
_unit addSecondaryWeaponItem "CUP_optic_MAAWS_Scope";
_unit addWeapon "CUP_hgun_M9";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

_unit addItemToVest "CUP_30Rnd_556x45_Stanag";
_unit addItemToVest "CUP_15Rnd_9x19_M9";
_unit addItemToBackpack "CUP_MAAWS_HEAT_M";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_HMNVS";};

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
_unit forceAddUniform "CUP_U_B_USArmy_TwoKnee";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Green";};
_unit addVest "CUP_V_B_IOTV_Rifleman";
for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "CUP_15Rnd_9x19_M9";};
_unit addBackpack "CUP_B_AssaultPack_ACU";
_unit addItemToBackpack "ACE_DefusalKit";
_unit addItemToBackpack "ACE_M26_Clacker";
for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_Clacker";};
_unit addItemToBackpack "SatchelCharge_Remote_Mag";
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addItemToBackpack "CUP_30Rnd_556x45_Stanag";
_unit addHeadgear "CUP_H_USArmy_HelmetMICH";

comment "Add weapons";
_unit addWeapon "CUP_arifle_M4A1_black";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";
_unit addPrimaryWeaponItem "CUP_optic_CompM2_Black";
_unit addWeapon "CUP_hgun_M9";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

_unit addItemToVest "CUP_30Rnd_556x45_Stanag";
_unit addItemToVest "CUP_15Rnd_9x19_M9";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_HMNVS";};

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
_unit forceAddUniform "CUP_U_B_USArmy_TwoKnee";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Green";};
_unit addVest "CUP_V_B_IOTV_gl";
for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "CUP_15Rnd_9x19_M9";};
_unit addBackpack "CUP_B_AssaultPack_ACU";
for "_i" from 1 to 5 do {_unit addItemToBackpack "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 13 do {_unit addItemToBackpack "CUP_1Rnd_HE_M203";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "UGL_FlareWhite_F";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";};
_unit addHeadgear "CUP_H_USArmy_HelmetMICH_ESS";

comment "Add weapons";
_unit addWeapon "CUP_arifle_M4A1_BUIS_GL";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";
_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";
_unit addWeapon "CUP_hgun_M9";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

_unit addItemToVest "CUP_30Rnd_556x45_Stanag";
_unit addItemToVest "CUP_15Rnd_9x19_M9";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_HMNVS";};

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
_unit forceAddUniform "CUP_U_B_USArmy_TwoKnee";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACE_IR_Strobe_Item";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Green";};
_unit addVest "CUP_V_B_IOTV_Rifleman";
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 4 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_15Rnd_9x19_M9";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addBackpack "CUP_B_AssaultPack_ACU";
for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_30Rnd_556x45_Stanag";};
_unit addHeadgear "CUP_H_USArmy_HelmetMICH";

comment "Add weapons";
_unit addWeapon "CUP_arifle_M4A1_black";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";
_unit addPrimaryWeaponItem "CUP_optic_CompM2_Black";
_unit addWeapon "CUP_hgun_M9";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

_unit addItemToVest "CUP_30Rnd_556x45_Stanag";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_HMNVS";};

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
_unit forceAddUniform "CUP_U_B_USArmy_TwoKnee";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACE_IR_Strobe_Item";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Green";};
_unit addVest "CUP_V_B_IOTV_saw";
for "_i" from 1 to 6 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "CUP_15Rnd_9x19_M9";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addBackpack "CUP_B_AssaultPack_ACU";
for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";};
_unit addItemToBackpack "CUP_30Rnd_556x45_Stanag";
_unit addHeadgear "CUP_H_USArmy_HelmetMICH";

comment "Add weapons";
_unit addWeapon "CUP_arifle_M4A1_black";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";
_unit addPrimaryWeaponItem "CUP_optic_CompM2_Black";
_unit addWeapon "CUP_hgun_M9";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

_unit addItemToVest "CUP_30Rnd_556x45_Stanag";
_unit addItemToVest "CUP_15Rnd_9x19_M9";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_HMNVS";};
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
_unit forceAddUniform "CUP_U_B_USArmy_Base";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACRE_PRC148";
_unit addItemToUniform "ACE_IR_Strobe_Item";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addVest "CUP_V_B_IOTV_Rifleman";
for "_i" from 1 to 7 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_15Rnd_9x19_M9";};
_unit addHeadgear "CUP_H_USMC_Crew_Helmet";

comment "Add weapons";
_unit addWeapon "CUP_arifle_M4A1";
_unit addWeapon "CUP_hgun_M9";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_HMNVS";};

};
