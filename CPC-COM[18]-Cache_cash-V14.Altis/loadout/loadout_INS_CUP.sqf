
hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_uniform = ["rhsgref_uniform_woodland_olive","rhsgref_uniform_woodland","rhsgref_uniform_reed","rhsgref_uniform_tigerstripe","rhsgref_uniform_flecktarn"];
	_headgear = ["rhs_beanie_green","CUP_H_FR_BandanaWdl","CUP_H_SLA_BeanieGreen","CUP_H_SLA_BeanieGreen","H_Beret_blk","rhs_ssh68","CUP_H_C_Ushanka_03","rhs_Booniehat_flora","CUP_H_C_Beanie_02","H_Bandanna_camo","H_Bandanna_sgg","H_Bandanna_gry","CUP_H_C_Beanie_04","H_Booniehat_khk","H_Booniehat_oli","H_Cap_oli","H_Cap_blk"];
	
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
	_unit forceAddUniform (selectRandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest "CUP_V_B_GER_Carrier_Rig_3_Brown";
	_unit addItemToVest "ACE_DAGR";
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Red";};
	for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addHeadgear (selectRandom _headgear);
	_unit addGoggles "G_Aviator";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	_unit addWeapon "rhs_weap_rsp30_red";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform (selectRandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest "CUP_V_B_GER_Carrier_Rig_3_Brown";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addItemToVest "CUP_HandGrenade_RGD5";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_Red";};
	_unit addHeadgear (selectRandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akm";
	_unit addWeapon "rhs_weap_rsp30_red";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform (selectRandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_B_GER_Carrier_Rig_2_Brown";
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack "B_Carryall_cbr";
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
	_unit addHeadgear (selectRandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform (selectRandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_OI_TKI_Jacket3_01";
	_unit addItemToVest "rhs_100Rnd_762x54mmR_green";
	_unit addBackpack "CUP_B_CivPack_WDL";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear (selectRandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pkm";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform (selectRandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "CUP_HandGrenade_RGD5";
	_unit addVest "CUP_V_B_GER_Carrier_Rig_2_Brown";
	for "_i" from 1 to 18 do {_unit addItemToVest "CUP_10Rnd_762x54_SVD_M";};
	_unit addHeadgear (selectRandom _headgear);
	_unit addGoggles "G_Bandanna_khk";

	comment "Add weapons";
	_unit addWeapon "CUP_srifle_SVD";
	_unit addPrimaryWeaponItem "CUP_optic_PSO_1";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform (selectRandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_B_GER_Carrier_Rig_2_Brown";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack "CUP_B_RPGPack_Khaki";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "CUP_PG7VM_M";};
	_unit addHeadgear (selectRandom _headgear);
	_unit addGoggles "G_Bandanna_oli";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	_unit addWeapon "CUP_launch_RPG7V";
	_unit addSecondaryWeaponItem "CUP_optic_PGO7V2";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToBackpack "CUP_PG7VM_M";;
	
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform (selectRandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_B_GER_Carrier_Rig_2_Brown";
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack "CUP_B_AlicePack_Khaki";
	_unit addItemToBackpack "ACE_Clacker";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_EntrenchingTool";
	_unit addItemToBackpack "ACE_DeadManSwitch";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addHeadgear (selectRandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform (selectRandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addVest "CUP_V_B_GER_Carrier_Rig_2_Brown";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addBackpack "CUP_B_SLA_Medicbag";
	for "_i" from 1 to 20 do {_unit addItemToBackpack "rhs_VOG25";};
	for "_i" from 1 to 8 do {_unit addItemToBackpack "rhs_VG40OP_white";};
	_unit addHeadgear (selectRandom _headgear);
	_unit addGoggles "rhs_scarf";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akm_gp25";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform (selectRandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_B_GER_Carrier_Rig_2_Brown";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	_unit addHeadgear (selectRandom _headgear);

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akm";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform (selectRandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_B_GER_Carrier_Rig_2_Brown";
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	_unit addHeadgear (selectRandom _headgear);
	_unit addBackpack "CUP_B_ACRPara_m95";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_30Rnd_762x39mm";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_HandGrenade_RGD5";};
	_unit addItemToBackpack "CUP_PG7VL_M";
	
	comment "Add weapons";
	_unit addWeapon "rhs_weap_akm";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform (selectRandom _uniform);
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 2 do {_unit addItemToUniform "CUP_HandGrenade_RGD5";};
	_unit addVest "CUP_V_B_GER_Carrier_Rig_3_Brown";
	for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_762x39mm";};
	_unit addHeadgear "rhs_tsh4";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_akms";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 2) then {_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";};
	if ((paramsArray select 3) == 1) then {_unit linkItem "CUP_NVG_PVS7";};
};
