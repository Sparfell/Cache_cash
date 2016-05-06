if (player in [p1,p2,p9,p16]) then {
	onMapSingleClick "
		if !(_pos inArea 'Mark_cible') then {'Mark_inser' setmarkerPos _pos;};
	";
};


waituntil {time > 0};
onMapSingleClick "";
if (Time > 60) exitWith {};
if (hasInterface) then {
	player setpos [(markerpos "mark_inser" select 0) + (random 30) -15,(markerpos "mark_inser" select 1)+ (random 30) -15,1.5];
};

if (isServer) then {
	{
	if !(isPlayer _x) then {
	_x setpos [(markerpos "mark_inser" select 0) + (random 30) -15,(markerpos "mark_inser" select 1)+ (random 30) -15,1.5];
	};
	} foreach SlotPlayers;
};
