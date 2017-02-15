/*
	Script d'insertion sur la base aérienne de la map (donne accès à des hélicos de transport
*/

if (didJIP) exitwith {};

private ["_unitArray"];

if (!isMultiplayer) then {
	_unitArray = SlotPlayers;
} else {
	_unitArray = PlayableUnits;
};

waitUntil {time > 0};

if (hasInterface) then {
	player setpos [(markerpos "mark_inser" select 0) + (random 30) -15,(markerpos "mark_inser" select 1)+ (random 30) -15,1.5];
};

if (isServer) then {
	{
		if !(isPlayer _x) then {
			_x setpos [(markerpos "mark_inser" select 0) + (random 30) -15,(markerpos "mark_inser" select 1)+ (random 30) -15,1.5];
		};
	} foreach _unitArray;
};