if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};

// définition manuelle des paramètres pour le débug
if (isNil "paramsArray") then {
	paramsArray = [12,0,1,0,1,3,100,1,0,0,1,0,0,0]
};

// déterminer la localité pour faire pop les IAs(HC ou éditeur)
MODE_EDITEUR = false;
MODE_HC = false;
if !(isMultiplayer) then {
	MODE_EDITEUR = true;
} else {
if !(hasInterface or isServer) then {
	MODE_HC = true;
};
};

waitUntil {CPC_MarkersCreated};

// DATE POUR LA LUNE
if (isServer) then {
	if ((paramsArray select 14) == 1) then {setDate CPC_FullMoon;};
	skipTime (paramsArray select 0);
};

//METEO
null = [] execVM "scripts\meteo.sqf";

/*VARIABLES MISSION*/
CPC_CC_Insertion_OK = false;
SlotPlayers = [P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,P21,P22,P23,P24,P25,P26,P27,P28,P29,P30,P31,P32,P33];
chefIA = null;

/*SCRIPTS*/
null = [] execVM "briefing.sqf";
null = [] execVM "spawn\Spawn_IA.sqf";
null = [2,true,true] execVM "roster.sqf";
if ((paramsArray select 1) == 1) then {null = [] execVM "scripts\playerPos.sqf";};
if ((paramsArray select 1) == 4) then {null = [] execVM "scripts\playerPara.sqf";};
if ((paramsArray select 1) == 5) then {null = [] execVM "scripts\playerHALO.sqf";};
if ((paramsArray select 1) == 3) then {null = [] execVM "CPC_INSERT\create_insertion.sqf";};
if ((paramsArray select 7) == 3) then {null = [] execVM "CPC_EXTRA\call_extraction.sqf";};

//Cacher les marqueurs de zone
for "_x" from 1 to 100 do
{
	format ["%1",_x] setMarkerAlpha 0;
};


finishMissionInit;

waitUntil {time > 0};


if (CPC_CC_Insertion_OK) exitWith {};

//SPAWN aléatoire
if ((paramsArray select 1 == 0) or (paramsArray select 1 == 2)) then {
	_pos = markerpos "Mark_inser";
	_deg = 360 / (count SlotPlayers);
	_i = 0;
	{
		if (_x == player) then {
			_x setpos [(_pos select 0)+(8 * cos(_deg *_i)),(_pos select 1)+(8 * sin(_deg *_i)),1.5];
			_x setdir (270-(_deg *_i));
			_x DisableAI "MOVE";
			_x DisableAI "AUTOTARGET";
		};
		_i = _i +1;
	} foreach SlotPlayers;
	CPC_CC_Insertion_OK = true;
};


