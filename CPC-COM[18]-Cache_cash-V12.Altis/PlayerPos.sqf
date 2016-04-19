if (player in [p1,p2,p9,p16]) then {
	onMapSingleClick "
		if !(['Mark_cible_1',_pos] call BIS_fnc_inTrigger) then {'Mark_inser' setmarkerPos _pos;};
	";
};


waituntil {time > 0};
onMapSingleClick "";
if (time > 60) exitWith {};
if (hasInterface) then {player setposATL [(markerpos "mark_inser" select 0) + (random 30) -15,(markerpos "mark_inser" select 1)+ (random 30) -15,1.5];};

if (isServer) then {
	{
	if !(isPlayer _x) then {
		_x setposATL [(markerpos "mark_inser" select 0) + (random 30) -15,(markerpos "mark_inser" select 1)+ (random 30) -15,1.5];
	};
	} foreach SlotPlayers;
};
