if (player in [p1,p2,p14,p26,P29,P31,P32,P33]) then {
	onMapSingleClick "
		if !(_pos inArea 'Mark_cible') then {'Mark_inser' setmarkerPos _pos;};
	";
};


waituntil {time > 0};
onMapSingleClick "";
if (CPC_CC_Insertion_OK) exitWith {};
if (hasInterface) then {
	player setpos [(markerpos "mark_inser" select 0) + (random 30) -15,(markerpos "mark_inser" select 1)+ (random 30) -15,1.5];
	CPC_CC_Insertion_OK = true;
};

if (isServer) then {
	{
	if !(isPlayer _x) then {
	_x setpos [(markerpos "mark_inser" select 0) + (random 30) -15,(markerpos "mark_inser" select 1)+ (random 30) -15,1.5];
	};
	} foreach SlotPlayers;
	CPC_CC_Insertion_OK = true;
};
