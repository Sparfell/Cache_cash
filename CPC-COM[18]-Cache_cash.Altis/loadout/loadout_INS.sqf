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
private ["_rhsennemy","_uniform","_helmet","_nvg","_lamp","_face","_vest1","_vest2","_weapon","_bag_small","_bag_medium","_bag_big"];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,17,18,19,100,106,108,109]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_uniform = [];
	_helmet = [];
	_face = [];
	_vest1 = [];
	_vest2 = [];
	_weapon = ["rhs_weap_akm","rhs_weap_akms"];
	_bag_small = ["B_FieldPack_cbr","B_FieldPack_khk","B_FieldPack_oli"];
	_bag_medium = ["B_TacticalPack_oli","B_MU_TacticalPack_cbr","B_TacticalPack_blk"];
	_bag_big = ["B_Carryall_khk","B_Carryall_oli"];
	
	//WDL
	if (CPC_MAP in ["chernarus","chernarus_summer","fdf_isle1_a","woodland_acr","eden"]) then 
	{
		_uniform = ["U_BG_Guerrilla_6_1","CUP_U_O_CHDKZ_Kam_03","CUP_U_O_CHDKZ_Kam_01","CUP_U_O_CHDKZ_Kam_04","CUP_U_O_CHDKZ_Kam_02","rhs_chdkz_uniform_4","rhs_chdkz_uniform_3","rhsgref_uniform_woodland_olive","rhsgref_uniform_woodland","rhsgref_uniform_reed","rhsgref_uniform_flecktarn","CUP_U_I_GUE_Flecktarn2","CUP_U_I_GUE_Flecktarn","CUP_U_I_GUE_Woodland1","CUP_U_I_GUE_Anorak_03"];
		_helmet = ["H_Bandanna_camo","H_Bandanna_mcamo","H_Bandanna_gry","rhs_beanie_green","CUP_H_C_Beanie_02","CUP_H_ChDKZ_Beanie","H_Beret_blk","H_Booniehat_oli","H_Booniehat_khk","H_Cap_grn","rhs_fieldcap_digi2","CUP_H_ChDKZ_Cap","CUP_H_ChDKZ_Beret","CUP_H_SLA_BeanieGreen","CUP_H_SLA_BeanieGreen","CUP_H_SLA_BeanieGreen","rhs_ssh68","CUP_H_C_Ushanka_03",""];
		_face = ["G_Bandanna_oli","G_Bandanna_blk","G_Bandanna_khk","","","","","",""];
		_vest1 = ["CUP_V_I_Carrier_Belt","CUP_V_B_GER_Carrier_Rig_2_Brown","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_RUS_Smersh_1","V_TacChestrig_grn_F","V_TacChestrig_oli_F","V_TacVest_blk","V_TacVest_camo","V_TacVest_khk","V_TacVest_oli","V_I_G_resistanceLeader_F"];
		_vest2 = ["CUP_V_B_GER_Carrier_Rig_3_Brown","CUP_V_O_Ins_Carrier_Rig_Com","CUP_V_I_RACS_Carrier_Rig_wdl_3","CUP_V_RUS_Smersh_2"];
	};
	
	//DES
	if (CPC_MAP in ["takistan","pja307"]) then 
	{
		_uniform = ["CPC_ME_Uniform_M93_sand_1","CPC_ME_Uniform_M93_sand_2","CPC_ME_Uniform_M93_sand_3","CPC_ME_Uniform_M93_sand_4","rhs_chdkz_uniform_4","rhs_chdkz_uniform_3","U_MU_B_GuerillaGarment2","U_MU_B_GuerillaGarment2_brown","U_MU_B_GuerillaGarment2_grey","U_MU_B_GuerillaGarment2_skull","U_BG_Guerilla1_1","U_MU_B_GuerillaGarment_brown","U_MU_B_GuerillaGarment_grey","U_MU_B_GuerillaGarment_skull","U_BG_leader","CUP_O_TKI_Khet_Jeans_04","CUP_O_TKI_Khet_Jeans_02","CUP_O_TKI_Khet_Jeans_01"];
		_helmet = ["H_ShemagOpen_khk","H_ShemagOpen_khk","H_ShemagOpen_khk","H_ShemagOpen_tan","H_Shemag_olive","CUP_H_TKI_Lungee_01","CUP_H_TKI_Lungee_02","CUP_H_TKI_Lungee_03","CUP_H_TKI_Lungee_04","CUP_H_TKI_Lungee_05","CUP_H_TKI_Lungee_06"];
		_face = [""];
		_vest1 = ["CUP_V_I_Carrier_Belt","CUP_V_B_GER_Carrier_Rig_2_Brown","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_RUS_Smersh_1","V_TacChestrig_grn_F","V_TacChestrig_oli_F","V_TacVest_blk","V_TacVest_camo","V_TacVest_khk","V_TacVest_oli","V_I_G_resistanceLeader_F"];
		_vest2 = ["CUP_V_B_GER_Carrier_Rig_3_Brown","CUP_V_O_Ins_Carrier_Rig_Com","CUP_V_I_RACS_Carrier_Rig_wdl_3","CUP_V_RUS_Smersh_2"];
	};
	
	//Jungle
	if (CPC_MAP in ["tanoa","pja305","isladuala3"]) then 
	{
		_uniform = ["U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Camo_F"];
		_helmet = ["H_Bandanna_camo","CUP_H_FR_BandanaWdl","CUP_H_FR_BandanaGreen","H_Bandanna_sgg","rhs_Booniehat_digi","H_Booniehat_khk","CPC_JUN_fieldcap","H_Booniehat_oli","rhs_Booniehat_m81","CPC_JUN_fieldcap","CPC_JUN_fieldcap","CPC_JUN_fieldcap"];
		_face = ["G_Bandanna_oli","G_Bandanna_blk","G_Bandanna_khk","","","","","",""];
		_vest1 = ["CUP_V_I_Carrier_Belt","CUP_V_B_GER_Carrier_Rig_2_Brown","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_RUS_Smersh_1","V_TacChestrig_grn_F","V_TacChestrig_oli_F","V_TacVest_camo","V_TacVest_oli","V_I_G_resistanceLeader_F"];
		_vest2 = ["CUP_V_B_GER_Carrier_Rig_3_Brown","CUP_V_O_Ins_Carrier_Rig_Com","CUP_V_I_RACS_Carrier_Rig_wdl_3","CUP_V_RUS_Smersh_2"];
	};
	
	//Autre
	if (CPC_MAP in ["altis","sara","noe"]) then 
	{
		_uniform = ["U_BG_Guerilla1_1","U_MU_B_GuerillaGarment2","U_MU_B_GuerillaGarment2_grey","U_MU_B_GuerillaGarment2_brown","U_MU_B_GuerillaGarment_brown","U_MU_B_GuerillaGarment_grey","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_BG_leader","U_BG_Guerrilla_6_1"];
		_helmet = ["H_Bandanna_cbr","H_Bandanna_khk","H_Bandanna_camo","H_Bandanna_mcamo","H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_tan","H_Cap_blk","H_Cap_grn","H_Cap_tan","H_Cap_blk_Raven"];
		_face = ["G_Bandanna_oli","G_Bandanna_blk","G_Bandanna_khk","","","","","",""];
		_vest1 = ["CUP_V_I_Carrier_Belt","CUP_V_B_GER_Carrier_Rig_2_Brown","CUP_V_I_RACS_Carrier_Rig_wdl_2","CUP_V_RUS_Smersh_1","V_TacChestrig_grn_F","V_TacChestrig_oli_F","V_TacVest_blk","V_TacVest_camo","V_TacVest_khk","V_TacVest_oli","V_I_G_resistanceLeader_F"];
		_vest2 = ["CUP_V_B_GER_Carrier_Rig_3_Brown","CUP_V_O_Ins_Carrier_Rig_Com","CUP_V_I_RACS_Carrier_Rig_wdl_3","CUP_V_RUS_Smersh_2"];
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellYellow";};
	_unit addVest (selectrandom _vest2);
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_microDAGR";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "ACE_HandFlare_Red";
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellYellow";};
	_unit addVest (selectrandom _vest2);
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_MapTools";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "ACE_HandFlare_Red";
	_unit addBackpack (selectrandom _bag_medium);
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_m72a7";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_RPG18";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	_unit addBackpack (selectrandom _bag_small);
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
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	for "_i" from 1 to 4 do {_unit addItemToVest "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	_unit addBackpack (selectrandom _bag_small);
	for "_i" from 1 to 6 do {_unit addItemToBackpack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "CUP_arifle_RPK74_45";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	_unit addBackpack (selectrandom _bag_big);
	for "_i" from 1 to 8 do {_unit addItemToBackpack "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";};
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest "CUP_V_O_Ins_Carrier_Rig_MG";
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	_unit addItemToVest "rhs_100Rnd_762x54mmR";
	_unit addBackpack (selectrandom _bag_medium);
	_unit addItemToBackpack "rhs_100Rnd_762x54mmR";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pkm";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	_unit addBackpack (selectrandom _bag_big);
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_rhsennemy) then {
		_unit addWeapon "rhs_weap_rpg7";
		_unit addSecondaryWeaponItem "rhs_acc_pgo7v";
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
	};
	if (!_rhsennemy) then {
		_unit addBackpack "CUP_B_RPGPack_Khaki";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_PG7VM_M";};
		_unit addWeapon "CUP_launch_RPG7V";
		_unit addItemToBackpack "CUP_PG7VM_M";
	};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	if (_rhsennemy) then {
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
	};
	if (!_rhsennemy) then {
		_unit addBackpack "CUP_B_RPGPack_Khaki";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_PG7VM_M";};
	};
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	_unit addBackpack (selectrandom _bag_medium);
	_unit addItemToBackpack "ACE_Clacker";
	_unit addItemToBackpack "ACE_Cellphone";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "CUP_PipeBomb_M";};
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	for "_i" from 1 to 11 do {_unit addItemToVest "rhsgref_10Rnd_792x57_m76";};
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m76";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m2";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_VOG25";};
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms_gp25";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	_unit addBackpack (selectrandom _bag_big);
	for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_30Rnd_762x39mm";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "CUP_HandGrenade_RGD5";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HandFlare_Red";};
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if (_rhsennemy) then {_unit addWeapon "rhs_weap_m72a7";};
	if (!_rhsennemy) then {_unit addWeapon "CUP_launch_RPG18";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACRE_PRC148";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addHeadgear "CUP_H_TK_TankerHelmet";

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit forceAddUniform (selectrandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest1);
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_microDAGR";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_9x18_8_57N181S";};
	_unit addHeadgear "CUP_H_PMC_EP_Headset";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_makarov_pm";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_RangeCard";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest (selectrandom _vest1);
	for "_i" from 1 to 12 do {_unit addItemToVest "CUP_10x_303_M";};
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon "CUP_srifle_LeeEnfield_rail";
	_unit addPrimaryWeaponItem "CUP_optic_LeupoldMk4";
	_unit addPrimaryWeaponItem "bipod_02_F_blk";
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest (selectrandom _vest2);
	_unit addItemToVest "ACRE_PRC148";
	_unit addItemToVest "ACE_MapTools";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack (selectrandom _bag_small);
	_unit addItemToBackpack "ACE_SpottingScope";
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	_unit addPrimaryWeaponItem "rhs_acc_pbs1";
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "ACE_Vector";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
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
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellYellow";};
	_unit addVest (selectrandom _vest1);
	_unit addItemToVest "ACE_MapTools";
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	_unit addBackpack (selectrandom _bag_small);
	_unit addItemToBackpack "ACRE_PRC117F";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellYellow";};
	_unit addHeadgear (selectrandom _helmet); _unit addgoggles (selectrandom _face);

	comment "Add weapons";
	_unit addWeapon (selectrandom _weapon);
	if (_nvg or _lamp) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	if (_nvg) then {_unit linkItem "ACE_NVG_Gen1";};
};
