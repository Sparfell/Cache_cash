if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};

if (isNil "paramsArray") then {
	paramsArray = [12,0,1,0,1,0,9,1,0,0,0,25,0]
};

waitUntil {CPC_MarkersCreated};
//VARIABLES PLAYERS
SlotPlayers = [P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18];
chefIA = null;

//VARIABLES MISSION
if (isServer) then {
	skipTime (paramsArray select 0);
};

if ((paramsArray select 11)< 1.5) then {
	0 setOvercast (paramsArray select 11);
};
0 setfog (paramsArray select 12);
forceWeatherChange;
CPC_CC_Insertion_OK = false;

//Script
null = [] execVM "briefing.sqf";
null = [] execVM "spawn\Spawn_IA.sqf";
null = [2,true,true] execVM "roster.sqf";
if ((paramsArray select 1) == 1) then {null = [] execVM "playerPos.sqf";};
if ((paramsArray select 1) == 4) then {null = [] execVM "playerPara.sqf";};
if ((paramsArray select 7) == 3) then {null = [] execVM "CPC_EXTRA\call_extraction.sqf";};

// Teleport & invulnerable
//onMapSingleClick "player setPos _pos";
//player allowdammage false;

for "_x" from 1 to 100 do
{
	format ["%1",_x] setMarkerAlpha 0;
};


finishMissionInit;

waitUntil {time > 0};

0 setfog (paramsArray select 12);
forceWeatherChange;

if (CPC_CC_Insertion_OK) exitWith {};

//spawn
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


