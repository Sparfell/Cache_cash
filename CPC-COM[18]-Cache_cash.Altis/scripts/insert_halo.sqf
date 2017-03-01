/*
	Script d'insertion HALO
*/

if (didJIP) exitwith {};

private["_pos","_wp","_group","_dir","_unitArray","_veh","_IndexNumber","_mybackpack","_mybackpackcontent","_myitems"];

if (rank player == "SERGEANT") then {
	onMapSingleClick "
		'Mark_inser' setmarkerPos _pos;
	";
};

waituntil {time > 0};
onMapSingleClick "";

if (isserver) then {
	
	// Création des positions nécessaires
	_dir = (getmarkerPos "Mark_Cible") getDir (getmarkerPos "Mark_inser");
	_veh = "Land_HelipadEmpty_F" createVehicle (getmarkerPos "Mark_inser");
	_pos = _veh getRelPos [10000, _dir];
	deleteVehicle _veh;
	
	//Récupération du marqueur "AVION" si présent
	{
		if (((markerPos _x) distance2D (markerPos "Mark_inser")) > 5000) then 
		{
			_pos = markerPos _x;
		};
	} forEach (allMapMarkers select {(markerText _x) isEqualTo "AVION"});
	
	// Création de l'avion sur le point d'insertion
	_veh = createVehicle ["RHS_C130J",_pos,[],0,"FLY"];
	createVehicleCrew vehicle _veh;
	_veh flyInHeightASL [8000,8000,8000];
	_group = createGroup civilian;
	[_veh] joinSilent _group;
	{_x disableAI "AUTOTARGET";_x disableAI "AUTOCOMBAT";[_x] joinSilent _group;} foreach (crew _veh);
	_veh setposASL [(_pos select 0),(_pos select 1),8000];
	_dir = (getPos _veh) getDir (getmarkerPos "Mark_inser");
	_veh setdir _dir;
	"Mark_inser" setMarkerDir _dir;
	_veh setvelocity [100,0,0];
	// Allumage des lampes intérieures
	_veh animateSource ["cargolights_hide",1];
	(_veh turretUnit [0]) action ["searchlightOn",  _veh];
	
	sleep 0.5;

	// Création du WP de HALO
	_pos = (getmarkerPos "Mark_inser");
	_pos = [(_pos select 0),(_pos select 1),8000];

	_wp = _group addWaypoint [_pos, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointCombatMode "BLUE";
	_wp setWaypointStatements ["true", "null = [this] execVM ""scripts\insert_halo_eject.sqf"";"];

	sleep 0.5;

	// Déplacement des joueurs dans l'avion.
	if (!isMultiplayer) then {
		_unitArray = SlotPlayers;
	} else {
		_unitArray = PlayableUnits;
	};
	_IndexNumber = 1;
	{
		_x assignAsCargoIndex [_veh, _IndexNumber];
		[_x,[_veh,_IndexNumber]] remoteExecCall ["moveInCargo",_x];
		_IndexNumber = _IndexNumber + 1;
		sleep 0.1;
	} forEach _unitArray;
	
	// On attend que l'avion soit à 300m de la DZ pour lui assigner son 2e WP
	waitUntil {((getpos _veh) distance2D _pos) < 2000};
	_veh animateSource ["ramp",1];
	waitUntil {((getpos _veh) distance2D _pos) < 1000};
	_veh animateSource ["jumplight",1];;
	
	_wp = _group addWaypoint [(_veh getRelPos [6000, 0]), 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointStatements ["true", "{ deleteVehicle (vehicle _x); deleteVehicle _x; } forEach units group this;"];

};

if (hasInterface) then {
	
	// Cette partie permet gérer le loadouts des joueurs lors du saut (ajout du parachute et sauvegarde du sac à dos)
	waitUntil {time > 15};
	_mybackpack = backpack player;
	_mybackpackcontent = backpackItems player;
	_myitems = assignedItems player;
	removeBackpack player;
	player addbackpack "B_Parachute";
	player linkitem "ItemGPS";
	
	waitUntil {(getposATL player select 2) < 2};
	sleep 1.0;
	removeBackpack player;
	removeBackpack player;
	if (!("ItemGPS" in _myitems)) then {player unlinkItem "ItemGPS";};
	player addbackpack _mybackpack;
	{
		player additemtobackpack _x;
	} foreach _mybackpackcontent;
};