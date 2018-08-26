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
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/


hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	_uniform = "";
	_vest = "";
	_backpack_big = "";
	_backpack_small = "";
	_headgear = "";
	_hat = "";
	_facewear = [];
	_nvg = "";
	_lamp = "";
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];
	
	switch (cc_loadoutcamo) do {
		case "polyvalent": {
			_uniform = "rhsgref_uniform_altis_lizard";
			_vest = "rhsgref_otv_khaki";
			_backpack_big = "B_Carryall_khk";
			_backpack_small = "B_FieldPack_khk";
			_headgear = "rhsgref_helmet_pasgt_altis_lizard";
			_hat = "H_Booniehat_khk";
			_facewear = ["rhs_ess_black","rhsusf_oakley_goggles_clr","rhs_googles_black","G_Shades_Black","G_Shades_Green","rhsusf_shemagh_od","rhsusf_shemagh2_od","rhsusf_shemagh_gogg_od","rhsusf_shemagh2_gogg_od"];
		};
		case "woodland": {
			_uniform = "rhsgref_uniform_woodland";
			_vest = "rhssaf_vest_otv_md2camo";
			_backpack_big = "B_Carryall_oli";
			_backpack_small = "B_FieldPack_oli";
			_headgear = "rhsgref_helmet_pasgt_woodland_rhino";
			_hat = "H_Booniehat_oli";
			_facewear = ["rhs_ess_black","rhsusf_oakley_goggles_clr","rhs_googles_black","G_Shades_Black","G_Shades_Green","rhsusf_shemagh_grn","rhsusf_shemagh2_grn","rhsusf_shemagh_gogg_grn","rhsusf_shemagh2_gogg_grn"];
		};
		case "desert": {
			_uniform = "rhsgref_uniform_3color_desert";
			_vest = "rhssaf_vest_otv_md2camo";
			_backpack_big = "B_Carryall_cbr";
			_backpack_small = "B_FieldPack_cbr";
			_headgear = "rhsgref_helmet_pasgt_3color_desert_rhino";
			_hat = "H_Booniehat_tan";
			_facewear = ["rhs_ess_black","rhsusf_oakley_goggles_clr","rhs_googles_black","G_Shades_Black","G_Shades_Green","rhsusf_shemagh_tan","rhsusf_shemagh2_tan","rhsusf_shemagh_gogg_tan","rhsusf_shemagh2_gogg_tan"];
		};
		case "jungle": {
			_uniform = "rhsgref_uniform_ERDL";
			_vest = "rhsgref_otv_khaki";
			_backpack_big = "B_Carryall_oli";
			_backpack_small = "B_FieldPack_oli";
			_headgear = "rhsgref_helmet_pasgt_erdl_rhino";
			_hat = "H_Booniehat_oli";
			_facewear = ["rhs_ess_black","rhsusf_oakley_goggles_clr","rhs_googles_black","G_Shades_Black","G_Shades_Green"];
		};
		default {
			_uniform = "rhsgref_uniform_altis_lizard";
			_vest = "rhsgref_otv_khaki";
			_backpack_big = "B_Carryall_khk";
			_backpack_small = "B_FieldPack_khk";
			_headgear = "rhsgref_helmet_pasgt_altis_lizard";
			_hat = "H_Booniehat_khk";
			_facewear = ["rhs_ess_black","rhsusf_oakley_goggles_clr","rhs_googles_black","G_Shades_Black","G_Shades_Green","rhsusf_shemagh_od","rhsusf_shemagh2_od","rhsusf_shemagh_gogg_od","rhsusf_shemagh2_gogg_od"];
		};
	};
	switch (CC_p_nvg) do {
		case 0: {_nvg = ""; _lamp = "";};
		case 1: {_nvg = "rhsusf_ANPVS_14"; _lamp = "rhsusf_acc_anpeq16a";};
		case 2: {_nvg = ""; _lamp = "rhsusf_acc_wmx_bk";};
		default {_nvg = ""; _lamp = "";};
	};
	switch (cc_rhsennemy) do {
		case true: {
			_weap_lat = ["rhs_weap_m72a7","","","",["rhs_m72a7_mag",1],[],""];
			_weap_at = ["rhs_weap_smaw_green","","","rhs_weap_optic_smaw",["rhs_mag_smaw_HEAA",1],[],""];
			_mun_at = [["rhs_mag_smaw_HEAA",2,1],["rhs_mag_smaw_SR",2,5]];
		};
		case false: {
			_weap_lat = ["CUP_launch_M72A6","","","",["ACE_PreloadedMissileDummy_M72A6_CUP",1],[],""];
			_weap_at = ["CUP_launch_Mk153Mod0","","","cup_optic_smaw_scope",["CUP_SMAW_HEAA_M",1],[],""];
			_mun_at = [["CUP_SMAW_HEAA_M",2,1],["CUP_SMAW_Spotting",2,5]];
		};
		default {
			_weap_lat = ["rhs_weap_m72a7","","","",["rhs_m72a7_mag",1],[],""];
			_weap_at = ["rhs_weap_smaw_green","","","rhs_weap_optic_smaw",["rhs_mag_smaw_HEAA",1],[],""];
			_mun_at = [["rhs_mag_smaw_HEAA",2,1],["rhs_mag_smaw_SR",2,5]];
		};
	
	};
	
	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_MX991",1],["ACRE_PRC343",1],["SmokeShell",2,1]];
	_itemsU_tl = [["ACRE_PRC148",1],["ACE_microDAGR",1],["ACE_MapTools",1],["ACE_IR_Strobe_Item",1]];
	_itemsB_medic = [["ACE_personalAidKit",1],["ACE_surgicalKit",1],["ACE_salineIV",2],["ACE_salineIV_250",2],["ACE_salineIV_500",2],["ACE_packingBandage",15],["ACE_fieldDressing",15],["ACE_elasticBandage",10],["ACE_quikclot",10],["ACE_morphine",8],["ACE_epinephrine",4],["ACE_tourniquet",4]];
	_weap_r = ["rhs_weap_vhsd2_ct15x","",_lamp,"",["rhsgref_30rnd_556x45_vhs2",30],[],""];
	
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
		default {[_unit] call loadoutCC_R};
	};
};



loadoutCC_OFF = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vest,[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",3,30],["rhsgref_30rnd_556x45_vhs2_t",4,30],["SmokeShellGreen",2,1]]],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		"rhssaf_beret_green",
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",(if (CC_p_nvg == 1) then {"NVGoggles_OPFOR"} else {""})]
	];
};

loadoutCC_TL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		_weap_lat,
		[],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vest,[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",3,30],["rhsgref_30rnd_556x45_vhs2_t",4,30],["SmokeShellGreen",2,1]]],
		[],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_DOC = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",7,30]]],
		[_backpack_big,_itemsB_medic],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AR = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_m249_pip_L_para","",_lamp,"rhsusf_acc_compm4",["rhsusf_200rnd_556x45_mixed_box",200],[],""],
		[],
		[],
		[_uniform,_itemsU_base],
		["rhssaf_vest_md98_md2camo",[["rhs_mag_m67",2,1]]],
		[_backpack_small,[["rhsusf_200rnd_556x45_mixed_box",3,200]]],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AAR = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",7,30]]],
		[_backpack_small,[["rhsusf_200rnd_556x45_mixed_box",4,200]]],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_MG = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_m240B","",_lamp,"rhsusf_acc_ELCAN",["rhsusf_50Rnd_762x51_m62_tracer",50],[],""],
		[],
		[],
		[_uniform,_itemsU_base],
		["rhssaf_vest_md98_md2camo",[["rhs_mag_m67",2,1]]],
		[_backpack_small,[["rhsusf_50Rnd_762x51_m62_tracer",7,50]]],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AMG = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",7,30]]],
		[_backpack_small,[["rhsusf_50Rnd_762x51_m62_tracer",7,50]]],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		_weap_at,
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",7,30]]],
		[_backpack_big,_mun_at],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AAT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",7,30]]],
		[_backpack_big,_mun_at],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_DEMO = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",7,30]]],
		[_backpack_big,[["ACE_M26_Clacker",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["SatchelCharge_Remote_Mag",2,1],["DemoCharge_Remote_Mag",2,1]]],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_M = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_sr25","","rhsusf_acc_anpeq16a","rhsusf_acc_ACOG3",["rhsusf_20Rnd_762x51_SR25_m118_special_Mag",20],[],"bipod_02_F_blk"],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhsusf_20Rnd_762x51_SR25_m118_special_Mag",6,20]]],
		[],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		["ACE_Vector","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_GL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_vhsd2_bg_ct15x","",_lamp,"",["rhsgref_30rnd_556x45_vhs2",30],["rhs_mag_M433_HEDP",1],""],
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",7,30],["rhs_mag_M433_HEDP",5,1]]],
		[_backpack_small,[["rhs_mag_M433_HEDP",6,1],["rhs_mag_m713_Red",6,1],["rhs_mag_M585_white",6,1],["ACE_HandFlare_Green",2,1],["rhs_mag_m67",2,1],["SmokeShell",2,1]]],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_A = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",7,30]]],
		[_backpack_big,[["rhsgref_30rnd_556x45_vhs2",8,30],["SmokeShell",2,1],["rhs_mag_m67",2,1],["ACE_HandFlare_Green",2,1]]],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_LAT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		_weap_lat,
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",7,30]]],
		[],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_R = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,_itemsU_base],
		[_vest,[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",7,30]]],
		[],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_CREW = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_vhsd2","",_lamp,"",["rhsgref_30rnd_556x45_vhs2",30],[],""],
		[],
		[],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		["V_TacVest_oli",[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",7,30]]],
		[],
		"rhsusf_cvc_green_alt_helmet",
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_PILOT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_vhsd2","",_lamp,"",["rhsgref_30rnd_556x45_vhs2",30],[],""],
		[],
		[],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		["V_TacVest_oli",[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",7,30]]],
		[],
		"rhsusf_hgu56p",
		"",
		[],
		["ItemMap","","","ItemCompass","ItemWatch",(if (CC_p_nvg > 0) then {"rhsusf_ANPVS_15"} else {""})]
	];
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_m40a5","","rhsusf_acc_anpeq15side_bk","rhsusf_acc_LEUPOLDMK4",["rhsusf_5Rnd_762x51_AICS_m118_special_Mag",5],[],"rhsusf_acc_harris_swivel"],
		[],
		["rhsusf_weap_m1911a1","","","",["rhsusf_mag_7x45acp_MHP",7],[],""],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		["V_TacVest_oli",[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["ACE_ATragMX",1],["rhs_mag_m67",2,1],["rhsusf_5Rnd_762x51_AICS_m118_special_Mag",15,5],["rhsusf_mag_7x45acp_MHP",2,7]]],
		[],
		_hat,
		"rhsusf_shemagh2_od",
		["Rangefinder","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",(if (CC_p_nvg > 0) then {"NVGoggles_OPFOR"} else {""})]
	];
};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_vhsd2","","rhsusf_acc_anpeq16a","rhsusf_acc_acog_rmr",["rhsgref_30rnd_556x45_vhs2",30],[],""],
		[],
		[],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vest,[["ACE_Kestrel4500",1],["ACE_ATragMX",1],["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",7,30]]],
		[],
		_hat,
		"rhsusf_shemagh_od",
		["Rangefinder","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",(if (CC_p_nvg > 0) then {"NVGoggles_OPFOR"} else {""})]
	];
};

loadoutCC_JTAC = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[_uniform,(_itemsU_base + _itemsU_tl)],
		[_vest,[["rhs_mag_m67",2,1],["rhsgref_30rnd_556x45_vhs2",3,30],["rhsgref_30rnd_556x45_vhs2_t",4,30],["SmokeShellGreen",2,1]]],
		[_backpack_small,[["ACRE_PRC117F",1],["SmokeShellPurple",2,1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",4,1]]],
		_headgear,
		(if ((random 100 < 50) && (CC_p_nvg < 1)) then {selectrandom _facewear} else {""}),
		["Laserdesignator_01_khk_F","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};
