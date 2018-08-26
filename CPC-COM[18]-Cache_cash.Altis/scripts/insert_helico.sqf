/*
	Script d'insertion en hélico (piloté par une IA)
*/

if (didJIP) exitwith {};

if (rank player == "SERGEANT") then {
	onMapSingleClick "
		if !(_pos inArea 'Mark_cible') then {'Mark_inser' setmarkerPos _pos;};
	";
};

private["_type","_veh","_dir","_pos","_group","_wp","_unitArray"];


switch (CC_p_loaout) do {
		case 0 : {_type = "B_Heli_Transport_03_unarmed_F";}; // NATO
		case 1 : {_type = "O_Heli_Transport_04_covered_F";}; // CSAT
		case 2 : {_type = "I_Heli_Transport_02_F";}; // AAF
		case 3 : {_type = "RHS_CH_47F";}; // US Army RHS
		case 4 : {_type = "RHS_CH_47F";}; // USMC RHS
		case 5 : {_type = "RHS_CH_47F";}; // US SF RHS
		case 6 : {_type = "RHS_Mi8AMT_vvsc";}; // RU 2000
		case 7 : {_type = "RHS_Mi8AMT_vvsc";}; // RU 2015
		case 8 : {_type = "RHS_Mi8AMT_vvsc";}; // RU SF
		case 9 : {_type = "CUP_B_CH53E_GER";}; // KSK
		case 10 : {_type = "CUP_B_Merlin_HC3_GB";}; // BAF
		case 11 : {_type = "CUP_I_SA330_Puma_HC1_RACS";}; // RACS
		case 12 : {_type = "CUP_O_Mi17_TK";}; // TAK
		case 13 : {_type = "rhsgref_ins_Mi8amt";}; // INS
		case 14 : {_type = "CUP_C_Mi17_Civilian_RU";}; // TAK INS
		case 15 : {_type = "rhssaf_airforce_ht48";}; // SAF
		case 16 : {_type = "rhsgref_cdf_b_reg_Mi8amt";}; // CDF
		case 17 : {_type = "MU_MERC_Mohawk";}; // PMC
		case 18 : {_type = "CUP_B_SA330_Puma_HC2_BAF";}; // FR
};

waituntil {time > 0};
onMapSingleClick "";

if (isserver) then {

	// Création des positions
	_dir = (getmarkerPos "Mark_Cible") getDir (getmarkerPos "Mark_inser");
	_veh = "Land_HelipadEmpty_F" createVehicle (getmarkerPos "Mark_inser");
	_pos = _veh getRelPos [3000, _dir];

	// Creation hélico
	_dir = _dir - 180;
	_veh = [_pos,_dir,_type,civilian] call BIS_fnc_spawnVehicle;
	_group = _veh select 2;
	_veh =  _veh select 0;
	_veh disableAI "AUTOTARGET";
	_veh disableAI "AUTOCOMBAT";
	_veh allowdamage false;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	_veh flyInHeight 100;
	
	sleep 4.0;
	
	// teleport des joueurs dans l'hélico
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

	sleep 1;
	// Creation WP
	_wp = _group addWaypoint [(getmarkerpos "Mark_inser"), 0];
		_wp setWaypointType "TR UNLOAD";
		_wp setWaypointBehaviour "CARELESS";
		_wp setWaypointCombatMode "BLUE";
	_wp = _group addWaypoint [_pos, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "CARELESS";
		_wp setWaypointCombatMode "BLUE";
		_wp setWaypointStatements ["true", "{ deleteVehicle (vehicle _x); deleteVehicle _x; } forEach units group this;"];

};