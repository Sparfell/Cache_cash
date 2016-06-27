if (player in [p1,p2,p9,p16]) then {
	onMapSingleClick "
		'Mark_inser' setmarkerPos _pos;
	";
};

private["_jump_pos","_dir","_markerName","_text","_spawnpos","_helipad","_veh","_veh_wp1","_veh_wp2","_IndexNumber","_mybackpack","_mybackpackcontent","_myitems"];

waituntil {time > 0};
onMapSingleClick "";

if (isserver) then {
	
	// Création des positions nécessaires
	_jump_pos = (getmarkerPos "Mark_inser");
	_dir = (getmarkerPos "Mark_Cible") getDir (getmarkerPos "Mark_inser");
	_helipad = "Land_HelipadEmpty_F" createVehicle (getmarkerPos "Mark_inser");
	_spawnpos = _helipad getRelPos [10000, _dir];
	
	//Récupération du marqueur "JUMP" si présent
	_markerName = "AVION";
	{
		_text = markerText _x;
		if(_text isEqualTo _markerName) then 
		{
			_spawnpos = markerPos _x;
		};
	} forEach allMapMarkers;
	
	


	// Création de l'avion sur le point d'insertion
	_veh = createVehicle ["RHS_C130J", _spawnpos, [], 0, "FLY"];
	createVehicleCrew vehicle _veh;
	_veh flyInHeightASL [8000,8000,8000];
	group_avion_HALO = createGroup civilian;
	publicVariable "group_avion_HALO";
	[_veh] joinSilent group_avion_HALO;
	{_x disableAI "AUTOTARGET";_x disableAI "AUTOCOMBAT";[_x] joinSilent group_avion_HALO;} foreach (crew _veh);
	_veh setposASL [(_spawnpos select 0),(_spawnpos select 1),8000];
	_dir = (getPos _veh) getDir (getmarkerPos "Mark_inser");
	_veh setdir _dir;
	"Mark_inser" setMarkerDir _dir;
	_veh setvelocity [100,0,0];
	deleteVehicle _helipad;

	sleep 0.5;

	// Création du WP de HALO
	_jump_pos = [(_jump_pos select 0),(_jump_pos select 1),8000];

	_veh_wp1 = group_avion_HALO addWaypoint [_jump_pos, 0];
	_veh_wp1 setWaypointType "MOVE";
	_veh_wp1 setWaypointBehaviour "SAFE";
	_veh_wp1 setWaypointCombatMode "BLUE";
	_veh_wp1 setWaypointStatements ["true", "null = [this] execVM ""infParadropHALO.sqf"";"];

	sleep 0.5;

	// Déplacement des joueurs dans l'avion.
	_IndexNumber = 1;
	if (!isMultiplayer) then {
	{_x assignAsCargoIndex [_veh, _IndexNumber]; [_x,[_veh,_IndexNumber]] remoteExecCall ["moveInCargo",_x]; _veh; _IndexNumber = _IndexNumber + 1; sleep 0.1;} forEach [P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18];
	} else {
	{_x assignAsCargoIndex [_veh, _IndexNumber]; [_x,[_veh,_IndexNumber]] remoteExecCall ["moveInCargo",_x]; _veh; _IndexNumber = _IndexNumber + 1; sleep 0.1;} forEach playableUnits;
	};
	
	// On attend que l'avion soit à 300m de la DZ pour lui assigner son 2e WP
	waitUntil {((getpos _veh) distance _jump_pos) < 2000};
	_veh animateDoor ["ramp",1];
	
	_veh_wp2 = group_avion_HALO addWaypoint [(_veh getRelPos [6000, 0]), 0];
	_veh_wp2 setWaypointType "MOVE";
	_veh_wp2 setWaypointStatements ["true", "{ deleteVehicle (vehicle _x); deleteVehicle _x; } forEach units group this;"];

}
else
{	
	sleep 1.0;
	_mybackpack = backpack player;
	_mybackpackcontent = backpackItems player;
	_myitems = assignedItems player;
	removeBackpack player;
	player addbackpack "B_Parachute";
	player linkitem "ItemGPS";
	
	sleep 20.0;
	any=[
		[
			["Quelque part 8000 mètres au-dessus de la croûte terrestre","<t align = 'left' size = '0.8'>%1</t><br/>"],
			[str (date select 2) + "/" + str (date select 1) + "/" + str (date select 0),"<t align = 'left' size = '0.8'>%1</t><br/>"],
			[str (date select 3) + ":" + str (date select 4),"<t align = 'left' size = '0.8'>%1</t><br/>"],
			["...","<t align = 'left' size = '0.8'>%1</t>"]
		]
	] spawn BIS_fnc_typeText;
	
	waitUntil {(getposATL player select 2) < 2};
	removeBackpack player;
	if (!("ItemGPS" in _myitems)) then {player unlinkItem "ItemGPS";};
	player addbackpack _mybackpack;
	{
		player additemtobackpack _x;
	} foreach _mybackpackcontent;
};