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
	_unit forceAddUniform "U_O_CombatUniform_ocamo";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellOrange";};
	_unit addVest "V_TacVest_khk";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
	_unit addHeadgear "H_MilCap_ocamo";

	comment "Add weapons";
	_unit addWeapon "arifle_Katiba_C_F";
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "ACE_acc_pointer_green";};
	_unit addPrimaryWeaponItem "optic_Arco";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "NVGoggles_OPFOR";};

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
	_unit forceAddUniform "U_O_CombatUniform_ocamo";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellOrange";};
	_unit addVest "V_HarnessO_brn";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_green_mag_Tracer";};
	_unit addBackpack "B_AssaultPack_ocamo";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_65x39_caseless_green";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "SmokeShellOrange";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "HandGrenade";};
	_unit addHeadgear "H_HelmetLeaderO_ocamo";

	comment "Add weapons";
	_unit addWeapon "arifle_Katiba_F";
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "ACE_acc_pointer_green";};
	_unit addPrimaryWeaponItem "optic_Arco";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";


	
	if ((paramsArray select 3) == 1) then {_unit linkitem "NVGoggles_OPFOR";};

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
	_unit forceAddUniform "U_O_CombatUniform_ocamo";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_Chestrig_khk";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
	_unit addBackpack "B_Carryall_khk";
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
	_unit addHeadgear "H_HelmetLeaderO_ocamo";

	comment "Add weapons";
	_unit addWeapon "arifle_Katiba_F";
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "ACE_acc_pointer_green";};
	_unit addPrimaryWeaponItem "optic_ACO_grn";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "NVGoggles_OPFOR";};

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
	_unit forceAddUniform "U_O_CombatUniform_ocamo";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "HandGrenade";
	_unit addVest "V_HarnessO_brn";
	for "_i" from 1 to 3 do {_unit addItemToVest "150Rnd_762x54_Box_Tracer";};
	_unit addHeadgear "H_HelmetLeaderO_ocamo";

	comment "Add weapons";
	_unit addWeapon "LMG_Zafir_F";
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "ACE_acc_pointer_green";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "150Rnd_762x54_Box_Tracer";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "NVGoggles_OPFOR";};

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
	_unit forceAddUniform "U_O_CombatUniform_ocamo";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_Kestrel4500";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_HarnessO_brn";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 7 do {_unit addItemToVest "10Rnd_762x54_Mag";};
	for "_i" from 1 to 7 do {_unit addItemToVest "ACE_10Rnd_762x54_Tracer_mag";};
	_unit addHeadgear "H_HelmetLeaderO_ocamo";

	comment "Add weapons";
	_unit addWeapon "srifle_DMR_01_F";
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "ACE_acc_pointer_green";};
	if ((paramsArray select 3) == 1) then {_unit addPrimaryWeaponItem "optic_NVS"; _unit additemtoVest "optic_DMS";} else {_unit addPrimaryWeaponItem "optic_DMS";};
	_unit addPrimaryWeaponItem "optic_DMS";
	_unit addPrimaryWeaponItem "bipod_02_F_hex";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "NVGoggles_OPFOR";};

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
	_unit forceAddUniform "U_O_CombatUniform_ocamo";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_HarnessO_brn";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
	_unit addBackpack "B_FieldPack_ocamo";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "RPG32_F";};
	_unit addItemToBackpack "RPG32_HE_F";
	_unit addHeadgear "H_HelmetLeaderO_ocamo";

	comment "Add weapons";
	_unit addWeapon "arifle_Katiba_F";
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "ACE_acc_pointer_green";};
	_unit addPrimaryWeaponItem "optic_ACO_grn";
	_unit addWeapon "launch_RPG32_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "NVGoggles_OPFOR";};

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
	_unit forceAddUniform "U_O_CombatUniform_ocamo";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_TacVest_khk";
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack "B_TacticalPack_ocamo";
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	_unit addHeadgear "H_HelmetLeaderO_ocamo";

	comment "Add weapons";
	_unit addWeapon "arifle_Katiba_F";
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "ACE_acc_pointer_green";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "NVGoggles_OPFOR";};

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
	_unit forceAddUniform "U_O_CombatUniform_ocamo";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "30Rnd_65x39_caseless_green";
	_unit addVest "V_HarnessOGL_brn";
	for "_i" from 1 to 7 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
	for "_i" from 1 to 10 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
	_unit addHeadgear "H_HelmetLeaderO_ocamo";

	comment "Add weapons";
	_unit addWeapon "arifle_Katiba_GL_F";
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "ACE_acc_pointer_green";};
	_unit addPrimaryWeaponItem "optic_ACO_grn";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "NVGoggles_OPFOR";};

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
	_unit forceAddUniform "U_O_CombatUniform_ocamo";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_HarnessO_brn";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
	_unit addHeadgear "H_HelmetLeaderO_ocamo";

	comment "Add weapons";
	_unit addWeapon "arifle_Katiba_F";
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "ACE_acc_pointer_green";};
	_unit addPrimaryWeaponItem "optic_ACO_grn";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "NVGoggles_OPFOR";};

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
	_unit forceAddUniform "U_O_CombatUniform_ocamo";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_TacVest_khk";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
	_unit addBackpack "B_Carryall_khk";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_65x39_caseless_green";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "HandGrenade";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "150Rnd_762x54_Box_Tracer";};
	_unit addItemToBackpack "RPG32_F";
	_unit addHeadgear "H_HelmetLeaderO_ocamo";

	comment "Add weapons";
	_unit addWeapon "arifle_Katiba_F";
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "ACE_acc_pointer_green";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "NVGoggles_OPFOR";};
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
	_unit forceAddUniform "U_O_CombatUniform_ocamo";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_TacVest_khk";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
	_unit addHeadgear "H_HelmetCrew_O";

	comment "Add weapons";
	_unit addWeapon "arifle_Katiba_C_F";
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "acc_flashlight";} else {_unit addPrimaryWeaponItem "ACE_acc_pointer_green";};
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemGPS";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "NVGoggles_OPFOR";};

};
