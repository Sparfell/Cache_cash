if (player in [p1,p2,p14,p26,P29,P31,P32,P33]) then {
	onMapSingleClick "
		if !(_pos inArea 'Mark_cible') then {'Mark_inser' setmarkerPos _pos;};
	";
};

private["_type","_helipad","_DoorAnim1","_DoorAnim2","_AnimType","_dir","_helipad","_spawnpos","_helo","_heloGroup","_wp1","_wp2"];


switch (paramsArray select 5) do {
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
};

switch (_type) do {
		case "RHS_CH_47F" : 					{_DoorAnim1 = "ramp_anim"; _DoorAnim2 = ""; _AnimType = 3;};
		case "CUP_B_CH53E_USMC" : 				{_DoorAnim1 = "ramp_bottom"; _DoorAnim2 = "ramp_top"; _AnimType = 1;};
		case "RHS_Mi8AMT_vvsc" : 				{_DoorAnim1 = "RearDoors"; _DoorAnim2 = ""; _AnimType = 2;};
		case "rhsgref_ins_Mi8amt" : 			{_DoorAnim1 = "RearDoors"; _DoorAnim2 = ""; _AnimType = 2;};
		case "CUP_C_Mi17_Civilian_RU" : 		{_DoorAnim1 = ""; _DoorAnim2 = ""; _AnimType = 1;};
		case "CUP_O_Mi17_TK" : 					{_DoorAnim1 = ""; _DoorAnim2 = ""; _AnimType = 1;};
		case "CUP_B_CH53E_GER" : 				{_DoorAnim1 = "ramp_bottom"; _DoorAnim2 = "ramp_top"; _AnimType = 1;};
		case "B_Heli_Transport_03_unarmed_F" : 	{_DoorAnim1 = "Door_rear_source"; _DoorAnim2 = ""; _AnimType = 2;};
		case "O_Heli_Transport_04_covered_F" : 	{_DoorAnim1 = "Door_4_source"; _DoorAnim2 = "Door_5_source"; _AnimType = 2;};
		case "I_Heli_Transport_02_F" : 			{_DoorAnim1 = "CargoRamp_Open"; _DoorAnim2 = "Door_Back_R"; _AnimType = 2;};
		case "CPC_Duala_B_GFD_SA330" : 			{_DoorAnim1 = "ofrp_puma_porte_droite"; _DoorAnim2 = "ofrp_puma_porte_gauche"; _AnimType = 4;};
		case "CUP_I_SA330_Puma_HC1_RACS" : 		{_DoorAnim1 = "ofrp_puma_porte_droite"; _DoorAnim2 = "ofrp_puma_porte_gauche"; _AnimType = 4;};
		case "CUP_O_Mi8_SLA_1" : 				{_DoorAnim1 = ""; _DoorAnim2 = ""; _AnimType = 1;};
		case "CUP_B_Merlin_HC3_GB" : 			{_DoorAnim1 = ""; _DoorAnim2 = ""; _AnimType = 1;};
};

waituntil {time > 0};
onMapSingleClick "";

if (isserver) then {

	// Création des positions
	_dir = (getmarkerPos "Mark_Cible") getDir (getmarkerPos "Mark_inser");
	_helipad = "Land_HelipadEmpty_F" createVehicle (getmarkerPos "Mark_inser");
	_spawnpos = _helipad getRelPos [3000, _dir];

	// Creation hélico
	_dir = _dir - 180;
	_spawnhelo = [_spawnpos,_dir,_type,civilian] call BIS_fnc_spawnVehicle;
	_helo =  _spawnhelo select 0;
	_heloGroup = _spawnhelo select 2;
	_helo disableAI "AUTOTARGET";
	_helo disableAI "AUTOCOMBAT";
	_helo allowdamage false;
	clearMagazineCargoGlobal _helo;
	clearWeaponCargoGlobal _helo;
	clearItemCargoGlobal _helo;
	clearBackpackCargoGlobal _helo;
	_helo flyInHeight 100;
	
	sleep 4.0;
	
	// teleport des joueurs dans l'hélico
	_IndexNumber = 1;
	if (!isMultiplayer) then {
	{_x assignAsCargoIndex [_helo, _IndexNumber]; [_x,[_helo,_IndexNumber]] remoteExecCall ["moveInCargo",_x]; _helo; _IndexNumber = _IndexNumber + 1; sleep 0.1;} forEach [P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18];;
	} else {
	{_x assignAsCargoIndex [_helo, _IndexNumber]; [_x,[_helo,_IndexNumber]] remoteExecCall ["moveInCargo",_x]; _helo; _IndexNumber = _IndexNumber + 1; sleep 0.1;} forEach playableUnits;
	};

	sleep 1;
	// Creation WP
	_wp1 = _heloGroup addWaypoint [(getmarkerpos "Mark_inser"), 0];
		_wp1 setWaypointType "TR UNLOAD";
		_wp1 setWaypointBehaviour "CARELESS";
		_wp1 setWaypointCombatMode "BLUE";
	_wp2 = _heloGroup addWaypoint [_spawnpos, 0];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointBehaviour "CARELESS";
		_wp2 setWaypointCombatMode "BLUE";
		_wp2 setWaypointStatements ["true", "{ deleteVehicle (vehicle _x); deleteVehicle _x; } forEach units group this;"];

	//open ramp
	waitUntil {(_helo distance (getmarkerpos "Mark_inser")) < 30};
	if (_AnimType == 1) then {
	if (_DoorAnim1 != "") then {_helo animate [_DoorAnim1,1];};
	if (_DoorAnim2 != "") then {_helo animate [_DoorAnim2,1];};
	};
	if (_AnimType == 2) then {
	if (_DoorAnim1 != "") then {_helo animatedoor [_DoorAnim1,1];};
	if (_DoorAnim2 != "") then {_helo animatedoor [_DoorAnim2,1];};
	};
	if (_AnimType == 3) then {
	if (_DoorAnim1 != "") then {_helo animateSource [_DoorAnim1,0.6];};
	if (_DoorAnim2 != "") then {_helo animateSource [_DoorAnim2,0.6];};
	};
	if (_AnimType == 4) then {
	if (_DoorAnim1 != "") then {_helo animate [_DoorAnim1,0];};
	if (_DoorAnim2 != "") then {_helo animate [_DoorAnim2,0];};
	};
	
	//close ramp
	waitUntil {(_helo distance (getmarkerpos "Mark_inser")) > 40};
	if (_AnimType == 1) then {
	if (_DoorAnim1 != "") then {_helo animate [_DoorAnim1,0];};
	if (_DoorAnim2 != "") then {_helo animate [_DoorAnim2,0];};
	};
	if (_AnimType == 2) then {
	if (_DoorAnim1 != "") then {_helo animatedoor [_DoorAnim1,0];};
	if (_DoorAnim2 != "") then {_helo animatedoor [_DoorAnim2,0];};
	};
	if (_AnimType == 3) then {
	if (_DoorAnim1 != "") then {_helo animateSource [_DoorAnim1,0];};
	if (_DoorAnim2 != "") then {_helo animateSource [_DoorAnim2,0];};
	};
	if (_AnimType == 4) then {
	if (_DoorAnim1 != "") then {_helo animate [_DoorAnim1,1];};
	if (_DoorAnim2 != "") then {_helo animate [_DoorAnim2,1];};
	};

}
else
{
	sleep 20;
	any=[
		[
			["Quelque part sur Terre","<t align = 'left' size = '0.8'>%1</t><br/>"],
			[str (date select 2) + "/" + str (date select 1) + "/" + str (date select 0),"<t align = 'left' size = '0.8'>%1</t><br/>"],
			[str (date select 3) + ":" + "0" + str (date select 4),"<t align = 'left' size = '0.8'>%1</t><br/>"],
			["...","<t align = 'left' size = '0.8'>%1</t>"]
		]
	] spawn BIS_fnc_typeText;	
};