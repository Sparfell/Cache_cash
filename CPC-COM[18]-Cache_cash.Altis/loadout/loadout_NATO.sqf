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
private ["_rhsennemy","_uniform","_helmet","_cap","_hat","_vest1","_vest2","_nvg","_lamp","_bag_small","_bag_medium","_bag_big","_weapon_long","_weapon_short","_weapon_ar","_weapon_m","_weapon_gl","_weapon_mg"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,100,106]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_uniform = [];
	_vest1 = "";
	_vest2 = "";
	_helmet = [];
	_bag_small = "";
	_bag_medium = "";
	_bag_big = "";
	_weapon_long = "";
	_weapon_short = "";
	_weapon_ar = "";
	_weapon_m = "";
	_weapon_gl = "";
	_weapon_mg = "";
	_cap ="";
	_hat = "";

	//MTP
	if (worldName in ["takistan","Altis","IslaDuala3","pja307"]) then 
	{
		_uniform = ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest"];
		_vest1 = "V_PlateCarrier2_rgr";
		_vest2 = "V_PlateCarrier1_rgr";
		_helmet = ["H_HelmetB_camo","H_HelmetSpecB","H_HelmetSpecB_paint2","H_HelmetSpecB_paint1","H_HelmetSpecB_sand","H_HelmetSpecB_snakeskin"];
		_bag_small = "B_AssaultPack_mcamo";
		_bag_medium = "B_Kitbag_mcamo";
		_bag_big = "B_Carryall_mcamo";
		_weapon_long = "arifle_MX_F";
		_weapon_short = "arifle_MXC_F";
		_weapon_ar = "arifle_MX_SW_F";
		_weapon_m = "arifle_MXM_F";
		_weapon_gl = "arifle_MX_GL_F";
		_weapon_mg = "MMG_02_sand_F";
		_cap ="H_MilCap_mcamo";
		_hat = "H_Booniehat_mcamo";
	};
	//WDL
	if (worldName in ["FDF_Isle1_a","Woodland_ACR","chernarus","Chernarus","noe","eden"]) then 
	{
		_uniform = ["U_MU_B_soldier_wdl","U_MU_B_soldier_wdl_vest","U_MU_B_soldier_wdl_tshirt"];
		_vest1 = "V_PlateCarrier2_rgr";
		_vest2 = "V_PlateCarrier1_rgr";
		_helmet = ["H_HelmetB","H_HelmetB_camo"];
		_bag_small = "B_AssaultPack_rgr";
		_bag_medium = "B_Kitbag_rgr";
		_bag_big = "B_Carryall_oli";
		_weapon_long = "arifle_MX_Black_F";
		_weapon_short = "arifle_MXC_Black_F";
		_weapon_ar = "arifle_MX_SW_Black_F";
		_weapon_m = "arifle_MXM_Black_F";
		_weapon_gl = "arifle_MX_GL_Black_F";
		_weapon_mg = "MMG_02_black_F";
		_cap ="H_MU_MilCap_blk";
		_hat = "H_Booniehat_oli";
	};
	//Sage
	if (worldName in ["Sara"]) then 
	{
		_uniform = ["U_MU_B_soldier_sage","U_MU_B_soldier_sage_vest","U_MU_B_soldier_sage_tshirt"];
		_vest1 = "V_PlateCarrier2_rgr";
		_vest2 = "V_PlateCarrier1_rgr";
		_helmet = ["H_HelmetB_light","H_HelmetB_light_snakeskin","H_HelmetB_light_black","H_HelmetB_light_grass"];
		_bag_small = "B_AssaultPack_rgr";
		_bag_medium = "B_Kitbag_rgr";
		_bag_big = "B_Carryall_cbr";
		_weapon_long = "arifle_MX_Black_F";
		_weapon_short = "arifle_MXC_Black_F";
		_weapon_ar = "arifle_MX_SW_Black_F";
		_weapon_m = "arifle_MXM_Black_F";
		_weapon_gl = "arifle_MX_GL_Black_F";
		_weapon_mg = "MMG_02_black_F";
		_cap ="H_MilCap_gry";
		_hat = "H_Booniehat_khk";
	};
	//Jungle
	if (worldName in ["Tanoa","pja305"]) then 
	{
		_uniform = ["U_B_T_Soldier_SL_F","U_B_T_Soldier_F","U_B_T_Soldier_AR_F"];
		_vest1 = "V_PlateCarrier2_tna_F";
		_vest2 = "V_PlateCarrier1_tna_F";
		_helmet = ["H_HelmetB_Enh_tna_F","H_HelmetB_tna_F","H_HelmetB_Light_tna_F"];
		_bag_small = "B_AssaultPack_tna_F";
		_bag_medium = "B_Kitbag_rgr";
		_bag_big = "B_Carryall_oli";
		_weapon_long = "arifle_MX_khk_F";
		_weapon_short = "arifle_MXC_khk_F";
		_weapon_ar = "arifle_MX_SW_khk_F";
		_weapon_m = "arifle_MXM_khk_F";
		_weapon_gl = "arifle_MX_GL_khk_F";
		_weapon_mg = "MMG_02_black_F";
		_cap ="H_MilCap_tna_F";
		_hat = "H_Booniehat_tna_F";
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest _vest2;
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellPurple";};
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
	_unit addHeadgear _cap;

	comment "Add weapons";
	_unit addWeapon _weapon_short;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Holosight_blk_F";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest _vest2;
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
	_unit addBackpack _bag_small;
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_long;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Hamr";
	_unit addWeapon "hgun_P07_F";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
	if (!_rhsennemy) then {_unit addWeapon "launch_NLAW_F";};
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest _vest2;
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack _bag_medium;
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
	_unit addWeapon _weapon_long;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Holosight_blk_F";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest _vest2;
	for "_i" from 1 to 4 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack _bag_small;
	for "_i" from 1 to 4 do {_unit addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_ar;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Hamr";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest _vest2;
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack _bag_medium;
	for "_i" from 1 to 6 do {_unit addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_long;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Holosight_blk_F";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest _vest2;
	_unit addItemToVest "130Rnd_338_Mag";
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack _bag_small;
	for "_i" from 1 to 2 do {_unit addItemToBackpack "130Rnd_338_Mag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_mg;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Hamr";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest _vest2;
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack _bag_medium;
	for "_i" from 1 to 4 do {_unit addItemToBackpack "130Rnd_338_Mag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_long;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Aco";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest _vest1;
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_long;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Aco";
	_unit addWeapon "launch_I_Titan_short_F";
	_unit addsecondaryweaponitem "Titan_AT";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest _vest2;
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack _bag_big;
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AT";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_short;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Holosight_blk_F";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest _vest2;
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack _bag_medium;
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_short;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Holosight_blk_F";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest _vest1;
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_Kestrel4500";
	_unit addItemToVest "ACE_RangeCard";
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_m;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_SOS";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest _vest1;
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 10 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 4 do {_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_gl;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Hamr";
	_unit addWeapon "hgun_P07_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest _vest2;
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addBackpack _bag_big;
	for "_i" from 1 to 10 do {_unit addItemToBackpack "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_White";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_long;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Aco";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest _vest1;
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_long;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Aco";
	_unit addWeapon "hgun_P07_F";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_M136";};
	if (!_rhsennemy) then {_unit addWeapon "launch_NLAW_F";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest _vest1;
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_long;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Aco";
	_unit addWeapon "hgun_P07_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest "V_TacVest_khk";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	_unit addHeadgear "H_HelmetCrew_B";

	comment "Add weapons";
	_unit addWeapon _weapon_short;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Aco";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit forceAddUniform "U_B_HeliPilotCoveralls";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest "V_TacVest_blk";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_9x21_Mag";};
	_unit addHeadgear "H_PilotHelmetHeli_B";

	comment "Add weapons";
	_unit addWeapon "hgun_PDW2000_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_ATragMX";
	_unit addItemToUniform "ACE_RangeCard";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_Chestrig_rgr";
	for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
	for "_i" from 1 to 8 do {_unit addItemToVest "7Rnd_408_Mag";};
	_unit addBackpack _bag_small;
	for "_i" from 1 to 4 do {_unit addItemToBackpack "7Rnd_408_Mag";};
	_unit addItemToBackpack "ACRE_PRC148";
	_unit addHeadgear _hat;

	comment "Add weapons";
	_unit addWeapon "srifle_LRR_F";
	_unit addPrimaryWeaponItem "optic_LRPS";
	_unit addWeapon "hgun_P07_F";
	_unit addHandgunItem "muzzle_snds_L";
	_unit addWeapon "Rangefinder";

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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACE_ATragMX";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "V_Chestrig_rgr";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
	for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	_unit addBackpack _bag_small;
	_unit addItemToBackpack "ACE_Tripod";
	_unit addItemToBackpack "ACE_SpottingScope";
	_unit addHeadgear _hat;

	comment "Add weapons";
	_unit addWeapon _weapon_short;
	_unit addPrimaryWeaponItem "acc_pointer_IR";
	_unit addPrimaryWeaponItem "optic_Hamr";
	_unit addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
	_unit addWeapon "hgun_P07_F";
	_unit addHandgunItem "muzzle_snds_L";
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellBlue";};
	_unit addVest _vest2;
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
	_unit addBackpack _bag_small;
	_unit addItemToBackpack "ACRE_PRC117F";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "Laserbatteries";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellPurple";};
	_unit addHeadgear (selectrandom _helmet);

	comment "Add weapons";
	_unit addWeapon _weapon_short;
	if (_nvg) then {_unit addPrimaryWeaponItem "acc_pointer_IR";};
	if (_lamp) then {_unit addPrimaryWeaponItem "acc_flashlight";};
	_unit addPrimaryWeaponItem "optic_Holosight_blk_F";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Laserdesignator";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "NVGoggles_OPFOR";};
};
