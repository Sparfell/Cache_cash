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
	_unit forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_HandFlare_Yellow";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellYellow";};
	_unit addVest "rhs_6sh92_digi_radio";
	for "_i" from 1 to 3 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addHeadgear "CUP_H_FR_BeanieGreen";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m_npz";
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
	_unit addPrimaryWeaponItem "CUP_optic_HoloBlack";
	_unit addWeapon "rhs_pdu4";

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
	_unit forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_IR_Strobe_Item";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_HandFlare_Yellow";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellYellow";};
	_unit addVest "rhs_6sh92_digi_radio";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
	for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_green";};
	_unit addBackpack "B_AssaultPack_rgr";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N22_AK";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellYellow";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rgo";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_nspn_yellow";};
	_unit addGoggles "rhs_balaclava";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m_2mag_npz";
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
	_unit addPrimaryWeaponItem "optic_MRCO";
	_unit addWeapon "rhs_weap_rpg26";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 9 do {_unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
	_unit addBackpack "B_Carryall_oli";
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
	_unit addHeadgear "rhs_Booniehat_digi";
	_unit addGoggles "rhs_scarf";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m_2mag_npz";
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
	_unit addPrimaryWeaponItem "CUP_optic_MRad";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_100Rnd_762x54mmR_green";};
	_unit addBackpack "B_Carryall_oli";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addHeadgear "rhs_Booniehat_flora";
	_unit addGoggles "G_Bandanna_oli";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_pkm";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 18 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
	_unit addBackpack "B_FieldPack_oli";
	_unit addItemToVest "ACE_MapTools";
	_unit addItemToVest "ACE_Kestrel4500";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_Clacker";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	_unit addGoggles "rhs_balaclava1_olive";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_svdp_wd";
	_unit addPrimaryWeaponItem "rhs_acc_pso1m2";
	_unit addWeapon "rhs_pdu4";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemRadio";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 9 do {_unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
	_unit addBackpack "rhs_rpg_empty";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_OG7V_mag";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
	_unit addGoggles "rhs_balaclava1_olive";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m_npz";
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
	_unit addPrimaryWeaponItem "CUP_optic_ZDDot";
	_unit addWeapon "rhs_weap_rpg7";
	_unit addSecondaryWeaponItem "rhs_acc_pgo7v";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 9 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
	_unit addBackpack "rhs_assault_umbts_engineer_empty";
	_unit addItemToBackpack "ACE_DefusalKit";
	_unit addItemToBackpack "ACE_M26_Clacker";
	_unit addItemToBackpack "SatchelCharge_Remote_Mag";
	_unit addItemToBackpack "ACE_wirecutter";
	_unit addHeadgear "H_Bandanna_khk";
	_unit addGoggles "rhs_scarf";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m_2mag";
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
	_unit addPrimaryWeaponItem "rhs_acc_pkas";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi_vog";
	for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
	for "_i" from 1 to 6 do {_unit addItemToVest "rhs_VOG25";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_VG40TB";};
	for "_i" from 1 to 3 do {_unit addItemToVest "rhs_GDM40";};
	_unit addHeadgear "rhs_beanie_green";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m_gp25";
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	_unit addPrimaryWeaponItem "rhs_acc_ekp1";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 9 do {_unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
	_unit addGoggles "rhs_balaclava";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m_2mag_npz";
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
	_unit addPrimaryWeaponItem "optic_MRCO";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

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
	_unit forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rgo";};
	_unit addVest "rhs_6sh92_digi";
	for "_i" from 1 to 9 do {_unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
	_unit addBackpack "B_Carryall_oli";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N22_AK";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rgo";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_nspn_green";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
	_unit addGoggles "rhs_balaclava1_olive";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m_npz";
	_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
	_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
	_unit addPrimaryWeaponItem "CUP_optic_MRad";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";

	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};
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
	_unit forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_Flashlight_KSF1";
	_unit addItemToUniform "ACRE_PRC343";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACRE_PRC148";
	_unit addItemToUniform "ACE_microDAGR";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
	_unit addItemToUniform "ACE_HandFlare_Yellow";
	_unit addVest "rhs_vydra_3m";
	for "_i" from 1 to 7 do {_unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
	_unit addHeadgear "rhs_tsh4_bala";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_ak74m";
	_unit addPrimaryWeaponItem "rhs_acc_dtk";
	_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	if ((paramsArray select 3) == 1) then {_unit linkitem "CUP_NVG_PVS7";};

};
