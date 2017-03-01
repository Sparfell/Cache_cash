/*
	Script d'insertion terrestre aléatoire
*/

if (didJIP) exitwith {};

private ["_pos","_unitArray"];

if (isServer) then {
	_pos = [(markerpos "Mark_Cible"),1750,random 360,0] call SHK_pos;
	"Mark_inser" setmarkerpos _pos;
};
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