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
	
	_helmet = ["rhsusf_opscore_mc_cover","rhsusf_opscore_mc","rhsusf_opscore_mc_cover_pelt","rhsusf_opscore_mc_cover_pelt_nsw","rhsusf_opscore_mc_pelt","rhsusf_opscore_mc_pelt_nsw"];
	_helmetOFF = ["rhsusf_opscore_mc_cover_pelt","rhsusf_opscore_mc_cover_pelt_nsw","rhsusf_opscore_mc_pelt","rhsusf_opscore_mc_pelt_nsw"];
	
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
_unit forceAddUniform "CUP_U_B_FR_DirAction";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACRE_PRC148";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellYellow";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
_unit addItemToUniform "B_IR_Grenade";
_unit addVest "CUP_V_B_MTV_TL";
for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
_unit addHeadgear (selectRandom _helmetOFF);

comment "Add weapons";
_unit addWeapon "CUP_arifle_Mk16_STD";
_unit addPrimaryWeaponItem "CUP_muzzle_snds_SCAR_L";
_unit addPrimaryWeaponItem "optic_Arco";
_unit addWeapon "CUP_hgun_Glock17";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";


_unit addItemToUniform "CUP_17Rnd_9x19_glock17";
_unit addItemToVest "CUP_30Rnd_556x45_Stanag";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";};

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
_unit forceAddUniform "CUP_U_B_FR_DirAction";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACRE_PRC148";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellYellow";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
_unit addItemToUniform "B_IR_Grenade";
_unit addVest "CUP_V_B_MTV_TL";
for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
_unit addHeadgear (selectRandom _helmetOFF);

comment "Add weapons";
_unit addWeapon "CUP_arifle_Mk16_STD";
_unit addPrimaryWeaponItem "CUP_muzzle_snds_SCAR_L";
_unit addPrimaryWeaponItem "optic_Arco";
_unit addWeapon "CUP_launch_M136";
_unit addWeapon "CUP_hgun_Glock17";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";


_unit addItemToUniform "CUP_17Rnd_9x19_glock17";
_unit addItemToVest "CUP_30Rnd_556x45_Stanag";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";};

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
_unit forceAddUniform "CUP_U_B_FR_DirAction";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 6 do {_unit addItemToUniform "SmokeShellYellow";};
for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
_unit addVest "CUP_V_B_MTV_Patrol";
for "_i" from 1 to 9 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
_unit addBackpack "CUP_B_USMC_MOLLE";
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
_unit addHeadgear (selectRandom _helmet);

comment "Add weapons";
_unit addWeapon "CUP_arifle_Mk16_STD";
_unit addPrimaryWeaponItem "CUP_muzzle_snds_SCAR_L";
_unit addPrimaryWeaponItem "CUP_optic_Eotech533";
_unit addWeapon "CUP_hgun_Glock17";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";


_unit addItemToVest "CUP_30Rnd_556x45_Stanag";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";};

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
_unit forceAddUniform "CUP_U_B_FR_DirAction";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addVest "CUP_V_B_MTV_MG";
for "_i" from 1 to 2 do {_unit addItemToVest "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";};

_unit addHeadgear (selectRandom _helmet);

comment "Add weapons";
_unit addWeapon "CUP_lmg_Mk48_des";
_unit addPrimaryWeaponItem "CUP_optic_CompM2_Desert";
_unit addWeapon "CUP_hgun_Glock17";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";


_unit addItemToVest "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";};

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
_unit forceAddUniform "CUP_U_B_FR_DirAction";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_Kestrel4500";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_RangeCard";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellYellow";};
for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
_unit addVest "CUP_V_B_MTV_Marksman";
for "_i" from 1 to 8 do {_unit addItemToVest "CUP_20Rnd_762x51_B_M110";};

_unit addHeadgear (selectRandom _helmet);
_unit addGoggles "G_Bandanna_khk";

comment "Add weapons";
_unit addWeapon "CUP_srifle_M110";
_unit addPrimaryWeaponItem "CUP_muzzle_snds_M110";
_unit addPrimaryWeaponItem "CUP_optic_AN_PVS_10";
_unit addPrimaryWeaponItem "CUP_bipod_VLTOR_Modpod";
_unit addWeapon "CUP_hgun_Glock17";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";


_unit addItemToVest "CUP_20Rnd_762x51_B_M110";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";};

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
_unit forceAddUniform "CUP_U_B_FR_DirAction";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACRE_PRC343_ID_1";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
_unit addVest "CUP_V_B_MTV_LegPouch";
for "_i" from 1 to 9 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 3 do {_unit addItemToVest "CUP_SMAW_Spotting";};
_unit addBackpack "CUP_B_USMC_MOLLE";
for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_SMAW_HEAA_M";};
_unit addItemToBackpack "CUP_SMAW_HEDP_M";
_unit addHeadgear (selectRandom _helmet);

comment "Add weapons";
_unit addWeapon "CUP_arifle_Mk16_STD";
_unit addPrimaryWeaponItem "CUP_muzzle_snds_SCAR_L";
_unit addPrimaryWeaponItem "optic_Arco";
_unit addWeapon "CUP_launch_Mk153Mod0";
_unit addSecondaryWeaponItem "CUP_optic_SMAW_Scope";
_unit addWeapon "CUP_hgun_Glock17";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";


	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";};

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
_unit forceAddUniform "CUP_U_B_FR_DirAction";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
_unit addVest "CUP_V_B_MTV_Mine";
for "_i" from 1 to 12 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
_unit addBackpack "CUP_B_USMC_MOLLE";
_unit addItemToBackpack "ACE_wirecutter";
_unit addItemToBackpack "ACE_DefusalKit";
_unit addItemToBackpack "ACE_M26_Clacker";
for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_Clacker";};
_unit addItemToBackpack "SatchelCharge_Remote_Mag";
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addHeadgear (selectRandom _helmet);

comment "Add weapons";
_unit addWeapon "CUP_arifle_Mk16_STD";
_unit addPrimaryWeaponItem "CUP_muzzle_snds_SCAR_L";
_unit addPrimaryWeaponItem "optic_Arco";
_unit addWeapon "CUP_hgun_Glock17";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";


_unit addItemToVest "CUP_30Rnd_556x45_Stanag";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";};

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
_unit forceAddUniform "CUP_U_B_FR_DirAction";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
_unit addVest "CUP_V_B_MTV_Pouches";
for "_i" from 1 to 12 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
_unit addBackpack "CUP_B_USMC_MOLLE";
for "_i" from 1 to 15 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "UGL_FlareWhite_F";};
_unit addHeadgear (selectRandom _helmet);

comment "Add weapons";
_unit addWeapon "CUP_arifle_Mk16_STD_EGLM";
_unit addPrimaryWeaponItem "CUP_muzzle_snds_SCAR_L";
_unit addPrimaryWeaponItem "optic_Arco";
_unit addWeapon "CUP_hgun_Glock17";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";


_unit addItemToVest "CUP_30Rnd_556x45_Stanag";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";};

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
_unit forceAddUniform "CUP_U_B_FR_DirAction";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellYellow";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
_unit addVest "CUP_V_B_RRV_DA2";
for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
_unit addHeadgear (selectRandom _helmet);

comment "Add weapons";
_unit addWeapon "CUP_arifle_Mk16_STD";
_unit addPrimaryWeaponItem "CUP_muzzle_snds_SCAR_L";
_unit addPrimaryWeaponItem "optic_Arco";
_unit addWeapon "CUP_hgun_Glock17";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";


_unit addItemToVest "CUP_30Rnd_556x45_Stanag";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";};

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
_unit forceAddUniform "CUP_U_B_FR_DirAction";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACRE_PRC343";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
_unit addVest "CUP_V_B_RRV_DA2";
for "_i" from 1 to 10 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
_unit addBackpack "CUP_B_USMC_MOLLE";
for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_30Rnd_556x45_Stanag";};
_unit addHeadgear (selectRandom _helmet);

comment "Add weapons";
_unit addWeapon "CUP_arifle_Mk16_STD";
_unit addPrimaryWeaponItem "CUP_muzzle_snds_SCAR_L";
_unit addPrimaryWeaponItem "optic_Arco";
_unit addWeapon "CUP_hgun_Glock17";
_unit addWeapon "Binocular";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";


_unit addItemToVest "CUP_30Rnd_556x45_Stanag";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";};
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
_unit forceAddUniform "CUP_U_B_FR_Corpsman";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACRE_PRC148";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_17Rnd_9x19_glock17";};
_unit addVest "CUP_V_B_MTV";
for "_i" from 1 to 5 do {_unit addItemToVest "CUP_30Rnd_556x45_Stanag";};
_unit addHeadgear "CUP_H_USMC_Crew_Helmet";

comment "Add weapons";
_unit addWeapon "CUP_arifle_Mk16_STD";
_unit addWeapon "CUP_hgun_Glock17";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "rhsusf_ANPVS_15";};
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15";};

};
