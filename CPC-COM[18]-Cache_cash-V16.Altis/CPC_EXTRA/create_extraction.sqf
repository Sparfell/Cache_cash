// Suppression de l'action dans le menu molette
CPC_EXTRA_Created = true;

// Initialisation des variables
CPC_EXTRA_MarkerCreated = false;
CPC_EXTRA_LeaveLZ = false;
publicvariable "CPC_EXTRA_LeaveLZ";

// Désignation et création de la LZ par clic gauche sur la map.
hint "Ouvrez votre map et cliquez à l'endroit désiré pour désigner la LZ";
player onMapSingleClick {createMarkerLocal ["CPC_EXTRA_MLZ", _pos]; "CPC_EXTRA_MLZ" setMarkerTypeLocal "hd_Pickup"; "CPC_EXTRA_MLZ" setMarkerColorLocal "ColorIndependent"; CPC_EXTRA_MarkerCreated = true;};
sleep 1;
waitUntil {CPC_EXTRA_MarkerCreated};
sleep 1;
player onMapSingleClick "";
CPC_EXTRA_PosLZ = getMarkerPos "CPC_EXTRA_MLZ";
publicVariable "CPC_EXTRA_PosLZ";

_CPC_EXTRA_helipad = "Land_HelipadEmpty_F" createVehicle CPC_EXTRA_PosLZ;

sleep 1;

// Création des positions
_dir = (getmarkerPos "Mark_Cible") getDir (getmarkerPos "CPC_EXTRA_MLZ");
_helipad = "Land_HelipadEmpty_F" createVehicle (getmarkerPos "CPC_EXTRA_MLZ");
_CPC_EXTRA_PosSpawnHelo = _helipad getRelPos [3000, _dir];
// Création de l'hélico
CPC_EXTRA_SpawnHelo = [_CPC_EXTRA_PosSpawnHelo,0, CPC_EXTRA_HeloType, CPC_EXTRA_HeloSide] call BIS_fnc_spawnVehicle;
CPC_EXTRA_Helo =  CPC_EXTRA_SpawnHelo select 0;
publicVariable "CPC_EXTRA_Helo";
CPC_EXTRA_GroupHelo = CPC_EXTRA_SpawnHelo select 2;
CPC_EXTRA_Helo disableAI "AUTOTARGET";
CPC_EXTRA_Helo disableAI "AUTOCOMBAT";
CPC_EXTRA_Helo disableAI "SUPPRESSION";
deleteVehicle _helipad;

sleep 1;

// Création du premier point de passage de l'hélico
CPC_EXTRA_HeloWP1 = CPC_EXTRA_GroupHelo addWaypoint [CPC_EXTRA_PosLZ, 0];
	CPC_EXTRA_HeloWP1 setWaypointType CPC_EXTRA_HeloLandingType;
	CPC_EXTRA_HeloWP1 setWaypointBehaviour "CARELESS";
	CPC_EXTRA_HeloWP1 setWaypointCombatMode "BLUE";
	CPC_EXTRA_HeloWP1 setWaypointStatements ["true", "CPC_EXTRA_helo land 'GET IN'"];
	
// Ajout de l'action "Partir" pour tous les clients
[CPC_EXTRA_Helo,["<t color='#ff0000'>Partir</t>","CPC_EXTRA_LeaveLZ = true; publicVariable 'CPC_EXTRA_LeaveLZ';",0,1.5,false,true,"","!CPC_EXTRA_LeaveLZ"]] remoteExec ["addaction", 0];

// Ouverture de la porte :
waitUntil {(CPC_EXTRA_Helo distance _CPC_EXTRA_helipad) < 30};
if (CPC_EXTRA_AnimType == 1) then {
if (CPC_EXTRA_DoorAnimName1 != "") then {CPC_EXTRA_Helo animate [CPC_EXTRA_DoorAnimName1,1];};
if (CPC_EXTRA_DoorAnimName2 != "") then {CPC_EXTRA_Helo animate [CPC_EXTRA_DoorAnimName2,1];};
};
if (CPC_EXTRA_AnimType == 2) then {
if (CPC_EXTRA_DoorAnimName1 != "") then {CPC_EXTRA_Helo animatedoor [CPC_EXTRA_DoorAnimName1,1];};
if (CPC_EXTRA_DoorAnimName2 != "") then {CPC_EXTRA_Helo animatedoor [CPC_EXTRA_DoorAnimName2,1];};
};
if (CPC_EXTRA_AnimType == 3) then {
if (CPC_EXTRA_DoorAnimName1 != "") then {CPC_EXTRA_Helo animateSource [CPC_EXTRA_DoorAnimName1,0.6];};
if (CPC_EXTRA_DoorAnimName2 != "") then {CPC_EXTRA_Helo animateSource [CPC_EXTRA_DoorAnimName2,0.6];};
};
if (CPC_EXTRA_AnimType == 4) then {
if (CPC_EXTRA_DoorAnimName1 != "") then {CPC_EXTRA_Helo animateSource [CPC_EXTRA_DoorAnimName1,0];};
if (CPC_EXTRA_DoorAnimName2 != "") then {CPC_EXTRA_Helo animateSource [CPC_EXTRA_DoorAnimName2,0];};
};

// Attente de l'autorisation de décoller
waitUntil {CPC_EXTRA_LeaveLZ};
sleep 3;
// fermeture de la porte :
if (CPC_EXTRA_AnimType == 1) then {
if (CPC_EXTRA_DoorAnimName1 != "") then {CPC_EXTRA_Helo animate [CPC_EXTRA_DoorAnimName1,0];};
if (CPC_EXTRA_DoorAnimName2 != "") then {CPC_EXTRA_Helo animate [CPC_EXTRA_DoorAnimName2,0];};
};
if (CPC_EXTRA_AnimType == 2) then {
if (CPC_EXTRA_DoorAnimName1 != "") then {CPC_EXTRA_Helo animatedoor [CPC_EXTRA_DoorAnimName1,0];};
if (CPC_EXTRA_DoorAnimName2 != "") then {CPC_EXTRA_Helo animatedoor [CPC_EXTRA_DoorAnimName2,0];};
};
if (CPC_EXTRA_AnimType == 3) then {
if (CPC_EXTRA_DoorAnimName1 != "") then {CPC_EXTRA_Helo animateSource [CPC_EXTRA_DoorAnimName1,0];};
if (CPC_EXTRA_DoorAnimName2 != "") then {CPC_EXTRA_Helo animateSource [CPC_EXTRA_DoorAnimName2,0];};
};
if (CPC_EXTRA_AnimType == 4) then {
if (CPC_EXTRA_DoorAnimName1 != "") then {CPC_EXTRA_Helo animateSource [CPC_EXTRA_DoorAnimName1,1];};
if (CPC_EXTRA_DoorAnimName2 != "") then {CPC_EXTRA_Helo animateSource [CPC_EXTRA_DoorAnimName2,1];};
};
	
// Création du second point de passage de l'hélico
CPC_EXTRA_HeloWP2 = CPC_EXTRA_GroupHelo addWaypoint [_CPC_EXTRA_PosSpawnHelo, 0];
	CPC_EXTRA_HeloWP2 setWaypointType "MOVE";
