if (player in [p1,p2,p9,p16]) then {
	onMapSingleClick "
		'Mark_inser' setmarkerPos _pos;
	";
};


waituntil {time > 0};
onMapSingleClick "";
if (Time > 60) exitWith {};
if (hasInterface) then {
	_dir = [[getMarkerPos "Mark_Inser" select 0,getMarkerPos "Mark_Inser" select 1,0],[getMarkerPos "2" select 0,getMarkerPos "2" select 1,0]] call BIS_fnc_dirTo;
	_dir = _dir +90;
	_i = 100;
	{
		_i = _i - 15;
		if (player == _x) then {
			_para = "Steerable_Parachute_F" createVehicle [0,0,0];
			_para setpos [(getMarkerPos "Mark_Inser" select 0) + (_i* sin _dir) + (random 3),(getMarkerPos "Mark_Inser" select 1)+ (_i* cos _dir) + (random 3),200];
			_x moveInAny _para;
		};
	} foreach SlotPlayers;
};


if (isServer) then {
	_dir = [[getMarkerPos "Mark_Inser" select 0,getMarkerPos "Mark_Inser" select 1,0],[getMarkerPos "2" select 0,getMarkerPos "2" select 1,0]] call BIS_fnc_dirTo;
	_dir = _dir +90;
	_i = 100;
	{
		_i = _i - 15;
		if (!(isPlayer _x)) then {
			_para = "Steerable_Parachute_F" createVehicle [0,0,0];
			_para setpos [(getMarkerPos "Mark_Inser" select 0) + (_i* sin _dir)+ (random 3),(getMarkerPos "Mark_Inser" select 1)+ (_i* cos _dir)+ (random 3),200];
			_x moveInAny _para;
		};
	} foreach playableUnits;
};
