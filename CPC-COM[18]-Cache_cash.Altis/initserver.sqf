// Variables liées au paramètres de la mission
CC_p_time = (paramsArray select 0);
CC_p_insertion = (paramsArray select 1);
CC_p_difficulty = (paramsArray select 2);
CC_p_nvg = (paramsArray select 3);
CC_p_skillia = (paramsArray select 4);
CC_p_loaout = (paramsArray select 5);
CC_p_ennemy = (paramsArray select 6);
CC_p_extraction = (paramsArray select 7);
CC_p_vehicle1 = (paramsArray select 8);
CC_p_vehicle2 = (paramsArray select 9);
CC_p_vehicle3 = (paramsArray select 10);
CC_p_overcast = (paramsArray select 11);
CC_p_fog = (paramsArray select 12);
CC_p_ennemyveh = (paramsArray select 13);
CC_p_fullmoon = (paramsArray select 14);
CC_p_ammocrate = (paramsArray select 15);

cc_rhsennemy = false;
if (CC_p_ennemy in [0,2,14,17,18,19,100,106,108,109]) then {cc_rhsennemy = true};

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

if (CC_p_ammocrate == 1) then {
	null = [] execVM "scripts\AmmoCrate.sqf";
};