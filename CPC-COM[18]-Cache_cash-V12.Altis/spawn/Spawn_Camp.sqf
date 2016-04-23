if !(isServer) exitWith {};

_pos = (_this select 0);
_camp = (_this select 1);
_dir = random 360;

_listobj = [(configfile >> "CfgGroups" >> "Empty" >> "Military" >> "Outposts" >> _camp),0] call BIS_fnc_returnChildren;
{
		_obj = getText (configFile >> "CfgGroups"  >> "Empty" >> "Military" >> "Outposts" >> _camp >> configName _x >> "vehicle") createVehicle [0,0,0];
		_array = getArray (configFile >> "CfgGroups"  >> "Empty" >> "Military" >> "Outposts" >> _camp >> configName _x >> "position");
		_dirO = getNumber (configFile >> "CfgGroups"  >> "Empty" >> "Military" >> "Outposts" >> _camp >> configName _x >> "dir");
		_obj setdir (-_dir + _dirO);
		_obj setpos [(_pos select 0)+ ((_array select 0)* (cos _dir))- ((_array select 1)* (sin _dir)), (_pos select 1)+ ((_array select 1)* (cos _dir))+ ((_array select 0)* (sin _dir)), (_pos select 2)+ (_array select 2)];
} foreach _listobj;
