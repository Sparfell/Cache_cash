/*
Script pour créer une caisse avec du matos en plus près du spawn des joueurs


*/
private ["_pos","_veh","cc_rhsennemy","_lat","_at","_mag_at1","_mag_at2","_mag_at3","_hat","_mag_hat","_gre","_mag1","_mag2","_mag_ar","_mag_mg"];

waitUntil {time > 1};

_pos = markerpos "Mark_inser";
_pos = [_pos, 0, 30, 3, 0] call BIS_fnc_findSafePos;
_veh = "CUP_USBasicWeapons_EP1" createVehicle _pos;
_veh allowdamage false;

switch (CC_p_loaout) do {
	//OTAN
	case 0 : {
		_gre = "HandGrenade";
		_mag1 = "30Rnd_65x39_caseless_mag";
		_mag2 = "30Rnd_65x39_caseless_mag";
		_mag_ar = "100Rnd_65x39_caseless_mag_Tracer";
		_mag_mg = "130Rnd_338_Mag";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_M136";
			_at = "launch_I_Titan_short_F";
			_mag_at1 = "Titan_AT";
			_mag_at2 = "Titan_AP";
			_mag_at3 = "";
			_hat = "launch_I_Titan_short_F";
			_mag_hat = "Titan_AT";
		} else {
			_lat = "launch_NLAW_F";
			_at = "launch_I_Titan_short_F";
			_mag_at1 = "Titan_AT";
			_mag_at2 = "Titan_AP";
			_mag_at3 = "";
			_hat = "launch_I_Titan_short_F";
			_mag_hat = "Titan_AT";
		};
	};
	//CSAT
	case 1 : {
		_gre = "HandGrenade";
		_mag1 = "30Rnd_65x39_caseless_green";
		_mag2 = "10Rnd_762x54_Mag";
		_mag_ar = "150Rnd_762x54_Box_Tracer";
		_mag_mg = "150Rnd_762x54_Box_Tracer";
		if (cc_rhsennemy) then {
			_lat = "";
			_at = "rhs_weap_rpg7_pgo";
			_mag_at1 = "rhs_rpg7_PG7VL_mag";
			_mag_at2 = "rhs_rpg7_OG7V_mag";
			_mag_at3 = "rhs_rpg7_PG7VL_mag";
			_hat = "launch_O_Titan_short_F";
			_mag_hat = "Titan_AT";
		} else {
			_lat = "";
			_at = "launch_RPG32_F";
			_mag_at1 = "RPG32_F";
			_mag_at2 = "RPG32_HE_F";
			_mag_at3 = "RPG32_F";
			_hat = "launch_O_Titan_short_F";
			_mag_hat = "Titan_AT";
		};
	};
	//AAF
	case 2 : {
		_gre = "HandGrenade";
		_mag1 = "30Rnd_556x45_Stanag";
		_mag2 = "20Rnd_762x51_Mag";
		_mag_ar = "200Rnd_65x39_cased_Box";
		_mag_mg = "200Rnd_65x39_cased_Box_Tracer";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_m72a7";
			_at = "launch_I_Titan_short_F";
			_mag_at1 = "Titan_AT";
			_mag_at2 = "";
			_mag_at3 = "";
			_hat = "launch_I_Titan_short_F";
			_mag_hat = "Titan_AT";
		} else {
			_lat = "launch_NLAW_F";
			_at = "launch_I_Titan_short_F";
			_mag_at1 = "Titan_AT";
			_mag_at2 = "";
			_mag_at3 = "";
			_hat = "launch_I_Titan_short_F";
			_mag_hat = "Titan_AT";
		};
	};
	//USArmy
	case 3 : {
		_gre = "rhs_mag_m67";
		_mag1 = "rhs_mag_30Rnd_556x45_Mk318_Stanag";
		_mag2 = "rhsusf_20Rnd_762x51_m118_special_Mag";
		_mag_ar = "rhs_200rnd_556x45_M_SAW";
		_mag_mg = "rhsusf_50Rnd_762x51_m62_tracer";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_M136";
			_at = "rhs_weap_smaw_gr_optic";
			_mag_at1 = "rhs_mag_smaw_HEAA";
			_mag_at2 = "rhs_mag_smaw_HEDP";
			_mag_at3 = "rhs_mag_smaw_SR";
			_hat = "rhs_weap_fgm148";
			_mag_hat = "rhs_fgm148_magazine_AT";
		} else {
			_lat = "CUP_launch_M136";
			_at = "CUP_launch_Mk153Mod0_SMAWOptics";
			_mag_at1 = "CUP_SMAW_HEAA_M";
			_mag_at2 = "CUP_SMAW_HEDP_M";
			_mag_at3 = "CUP_SMAW_Spotting";
			_hat = "CUP_launch_Javelin";
			_mag_hat = "CUP_Javelin_M";
		};
	};
	//USMC
	case 4 : {
		_gre = "rhs_mag_m67";
		_mag1 = "rhs_mag_30Rnd_556x45_Mk318_Stanag";
		_mag2 = "rhsusf_20Rnd_762x51_m118_special_Mag";
		_mag_ar = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";
		_mag_mg = "rhsusf_50Rnd_762x51_m62_tracer";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_M136";
			_at = "rhs_weap_smaw_gr_optic";
			_mag_at1 = "rhs_mag_smaw_HEAA";
			_mag_at2 = "rhs_mag_smaw_HEDP";
			_mag_at3 = "rhs_mag_smaw_SR";
			_hat = "rhs_weap_fgm148";
			_mag_hat = "rhs_fgm148_magazine_AT";
		} else {
			_lat = "CUP_launch_M136";
			_at = "CUP_launch_Mk153Mod0_SMAWOptics";
			_mag_at1 = "CUP_SMAW_HEAA_M";
			_mag_at2 = "CUP_SMAW_HEDP_M";
			_mag_at3 = "CUP_SMAW_Spotting";
			_hat = "CUP_launch_Javelin";
			_mag_hat = "CUP_Javelin_M";
		};
	};
	//USSF
	case 5 : {
		_gre = "rhs_mag_m67";
		_mag1 = "rhs_mag_30Rnd_556x45_Mk318_Stanag";
		_mag2 = "rhsusf_20Rnd_762x51_m118_special_Mag";
		_mag_ar = "rhs_200rnd_556x45_M_SAW";
		_mag_mg = "rhsusf_50Rnd_762x51_m62_tracer";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_M136";
			_at = "rhs_weap_smaw_gr_optic";
			_mag_at1 = "rhs_mag_smaw_HEAA";
			_mag_at2 = "rhs_mag_smaw_HEDP";
			_mag_at3 = "rhs_mag_smaw_SR";
			_hat = "rhs_weap_fgm148";
			_mag_hat = "rhs_fgm148_magazine_AT";
		} else {
			_lat = "CUP_launch_M136";
			_at = "CUP_launch_Mk153Mod0_SMAWOptics";
			_mag_at1 = "CUP_SMAW_HEAA_M";
			_mag_at2 = "CUP_SMAW_HEDP_M";
			_mag_at3 = "CUP_SMAW_Spotting";
			_hat = "CUP_launch_Javelin";
			_mag_hat = "CUP_Javelin_M";
		};
	};
	//RUS2000
	case 6 : {
		_gre = "rhs_mag_rgd5";
		_mag1 = "rhs_30Rnd_545x39_AK";
		_mag2 = "rhs_10Rnd_762x54mmR_7N1";
		_mag_ar = "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";
		_mag_mg = "rhs_100Rnd_762x54mmR_green";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_rpg26";
			_at = "rhs_weap_rpg7_pgo";
			_mag_at1 = "rhs_rpg7_PG7VR_mag";
			_mag_at2 = "rhs_rpg7_OG7V_mag";
			_mag_at3 = "rhs_rpg7_TBG7V_mag";
			_hat = "rhs_weap_rpg7_pgo";
			_mag_hat = "rhs_rpg7_PG7VL_mag";
		} else {
			_lat = "CUP_launch_RPG18";
			_at = "CUP_launch_RPG7V_PGO7V3";
			_mag_at1 = "CUP_PG7VR_M";
			_mag_at2 = "CUP_OG7_M";
			_mag_at3 = "CUP_TBG7V_M";
			_hat = "CUP_launch_RPG7V_PGO7V3";
			_mag_hat = "CUP_PG7VL_M";
		};	
	};
	//RUS2015
	case 7 : {
		_gre = "rhs_mag_rgd5";
		_mag1 = "rhs_30Rnd_545x39_AK";
		_mag2 = "rhs_10Rnd_762x54mmR_7N1";
		_mag_ar = "rhs_100Rnd_762x54mmR_green";
		_mag_mg = "rhs_100Rnd_762x54mmR_green";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_rpg26";
			_at = "rhs_weap_rpg7_pgo";
			_mag_at1 = "rhs_rpg7_PG7VR_mag";
			_mag_at2 = "rhs_rpg7_OG7V_mag";
			_mag_at3 = "rhs_rpg7_TBG7V_mag";
			_hat = "rhs_weap_rpg7_pgo";
			_mag_hat = "rhs_rpg7_PG7VL_mag";
		} else {
			_lat = "CUP_launch_RPG18";
			_at = "CUP_launch_RPG7V_PGO7V3";
			_mag_at1 = "CUP_PG7VR_M";
			_mag_at2 = "CUP_OG7_M";
			_mag_at3 = "CUP_TBG7V_M";
			_hat = "CUP_launch_RPG7V_PGO7V3";
			_mag_hat = "CUP_PG7VL_M";
		};
	};
	//RUSF
	case 8 : {
		_gre = "rhs_mag_rgd5";
		_mag1 = "rhs_30Rnd_545x39_7N22_AK";
		_mag2 = "rhs_10Rnd_762x54mmR_7N14";
		_mag_ar = "rhs_45Rnd_545X39_7N22_AK";
		_mag_mg = "rhs_100Rnd_762x54mmR_7N26";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_rpg26";
			_at = "rhs_weap_rpg7_pgo";
			_mag_at1 = "rhs_rpg7_PG7VR_mag";
			_mag_at2 = "rhs_rpg7_OG7V_mag";
			_mag_at3 = "rhs_rpg7_TBG7V_mag";
			_hat = "rhs_weap_rpg7_pgo";
			_mag_hat = "rhs_rpg7_PG7VL_mag";
		} else {
			_lat = "CUP_launch_RPG18";
			_at = "CUP_launch_RPG7V_PGO7V3";
			_mag_at1 = "CUP_PG7VR_M";
			_mag_at2 = "CUP_OG7_M";
			_mag_at3 = "CUP_TBG7V_M";
			_hat = "CUP_launch_RPG7V_PGO7V3";
			_mag_hat = "CUP_PG7VL_M";
		};
	};
	//KSK
	case 9 : {
		_gre = "HandGrenade";
		_mag1 = "CUP_30Rnd_556x45_G36";
		_mag2 = "rhsusf_20Rnd_762x51_m118_special_Mag";
		_mag_ar = "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag";
		_mag_mg = "rhsusf_100Rnd_762x51_m62_tracer";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_M136";
			_at = "rhs_weap_maaws_optic";
			_mag_at1 = "rhs_mag_maaws_HEAT";
			_mag_at2 = "rhs_mag_maaws_HEDP";
			_mag_at3 = "rhs_mag_maaws_HEAT";
			_hat = "rhs_weap_fgm148";
			_mag_hat = "rhs_fgm148_magazine_AT";
		} else {
			_lat = "CUP_launch_M136";
			_at = "CUP_launch_MAAWS_Scope";
			_mag_at1 = "CUP_MAAWS_HEAT_M";
			_mag_at2 = "CUP_MAAWS_HEDP_M";
			_mag_at3 = "CUP_MAAWS_HEAT_M";
			_hat = "CUP_launch_Javelin";
			_mag_hat = "CUP_Javelin_M";
		};
	};
	//BAF
	case 10 : {
		_gre = "CUP_HandGrenade_L109A1_HE";
		_mag1 = "30Rnd_556x45_Stanag";
		_mag2 = "20Rnd_762x51_Mag";
		_mag_ar = "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";
		_mag_mg = "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_M136";
			_at = "rhs_weap_maaws_optic";
			_mag_at1 = "rhs_mag_maaws_HEAT";
			_mag_at2 = "rhs_mag_maaws_HEDP";
			_mag_at3 = "rhs_mag_maaws_HEAT";
			_hat = "rhs_weap_fgm148";
			_mag_hat = "rhs_fgm148_magazine_AT";
		} else {
			_lat = "CUP_launch_NLAW";
			_at = "CUP_launch_MAAWS_Scope";
			_mag_at1 = "CUP_MAAWS_HEAT_M";
			_mag_at2 = "CUP_MAAWS_HEDP_M";
			_mag_at3 = "CUP_MAAWS_HEAT_M";
			_hat = "CUP_launch_Javelin";
			_mag_hat = "CUP_Javelin_M";
		};
	};
	//RACS
	case 11 : {
		_gre = "HandGrenade";
		_mag1 = "30Rnd_556x45_Stanag";
		_mag2 = "20Rnd_762x51_Mag";
		_mag_ar = "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";
		_mag_mg = "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_m72a7";
			_at = "rhs_weap_maaws_optic";
			_mag_at1 = "rhs_mag_maaws_HEAT";
			_mag_at2 = "rhs_mag_maaws_HEDP";
			_mag_at3 = "rhs_mag_maaws_HEAT";
			_hat = "rhs_weap_fgm148";
			_mag_hat = "rhs_fgm148_magazine_AT";
		} else {
			_lat = "CUP_launch_M72A6";
			_at = "CUP_launch_MAAWS_Scope";
			_mag_at1 = "CUP_MAAWS_HEAT_M";
			_mag_at2 = "CUP_MAAWS_HEDP_M";
			_mag_at3 = "CUP_MAAWS_HEAT_M";
			_hat = "CUP_launch_Javelin";
			_mag_hat = "CUP_Javelin_M";
		};
	};
	//TAKI
	case 12 : {
		_gre = "CUP_HandGrenade_RGD5";
		_mag1 = "CUP_20Rnd_762x51_FNFAL_M";
		_mag2 = "30Rnd_556x45_Stanag";
		_mag_ar = "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";
		_mag_mg = "rhs_100Rnd_762x54mmR_green";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_rpg26";
			_at = "rhs_weap_rpg7_pgo";
			_mag_at1 = "rhs_rpg7_PG7VR_mag";
			_mag_at2 = "rhs_rpg7_OG7V_mag";
			_mag_at3 = "rhs_rpg7_TBG7V_mag";
			_hat = "rhs_weap_rpg7_pgo";
			_mag_hat = "rhs_rpg7_PG7VL_mag";
		} else {
			_lat = "CUP_launch_RPG18";
			_at = "CUP_launch_RPG7V_PGO7V3";
			_mag_at1 = "CUP_PG7VR_M";
			_mag_at2 = "CUP_OG7_M";
			_mag_at3 = "CUP_TBG7V_M";
			_hat = "CUP_launch_RPG7V_PGO7V3";
			_mag_hat = "CUP_PG7VL_M";
		};
	};
	//INS
	case 13 : {
		_gre = "CUP_HandGrenade_RGD5";
		_mag1 = "rhs_30Rnd_762x39mm";
		_mag2 = "rhsgref_10Rnd_792x57_m76";
		_mag_ar = "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";
		_mag_mg = "rhs_100Rnd_762x54mmR_green";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_rpg26";
			_at = "rhs_weap_rpg7_pgo";
			_mag_at1 = "rhs_rpg7_PG7VL_mag";
			_mag_at2 = "rhs_rpg7_OG7V_mag";
			_mag_at3 = "rhs_rpg7_OG7V_mag";
			_hat = "rhs_weap_rpg7_pgo";
			_mag_hat = "rhs_rpg7_PG7V_mag";
		} else {
			_lat = "CUP_launch_RPG18";
			_at = "CUP_launch_RPG7V_PGO7V3";
			_mag_at1 = "CUP_PG7VL_M";
			_mag_at2 = "CUP_OG7_M";
			_mag_at3 = "CUP_OG7_M";
			_hat = "CUP_launch_RPG7V_PGO7V3";
			_mag_hat = "CUP_PG7V_M";
		};	
	};
	//TakINS
	case 14 : {
		_gre = "CUP_HandGrenade_RGD5";
		_mag1 = "rhs_30Rnd_762x39mm";
		_mag2 = "CUP_10Rnd_762x54_SVD_M";
		_mag_ar = "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";
		_mag_mg = "rhs_100Rnd_762x54mmR_green";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_rpg26";
			_at = "rhs_weap_rpg7_pgo";
			_mag_at1 = "rhs_rpg7_PG7VL_mag";
			_mag_at2 = "rhs_rpg7_OG7V_mag";
			_mag_at3 = "rhs_rpg7_OG7V_mag";
			_hat = "rhs_weap_rpg7_pgo";
			_mag_hat = "rhs_rpg7_PG7V_mag";
		} else {
			_lat = "CUP_launch_RPG18";
			_at = "CUP_launch_RPG7V_PGO7V3";
			_mag_at1 = "CUP_PG7VL_M";
			_mag_at2 = "CUP_OG7_M";
			_mag_at3 = "CUP_OG7_M";
			_hat = "CUP_launch_RPG7V_PGO7V3";
			_mag_hat = "CUP_PG7V_M";
		};
	};
	//SAF
	case 15 : {
		_gre = "rhs_mag_rgd5";
		_mag1 = "rhsgref_30rnd_556x45_m21";
		_mag2 = "rhsgref_10Rnd_792x57_m76";
		_mag_ar = "rhs_200rnd_556x45_M_SAW";
		_mag_mg = "rhs_100Rnd_762x54mmR_green";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_m80";
			_at = "rhs_weap_rpg7_pgo";
			_mag_at1 = "rhs_rpg7_PG7VL_mag";
			_mag_at2 = "rhs_rpg7_OG7V_mag";
			_mag_at3 = "rhs_rpg7_PG7VL_mag";
			_hat = "rhs_weap_fgm148";
			_mag_hat = "CUP_Javelin_M";
		} else {
			_lat = "CUP_launch_M72A6";
			_at = "CUP_launch_RPG7V_PGO7V3";
			_mag_at1 = "CUP_PG7VL_M";
			_mag_at2 = "CUP_OG7_M";
			_mag_at3 = "CUP_PG7VL_M";
			_hat = "CUP_launch_M47";
			_mag_hat = "CUP_Dragon_EP1_M";
		};
	};
	//CDF
	case 16 : {
		_gre = "rhs_mag_rgd5";
		_mag1 = "rhs_30Rnd_762x39mm";
		_mag2 = "rhsgref_10Rnd_792x57_m76";
		_mag_ar = "rhs_100Rnd_762x54mmR_green";
		_mag_mg = "rhs_100Rnd_762x54mmR_green";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_rpg75";
			_at = "rhs_weap_rpg7_pgo";
			_mag_at1 = "rhs_rpg7_PG7VR_mag";
			_mag_at2 = "rhs_rpg7_OG7V_mag";
			_mag_at3 = "rhs_rpg7_TBG7V_mag";
			_hat = "rhs_weap_rpg7_pgo";
			_mag_hat = "rhs_rpg7_PG7VL_mag";
		} else {
			_lat = "CUP_launch_RPG18";
			_at = "CUP_launch_RPG7V_PGO7V3";
			_mag_at1 = "CUP_PG7VR_M";
			_mag_at2 = "CUP_OG7_M";
			_mag_at3 = "CUP_TBG7V_M";
			_hat = "CUP_launch_RPG7V_PGO7V3";
			_mag_hat = "CUP_PG7VL_M";
		};
	};
	//PMC
	case 17 : {
		_gre = "CUP_HandGrenade_M67";
		_mag1 = "rhs_mag_30Rnd_556x45_Mk318_Stanag";
		_mag2 = "rhsusf_20Rnd_762x51_m118_special_Mag";
		_mag_ar = "rhs_200rnd_556x45_M_SAW";
		_mag_mg = "rhsusf_50Rnd_762x51";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_M136";
			_at = "rhs_weap_smaw_gr_optic";
			_mag_at1 = "rhs_mag_smaw_HEAA";
			_mag_at2 = "rhs_mag_smaw_HEDP";
			_mag_at3 = "rhs_mag_smaw_SR";
			_hat = "rhs_weap_fgm148";
			_mag_hat = "rhs_fgm148_magazine_AT";
		} else {
			_lat = "CUP_launch_M136";
			_at = "CUP_launch_Mk153Mod0_SMAWOptics";
			_mag_at1 = "CUP_SMAW_HEAA_M";
			_mag_at2 = "CUP_SMAW_HEDP_M";
			_mag_at3 = "CUP_SMAW_Spotting";
			_hat = "CUP_launch_Javelin";
			_mag_hat = "CUP_Javelin_M";
		};
	};
	//FR
	case 18 : {
		_gre = "HandGrenade";
		_mag1 = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
		_mag2 = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";
		_mag_ar = "rhs_200rnd_556x45_M_SAW";
		_mag_mg = "rhsusf_100Rnd_762x51_m62_tracer";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_M136";
			_at = "rhs_weap_smaw_gr_optic";
			_mag_at1 = "rhs_mag_smaw_HEAA";
			_mag_at2 = "rhs_mag_smaw_HEDP";
			_mag_at3 = "rhs_mag_smaw_SR";
			_hat = "rhs_weap_fgm148";
			_mag_hat = "rhs_fgm148_magazine_AT";
		} else {
			_lat = "CUP_launch_M136";
			_at = "CUP_launch_Mk153Mod0_SMAWOptics";
			_mag_at1 = "CUP_SMAW_HEAA_M";
			_mag_at2 = "CUP_SMAW_HEDP_M";
			_mag_at3 = "CUP_SMAW_Spotting";
			_hat = "CUP_launch_M47";
			_mag_hat = "CUP_Dragon_EP1_M";
		};	
	};
	// armée occident
	case 19 : {
		_gre = "HandGrenade";
		_mag1 = "rhsgref_30rnd_556x45_vhs2";
		_mag2 = "rhsgref_30rnd_556x45_vhs2_t";
		_mag_ar = "rhs_200rnd_556x45_M_SAW";
		_mag_mg = "rhsusf_100Rnd_762x51_m62_tracer";
		if (cc_rhsennemy) then {
			_lat = "rhs_weap_m72a7";
			_at = "rhs_weap_smaw_gr_optic";
			_mag_at1 = "rhs_mag_smaw_HEAA";
			_mag_at2 = "rhs_mag_smaw_HEDP";
			_mag_at3 = "rhs_mag_smaw_SR";
			_hat = "rhs_weap_fgm148";
			_mag_hat = "rhs_fgm148_magazine_AT";
		} else {
			_lat = "CUP_launch_M72A6";
			_at = "CUP_launch_Mk153Mod0_SMAWOptics";
			_mag_at1 = "CUP_SMAW_HEAA_M";
			_mag_at2 = "CUP_SMAW_HEDP_M";
			_mag_at3 = "CUP_SMAW_Spotting";
			_hat = "CUP_launch_Javelin";
			_mag_hat = "CUP_Javelin_M";
		};
	};
};

clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearItemCargoGlobal _veh;
clearBackpackCargoGlobal _veh;

///Weapons///
_veh addWeaponCargoGlobal ["Laserdesignator", 1];
_veh addWeaponCargoGlobal ["Binocular", 3];
_veh addWeaponCargoGlobal ["ACE_Vector", 3];
_veh addWeaponCargoGlobal [_lat, 3];
_veh addWeaponCargoGlobal [_at, 1];
_veh addWeaponCargoGlobal [_hat, 1];

///AMMO///
_veh addMagazineCargoGlobal ["smokeshell", 10];
_veh addMagazineCargoGlobal ["smokeshellBlue", 10];
_veh addMagazineCargoGlobal ["ACE_HandFlare_Red", 10];
_veh addMagazineCargoGlobal ["ACE_HandFlare_Green", 10];
_veh addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 1];
_veh addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 2];
_veh addMagazineCargoGlobal ["Laserbatteries", 1];
_veh addMagazineCargoGlobal ["Laserbatteries", 1];
_veh addMagazineCargoGlobal ["Laserbatteries", 1];
_veh addMagazineCargoGlobal [_gre, 10];
_veh addMagazineCargoGlobal [_mag1, 10];
_veh addMagazineCargoGlobal [_mag2, 10];
_veh addMagazineCargoGlobal [_mag_ar, 5];
_veh addMagazineCargoGlobal [_mag_mg, 5];
_veh addMagazineCargoGlobal [_mag_at1, 2];
_veh addMagazineCargoGlobal [_mag_at2, 2];
_veh addMagazineCargoGlobal [_mag_at3, 1];
_veh addMagazineCargoGlobal [_mag_hat, 5];

///Else///
_veh addItemCargoGlobal ["ACE_EntrenchingTool",4];
_veh addItemCargoGlobal ["ACE_microDAGR",4];
_veh addItemCargoGlobal ["ACE_wirecutter",1];
_veh addItemCargoGlobal ["ACE_DefusalKit",1];
_veh addItemCargoGlobal ["ACE_M26_Clacker",1];
_veh addItemCargoGlobal ["ACRE_PRC117F",2];
_veh addItemCargoGlobal ["ACRE_PRC148",4];
_veh addItemCargoGlobal ["ACE_EntrenchingTool",2];
_veh addItemCargoGlobal ["ACE_EntrenchingTool",2];

///Backpack///
_veh addBackpackCargoGlobal ["B_Carryall_khk",1];
_veh addBackpackCargoGlobal ["B_Carryall_cbr",1];
_veh addBackpackCargoGlobal ["B_Carryall_oli",1];
_veh addBackpackCargoGlobal ["B_AssaultPack_rgr",1];
_veh addBackpackCargoGlobal ["B_Kitbag_rgr",1];
_veh addBackpackCargoGlobal ["B_rhsusf_B_BACKPACK",1];

