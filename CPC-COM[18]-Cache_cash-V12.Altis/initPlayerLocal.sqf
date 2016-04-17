/*-----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
***	Author: Hardballer

***	Description: 
	client init

*** En plus, pour visualiser l'inventaire sur les IA dans l'inventaires, à coller à la fin de ce fichier :

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

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	1) PARAM
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

playerUnit = _this select 0;	// unité du joueur (sélectionnée dans l'écran des slots)
playerIsJIP = _this select 1;	// boolean (true ou false). True = le joueur se connecte en cours de partie.
enableSaving [false, false]; // supprime la sauvegarde

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	2) CALL / COMPILE
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
switch (paramsArray select 5) do {
	case 0 : {call compile preprocessFileLineNumbers "loadout\loadout_US_RHS.sqf";};
	case 1 : {call compile preprocessFileLineNumbers "loadout\loadout_US_CUP.sqf";};
	case 2 : {call compile preprocessFileLineNumbers "loadout\loadout_RU_RHS.sqf";};
	case 3 : {call compile preprocessFileLineNumbers "loadout\loadout_RU_CUP.sqf";};
	case 4 : {call compile preprocessFileLineNumbers "loadout\loadout_INS_RHS.sqf";};
	case 5 : {call compile preprocessFileLineNumbers "loadout\loadout_INS_CUP.sqf";};
	case 6 : {call compile preprocessFileLineNumbers "loadout\loadout_TAKINS_RHS.sqf";};
	case 7 : {call compile preprocessFileLineNumbers "loadout\loadout_TAKINS_CUP.sqf";};
	case 8 : {call compile preprocessFileLineNumbers "loadout\loadout_TAK_RHS.sqf";};
	case 9 : {call compile preprocessFileLineNumbers "loadout\loadout_TAK_CUP.sqf";};
	case 10 : {call compile preprocessFileLineNumbers "loadout\loadout_GER_RHS.sqf";};
	case 11 : {call compile preprocessFileLineNumbers "loadout\loadout_GER_CUP.sqf";};
	case 12 : {call compile preprocessFileLineNumbers "loadout\loadout_NATO.sqf";};
	case 13 : {call compile preprocessFileLineNumbers "loadout\loadout_CSAT.sqf";};
	case 14 : {call compile preprocessFileLineNumbers "loadout\loadout_AAF.sqf";};
	case 15 : {call compile preprocessFileLineNumbers "loadout\loadout_GFD.sqf";};
	case 16 : {call compile preprocessFileLineNumbers "loadout\loadout_NPFD.sqf";};
	case 17 : {call compile preprocessFileLineNumbers "loadout\loadout_RACS.sqf";};
	case 18 : {call compile preprocessFileLineNumbers "loadout\loadout_SLA.sqf";};
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


[] execVM "inventory_briefing.sqf"; // lancement du script qui affiche le loadout lors du briefing.
/*
waitUntil {time > 1};
call compile preprocessFileLineNumbers "loadout.sqf"; 
[player] call hard_setLoadout;
player setVariable ["loadout_done", true, true];
*/