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
	_uniform = [];
	_backpack_big = [];
	_backpack_small = [];
	_hat = "";
	_nvg = "";
	_lamp = "";
	_lamp2 = "";
	_weap_lat = [];
	_weap_at = [];
	_mun_at = [];
	
	switch (cc_loadoutcamo) do {
		case "polyvalent": {
			_uniform = ["rhs_uniform_gorka_r_g","rhs_uniform_gorka_r_y"];
			_backpack_big = ["B_Carryall_khk","B_Carryall_oli"];
			_backpack_small = ["B_FieldPack_oli","B_FieldPack_khk"];
			_hat = "rhs_Booniehat_flora";
		};
		case "woodland": {
			_uniform = ["rhs_uniform_gorka_r_g","rhs_uniform_gorka_r_y"];
			_backpack_big = ["B_Carryall_khk","B_Carryall_oli"];
			_backpack_small = ["B_FieldPack_oli","B_FieldPack_khk"];
			_hat = "rhs_Booniehat_digi";
		};
		case "desert": {
			_uniform = ["rhs_uniform_emr_des_patchless"];
			_backpack_big = ["B_Carryall_khk","B_Carryall_oli","B_Carryall_cbr"];
			_backpack_small = ["B_FieldPack_oli","B_FieldPack_khk","B_FieldPack_cbr"];
			_hat = "H_Booniehat_tan";
		};
		case "jungle": {
			_uniform = ["rhs_uniform_emr_patchless"];
			_backpack_big = ["B_Carryall_khk","B_Carryall_oli"];
			_backpack_small = ["B_FieldPack_oli","B_FieldPack_khk"];
			_hat = "rhs_Booniehat_digi";
		};
		default {
			_uniform = ["rhs_uniform_gorka_r_g","rhs_uniform_gorka_r_y"];
			_backpack_big = ["B_Carryall_khk","B_Carryall_oli"];
			_backpack_small = ["B_FieldPack_oli","B_FieldPack_khk"];
			_hat = "rhs_Booniehat_flora";
		};
	};
	switch (CC_p_nvg) do {
		case 0: {_nvg = ""; _lamp = ""; _lamp2 = "";};
		case 1: {_nvg = "NVGoggles_OPFOR"; _lamp = "rhs_acc_perst3_2dp_h";; _lamp2 = "rhs_acc_perst3";};
		case 2: {_nvg = ""; _lamp = "rhs_acc_2dpzenit";; _lamp2 = "rhs_acc_2dpzenit_ris";};
		default {_nvg = ""; _lamp = "";; _lamp2 = "";};
	};
	switch (cc_rhsennemy) do {
		case true: {
			_weap_lat = ["rhs_weap_rpg26","","","",["rhs_rpg26_mag",1],[],""];
			_weap_at = ["rhs_weap_rpg7","","","rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag",1],[],""];
			_mun_at = ["rhs_rpg_empty",[["rhs_rpg7_PG7VL_mag",2,1],["rhs_rpg7_TBG7V_mag",1,1]]];
		};
		case false: {
			_weap_lat = ["CUP_launch_M72A6","","","",["ACE_PreloadedMissileDummy_M72A6_CUP",1],[],""];
			_weap_at = ["CUP_launch_RPG7V","","","cup_optic_pgo7v3",["CUP_PG7VM_M",1],[],""];
			_mun_at = ["CUP_B_RPGPack_Khaki",[["CUP_PG7VM_M",2,1],["CUP_OG7_M",2,1]]];
		};
		default {
			_weap_lat = ["rhs_weap_rpg26","","","",["rhs_rpg26_mag",1],[],""];
			_weap_at = ["rhs_weap_rpg7","","","rhs_acc_pgo7v3",["rhs_rpg7_PG7VL_mag",1],[],""];
			_mun_at = ["rhs_rpg_empty",[["rhs_rpg7_PG7VL_mag",2,1],["rhs_rpg7_TBG7V_mag",1,1]]];
		};
	
	};
	
	_vest = "rhs_6b23_digi_6sh92_spetsnaz2";
	_vest_radio = "rhs_6b23_digi_6sh92_Spetsnaz";
	_vest_gl = "rhs_6b23_digi_6sh92_Vog_Spetsnaz";
	_vest_m = "rhs_6b23_digi_sniper";
	_vest_mg = "rhs_6b23_digi_rifleman";
	_vest_crew = "rhs_6b23_digi_crew";
	_headgear = ["rhs_6b47_bala","rhs_6b47_bala","rhs_6b47_ess_bala"];
	_itemsU_base = [["ACE_fieldDressing",4],["ACE_tourniquet",1],["ACE_EarPlugs",1],["ACE_Flashlight_KSF1",1],["ACRE_PRC343",1],["SmokeShell",2,1]];
	_itemsU_tl = [["ACRE_PRC148",1],["ACE_microDAGR",1],["ACE_MapTools",1],["ACE_IR_Strobe_Item",1]];
	_itemsB_medic = [["ACE_personalAidKit",1],["ACE_surgicalKit",1],["ACE_salineIV",2],["ACE_salineIV_250",2],["ACE_salineIV_500",2],["ACE_packingBandage",15],["ACE_fieldDressing",15],["ACE_elasticBandage",10],["ACE_quikclot",10],["ACE_morphine",8],["ACE_epinephrine",4],["ACE_tourniquet",4]];
	
	_weap_r = ["rhs_weap_ak74mr","rhs_acc_dtk4short",_lamp,"rhs_acc_1p87",["rhs_30Rnd_545x39_7N22_AK",30],[],"rhs_acc_grip_ffg2"];
	_weap_tl = ["rhs_weap_ak74mr","rhs_acc_dtk4short",_lamp,"optic_arco_blk_f",["rhs_30Rnd_545x39_7N22_AK",30],[],"rhs_acc_grip_ffg2"];
	
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
		[(selectrandom _uniform),(_itemsU_base + _itemsU_tl)],
		[_vest_radio,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30],["SmokeShellGreen",2,1]]],
		["rhs_assault_umbts",[["ACRE_PRC117F",1],["SmokeShellPurple",2,1]]],
		"rhs_fieldcap_digi",
		"",
		["rhs_pdu4","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",(if (CC_p_nvg == 1) then {"NVGoggles_OPFOR"} else {""})]
	];
};


loadoutCC_TL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_tl,
		_weap_lat,
		[],
		[(selectrandom _uniform),(_itemsU_base + _itemsU_tl)],
		[_vest_radio,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30],["SmokeShellGreen",2,1]]],
		[],
		(selectrandom _headgear),
		"",
		["rhs_pdu4","","","",[],[],""],
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
		[(selectrandom _uniform),_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30]]],
		["rhs_assault_umbts",_itemsB_medic],
		(selectrandom _headgear),
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_AR = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_ak74mr","rhs_acc_dtk4short",_lamp,"rhs_acc_1p87",["rhs_45Rnd_545X39_7N22_AK",30],[],"rhs_acc_grip_rk2"],
		[],
		[],
		[(selectrandom _uniform),_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],["rhs_45Rnd_545X39_7N22_AK",6,45]]],
		[(selectrandom _backpack_small),[["rhs_45Rnd_545X39_7N22_AK",10,45]]],
		(selectrandom _headgear),
		"",
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
		[(selectrandom _uniform),_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30]]],
		[(selectrandom _backpack_big),[["rhs_45Rnd_545X39_7N22_AK",15,45]]],
		(selectrandom _headgear),
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};
loadoutCC_MG = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_pkp","","","rhs_acc_1p29",["rhs_100Rnd_762x54mmR_7N26",100],[],""],
		[],
		[],
		[(selectrandom _uniform),_itemsU_base],
		[_vest_mg,[["rhs_mag_rgd5",2,1]]],
		[(selectrandom _backpack_small),[["rhs_100Rnd_762x54mmR_7N26",3,100]]],
		(selectrandom _headgear),
		"",
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
		[(selectrandom _uniform),_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30]]],
		[(selectrandom _backpack_big),[["rhs_100Rnd_762x54mmR_7N26",3,100]]],
		(selectrandom _headgear),
		"",
		["rhs_pdu4","","","",[],[],""],
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
		[(selectrandom _uniform),_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30]]],
		_mun_at,
		(selectrandom _headgear),
		"",
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
		[(selectrandom _uniform),_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30]]],
		_mun_at,
		(selectrandom _headgear),
		"",
		["rhs_pdu4","","","",[],[],""],
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
		[(selectrandom _uniform),_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30]]],
		["rhs_assault_umbts_engineer_empty",[["ACE_M26_Clacker",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["SatchelCharge_Remote_Mag",1,1],["DemoCharge_Remote_Mag",2,1]]],
		(selectrandom _headgear),
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_M = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_svds","rhs_acc_tgpv2","","rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N14",10],[],""],
		[],
		[],
		[(selectrandom _uniform),_itemsU_base],
		[_vest_m,[["rhs_10Rnd_762x54mmR_7N14",12,10]]],
		[],
		(selectrandom _headgear),
		"",
		["rhs_pdu4","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_GL = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_ak74mr_gp25","rhs_acc_dtk4short",_lamp2,"rhs_acc_1p87",["rhs_30Rnd_545x39_7N22_AK",30],["rhs_VOG25",1],""],
		[],
		[],
		[(selectrandom _uniform),_itemsU_base],
		[_vest_gl,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30],["rhs_VOG25",5,1]]],
		[(selectrandom _backpack_small),[["rhs_VOG25",6,1],["rhs_VG40MD_Red",6,1],["rhs_VG40OP_white",6,1],["rhs_GDM40",6,1],["ACE_HandFlare_Green",2,1],["rhs_mag_rgd5",2,1],["SmokeShell",2,1]]],
		(selectrandom _headgear),
		"",
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
		[(selectrandom _uniform),_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30]]],
		[(selectrandom _backpack_big),[["rhs_30Rnd_545x39_7N22_AK",8,30],["SmokeShell",2,1],["rhs_mag_rgd5",2,1],["ACE_HandFlare_Green",2,1]]],
		(selectrandom _headgear),
		"",
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
		[(selectrandom _uniform),_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30]]],
		[],
		(selectrandom _headgear),
		"",
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
		[(selectrandom _uniform),_itemsU_base],
		[_vest,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30]]],
		[],
		(selectrandom _headgear),
		"",
		[],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_CREW = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_aks74u","rhs_acc_dtk4short","","",["rhs_30Rnd_545x39_7N22_AK",30],[],""],
		[],
		[],
		[(selectrandom _uniform),(_itemsU_base + _itemsU_tl)],
		[_vest_crew,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30]]],
		[],
		"rhs_tsh4_bala",
		"",
		["Binocular","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};

loadoutCC_PILOT = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_aks74u","rhs_acc_dtk4short","","",["rhs_30Rnd_545x39_7N22_AK",30],[],""],
		[],
		[],
		["rhs_uniform_df15",(_itemsU_base + _itemsU_tl)],
		["rhs_6sh92_digi_radio",[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30]]],
		[],
		"rhs_zsh7a_mike",
		"",
		[],
		["ItemMap","","","ItemCompass","ItemWatch",(if (CC_p_nvg > 0) then {"NVGoggles_OPFOR"} else {""})]
	];
};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		["rhs_weap_t5000","","","rhsusf_acc_premier",["rhs_5Rnd_338lapua_t5000",5],[],"rhs_acc_harris_swivel"],
		[],
		["rhs_weap_pb_6p9","rhs_acc_6p9_suppressor","","",["rhs_mag_9x18_8_57N181S",8],[],""],
		[(selectrandom _uniform),(_itemsU_base + _itemsU_tl)],
		["rhs_6sh92_vsr_radio",[["ACE_Kestrel4500",1],["ACE_RangeCard",1],["ACE_ATragMX",1],["rhs_mag_rgd5",2,1],["rhs_5Rnd_338lapua_t5000",15,5],["rhs_mag_9x18_8_57N181S",2,7]]],
		["B_FieldPack_khk",[["rhsusf_acc_premier_anpvs27",1]]],
		_hat,
		"",
		["rhs_pdu4","","","",[],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",(if (CC_p_nvg > 0) then {"NVGoggles_OPFOR"} else {""})]
	];
};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	_unit setUnitLoadout [
		_weap_r,
		[],
		[],
		[(selectrandom _uniform),(_itemsU_base + _itemsU_tl)],
		["rhs_6sh92_vsr_radio",[["ACE_Kestrel4500",1],["ACE_ATragMX",1],["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30]]],
		["B_FieldPack_khk",[]],
		_hat,
		"rhs_scarf",
		["rhs_pdu4","","","",[],[],""],
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
		[(selectrandom _uniform),(_itemsU_base + _itemsU_tl)],
		[_vest_radio,[["rhs_mag_rgd5",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30],["SmokeShellGreen",2,1]]],
		["rhs_assault_umbts",[["ACRE_PRC117F",1],["SmokeShellGreen",4,1],["ACE_HandFlare_Green",1,1]]],
		(selectrandom _headgear),
		"",
		["Laserdesignator_01_khk_F","","","",["Laserbatteries",1],[],""],
		["ItemMap","","","ItemCompass","ItemWatch",_nvg]
	];
};
