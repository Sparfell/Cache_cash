/*
a: reyhard
modified for specific use by Sparfell
simple infantry paradrop script

*/

_veh = vehicle (leader (_this select 0));

if(not(local _veh))exitWith{};

{
	// perform action only for cargo
	if(_veh getCargoIndex _x >= 0)then{

		(group _x) leaveVehicle _veh;
		moveout _x;

		private _delay =  (1/((speed _veh)/150));
		_delay = _delay + 0.5;
		sleep _delay;
	};
}foreach (crew _veh);

