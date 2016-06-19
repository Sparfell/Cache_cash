/*
a: reyhard
simple infantry paradrop script

*/

_v = vehicle (leader group_avion_HALO);

if(not(local _v))exitWith{};

{
	// perform action only for cargo
	if(_v getCargoIndex _x >= 0)then{

		(group _x) leaveVehicle _v;
		moveout _x;

		private _delay =  (1/((speed _v)/150));
		_delay = _delay + 0.5;
		sleep _delay;
	};
}foreach (crew _v);

