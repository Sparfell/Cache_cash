//if (hasInterface || isDedicated) exitwith {};
if (MODE_HC or MODE_EDITEUR) then {

waitUntil {CPC_MarkersCreated};

null = [] execVM "InitGaia.sqf";

waituntil {time > 30};

private ["_Nombre_Ennemi","_compo_group","_mark","_markEx","_markPos","_markSize","_pos","_group","_fois","_dir","_upPos","_binome","_ennemi_group","_rand_vehi","_transp_vehi","_offroad","_helico"];

_group = createGroup resistance;
_Nombre_Ennemi = floor(paramsArray select 2);
_rab_veh = if (((paramsArray select 2) - _Nombre_Ennemi )!= 0) then {true} else {false};
_fois = 0;

//type d'ennemis
switch (paramsArray select 6) do {
	case 0 : { // US RHS
		_compo_group = [
			["rhsusf_army_ocp_teamleader","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_autorifleman"],
			["rhsusf_army_ocp_rifleman","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_grenadier"],
			["rhsusf_army_ocp_rifleman","rhsusf_army_ocp_riflemanat","rhsusf_army_ocp_medic"],
			["rhsusf_army_ocp_teamleader","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_riflemanat","rhsusf_army_ocp_medic","rhsusf_army_ocp_riflemanl"],
			["rhsusf_army_ocp_marksman","rhsusf_army_ocp_riflemanl"]
		];

		_binome = ["rhsusf_army_ocp_riflemanl","rhsusf_army_ocp_riflemanl"];
		_ennemi_group = ["rhsusf_army_ocp_teamleader","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_autorifleman","rhsusf_army_ocp_riflemanat","rhsusf_army_ocp_grenadier"];
		_rand_vehi = ["rhsusf_M1117_W","rhsusf_M1117_O","rhsusf_m113_usarmy","rhsusf_m113_usarmy_M240","RHS_M2A2_wd","RHS_M2A3_BUSKI_wd","rhsusf_m1a1aimwd_usarmy"];
		_transp_vehi = "rhsusf_rg33_wd";
		_offroad = "rhsusf_m1025_w_m2";
		_helico = "RHS_UH60M";
	};

	case 1 : { // US CUP
		_compo_group = [
			["CUP_B_USMC_Soldier_SL","CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_AR"],
			["CUP_B_USMC_Soldier","CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_GL"],
			["CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Medic"],
			["CUP_B_USMC_Soldier_SL","CUP_B_USMC_Soldier","CUP_B_USMC_Soldier","CUP_B_USMC_Medic","CUP_B_USMC_Soldier"],
			["CUP_B_USMC_Soldier_Marksman","CUP_B_USMC_Soldier"]
		];

		_binome = ["CUP_B_USMC_Soldier","CUP_B_USMC_Soldier"];
		_ennemi_group = ["CUP_B_USMC_Soldier_SL","CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier_GL"];
		_rand_vehi = ["CUP_RG31_M2_OD","CUP_RG31_M2_OD","CUP_RG31_M2_OD","CUP_RG31_Mk19_OD","CUP_B_LAV25M240_USMC","CUP_B_M1A1_Woodland_USMC"];
		_transp_vehi = "B_Truck_01_covered_F";
		_offroad = "CUP_B_HMMWV_M2_USMC";
		_helico = "CUP_B_MH60S_USMC";
	};

	case 2 : { // RU RHS
		_compo_group = [
			["rhs_msv_efreitor","rhs_msv_rifleman","rhs_msv_machinegunner"],
			["rhs_msv_rifleman","rhs_msv_rifleman","rhs_msv_grenadier"],
			["rhs_msv_rifleman","rhs_msv_at","rhs_msv_medic"],
			["rhs_msv_efreitor","rhs_msv_LAT","rhs_msv_rifleman","rhs_msv_medic","rhs_msv_rifleman"],
			["rhs_msv_marksman","rhs_msv_rifleman"]
		];

		_binome = ["rhs_msv_rifleman","rhs_msv_rifleman"];
		_ennemi_group = ["rhs_msv_efreitor","rhs_msv_rifleman","rhs_msv_grenadier","rhs_msv_at","rhs_msv_machinegunner"];
		_rand_vehi = ["rhs_btr80_msv","rhs_btr80a_msv","rhs_bmp2k_msv","rhs_bmp3_late_msv","rhs_bmp1p_msv","rhs_t72bd_tv","rhs_t80bvk"];
		_transp_vehi = "RHS_Ural_MSV_01";
		_offroad = "rhs_tigr_sts_msv";
		_helico = "RHS_Mi8mt_vdv";
	};

	case 3 : { // TAKI ARMY
		_compo_group = [
			["CUP_O_TK_Soldier_SL","CUP_O_TK_Soldier","CUP_O_TK_Soldier_MG"],
			["CUP_O_TK_Soldier","CUP_O_TK_Soldier","CUP_O_TK_Soldier_GL"],
			["CUP_O_TK_Soldier","CUP_O_TK_Soldier_AT","O_medic_F"],
			["CUP_O_TK_Soldier_SL","CUP_O_TK_Soldier","CUP_O_TK_Soldier","O_medic_F","CUP_O_TK_Soldier"],
			["CUP_O_TK_Soldier_AR","CUP_O_TK_Soldier"]
		];

		_binome = ["CUP_O_TK_Soldier","CUP_O_TK_Soldier"];
		_ennemi_group = ["CUP_O_TK_Soldier_SL","CUP_O_TK_Soldier","CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_AT","CUP_O_TK_Soldier_GL"];
		_rand_vehi = ["CUP_O_BTR40_MG_TKA","CUP_O_BRDM2_TKA","CUP_O_BRDM2_TKA","CUP_O_M113_TKA","CUP_O_BMP1_TKA","CUP_O_BTR60_TK","CUP_O_BTR60_TK","CUP_O_BMP2_TKA","UP_O_T55_TK","CUP_O_T72_TKA"];
		_transp_vehi = "CUP_O_Ural_TKA";
		_offroad = "CUP_O_UAZ_MG_TKA";
		_helico = "CUP_O_Mi17_TK";
	};

	case 4 : { // RACS
		_compo_group = [
			["CUP_I_RACS_SL","CUP_I_RACS_Soldier","CUP_I_RACS_MMG"],
			["CUP_I_RACS_Soldier","CUP_I_RACS_Soldier","CUP_I_RACS_GL"],
			["CUP_I_RACS_Soldier","CUP_I_RACS_Soldier_MAT","CUP_I_RACS_Medic"],
			["CUP_I_RACS_SL","CUP_I_RACS_Soldier","CUP_I_RACS_Soldier_MAT","CUP_I_RACS_Medic","CUP_I_RACS_Soldier"],
			["CUP_I_RACS_RoyalMarksman","CUP_I_RACS_Soldier"]
		];

		_binome = ["CUP_I_RACS_Soldier","CUP_I_RACS_Soldier"];
		_ennemi_group = ["CUP_I_RACS_SL","CUP_I_RACS_Soldier","CUP_I_RACS_MMG","CUP_I_RACS_Medic","CUP_I_RACS_GL"];
		_rand_vehi = ["CUP_I_M113_RACS","CUP_I_M113_RACS","CUP_I_M163_RACS","CUP_I_T72_RACS","CUP_I_T72_RACS"];
		_transp_vehi = "CUP_I_LR_Transport_RACS";
		_offroad = "CUP_I_LR_MG_RACS";
		_helico = "CUP_I_UH60L_RACS";
	};

	case 5 : { // SLA
		_compo_group = [
			["CUP_O_sla_Soldier_SL","CUP_O_sla_Soldier","CUP_O_sla_Soldier_AR"],
			["CUP_O_sla_Soldier","CUP_O_sla_Soldier","CUP_O_sla_Soldier_GL"],
			["CUP_O_sla_Soldier","CUP_O_sla_Soldier_AT","CUP_O_sla_Medic"],
			["CUP_O_sla_Soldier_SL","CUP_O_sla_Soldier","CUP_O_sla_Soldier","CUP_O_sla_Medic","CUP_O_sla_Soldier"],
			["CUP_O_sla_Soldier_MG","CUP_O_sla_Soldier"]
		];

		_binome = ["CUP_O_sla_Soldier","CUP_O_sla_Soldier"];
		_ennemi_group = ["CUP_O_sla_Soldier_SL","CUP_O_sla_Soldier","CUP_O_sla_Soldier_AR","CUP_O_sla_Soldier_AT","CUP_O_sla_Soldier_GL"];
		_rand_vehi = ["CUP_O_BRDM2_SLA","CUP_O_BRDM2_SLA","CUP_O_BTR60_SLA","CUP_O_BMP2_SLA","CUP_O_BMP2_SLA","CUP_O_T72_SLA"];
		_transp_vehi = "CUP_O_Ural_SLA";
		_offroad = "CUP_O_UAZ_MG_RU";
		_helico = "CUP_O_Mi8_SLA_1";
	};

	case 6 : { // AAF
		_compo_group = [
			["I_Soldier_SL_F","I_soldier_F","I_Soldier_AR_F"],
			["I_soldier_F","I_soldier_F","I_Soldier_GL_F"],
			["I_soldier_F","I_Soldier_LAT_F","I_medic_F"],
			["I_Soldier_SL_F","I_soldier_F","I_Soldier_lite_F","I_medic_F","I_Soldier_lite_F"],
			["rhs_g_Soldier_M_F","I_Soldier_lite_F"]
		];

		_binome = ["I_Soldier_lite_F","I_Soldier_lite_F"];
		_ennemi_group = ["I_Soldier_SL_F","I_soldier_F","I_Soldier_AR_F","I_medic_F","I_Soldier_GL_F"];
		_rand_vehi = ["I_MRAP_03_hmg_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MBT_03_cannon_F"];
		_transp_vehi = "I_Truck_02_covered_F";
		_offroad = "B_G_Offroad_01_armed_F";
		_helico = "MU_AAF_HummingBird";
	};

	case 7 : { // CSAT
		_compo_group = [
			["O_Soldier_SL_F","O_Soldier_F","O_Soldier_AR_F"],
			["O_Soldier_F","O_Soldier_F","O_Soldier_GL_F"],
			["O_Soldier_F","O_Soldier_LAT_F","O_medic_F"],
			["O_Soldier_SL_F","O_Soldier_F","O_Soldier_lite_F","O_medic_F","O_Soldier_lite_F"],
			["O_soldier_M_F","O_Soldier_lite_F"]
		];

		_binome = ["O_Soldier_lite_F","O_Soldier_lite_F"];
		_ennemi_group = ["O_Soldier_SL_F","O_Soldier_F","O_Soldier_AR_F","O_medic_F","O_Soldier_GL_F"];
		_rand_vehi = ["O_MRAP_02_hmg_F","O_MRAP_02_hmg_F","O_APC_Wheeled_02_rcws_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F","O_MBT_02_cannon_F"];
		_transp_vehi = "O_Truck_02_covered_F";
		_offroad = "B_G_Offroad_01_armed_F";
		_helico = "O_Heli_Light_02_F";
	};

	case 8 : { // NATO
		_compo_group = [
			["B_Soldier_SL_F","B_Soldier_F","B_Soldier_AR_F"],
			["B_Soldier_F","B_Soldier_F","B_Soldier_GL_F"],
			["B_Soldier_F","B_Soldier_LAT_F","B_medic_F"],
			["B_Soldier_SL_F","B_Soldier_F","B_Soldier_lite_F","B_medic_F","B_Soldier_lite_F"],
			["B_soldier_M_F","B_Soldier_lite_F"]
		];

		_binome = ["B_Soldier_lite_F","B_Soldier_lite_F"];
		_ennemi_group = ["B_Soldier_SL_F","B_Soldier_F","B_Soldier_AR_F","B_medic_F","B_Soldier_GL_F"];
		_rand_vehi = ["B_MRAP_01_hmg_F","B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_rcws_F","B_MBT_01_cannon_F"];
		_transp_vehi = "B_Truck_01_covered_F";
		_offroad = "rhsusf_m1025_w_m2";
		_helico = "B_Heli_Transport_01_camo_F";
	};

	case 9 : { // GFD
		_compo_group = [
			["CPC_Duala_B_GFD_soldier_TL","CPC_Duala_B_GFD_soldier_1","CPC_Duala_B_GFD_soldier_MG"],
			["CPC_Duala_B_GFD_soldier_1","CPC_Duala_B_GFD_soldier_1","CPC_Duala_B_GFD_soldier_GL"],
			["CPC_Duala_B_GFD_soldier_1","CPC_Duala_B_GFD_soldier_AT","CPC_Duala_B_GFD_soldier_Medic"],
			["CPC_Duala_B_GFD_soldier_TL","CPC_Duala_B_GFD_soldier_1","CPC_Duala_B_GFD_soldier_light","CPC_Duala_B_GFD_soldier_Medic","CPC_Duala_B_GFD_soldier_light"],
			["CPC_Duala_B_GFD_soldier_M","CPC_Duala_B_GFD_soldier_light"]
		];

		_binome = ["CPC_Duala_B_GFD_soldier_light","CPC_Duala_B_GFD_soldier_light"];
		_ennemi_group = ["CPC_Duala_B_GFD_soldier_TL","CPC_Duala_B_GFD_soldier_1","CPC_Duala_B_GFD_soldier_MG","CPC_Duala_B_GFD_soldier_AT","CPC_Duala_B_GFD_soldier_GL"];
		_rand_vehi = ["CPC_Duala_B_GFD_BTR40_MG","CPC_Duala_B_GFD_BTR40_MG","CPC_Duala_B_GFD_BRDM2","CPC_Duala_B_GFD_BRDM2","CPC_Duala_B_GFD_BTR60","CPC_Duala_B_GFD_M113","CPC_Duala_B_GFD_M113","CPC_Duala_B_GFD_T55"];
		_transp_vehi = "CPC_Duala_B_GFD_LR_Transport";
		_offroad = "CPC_Duala_B_GFD_LR_MG";
		_helico = "CPC_Duala_B_GFD_SA330";
	};

	case 10 : { // Russe CUP
		_compo_group = [
			["CUP_O_RU_Soldier_SL","CUP_O_RU_Soldier","CUP_O_RU_Soldier_MG"],
			["CUP_O_RU_Soldier","CUP_O_RU_Soldier_LAT","CUP_O_RU_Soldier_GL"],
			["CUP_O_RU_Soldier","CUP_O_RU_Soldier_AT","CUP_O_RU_Medic"],
			["CUP_O_RU_Soldier_SL","CUP_O_RU_Soldier","CUP_O_RU_Soldier","CUP_O_RU_Medic","CUP_O_RU_Soldier"],
			["CUP_O_RU_Soldier_Marksman","CUP_O_RU_Soldier"]
		];

		_binome = ["CUP_O_RU_Soldier","CUP_O_RU_Soldier"];
		_ennemi_group = ["CUP_O_RU_Soldier_SL","CUP_O_RU_Soldier_LAT","CUP_O_RU_Soldier_MG","CUP_O_RU_Medic","CUP_O_RU_Soldier_GL"];
		_rand_vehi = ["CUP_O_BMP2_RU","CUP_O_BMP2_RU","CUP_O_BMP3_RU","CUP_O_BMP3_RU","CUP_O_GAZ_Vodnik_PK_RU","CUP_O_GAZ_Vodnik_BPPU_RU","CUP_O_BTR90_RU","CUP_O_BTR90_RU","CUP_O_T72_RU","CUP_O_T72_RU","CUP_O_UAZ_METIS_RU"];
		_transp_vehi = "CUP_O_Ural_RU";
		_offroad = "CUP_O_UAZ_MG_RU";
		_helico = "CUP_O_Mi8_RU";
	};

	case 11 : { // US army CUP
		_compo_group = [
			["CUP_B_US_Soldier_TL","CUP_B_US_Soldier","CUP_B_US_Soldier_MG"],
			["CUP_B_US_Soldier","CUP_B_US_Soldier_LAT","CUP_B_US_Soldier_GL"],
			["CUP_B_US_Soldier","CUP_B_US_Soldier_AT","CUP_B_US_Medic"],
			["CUP_B_US_Soldier_TL","CUP_B_US_Soldier","CUP_B_US_Soldier","CUP_B_US_Medic","CUP_B_US_Soldier"],
			["CUP_B_US_Soldier_Marksman","CUP_B_US_Soldier"]
		];

		_binome = ["CUP_B_US_Soldier","CUP_B_US_Soldier"];
		_ennemi_group = ["CUP_B_US_Soldier_TL","CUP_B_US_Soldier_LAT","CUP_B_US_Soldier_AR","CUP_B_US_Medic","CUP_B_US_Soldier_GL"];
		_rand_vehi = ["CUP_B_M1126_ICV_M2_Desert_Slat","CUP_B_M1126_ICV_M2_Desert_Slat","CUP_B_M1126_ICV_MK19_Desert_Slat","CUP_B_M1128_MGS_Desert_Slat","CUP_B_M2Bradley_USA_D","CUP_B_M2A3Bradley_USA_D","CUP_B_M1A2_TUSK_MG_DES_US_Army"];
		_transp_vehi = "CUP_B_HMMWV_Transport_USA";
		_offroad = "CUP_B_HMMWV_M2_GPK_USA";
		_helico = "CUP_B_UH60M_US";
	};

	case 12 : { // BAF des CUP
		_compo_group = [
			["CUP_B_BAF_Soldier_SL_DDPM","CUP_B_BAF_Soldier_Backpack_DDPM","CUP_B_BAF_Soldier_MG_DDPM"],
			["CUP_B_BAF_Soldier_DDPM","CUP_B_BAF_Soldier_DDPM","CUP_B_BAF_Soldier_GL_DDPM"],
			["CUP_B_BAF_Soldier_DDPM","CUP_B_BAF_Soldier_AT_DDPM","CUP_B_BAF_Medic_DDPM"],
			["CUP_B_BAF_Soldier_SL_DDPM","CUP_B_BAF_Soldier_DDPM","CUP_B_BAF_Soldier_Backpack_DDPM","CUP_B_BAF_Medic_DDPM","CUP_B_BAF_Soldier_DDPM"],
			["CUP_B_BAF_Soldier_scout_DDPM","CUP_B_BAF_Soldier_DDPM"]
		];

		_binome = ["CUP_B_BAF_Soldier_DDPM","CUP_B_BAF_Soldier_Backpack_DDPM"];
		_ennemi_group = ["CUP_B_BAF_Soldier_SL_DDPM","CUP_B_BAF_Soldier_AT_DDPM","CUP_B_BAF_Soldier_AR_DDPM","CUP_B_BAF_Medic_DDPM","CUP_B_BAF_Soldier_GL_DDPM"];
		_rand_vehi = ["CUP_B_Ridgback_HMG_GB_D","CUP_B_Ridgback_HMG_GB_D","CUP_B_Ridgback_GMG_GB_D","CUP_B_FV432_Bulldog_GB_D_RWS","CUP_B_FV510_GB_D_SLAT","CUP_B_MCV80_GB_D_SLAT"];
		_transp_vehi = "CUP_B_LR_Transport_GB_D";
		_offroad = "CUP_B_Jackal2_L2A1_GB_D";
		_helico = "CUP_B_Merlin_HC3_GB";
	};

	case 13 : { // BAF wdl CUP
		_compo_group = [
			["CUP_B_BAF_Soldier_SL_DPM","CUP_B_BAF_Soldier_Backpack_DPM","CUP_B_BAF_Soldier_MG_DPM"],
			["CUP_B_BAF_Soldier_DPM","CUP_B_BAF_Soldier_DPM","CUP_B_BAF_Soldier_GL_DPM"],
			["CUP_B_BAF_Soldier_DPM","CUP_B_BAF_Soldier_AT_DPM","CUP_B_BAF_Medic_DPM"],
			["CUP_B_BAF_Soldier_SL_DPM","CUP_B_BAF_Soldier_DPM","CUP_B_BAF_Soldier_Backpack_DPM","CUP_B_BAF_Medic_DPM","CUP_B_BAF_Soldier_DPM"],
			["CUP_B_BAF_Soldier_scout_DPM","CUP_B_BAF_Soldier_DPM"]
		];

		_binome = ["CUP_B_BAF_Soldier_DPM","CUP_B_BAF_Soldier_Backpack_DPM"];
		_ennemi_group = ["CUP_B_BAF_Soldier_SL_DPM","CUP_B_BAF_Soldier_AT_DPM","CUP_B_BAF_Soldier_AR_DPM","CUP_B_BAF_Medic_DPM","CUP_B_BAF_Soldier_GL_DPM"];
		_rand_vehi = ["CUP_B_Ridgback_HMG_GB_W","CUP_B_Ridgback_HMG_GB_W","CUP_B_Ridgback_GMG_GB_W","CUP_B_FV432_Bulldog_GB_W_RWS","CUP_B_FV510_GB_W_SLAT","CUP_B_MCV80_GB_W"];
		_transp_vehi = "CUP_B_LR_Transport_GB_W";
		_offroad = "CUP_B_LR_MG_GB_W";
		_helico = "CUP_B_Merlin_HC3_GB";
	};

	case 14 : { // CDF RHS
		_compo_group = [
			["rhsgref_cdf_reg_rifleman_lite","rhsgref_cdf_reg_rifleman","rhsgref_cdf_reg_machinegunner"],
			["rhsgref_cdf_reg_rifleman","rhsgref_cdf_reg_rifleman_m70","rhsgref_cdf_reg_grenadier"],
			["rhsgref_cdf_reg_rifleman","rhsgref_cdf_reg_grenadier_rpg","rhsgref_cdf_reg_medic"],
			["rhsgref_cdf_reg_rifleman_lite","rhsgref_cdf_reg_grenadier_rpg","rhsgref_cdf_reg_rifleman","rhsgref_cdf_reg_medic","rhsgref_cdf_reg_rifleman_m70"],
			["rhsgref_cdf_reg_marksman","rhsgref_cdf_reg_rifleman"]
		];

		_binome = ["rhsgref_cdf_reg_rifleman","rhsgref_cdf_reg_rifleman_m70"];
		_ennemi_group = ["rhsgref_cdf_reg_rifleman_lite","rhsgref_cdf_reg_rifleman","rhsgref_cdf_reg_grenadier","rhsgref_cdf_reg_grenadier_rpg","rhsgref_cdf_reg_machinegunner"];
		_rand_vehi = ["rhsgref_cdf_btr60","rhsgref_cdf_btr70","rhsgref_cdf_bmd2k","rhsgref_cdf_bmp1","rhsgref_cdf_bmp2e","rhsgref_cdf_t72ba_tv"];
		_transp_vehi = "rhsgref_cdf_gaz66";
		_offroad = "rhsgref_cdf_reg_uaz_dshkm";
		_helico = "rhsgref_cdf_reg_Mi17Sh";
	};

	case 100 : { // Insurge RHS
		_compo_group = [
			["rhsgref_ins_g_rifleman","rhsgref_ins_g_rifleman_akm","rhsgref_ins_g_machinegunner"],
			["rhsgref_ins_g_rifleman_aksu","rhsgref_ins_g_rifleman_akm","rhsgref_ins_g_grenadier"],
			["rhsgref_ins_g_rifleman_akm","rhsgref_ins_g_grenadier_rpg","rhsgref_ins_g_medic"],
			["rhsgref_ins_g_rifleman","rhsgref_ins_g_rifleman_akm","rhsgref_ins_g_rifleman_aksu","rhsgref_ins_g_medic","rhsgref_ins_g_militiaman_mosin"],
			["rhsgref_ins_g_sniper","rhsgref_ins_g_rifleman_RPG26"]
		];

		_binome = ["rhsgref_ins_g_rifleman_aksu","rhsgref_ins_g_rifleman_RPG26"];
		_ennemi_group = ["rhsgref_ins_g_rifleman","rhsgref_ins_g_rifleman_akm","rhsgref_ins_g_machinegunner","rhsgref_ins_g_grenadier_rpg","rhsgref_ins_g_militiaman_mosin"];
		_rand_vehi = ["rhsgref_ins_g_uaz_dshkm_chdkz","rhsgref_ins_g_uaz_ags","rhsgref_ins_g_btr60","rhsgref_ins_g_btr70","rhsgref_ins_g_uaz_spg9","rhsgref_ins_g_gaz66_zu23","rhsgref_BRDM2_ins_g","rhsgref_ins_g_bmp2e","rhsgref_ins_g_bmd1p","rhsgref_ins_g_bmp1","rhsgref_ins_g_t72ba","rhsgref_ins_g_t72bb"];
		_transp_vehi = "rhsgref_ins_g_gaz66";
		_offroad = "rhsgref_ins_g_uaz_dshkm_chdkz";
		_helico = "";
	};

	case 101 : { // Insurge taki
		_compo_group = [
			["CUP_I_TK_GUE_Soldier","CUP_I_TK_GUE_Soldier","CUP_I_TK_GUE_Soldier_MG"],
			["CUP_I_TK_GUE_Soldier","CUP_I_TK_GUE_Soldier","CUP_I_TK_GUE_Soldier_GL"],
			["CUP_I_TK_GUE_Soldier","CUP_I_TK_GUE_Soldier_AT","CUP_I_TK_GUE_Guerilla_Medic"],
			["CUP_I_TK_GUE_Soldier_TL","CUP_I_TK_GUE_Soldier","CUP_I_TK_GUE_Soldier_AK_47S","CUP_I_TK_GUE_Guerilla_Medic","CUP_I_TK_GUE_Soldier_AK_47S"],
			["CUP_I_TK_GUE_Sniper","CUP_I_TK_GUE_Soldier_AK_47S"]
		];

		_binome = ["CUP_I_TK_GUE_Soldier_AK_47S","CUP_I_TK_GUE_Soldier_AK_47S"];
		_ennemi_group = ["CUP_I_TK_GUE_Soldier_TL","CUP_I_TK_GUE_Soldier","CUP_I_TK_GUE_Soldier_MG","CUP_I_TK_GUE_Guerilla_Medic","CUP_I_TK_GUE_Soldier_GL"];
		_rand_vehi = ["CUP_I_BTR40_MG_TKG","CUP_I_BTR40_MG_TKG","CUP_I_BRDM2_TK_Gue","CUP_I_BMP1_TK_GUE","CUP_I_BRDM2_TK_Gue","CUP_I_T34_TK_GUE","CUP_I_T34_TK_GUE","CUP_I_T55_TK_GUE"];
		_transp_vehi = "CUP_O_Ural_SLA";
		_offroad = "CUP_I_Datsun_PK_TK";
		_helico = "";
	};

	case 102 : { // NAPA
		_compo_group = [
			["CUP_I_GUE_Officer","CUP_I_GUE_Soldier_AKS74","CUP_I_GUE_Soldier_MG"],
			["CUP_I_GUE_Soldier_AKS74","CUP_I_GUE_Soldier_AKS74","CUP_I_GUE_Soldier_GL"],
			["CUP_I_GUE_Soldier_AKS74","UP_I_GUE_Soldier_AT","CUP_I_GUE_Medic"],
			["CUP_I_GUE_Officer","CUP_I_GUE_Soldier_AKS74","CUP_I_GUE_Soldier_AKSU","CUP_I_GUE_Medic","CUP_I_GUE_Soldier_AKSU"],
			["CUP_I_GUE_Sniper","CUP_I_GUE_Soldier_AKSU"]
		];

		_binome = ["CUP_I_GUE_Soldier_AKSU","CUP_I_GUE_Soldier_AKSU"];
		_ennemi_group = ["CUP_I_GUE_Officer","CUP_I_GUE_Soldier_AKS74","CUP_I_GUE_Soldier_MG","CUP_I_GUE_Medic","CUP_I_GUE_Soldier_GL"];
		_rand_vehi = ["CUP_I_BRDM2_NAPA","CUP_I_BRDM2_NAPA","CUP_I_BRDM2_NAPA","CUP_I_BMP2_NAPA","CUP_I_T34_NAPA","CUP_I_T72_NAPA"];
		_transp_vehi = "CUP_O_Ural_SLA";
		_offroad = "CUP_I_Datsun_PK";
		_helico = "";
	};

	case 103 : { // FIA
		_compo_group = [
			["B_G_Soldier_SL_F","B_G_Soldier_F","B_G_Soldier_AR_F"],
			["B_G_Soldier_F","B_G_Soldier_F","B_G_Soldier_GL_F"],
			["B_G_Soldier_F","B_G_Soldier_LAT_F","B_G_medic_F"],
			["B_G_Soldier_SL_F","B_G_Soldier_F","B_G_Soldier_lite_F","B_G_medic_F","B_G_Soldier_lite_F"],
			["B_G_Soldier_M_F","B_G_Soldier_lite_F"]
		];

		_binome = ["B_G_Soldier_lite_F","B_G_Soldier_lite_F"];
		_ennemi_group = ["B_G_Soldier_SL_F","B_G_Soldier_F","B_G_Soldier_AR_F","B_G_medic_F","B_G_Soldier_GL_F"];
		_rand_vehi = ["B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F"];
		_transp_vehi = "B_G_Van_01_transport_F";
		_offroad = "B_G_Offroad_01_armed_F";
		_helico = "";
	};

	case 104 : { // NPFD
		_compo_group = [
			["CPC_Duala_O_NPFD_soldier_TL","CPC_Duala_O_NPFD_soldier_4","CPC_Duala_O_NPFD_soldier_MG"],
			["CPC_Duala_O_NPFD_soldier_2","CPC_Duala_O_NPFD_soldier_4","CPC_Duala_O_NPFD_soldier_GL"],
			["CPC_Duala_O_NPFD_soldier_2","CPC_Duala_O_NPFD_soldier_AT","CPC_Duala_O_NPFD_soldier_Medic"],
			["CPC_Duala_O_NPFD_soldier_TL","CPC_Duala_O_NPFD_soldier_4","CPC_Duala_O_NPFD_soldier_5","CPC_Duala_O_NPFD_soldier_Medic","CPC_Duala_O_NPFD_soldier_5"],
			["CPC_Duala_O_NPFD_soldier_sniper","CPC_Duala_O_NPFD_soldier_5"]
		];

		_binome = ["CPC_Duala_O_NPFD_soldier_5","CPC_Duala_O_NPFD_soldier_5"];
		_ennemi_group = ["CPC_Duala_O_NPFD_soldier_TL","CPC_Duala_O_NPFD_soldier_2","CPC_Duala_O_NPFD_soldier_MG","CPC_Duala_O_NPFD_soldier_Medic","CPC_Duala_O_NPFD_soldier_GL"];
		_rand_vehi = ["CPC_Duala_O_NPFD_BTR40_MG","CPC_Duala_O_NPFD_Datsun_PK","CPC_Duala_O_NPFD_Datsun_PK","CPC_Duala_O_NPFD_Datsun_PK","CPC_Duala_O_NPFD_Ural_ZU23"];
		_transp_vehi = "CPC_Duala_O_NPFD_Ural_1";
		_offroad = "CPC_Duala_O_NPFD_Datsun_PK";
		_helico = "";
	};

	case 105 : { // chdkz
		_compo_group = [
			["CUP_O_INS_Officer","CUP_O_INS_Soldier","CUP_O_INS_Soldier_MG"],
			["CUP_O_INS_Soldier_AK74","CUP_O_INS_Soldier","CUP_O_INS_Soldier_GL"],
			["CUP_O_INS_Soldier_AK74","CUP_O_INS_Soldier_AT","CUP_O_INS_Medic"],
			["CUP_O_INS_Officer","CUP_O_INS_Soldier","CUP_O_INS_Soldier","CUP_O_INS_Medic","CUP_O_INS_Soldier_AK74"],
			["CUP_O_INS_Sniper","CUP_O_INS_Soldier_AK74"]
		];

		_binome = ["CUP_O_INS_Soldier_AK74","CUP_O_INS_Soldier"];
		_ennemi_group = ["CUP_O_INS_Officer","CUP_O_INS_Soldier_AK74","CUP_O_INS_Soldier_MG","CUP_O_INS_Soldier_AT","CUP_O_INS_Soldier_GL"];
		_rand_vehi = ["CUP_O_Datsun_PK_Random","CUP_O_UAZ_AGS30_CHDKZ","CUP_O_BRDM2_CHDKZ","CUP_O_BRDM2_CHDKZ","CUP_O_BMP2_CHDKZ","CUP_O_BMP2_CHDKZ","CUP_O_T72_CHDKZ"];
		_transp_vehi = "CUP_O_Ural_CHDKZ";
		_offroad = "CUP_O_UAZ_MG_CHDKZ";
		_helico = "";
	};

	case 106 : { // Paramilitaires nationalistes (RHS)
		_compo_group = [
			["rhsgref_nat_pmil_commander","rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_machinegunner"],
			["rhsgref_nat_pmil_saboteur","rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_grenadier"],
			["rhsgref_nat_pmil_saboteur","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_medic"],
			["rhsgref_nat_pmil_commander","rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_medic","rhsgref_nat_pmil_saboteur"],
			["rhsgref_nat_pmil_hunter","rhsgref_nat_pmil_saboteur"]
		];

		_binome = ["rhsgref_nat_pmil_saboteur","rhsgref_nat_pmil_rifleman"];
		_ennemi_group = ["rhsgref_nat_pmil_commander","rhsgref_nat_pmil_saboteur","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_grenadier"];
		_rand_vehi = ["rhsgref_nat_uaz_dshkm","rhsgref_nat_uaz_ags","rhsgref_nat_uaz_spg9","rhsgref_nat_btr70","rhsgref_nat_btr70","rhsgref_nat_ural_Zu23"];
		_transp_vehi = "rhsgref_nat_ural_open";
		_offroad = "rhsgref_nat_uaz_dshkm";
		_helico = "";
	};
};

// Fait spawn des groupes (jusqu'à 4) qui patrouillent dans la petite zone en NOFOLLOW
_fois = switch (_Nombre_Ennemi) do {
	case 0: {1};
	case 1: {2};
	case 2: {3};
	case 3: {4};
};
_mark = "2";
_markEx = "1";
for "_n" from 1 to _fois do {
	_pos = [_mark,0,_markEx,100] call SHK_pos;
	_group = [_pos, resistance, selectrandom _Compo_group,[],[],[],[],[],random 360] call BIS_fnc_spawnGroup;
	_group setVariable ["GAIA_ZONE_INTEND",[_mark, "NOFOLLOW"], false];
	sleep 0.5;
};

// Fait spawn des technicals (jusqu'à 4) qui patrouillent dans la petite zone en MOVE
_fois = switch (_Nombre_Ennemi) do {
	case 0: {2};
	case 1: {2 + (floor random 2)};
	case 2: {3};
	case 3: {4};
};
//if (typecamp == 2) then {_fois = _fois + 2;}; la ville doit elle vraiment provoquer + de véhicules ?
if ((paramsArray select 13) < 1) then {
for "_n" from 1 to _fois do {
	_pos = [_mark,0,_markEx,100] call SHK_pos;
	_objet = _offroad CreateVehicle _pos;
	_group = [getpos _objet, resistance, _binome,[],[],[],[],[],random 360] call BIS_fnc_spawnGroup;
	_group setVariable ["GAIA_ZONE_INTEND",[_mark, "MOVE"], false];
	units _group select 0 moveInDriver _objet; units _group select 0 assignAsDriver _objet;
	units _group select 1 moveInGunner _objet; units _group select 1 assignAsGunner _objet;
	sleep 0.5;
};
};

// Fait spawn des groupes (jusqu'à 6) qui restent dans la zone du camp en FORTIFY
if (typecamp == 1) then { //petit camp
	_fois = switch (_Nombre_Ennemi) do {
		case 0: {2};
		case 1: {3};
		case 2: {4};
		case 3: {5};
	};
};
if (typecamp == 2) then { //ville
	_fois = switch (_Nombre_Ennemi) do {
		case 0: {2 + (floor random 2)};
		case 1: {3 + (floor random 2)};
		case 2: {4 + (floor random 2)};
		case 3: {6 + (floor random 2)};
	};
};
if (typecamp == 3) then { //Base militaire
	_fois = switch (_Nombre_Ennemi) do {
		case 0: {2};
		case 1: {3 + (floor random 2)};
		case 2: {4 + (floor random 2)};
		case 3: {6 + (floor random 2)};
	};
};
_mark = "1";
for "_n" from 1 to _fois do {
	_pos = [_mark,0,[],100] call SHK_pos;
	_group = [_pos, resistance, selectrandom _Compo_group,[],[],[],[],[],random 360] call BIS_fnc_spawnGroup;
	_group setVariable ["GAIA_ZONE_INTEND",[_mark, "FORTIFY"], false];
	sleep 0.5;
};

// Fait spawn des groupes (minimum 4) qui patrouillent dans la grande zone en MOVE
_fois = switch (_Nombre_Ennemi) do {
	case 0: {1};
	case 1: {2};
	case 2: {3};
	case 3: {5};
};
_mark = "3";
_markEx = "2";
for "_n" from 1 to _fois do {
	{
	_pos = [_mark,0,_markEx,200] call SHK_pos;
	_group = [_pos, resistance, selectrandom _Compo_group,[],[],[],[],[],random 360] call BIS_fnc_spawnGroup;
	_group setVariable ["GAIA_ZONE_INTEND",[_mark, "MOVE"], false];
	sleep 0.5;
	} foreach [1,2,3,4];
};

// Fait spawn des véhicules "lourds" (entre 1 et 8) qui patrouillent dans la grande zone en MOVE 
_fois = switch (_Nombre_Ennemi) do {
	case 0: {floor random 2};
	case 1: {floor ((random 2)+ 0.5)};
	case 2: {(floor random 1.8) + 1};
	case 3: {(floor random 3) + 2};
};
if ((paramsArray select 13) == 0) then {
if (_rab_veh) then {_fois = _fois + 1 + _Nombre_Ennemi;}; 
_mark = "3";
_markEx = "2";
for "_n" from 1 to _fois do {
	_pos = [_mark,0,_markEx,200] call SHK_pos; 
	_type = selectrandom _rand_vehi;
	_group = [_pos,random 360,_type,resistance] call BIS_fnc_spawnVehicle;
	group ((_group select 1) select 0) setVariable ["GAIA_ZONE_INTEND",[_mark, "MOVE"], false];
	sleep 0.5;
};
};

// Fait spawn un mortier qui bombarde la grande zone
if (random 100 < 22) then {
	_dir = [[getMarkerPos "Mark_Inser" select 0,getMarkerPos "Mark_Inser" select 1,0],[getMarkerPos "1" select 0,getMarkerPos "1" select 1,0]] call BIS_fnc_dirTo;
	_pos = [[getmarkerpos "1" select 0, getmarkerpos "1" select 1,0],2000,(_dir + ((random 20)-10)),0] call SHK_pos;
	_objet = "B_G_Mortar_01_F" CreateVehicle _pos;
	_group = [getpos _objet, resistance, _binome,[],[],[],[],[],random 360] call BIS_fnc_spawnGroup;
	_group setVariable ["GAIA_ZONE_INTEND",["3", "NOFOLLOW"], false];
	units _group select 0 moveInGunner _objet; units _group select 0 assignAsGunner _objet;
};

//Fait spawn des petits camps (jusqu'à 4) dans la grande zone avec un groupe dessus en FORTIFY
{
	if (random 100 < _x) then {
		_pos = [[getmarkerpos "1" select 0, getmarkerpos "1" select 1,0],[450,800],random 360,0] call SHK_pos;
		while {((SurfaceNormal _pos) select 2) < 0.955} do {
			_pos = [[getmarkerpos "1" select 0, getmarkerpos "1" select 1,0],[450,800],random 360,0] call SHK_pos;
		};
		[
			_pos
			, selectrandom ["campA","campB","campC","campD","campE","campF"]
		] execVM "spawn\spawn_OP.sqf";
		_mark = createMarker [format["CPos%1",_x],_pos];
			_mark setmarkerColor "colorRed";
			_mark setMarkerShape "ELLIPSE";
			_mark setMarkerSize [50,51];
			_mark setMarkerAlpha 1;
		_dir = random 360;
		_group = [_pos, resistance, selectrandom _compo_group,[],[],[],[],[],random 360] call BIS_fnc_spawnGroup;
		_group setVariable ["GAIA_ZONE_INTEND",[_mark, "FORTIFY"], false];
		sleep 0.5;
	};
} foreach [45,25,8,2];

//road Patrouille
if (random 100 < 75) then {
	_vehtype = _transp_vehi;
	_pos = [getMarkerPos "1",[1000,1500],random 360,0,[1,500],_vehtype] call SHK_pos;
	_veh = [_pos,random 360,_vehtype,resistance] call BIS_fnc_spawnVehicle;
	_group = [_pos, resistance, _ennemi_group] call BIS_fnc_spawnGroup;
	{_x assignAsCargo (_veh select 0); _x moveInCargo (_veh select 0);} foreach units _group;
	units _group join (_veh select 2);
	_way = (_veh select 2) addWaypoint [getpos (_veh select 0), 20, 0];
		_way setWaypointType "MOVE";
		_way setWaypointBehaviour "SAFE";
		_way setWaypointSpeed "LIMITED";
	_i = 1;
	{
		_pos = [getMarkerPos "1",[1500,1800],_x,0,[1,300],_vehtype] call SHK_pos;
		_way = (_veh select 2) addWaypoint [_pos, 20, _i];
			_way setWaypointType "MOVE";
			_way setWaypointBehaviour "SAFE";
			_way setWaypointSpeed "LIMITED";
		_i = _i +1;
	} foreach [[0,90],[90,180],[180,270],[270,360]];
	_way = (_veh select 2) addWaypoint [getpos (_veh select 0), 20, _i];
		_way setWaypointType "CYCLE";
		_way setWaypointBehaviour "SAFE";
		_way setWaypointSpeed "LIMITED";
};

if (random 100 < 75) then {
	_mark = "3";
	_markPos = markerpos _mark;
	_markSize = (getmarkerSize _mark) select 0;
	_upPos = -1;
	_pos = [0,0,-10];
	for "_x" from ((_markPos select 0)- (_markSize /1.6)) to ((_markPos select 0)+ (_markSize /1.6)) step (_markSize / 100) do {
		for "_y" from ((_markPos select 1)- (_markSize /1.6)) to ((_markPos select 1)+ (_markSize /1.6)) step (_markSize / 100) do {
			_upPos = getTerrainHeightASL [_x,_y];
			if ((_pos select 2) < _upPos) then {
				_Pos = [_x,_y,_upPos];
			};
		};
	};

_objet = "Land_Cargo_Patrol_V2_F" CreateVehicle [_pos select 0, _pos select 1,-3];
_objet setdir random 360;
"4" setmarkerpos _pos;
_group = [getpos _objet, resistance,  selectrandom _compo_group,[],[],[],[],[],random 360] call BIS_fnc_spawnGroup;
leader _group setPosATL (_objet buildingPos 1);
_group setVariable ["GAIA_ZONE_INTEND",["4", "FORTIFY"], false];
};

//hélico
if ((paramsArray select 13) == 0) then {
if ((_helico != "") AND (random 100 < 20)) then {
	_mark = "2";
	_markEx = "1";
	_dir = random 360;
	_pos = [_mark,0,_markEx,[300,_helico]] call SHK_pos;
	_veh = [_pos,random 360,_helico,resistance] call BIS_fnc_spawnVehicle;
	_group = createGroup resistance;
	_group = [[0,0,0], resistance, _ennemi_group] call BIS_fnc_spawnGroup;
	{_x assignAsCargo (_veh select 0); _x moveInCargo (_veh select 0);} foreach units _group;
	units _group join (_veh select 2);
	(_veh select 2) setVariable ["GAIA_ZONE_INTEND",["3", "MOVE"], false];
};
};

//pat Ville
_houselist = nearestObjects [getMarkerPos "3", ["Building","House"], 1200];
{
	if (random 100 < 3.5) then {
		_pos = getpos _x;
		_group = [_pos, resistance, _binome,[],[],[],[],[],random 360] call BIS_fnc_spawnGroup;
		_group setVariable ["GAIA_ZONE_INTEND",["3", "FORTIFY"], false];
		if ((isnull chefIA) AND (random 100 < 20) AND !(["1",_pos] call BIS_fnc_inTrigger)) then {
			chefIA = _group createUnit [(_binome select 0), _pos, [], 0, "FORM"];
			chefIA allowDamage false; 
			_mark = createMarker ["Chefmarker",_pos];
			_mark setMarkerType "HD_dot";
			_mark setMarkerColor "colorRed";
			publicVariable "chefIA";
		};
		sleep 0.5;
	};
} foreach _houselist;
_houseOutlist = (nearestObjects [getMarkerPos "3", ["Building","House"], 1800]) - _houselist;
{
	if (random 100 < 3.5) then {
		_pos = getpos _x;
		if (CPC_WorldType == "vanilla") then {CPC_civilianType =["CUP_C_C_Citizen_02","CUP_C_C_Citizen_01","CUP_C_C_Citizen_04","CUP_C_C_Citizen_03""CUP_C_C_Functionary_01","CUP_C_C_Functionary_02","CUP_C_C_Profiteer_02","CUP_C_C_Profiteer_03","CUP_C_C_Profiteer_01","CUP_C_C_Profiteer_04","CUP_C_C_Rocker_01","CUP_C_C_Rocker_03","CUP_C_C_Rocker_02","CUP_C_C_Rocker_04","CUP_C_C_Schoolteacher_01","CUP_C_C_Villager_01","CUP_C_C_Villager_04","CUP_C_C_Villager_02","CUP_C_C_Villager_03","CUP_C_C_Worker_03","CUP_C_C_Worker_04","CUP_C_C_Worker_02","CUP_C_C_Worker_01","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_p_beggar_F"];};
		if (CPC_WorldType == "desert") then {CPC_civilianType =["C_man_p_beggar_F_afro","C_man_polo_1_F_afro","C_man_polo_2_F_afro","C_man_polo_3_F_afro","C_man_polo_4_F_afro","C_man_polo_5_F_afro","C_man_polo_6_F_afro","C_man_p_beggar_F_asia","C_man_polo_1_F_asia","C_man_polo_2_F_asia","C_man_polo_3_F_asia","C_man_polo_4_F_asia","C_man_polo_5_F_asia","C_man_polo_6_F_asia"];};
		if (CPC_WorldType == "afrique") then {CPC_civilianType =["C_man_p_beggar_F_afro","C_man_polo_1_F_afro","C_man_polo_2_F_afro","C_man_polo_3_F_afro","C_man_polo_4_F_afro","C_man_polo_5_F_afro","C_man_polo_6_F_afro"];};
		if (CPC_WorldType == "jungle") then {CPC_civilianType =["C_man_p_beggar_F_afro","C_man_polo_1_F_afro","C_man_polo_2_F_afro","C_man_polo_3_F_afro","C_man_polo_4_F_afro","C_man_polo_5_F_afro","C_man_polo_6_F_afro"];};
		if (CPC_WorldType == "chernarus") then {CPC_civilianType =["CUP_C_C_Citizen_02","CUP_C_C_Citizen_01","CUP_C_C_Citizen_04","CUP_C_C_Citizen_03""CUP_C_C_Functionary_01","CUP_C_C_Functionary_02","CUP_C_C_Priest_01","CUP_C_C_Profiteer_02","CUP_C_C_Profiteer_03","CUP_C_C_Profiteer_01","CUP_C_C_Profiteer_04","CUP_C_C_Rocker_01","CUP_C_C_Rocker_03","CUP_C_C_Rocker_02","CUP_C_C_Rocker_04","CUP_C_C_Schoolteacher_01","CUP_C_C_Villager_01","CUP_C_C_Villager_04","CUP_C_C_Villager_02","CUP_C_C_Villager_03","CUP_C_C_Woodlander_01","CUP_C_C_Woodlander_02","CUP_C_C_Woodlander_03","CUP_C_C_Woodlander_04","CUP_C_C_Worker_03","CUP_C_C_Worker_04","CUP_C_C_Worker_02","CUP_C_C_Worker_01"];};
		_group = [_pos, civilian, [(selectrandom CPC_civilianType),(selectrandom CPC_civilianType)],[],[],[],[],[],random 360] call BIS_fnc_spawnGroup;
		[_group, 0] setWaypointType "DISMISS";
		sleep 0.5;
	};
} foreach _houseOutlist;

// réglage des skills
_skill = paramsArray select 4;
{
	if (side _x == resistance) then {_x unlinkItem "rhsusf_ANPVS_14";  _x unlinkItem "NVGoggles"; _x unlinkItem "NVGoggles_OPFOR"; _x unlinkItem "NVGoggles_INDEP";};
	_IA = _x;
	{
	_Sktype = _IA skill _x ;
	_IA setSkill [_x,( _Sktype * _skill)];
	} foreach ["aimingShake","aimingSpeed","spotTime","spotDistance","aimingAccuracy"];
} foreach allUnits;

if (!isnull chefIA) then {removeHeadgear chefIA; chefIA addHeadgear "H_Beret_blk"; chefIA allowDamage true;};

//event fin
[_Nombre_Ennemi,_Compo_group,_skill] spawn {
	_Compo_group = _this select 1;
	_skill = _this select 2;
	waitUntil {("Succeeded" == (taskState task1))};

	_fois = switch (_this select 0) do {
	case 0: {2};
	case 1: {3};
	case 2: {4};
	case 3: {5};
	};
	for "_n" from 1 to _fois do {
		_mark = "2";
		_markPos = markerpos _mark;
		_dir = random 360;
		_pos = [[_markPos select 0,_markPos select 1,0],1400,random 360,0,[],100] call SHK_pos;
		_group = [_pos, resistance, selectrandom _Compo_group,[],[],[],[],[],random 360] call BIS_fnc_spawnGroup;
		_group setVariable ["GAIA_ZONE_INTEND",[_mark, "NOFOLLOW"], false];
		sleep 0.5;
		{
			if (side _x == resistance) then {_x unlinkItem "rhsusf_ANPVS_14";  _x unlinkItem "NVGoggles"; _x unlinkItem "NVGoggles_OPFOR"; _x unlinkItem "NVGoggles_INDEP";};
			_IA = _x;
			{
			_Sktype = _IA skill _x ;
			_IA setSkill [_x,( _Sktype * _skill)];
			} foreach ["aimingShake","aimingSpeed","spotTime","spotDistance","aimingAccuracy"];
		} foreach (units _group);
	};
};


waitUntil {time > (2100 + (random 600))};
//random Event
	_vehtype = _transp_vehi;
	_pos = [getMarkerPos "1",[1500,1800],random 360,0,[1,200],_vehtype] call SHK_pos;
	_veh = [_pos,random 360,_vehtype,resistance] call BIS_fnc_spawnVehicle;
	_group = [_pos, resistance, _ennemi_group] call BIS_fnc_spawnGroup;
	{_x assignAsCargo (_veh select 0); _x moveInCargo (_veh select 0);} foreach units _group;
	units _group join (_veh select 2);
	(_veh select 2) setVariable ["GAIA_ZONE_INTEND",["2", "MOVE"], false];

{
	if (side _x == resistance) then {_x unlinkItem "rhsusf_ANPVS_14";  _x unlinkItem "NVGoggles"; _x unlinkItem "NVGoggles_OPFOR"; _x unlinkItem "NVGoggles_INDEP";};
	_IA = _x;
	{
	_Sktype = _IA skill _x ;
	_IA setSkill [_x,( _Sktype * _skill)];
	} foreach ["aimingShake","aimingSpeed","spotTime","spotDistance","aimingAccuracy"];
} foreach (units (_veh select 2));


if (random 100 < 50) then {
	sleep (600 + (random 300));
		_vehtype = _transp_vehi;
		_pos = [getMarkerPos "1",[1500,1800],random 360,0,[1,200],_vehtype] call SHK_pos;
		_veh = [_pos,random 360,_vehtype,resistance] call BIS_fnc_spawnVehicle;
		_group = [_pos, resistance, _ennemi_group] call BIS_fnc_spawnGroup;
		{_x assignAsCargo (_veh select 0); _x moveInCargo (_veh select 0);} foreach units _group;
		units _group join (_veh select 2);
		(_veh select 2) setVariable ["GAIA_ZONE_INTEND",["2", "MOVE"], false];

	{
		if (side _x == resistance) then {_x unlinkItem "rhsusf_ANPVS_14";  _x unlinkItem "NVGoggles"; _x unlinkItem "NVGoggles_OPFOR"; _x unlinkItem "NVGoggles_INDEP";};
		_IA = _x;
		{
		_Sktype = _IA skill _x ;
		_IA setSkill [_x,( _Sktype * _skill)];
		} foreach ["aimingShake","aimingSpeed","spotTime","spotDistance","aimingAccuracy"];
	} foreach (units (_veh select 2));
};

if ((({(paramsArray select 6) == _x} count [0,1,4,8]) > 0) AND (4 > random 10)) then {
	waitUntil {time > 4200};
	sleep (random 300);
	_group = CreateGroup resistance;
	_veh = createVehicle ["RHS_C130J", [0,0,500], [], 0, "FLY"];
	_pilot = _group createUnit ["C_man_pilot_F", [0,0,1], [], 0, "NONE"];
	_pilot moveInDriver _veh;
	_veh flyInHeight 400;
	_wp1 = _group addWaypoint [(getmarkerpos "1"), 0];
	_wp1 setWaypointSpeed "LIMITED";
	_wp1 setWaypointType "SAFE";
	if (_Nombre_Ennemi != 0) then {
		for "_n" from 1 to _Nombre_Ennemi do {
			_group = [[0,0,0], resistance, _ennemi_group] call BIS_fnc_spawnGroup;
			{_x assignAsCargo _veh; _x moveInCargo _veh;} foreach units _group;
		};
	};
	_veh spawn {
		waitUntil {({(_this distance _x) < 700} count SlotPlayers) != 0};
		[_this,140] execVM "Eject.sqf";
		sleep 40;
		_wp2 = group driver _this addWaypoint [[0,0,500], 0];
		_wp2 setWaypointSpeed "LIMITED";
		_wp2 setWaypointType "SAFE";
		group driver _this setCurrentWaypoint _wp2;
		waitUntil {(_this distance [0,0,0]) < 500};
		deleteVehicle driver _this;
		deleteVehicle _this;
	};
};

if ((paramsArray select 13) == 0) then {
if ((_helico != "") AND (random 100 < 35)) then {
	waitUntil {time > (6100+ (random 300))};
	_mark = "2";
	_markEx = "1";
	_dir = random 360;
	_pos = [_mark,0,_markEx,[300,_helico]] call SHK_pos;
	_veh = [_pos,random 360,_helico,resistance] call BIS_fnc_spawnVehicle;
	_group = createGroup resistance;
	_group = [[0,0,0], resistance, _ennemi_group] call BIS_fnc_spawnGroup;
	{_x assignAsCargo (_veh select 0); _x moveInCargo (_veh select 0);} foreach units _group;
	units _group join (_veh select 2);
	(_veh select 2) setVariable ["GAIA_ZONE_INTEND",["3", "MOVE"], false];

	{
		if (side _x == resistance) then {_x unlinkItem "rhsusf_ANPVS_14";  _x unlinkItem "NVGoggles"; _x unlinkItem "NVGoggles_OPFOR"; _x unlinkItem "NVGoggles_INDEP";};
		_IA = _x;
		{
		_Sktype = _IA skill _x ;
		_IA setSkill [_x,( _Sktype * _skill)];
		} foreach ["aimingShake","aimingSpeed","spotTime","spotDistance","aimingAccuracy"];
	} foreach (units (_veh select 2));
};
};


};