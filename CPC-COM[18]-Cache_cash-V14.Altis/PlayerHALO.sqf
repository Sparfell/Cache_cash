if (player in [p1,p2,p9,p16]) then {
	onMapSingleClick "
		'Mark_inser' setmarkerPos _pos;
	";
};


waituntil {time > 0};
onMapSingleClick "";

if (isserver) then {

	jump_pos = (getmarkerPos "Mark_Cible");
	//Récupération du marqueur "JUMP"
	_markerName = "JUMP";
	waitUntil {time > 1};
	{
		_text = markerText _x;
		if(_text isEqualTo _markerName) then 
		{
			jump_pos = markerPos _x;
		};
	} forEach allMapMarkers;


	// Création de l'avion sur le point d'insertion
	_veh = createVehicle ["RHS_C130J", (getmarkerPos "Mark_inser"), [], 0, "FLY"];
	createVehicleCrew vehicle _veh;
	_veh flyInHeightASL [8000,8000,8000];
	group_avion_HALO = createGroup civilian;
	publicVariable "group_avion_HALO";
	[_veh] joinSilent group_avion_HALO;
	{_x disableAI "AUTOTARGET";_x disableAI "AUTOCOMBAT";[_x] joinSilent group_avion_HALO;} foreach (crew _veh);
	_veh setposASL [((getmarkerPos "Mark_inser") select 0),((getmarkerPos "Mark_inser") select 1),8000];
	_dir = (getmarkerPos "Mark_inser") getDir jump_pos;
	_veh setdir _dir;
	"Mark_inser" setMarkerDir _dir;
	_veh setvelocity [100,0,0];

	sleep 0.5;

	// Création du WP de HALO
	jump_pos = [(jump_pos select 0),(jump_pos select 1),8000];

	_veh_wp1 = group_avion_HALO addWaypoint [jump_pos, 0];
	_veh_wp1 setWaypointType "MOVE";
	_veh_wp1 setWaypointBehaviour "SAFE";
	_veh_wp1 setWaypointCombatMode "BLUE";
	_veh_wp1 setWaypointStatements ["true", "null = [this] execVM ""infParadropHALO.sqf"";"];

	sleep 0.5;

	// Déplacement des joueurs dans l'avion.
	_IndexNumber = 1;
	{_x assignAsCargoIndex [_veh, _IndexNumber]; [_x,[_veh,_IndexNumber]] remoteExecCall ["moveInCargo",_x]; _veh; _IndexNumber = _IndexNumber + 1; sleep 0.1;} forEach playableUnits;
	//{_x assignAsCargoIndex [_veh, _IndexNumber]; [_x,[_veh,_IndexNumber]] remoteExecCall ["moveInCargo",_x]; _veh; _IndexNumber = _IndexNumber + 1; sleep 0.1;} forEach [P1,P2,P3,P4];
	
	// On attend que l'avion soit à 300m de la DZ pour lui assigner son 2e WP
	waitUntil {((getpos _veh) distance jump_pos) < 2000};
	_veh animateDoor ["ramp",1];
	
	_veh_wp2 = group_avion_HALO addWaypoint [(_veh getRelPos [6000, 0]), 0];
	_veh_wp2 setWaypointType "MOVE";
	_veh_wp2 setWaypointStatements ["true", "{ deleteVehicle (vehicle _x); deleteVehicle _x; } forEach units group this;"];

}
else
{
	_myloadout = getUnitLoadout player;
	removeBackpack player;
	player addbackpack "B_Parachute";
	sleep 5;
	waitUntil {(getposATL player select 2) < 2};
	removeBackpack player;
	player setUnitLoadout _myloadout;
	
};