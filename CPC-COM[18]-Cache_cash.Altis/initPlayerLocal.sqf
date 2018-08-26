// Variables liées au paramètres de la mission
CC_p_time = (paramsArray select 0);
CC_p_insertion = (paramsArray select 1);
CC_p_difficulty = (paramsArray select 2);
CC_p_nvg = (paramsArray select 3);
CC_p_skillia = (paramsArray select 4);
CC_p_loaout = (paramsArray select 5);
CC_p_ennemy = (paramsArray select 6);
CC_p_extraction = (paramsArray select 7);
CC_p_vehicle1 = (paramsArray select 8);
CC_p_vehicle2 = (paramsArray select 9);
CC_p_vehicle3 = (paramsArray select 10);
CC_p_overcast = (paramsArray select 11);
CC_p_fog = (paramsArray select 12);
CC_p_ennemyveh = (paramsArray select 13);
CC_p_fullmoon = (paramsArray select 14);
CC_p_ammocrate = (paramsArray select 15);

// Variables pour les loadouts
playerUnit = _this select 0;	// unité du joueur (sélectionnée dans l'écran des slots)
playerIsJIP = _this select 1;	// boolean (true ou false). True = le joueur se connecte en cours de partie.
cc_rhsennemy = false;
if (CC_p_ennemy in [0,2,14,17,18,19,100,106,108,109]) then {cc_rhsennemy = true};
cc_loadoutcamo = "polyvalent";
switch (toLower worldName) do {
	case "altis" : {cc_loadoutcamo = "polyvalent"};
	case "sara" : {cc_loadoutcamo = "polyvalent"};
	case "chernarus" : {cc_loadoutcamo = "woodland"};
	case "chernarus_summer" : {cc_loadoutcamo = "woodland"};
	case "fdf_isle1_a" : {cc_loadoutcamo = "woodland"}; // Podagorsk
	case "woodland_acr" : {cc_loadoutcamo = "woodland"}; // Bystrica
	case "noe" : {cc_loadoutcamo = "woodland"}; // Nogova
	case "eden" : {cc_loadoutcamo = "woodland"}; // Everon
	case "takistan" : {cc_loadoutcamo = "desert"};
	case "pja307" : {cc_loadoutcamo = "desert"}; // dariyah
	case "isladuala3" : {cc_loadoutcamo = "desert"};
	case "tanoa" : {cc_loadoutcamo = "jungle"};
	case "pja305" : {cc_loadoutcamo = "jungle"}; // Nazigogo
	default {cc_loadoutcamo = "polyvalent"};
};

waitUntil {CPC_MarkersCreated};
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	2) CALL / COMPILE
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

switch (CC_p_loaout) do {
	case 0 : {call compile preprocessFileLineNumbers "loadout\loadout_NATO.sqf";};
	case 1 : {call compile preprocessFileLineNumbers "loadout\loadout_CSAT.sqf";};
	case 2 : {call compile preprocessFileLineNumbers "loadout\loadout_AAF.sqf";};
	case 3 : {call compile preprocessFileLineNumbers "loadout\loadout_USArmy_RHS.sqf";};
	case 4 : {call compile preprocessFileLineNumbers "loadout\loadout_USMC_RHS.sqf";};
	case 5 : {call compile preprocessFileLineNumbers "loadout\loadout_USsf_RHS.sqf";};
	case 6 : {call compile preprocessFileLineNumbers "loadout\loadout_RU2000_RHS.sqf";};
	case 7 : {call compile preprocessFileLineNumbers "loadout\loadout_RU2015_RHS.sqf";};
	case 8 : {call compile preprocessFileLineNumbers "loadout\loadout_RUsf.sqf";};
	case 9 : {call compile preprocessFileLineNumbers "loadout\loadout_KSK.sqf";};
	case 10 : {call compile preprocessFileLineNumbers "loadout\loadout_BAF.sqf";};
	case 11 : {call compile preprocessFileLineNumbers "loadout\loadout_RACS.sqf";};
	case 12 : {call compile preprocessFileLineNumbers "loadout\loadout_TAK.sqf";};
	case 13 : {call compile preprocessFileLineNumbers "loadout\loadout_INS.sqf";};
	case 14 : {call compile preprocessFileLineNumbers "loadout\loadout_TAK_INS.sqf";};
	case 15 : {call compile preprocessFileLineNumbers "loadout\loadout_SAF.sqf";};
	case 16 : {call compile preprocessFileLineNumbers "loadout\loadout_CDF.sqf";};
	case 17 : {call compile preprocessFileLineNumbers "loadout\loadout_PMC.sqf";};
	case 18 : {call compile preprocessFileLineNumbers "loadout\loadout_FR.sqf";};
	case 19 : {call compile preprocessFileLineNumbers "loadout\loadout_occident.sqf";};
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	3) LOADOUT
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if !(isNil {playerUnit getVariable "loadout"}) then // La variable loadout doit être placer dans l'éditeur [init de l'unité] => this setVariable ["loadout", "aaf_sl"];
{
	if (isNil {playerUnit getVariable "loadout_done"}) then // loadout_done inexistant, on lance la function loadout
	{
		[playerUnit] call hard_setLoadout;
		playerUnit setVariable ["loadout_done", true, true]; // loadout_done permet de vérifier si le loadout a été fait afin d'éviter les doublons en cas de déco / reco.
	};
};

playerUnit action ["WeaponOnBack", playerUnit]; // pour que le joueur ait l'arme baissée


if !(isMultiplayer) then
{
	{
		if !(isNil {_x getVariable "loadout"}) then 
		{
			if (isNil {_x getVariable "loadout_done"}) then 
			{
				[_x] call hard_setLoadout;
				_x setVariable ["loadout_done", true, true];
			};
		};
	} foreach allUnits;
};


execVM "briefing.sqf";
[] call GDC_fnc_inventoryBriefing; // lancement du script qui affiche le loadout lors du briefing.
[] call GDC_fnc_rosterBriefing; // lancement du script qui affiche le roster lors du briefing.

player allowdamage false;

waitUntil {time > 1};
if ((uniform playerUnit) == "") then {
[playerUnit] call hard_setLoadout;
playerUnit setVariable ["loadout_done", true, true];
playerUnit action ["WeaponOnBack", playerUnit];
};

waitUntil {time > 10};
player allowdamage true;