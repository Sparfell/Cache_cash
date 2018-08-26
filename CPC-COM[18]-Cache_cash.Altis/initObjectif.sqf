waitUntil {CPC_MarkersCreated};

call compile preprocessfilelinenumbers "shk_pos\shk_pos_init.sqf";

task1done = false;
task3done = false;
Fin = false;

if !(isServer) exitwith {};
private ["_marker","_markEx","_pos","_rdir","_deg","_i","_type","_veh"];

//position de la base ennemie
switch (CPC_MAP) do {
	case "altis" : {_marker = str (64 + (floor random 36));};
	case "takistan" : {_marker = str (68 + (floor random 32));};
	case "chernarus" : {_marker = str (70 + (floor random 30));};
	case "chernarus_summer" : {_marker = str (70 + (floor random 30));};
	case "isladuala3" : {_marker = str (75 + (floor random 25));};
	case "sara" : {_marker = str (87 + (floor random 13));};
	case "fdf_isle1_a" : {_marker = str (75 + (floor random 25));};
	case "woodland_acr" : {_marker = str (88 + (floor random 12));};
	case "pja305" : {_marker = str (72 + (floor random 28));};
	case "pja307" : {_marker = str (80 + (floor random 20));};
	case "tanoa" : {_marker = str (84 + (floor random 16));};
	case "noe" : {_marker = str (87 + (floor random 13));};
	case "eden" : {_marker = str (92 + (floor random 8));};
};
_markEx = [];
Random_Position = [_marker,0,_markEx,50] call SHK_pos;
while {((SurfaceNormal Random_Position) select 2) < 0.955} do {
	Random_Position = [_marker,0,_markEx,50] call SHK_pos;
}; // permet de trouver une position plate ?

//creation de la caisse objectif et gestion des marqueurs
{ _x hideObjectGlobal true;} forEach (nearestObjects [Random_Position,[],30]);
_Cargo = "Land_Cargo20_military_green_F" createVehicle [0,0,0];
_Cargo setpos [(Random_Position select 0) + 2,Random_Position select 1,1];
cible setpos [(Random_Position select 0) + 2,Random_Position select 1,1.5];
"Mark_Cible" setmarkerpos [(Random_Position select 0)+(random 300)-150,(Random_Position select 1)+(random 300)-150,0]; "Mark_Cible" setmarkerAlpha 0.6;
_pos = markerpos "Mark_Cible";
"Mark_Cible_1" setmarkerpos _pos;
"1" setmarkerpos getpos cible;
"2" setmarkerpos markerpos "Mark_Cible";
"3" setmarkerpos markerpos "Mark_Cible_1";

//creation du camp
if (random 100 < 70) then {
	[] execVM "scripts\create_base.sqf";
} else {
	["1"] execVM "scripts\create_ville.sqf";
};

//spawn des helicos si insertion helico
if (CC_p_insertion == 2) then 
{
	switch (CC_p_loaout) do {
		case 0 : {_type = "B_Heli_Transport_01_camo_F";}; // NATO
		case 1 : {_type = "O_Heli_Light_02_F";}; // CSAT
		case 2 : {_type = "I_Heli_Transport_02_F";}; // AAF
		case 3 : {_type = "RHS_UH60M";}; // US Army RHS
		case 4 : {_type = "RHS_UH60M";}; // USMC RHS
		case 5 : {_type = "RHS_UH60M";}; // US SF RHS
		case 6 : {_type = "RHS_Mi8mt_vvsc";}; // RU 2000
		case 7 : {_type = "RHS_Mi8mt_vvsc";}; // RU 2015
		case 8 : {_type = "RHS_Mi8mt_vvsc";}; // RU SF
		case 9 : {_type = "RHS_UH60M";}; // KSK
		case 10 : {_type = "CUP_B_Merlin_HC3_GB";}; // BAF
		case 11 : {_type = "CUP_I_UH60L_RACS";}; // RACS
		case 12 : {_type = "CUP_O_Mi17_TK";}; // TAK
		case 13 : {_type = "rhsgref_ins_Mi8amt";}; // INS
		case 14 : {_type = "CUP_I_UH1H_TK_GUE";}; // TAK INS
		case 15 : {_type = "rhssaf_airforce_ht48";}; // SAF
		case 16 : {_type = "rhsgref_cdf_b_reg_Mi8amt";}; // CDF
		case 17 : {_type = "MU_MERC_Mohawk";}; // PMC
		case 18 : {_type = "CUP_B_SA330_Puma_HC2_BAF";}; // FR
	};
	"M_helipad1" setMarkerAlpha 1;
	_veh = _type createVehicle (getMarkerPos "M_helipad1");
	clearMagazineCargoGlobal _veh;clearWeaponCargoGlobal _veh;clearItemCargoGlobal _veh;clearBackpackCargoGlobal _veh;
	_veh = _type createVehicle (getMarkerPos "M_helipad2");
	clearMagazineCargoGlobal _veh;clearWeaponCargoGlobal _veh;clearItemCargoGlobal _veh;clearBackpackCargoGlobal _veh;
};

//gestion vehicules
[] spawn {
	_listveh = [
	"",
	"B_G_Offroad_01_F",
	"B_G_Offroad_01_armed_F",
	"B_G_Van_01_transport_F",
	"rhsusf_m1025_d_s_m2",
	"rhsusf_m1025_w_s_m2",
	"rhsusf_m1025_d_s",
	"rhsusf_m1025_w_s",
	"rhs_tigr_3camo_msv",
	"rhs_tigr_sts_3camo_msv",
	"CUP_O_UAZ_Unarmed_RU",
	"CUP_O_UAZ_Open_RU",
	"CUP_O_UAZ_MG_RU",
	"CUP_O_UAZ_AGS30_RU",
	"CUP_O_UAZ_METIS_RU",
	"CUP_RG31_M2",
	"CUP_RG31_M2_OD",
	"CUP_B_HMMWV_Unarmed_USA",
	"CUP_B_HMMWV_M2_GPK_USA",
	"CUP_B_HMMWV_Crows_M2_USA",
	"CUP_B_HMMWV_TOW_USA",
	"CUP_B_HMMWV_SOV_USA",
	"CUP_O_LR_Transport_TKA",
	"CUP_B_LR_Transport_GB_W",
	"CUP_O_LR_MG_TKA",
	"CUP_B_LR_MG_GB_W",
	"CUP_B_LR_Special_Des_CZ_D",
	"CUP_B_LR_Special_CZ_W",
	"CUP_B_Jackal2_L2A1_GB_D",
	"CUP_B_Jackal2_L2A1_GB_W",
	"CUP_O_Ural_RU",
	"CUP_O_Ural_ZU23_RU",
	"CUP_B_Dingo_CZ_Des",
	"CUP_B_Dingo_CZ_Wdl",
	"I_MRAP_03_F",
	"I_MRAP_03_hmg_F",
	"O_MRAP_02_F",
	"O_MRAP_02_hmg_F",
	"B_MRAP_01_F",
	"B_MRAP_01_hmg_F",
	"B_Quadbike_01_F",
	"rhsusf_m113d_usarmy",
	"rhsusf_m113_usarmy",
	"RHS_M2A3",
	"RHS_M2A3_wd",
	"rhsusf_m1a1aimd_usarmy",
	"rhsusf_m1a1aimwd_usarmy",
	"CUP_B_M113_USA",
	"CUP_B_M2Bradley_USA_D",
	"CUP_B_M2Bradley_USA_W",
	"CUP_B_M1126_ICV_M2_Desert_Slat",
	"CUP_B_M1126_ICV_M2_Woodland",
	"CUP_B_LAV25M240_USMC",
	"CUP_B_M1A1_DES_US_Army",
	"CUP_B_M1A1_Woodland_US_Army",
	"rhs_btr70_msv",
	"rhs_btr80a_msv",
	"rhs_bmp1_msv",
	"rhs_bmp2_msv",
	"rhs_bmp3_msv",
	"rhs_t72bb_tv",
	"rhs_t80",
	"rhs_t90a_tv",
	"CUP_O_BTR90_RU",
	"CUP_I_BRDM2_TK_Gue",
	"CUP_I_BRDM2_ATGM_TK_Gue",
	"CUP_I_BMP1_TK_GUE",
	"CUP_O_BMP2_RU",
	"CUP_I_T34_TK_GUE",
	"CUP_I_T55_TK_GUE",
	"CUP_O_T72_RU",
	"CUP_I_Datsun_PK",
	"O_APC_Wheeled_02_rcws_F",
	"O_APC_Tracked_02_cannon_F",
	"O_MBT_02_cannon_F",
	"I_APC_Wheeled_03_cannon_F",
	"I_APC_tracked_03_cannon_F",
	"I_MBT_03_cannon_F",
	"B_APC_Wheeled_01_cannon_F",
	"B_APC_Tracked_01_rcws_F",
	"B_MBT_01_cannon_F",
	"B_Heli_Light_01_armed_F",
	"B_Heli_Light_01_F",
	"I_Heli_light_03_unarmed_F",
	"CUP_B_AW159_Cannon_GB",
	"CUP_O_UH1H_SLA",
	"CUP_B_UH1Y_UNA_USMC",
	"CUP_B_UH1Y_GUNSHIP_USMC",
	"CUP_O_Mi24_V_RU",
	"O_Heli_Light_02_unarmed_F",
	"CUP_I_BTR40_MG_TKG",
	"CUP_I_BTR40_TKG",
	"CUP_B_T72_CZ",
	"CUP_O_BTR60_SLA",
	"CUP_B_FV510_GB_W_SLAT",
	"CUP_B_FV510_GB_D_SLAT",
	"CUP_B_FV432_Bulldog_GB_W",
	"CUP_B_FV432_Bulldog_GB_D",
	"CUP_B_Ridgback_HMG_GB_W",
	"CUP_B_Ridgback_HMG_GB_D",
	"CUP_O_GAZ_Vodnik_PK_RU",
	"CUP_O_GAZ_Vodnik_BPPU_RU",
	"CUP_B_MH6J_USA",
	"CUP_B_AH6J_Escort_USA",
	"CUP_B_DSHkM_MiniTriPod_CDF",
	"CUP_B_M2StaticMG_MiniTripod_US",
	"CUP_B_AGS_CDF",
	"CUP_B_2b14_82mm_CDF",
	"CUP_B_TOW_TriPod_US",
	"CUP_O_Metis_RU",
	"RHS_TOW_TriPod_WD",
	"rhs_Metis_9k115_2_msv",
	"rhs_Kornet_9M133_2_msv",
	"rhsusf_M1117_O",
	"rhsgref_nat_uaz_spg9",
	"O_T_LSV_02_unarmed_F",
	"O_T_LSV_02_armed_F",
	"B_T_LSV_01_unarmed_F",
	"B_T_LSV_01_armed_F",
	"B_CTRG_LSV_01_light_F",
	"C_Offroad_02_unarmed_F",
	"rhsusf_M1232_M2_usarmy_wd",
	"rhsusf_M1237_M2_usarmy_d",
	"CUP_B_Challenger2_2CW_BAF",
	"CUP_B_Challenger2_Desert_BAF",
	"rhsusf_CGRCAT1A2_M2_usmc_wd",
	"rhsusf_CGRCAT1A2_M2_usmc_d",
	"rhs_zil131_msv",
	"CPC_JUN_B_AMIL_UH1H_gunship",
	"I_LT_01_AT_F",
	"O_MBT_04_cannon_F",
	"B_AFV_Wheeled_01_up_cannon_F"
	];
	waitUntil {time > 0};
	_pos = markerpos "Mark_inser";
	for "_i" from 8 to 10 do {
		_type = _listveh select (paramsArray select _i);
		_veh = _type createVehicle ([_pos,30,random 360,0,[0,0],[55,_type]] call SHK_pos);
		clearItemCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		if ((CC_p_insertion == 4)AND(_type != "")) then {
			_dir = [[getMarkerPos "Mark_Inser" select 0,getMarkerPos "Mark_Inser" select 1,0],[getMarkerPos "2" select 0,getMarkerPos "2" select 1,0]] call BIS_fnc_dirTo;
			_dir = _dir +90;
			_para = "NonSteerable_Parachute_F" createVehicle [0,0,0];
			_para setpos [(getMarkerPos "Mark_Inser" select 0) + ((((_i-7)*20)+100)* sin _dir) + (random 3),(getMarkerPos "Mark_Inser" select 1)+ ((((_i-7)*20)+100)* cos _dir) + (random 3),200];
			_veh attachto [_para,[0,0,1]];
		};
	};
};

//extraction
switch (CC_p_extraction) do {
	case 0 : {
		trig_ext setpos Random_Position;
	};
	case 1 : {
		[] spawn {
			waitUntil {time > 0};
			waitUntil {task1done};
			_dir = [[getMarkerPos "Mark_Inser" select 0,getMarkerPos "Mark_Inser" select 1,0],[getMarkerPos "2" select 0,getMarkerPos "2" select 1,0]] call BIS_fnc_dirTo;
			_pos = [[getmarkerpos "2" select 0, getmarkerpos "2" select 1,0],1150,(_dir + ((random 140)-70)),0] call SHK_pos;
			_mark = createMarker ["RDV",_pos];
				_mark setmarkerColor "colorBlue";
				_mark setMarkerShape "ICON";
				_mark setMarkerType "mil_arrow2";
				_mark setMarkerDir ([[getMarkerPos "2" select 0,getMarkerPos "2" select 1,0],_pos] call BIS_fnc_dirTo);
				_mark setMarkerSize [1,1.4];
				_mark setMarkerText "RDV";
			trig_ext setpos _pos;
		};
	};
	case 2 : {
		[] spawn {
			waitUntil {time > 300};
			trig_ext setpos getMarkerPos "Mark_inser";
		};
	};
};