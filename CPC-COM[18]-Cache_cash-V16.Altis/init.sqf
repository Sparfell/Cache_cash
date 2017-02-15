if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};

// définition manuelle des paramètres pour le débug
if (isNil "paramsArray") then {
	paramsArray = [
		12,		//Heure
		0,		//Insertion
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
		0		//Moon
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
null = [] execVM "briefing.sqf";
null = [] execVM "scripts\Spawn_IA.sqf";
null = [2,true,true] execVM "roster.sqf";
switch (paramsArray select 1) do {
	case 0 : {null = [] execVM "scripts\insert_random.sqf";};
	case 1 : {null = [] execVM "scripts\insert_choose.sqf";};
	case 2 : {null = [] execVM "scripts\insert_base.sqf";};
	case 3 : {null = [] execVM "scripts\insert_helico.sqf";};
	case 4 : {null = [] execVM "scripts\insert_para.sqf";};
	case 5 : {null = [] execVM "scripts\insert_halo.sqf";};
};
if ((paramsArray select 7) == 3) then {
	null = ["ACRE_PRC148",5,blufor,"",[0,0,0]] execVM "CPC_EXTRA\call_extra.sqf";
};



finishMissionInit;

waitUntil {time > 0};

//METEO
null = [] execVM "scripts\meteo.sqf";

//SPAWN aléatoire



