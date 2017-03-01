/*
	Script d'insertion terrestre choisie par clic sur map
*/

if (didJIP) exitwith {};

private ["_unitArray"];

if (rank player == "SERGEANT") then {
	onMapSingleClick "
		if !(_pos inArea 'Mark_cible') then {'Mark_inser' setmarkerPos _pos;};
	";
};

if (!isMultiplayer) then {
	_unitArray = SlotPlayers;
} else {
	_unitArray = PlayableUnits;
};

waituntil {time > 0};
onMapSingleClick "";

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
