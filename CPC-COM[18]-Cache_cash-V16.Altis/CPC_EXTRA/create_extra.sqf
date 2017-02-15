/*
Désignation et création de la LZ par clic gauche sur la map.
+
Création de l'hélico
*/

private ["_veh","_pos","_group","_wp","_dir"];


// Désignation et création de la LZ par clic gauche sur la map.
hint "Ouvrez votre map et cliquez à l'endroit désiré pour désigner la LZ";
// Création de l'action d'annulation
CPC_EXTRA_Action = player addAction ["<t color='#DF1444'>Annuler</t>","player onMapSingleClick """";player removeaction (_this select 2); hint """";",0,0,false,true,"",""];

player onMapSingleClick {
	// Suppression de l'action dans le menu molette
	CPC_EXTRA_Created = true;
	publicVariable "CPC_EXTRA_Created";
	player removeaction CPC_EXTRA_Action;
	hint "L'extraction est en route";
	// création du marker et de l'hélipad
	createMarkerLocal ["CPC_EXTRA_LZ",_pos];
	"CPC_EXTRA_LZ" setMarkerTypeLocal "mil_Pickup";
	"CPC_EXTRA_LZ" setMarkerColorLocal "ColorIndependent";
	_veh = "Land_HelipadEmpty_F" createVehicle _pos;
	// Définir la position de spawn de l'hélico
	_dir = (getmarkerPos "Mark_Cible") getDir (getmarkerPos "CPC_EXTRA_LZ");
	CPC_EXTRA_Pos = _veh getRelPos [3000, _dir];
	// création de l'hélico
	_veh = [CPC_EXTRA_Pos,0,CPC_EXTRA_Veh,CPC_EXTRA_Side] call BIS_fnc_spawnVehicle;
	CPC_EXTRA_Helo =  _veh select 0;
	_group = _veh select 2;
	CPC_EXTRA_Helo disableAI "AUTOTARGET";
	CPC_EXTRA_Helo disableAI "AUTOCOMBAT";
	CPC_EXTRA_Helo disableAI "SUPPRESSION";
	// Ajout du premier WP
	_wp = _group addWaypoint [_pos, 0];
	_wp setWaypointType CPC_EXTRA_Landing;
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointCombatMode "BLUE";
	_wp setWaypointStatements ["true", "CPC_EXTRA_helo land 'GET IN'"];
	
	player onMapSingleClick "";
	
	// Ajout de l'action "Partir" pour tous les clients
	[CPC_EXTRA_Helo,["<t color='#ff0000'>Partir</t>","CPC_EXTRA_LeaveLZ = true; publicVariable 'CPC_EXTRA_LeaveLZ'; _wp = (group CPC_EXTRA_Helo) addWaypoint [CPC_EXTRA_Pos, 0]; _wp setWaypointType 'MOVE';",0,1.5,false,true,"","(!CPC_EXTRA_LeaveLZ) AND (_this in (assignedCargo _target))"]] remoteExec ["addaction", 0];

};

