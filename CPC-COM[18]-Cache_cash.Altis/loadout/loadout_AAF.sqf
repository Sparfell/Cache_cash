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
private ["_rhsennemy","_uniform","_helmet","_nvg","_lamp"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,100,106]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_uniform = ["U_I_CombatUniform","U_I_CombatUniform_shortsleeve"];
	_helmet = [];
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
	_unit forceAddUniform "U_I_OfficerUniform";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 4 do {_unit addItemToUniform "SmokeShellGreen";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellPurple";};
	_unit addVest "V_PlateCarrierIA1_dgtl";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Yellow";};
	_unit addItemToVest "I_IR_Grenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Green";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellPurple";};
	_unit addHeadgear "H_MilCap_dgtl";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20C_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_ACO_grn";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	for "_i" from 1 to 3 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addVest "V_PlateCarrierIA2_dgtl";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_IR_Strobe_Item";
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Yellow";};
	_unit addBackpack "B_AssaultPack_dgtl";
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_MRCO";
	_unit addWeapon "hgun_ACPC2_F";
	_unit addWeapon "Rangefinder";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_m72a7";};
	if (!_rhsennemy) then {_unit addWeapon "launch_NLAW_F";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_PlateCarrierIA1_dgtl";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack "B_Kitbag_rgr";
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
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_ACO_grn";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	_unit addVest "V_PlateCarrierIA2_dgtl";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "200Rnd_65x39_cased_Box";
	_unit addItemToVest "200Rnd_65x39_cased_Box_Tracer";
	_unit addBackpack "B_AssaultPack_dgtl";
	_unit addItemToBackpack "200Rnd_65x39_cased_Box";
	_unit addItemToBackpack "200Rnd_65x39_cased_Box_Tracer";
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "LMG_Mk200_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Holosight";
	_unit addWeapon "hgun_ACPC2_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	_unit addVest "V_PlateCarrierIA2_dgtl";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack "B_AssaultPack_dgtl";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "200Rnd_65x39_cased_Box";};
	_unit addItemToBackpack "200Rnd_65x39_cased_Box_Tracer";
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_ACO_grn";
	_unit addWeapon "hgun_ACPC2_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	_unit addVest "V_PlateCarrierIA2_dgtl";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "200Rnd_65x39_cased_Box";
	_unit addItemToVest "200Rnd_65x39_cased_Box_Tracer";
	_unit addBackpack "B_AssaultPack_dgtl";
	_unit addItemToBackpack "200Rnd_65x39_cased_Box";
	_unit addItemToBackpack "200Rnd_65x39_cased_Box_Tracer";
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "LMG_Mk200_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Arco";
	_unit addWeapon "hgun_ACPC2_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	_unit addVest "V_PlateCarrierIA2_dgtl";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack "B_AssaultPack_dgtl";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "200Rnd_65x39_cased_Box";};
	_unit addItemToBackpack "200Rnd_65x39_cased_Box_Tracer";
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_MRCO";
	_unit addWeapon "hgun_ACPC2_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_PlateCarrierIA1_dgtl";
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack "B_AssaultPack_dgtl";
	_unit addItemToBackpack "Titan_AT";
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_ACO_grn";
	_unit addWeapon "launch_I_Titan_short_F";
	_unit addItemToBackpack "Titan_AT";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_PlateCarrierIA1_dgtl";
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack "B_Carryall_oli";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AT";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AP";};
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_ACO_grn";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	_unit addVest "V_PlateCarrierIA2_dgtl";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack "B_AssaultPack_dgtl";
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_ACO_grn";
	_unit addWeapon "hgun_ACPC2_F";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_RangeCard";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	_unit addVest "V_PlateCarrierIA2_dgtl";
	for "_i" from 1 to 10 do {_unit addItemToVest "20Rnd_762x51_Mag";};
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "srifle_EBR_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_SOS";
	_unit addPrimaryWeaponItem "bipod_03_F_blk";
	_unit addWeapon "hgun_ACPC2_F";
	_unit addWeapon "Rangefinder";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	_unit addVest "V_PlateCarrierIA2_dgtl";
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 10 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 4 do {_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_GL_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_MRCO";
	_unit addWeapon "hgun_ACPC2_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_PlateCarrierIA1_dgtl";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack "B_Carryall_oli";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Green";};
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_MRCO";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	_unit addVest "V_PlateCarrierIA2_dgtl";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_ACO_grn";
	_unit addWeapon "hgun_ACPC2_F";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_m72a7";};
	if (!_rhsennemy) then {_unit addWeapon "launch_NLAW_F";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	_unit addVest "V_PlateCarrierIA2_dgtl";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_ACO_grn";
	_unit addWeapon "hgun_ACPC2_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_TacVest_oli";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	_unit addHeadgear "H_HelmetCrew_I";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20C_F";
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform "U_I_HeliPilotCoveralls";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Green";};
	_unit addVest "V_TacVest_oli";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_microDAGR";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	_unit addHeadgear "H_PilotHelmetHeli_I";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20C_F";
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform "U_I_GhillieSuit";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_ATragMX";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 3 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	_unit addVest "V_Chestrig_rgr";
	for "_i" from 1 to 12 do {_unit addItemToVest "rhsusf_5Rnd_762x51_m118_special_Mag";};
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m24sws";
	_unit addPrimaryWeaponItem "rhsusf_acc_premier_low";
	_unit addPrimaryWeaponItem "bipod_02_F_blk";
	_unit addWeapon "hgun_ACPC2_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform "U_I_GhillieSuit";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_ATragMX";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "V_Chestrig_rgr";
	_unit addItemToVest "ACE_SpottingScope";
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20C_F";
	_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	_unit addPrimaryWeaponItem "optic_MRCO";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg or _lamp) then {_unit linkItem "NVGoggles_INDEP";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_HandFlare_Green";};
	for "_i" from 1 to 4 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addVest "V_PlateCarrierIA1_dgtl";
	_unit addItemToVest "ACE_IR_Strobe_Item";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_microDAGR";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 6 do {_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HuntIR_M203";};
	_unit addBackpack "B_Kitbag_rgr";
	_unit addItemToBackpack "ACRE_PRC117F";
	_unit addItemToBackpack "ACE_HuntIR_monitor";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
	_unit addHeadgear "H_Booniehat_dgtl";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_GL_F";
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_ACO_grn";
	_unit addWeapon "Laserdesignator";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_INDEP";};
};
