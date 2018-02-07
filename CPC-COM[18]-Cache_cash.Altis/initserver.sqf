CPC_loadedworld = worldName;
publicVariable "CPC_loadedworld";
chefIA_create = false;
publicVariable "chefIA_create";
chefIA_killed = false;
publicVariable "chefIA_killed";

null = [] execVM "create_markers.sqf";

_trg = createTrigger ["EmptyDetector", [0,0,0], true];
_trg setTriggerActivation ["ALPHA", "PRESENT", false];
_trg setTriggerText "Couper la mission";
_trg setTriggerStatements ["this", "['end1',true,4] call BIS_fnc_endMission;", ""];

if ((paramsArray select 15) == 1) then {
	null = [] execVM "scripts\AmmoCrate.sqf";
};