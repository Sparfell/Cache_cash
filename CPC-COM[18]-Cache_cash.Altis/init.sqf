
if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};

// définition manuelle des paramètres pour le débug
if (isNil "paramsArray") then {
	paramsArray = [
		12,		//Heure
		1,		//Insertion
		1,		//Difficulté
		0,		//NVG
		1,		//Skill
		3,		//Faction
		100,	//Faction IA
		1,		//extraction
		0,		//Véhicule 1
		0,		//Véhicule 2
		0,		//Véhicule 3
		1,		//météo
		0,		//brouillard
		0,		//ennemyveh
		0,		//Moon
		0		//Caisse
	];
};

// déterminer la localité pour faire pop les IAs(HC ou éditeur)
MODE_EDITEUR = false;
MODE_HC = false;
if !(isMultiplayer) then {
	MODE_EDITEUR = true;
} else {
if !(hasInterface or isServer) then {
	MODE_HC = true;
};
};

waitUntil {CPC_MarkersCreated};

// DATE POUR LA LUNE
if (isServer) then {
	if ((paramsArray select 14) == 1) then {setDate CPC_FullMoon;};
	skipTime (paramsArray select 0);
};

//METEO
null = [] execVM "scripts\meteo.sqf";

/*VARIABLES MISSION*/
CPC_CC_Insertion_OK = false;
SlotPlayers = [P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,P21,P22,P23,P24,P25,P26,P27,P28,P29,P30,P31,P32,P33];

/*SCRIPTS*/
null = [] execVM "scripts\Spawn_IA.sqf";
switch (paramsArray select 1) do {
	case 0 : {null = [] execVM "scripts\insert_random.sqf";};
	case 1 : {null = [] execVM "scripts\insert_choose.sqf";};
	case 2 : {null = [] execVM "scripts\insert_base.sqf";};
	case 3 : {null = [] execVM "scripts\insert_helico.sqf";};
	case 4 : {null = [] execVM "scripts\insert_para.sqf";};
	case 5 : {null = [] execVM "scripts\insert_halo.sqf";};
};
if ((paramsArray select 7) == 3) then {
	_type = "RHS_CH_47F";
	switch (paramsArray select 5) do {
			case 0 : {_type = "B_Heli_Transport_03_unarmed_F";}; // NATO
			case 1 : {_type = "O_Heli_Transport_04_covered_F";}; // CSAT
			case 2 : {_type = "I_Heli_Transport_02_F";}; // AAF
			case 3 : {_type = "RHS_CH_47F";}; // US Army RHS
			case 4 : {_type = "RHS_CH_47F";}; // USMC RHS
			case 5 : {_type = "RHS_CH_47F";}; // US SF RHS
			case 6 : {_type = "RHS_Mi8AMT_vvsc";}; // RU 2000
			case 7 : {_type = "RHS_Mi8AMT_vvsc";}; // RU 2015
			case 8 : {_type = "RHS_Mi8AMT_vvsc";}; // RU SF
			case 9 : {_type = "CUP_B_CH53E_GER";}; // KSK
			case 10 : {_type = "CUP_B_Merlin_HC3_GB";}; // BAF
			case 11 : {_type = "CUP_I_SA330_Puma_HC1_RACS";}; // RACS
			case 12 : {_type = "CUP_O_Mi17_TK";}; // TAK
			case 13 : {_type = "rhsgref_ins_Mi8amt";}; // INS
			case 14 : {_type = "CUP_C_Mi17_Civilian_RU";}; // TAK INS
			case 15 : {_type = "rhssaf_airforce_ht48";}; // SAF
			case 16 : {_type = "rhsgref_cdf_b_reg_Mi8amt";}; // CDF
			case 17 : {_type = "MU_MERC_Mohawk";}; // PMC
			case 18 : {_type = "CUP_B_SA330_Puma_HC2_BAF";}; // FR
	};
	["ACRE_PRC148",5,blufor,_type,"Mark_Cible",true] call GDC_fnc_extra;
};

finishMissionInit;
waitUntil {time > 0};

//METEO
null = [] execVM "scripts\meteo.sqf";
