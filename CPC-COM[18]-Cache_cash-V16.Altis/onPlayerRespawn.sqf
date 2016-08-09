//Spectateur ACRE
[true] call acre_api_fnc_setSpectator;

//Anti mouettes
{
	if(_x isKindOf "seagull") then {
		_x setPos [0,0,500];
		hideobjectglobal _x;
		_x enablesimulationglobal false;
	};
} forEach nearestObjects [player, [], 250];