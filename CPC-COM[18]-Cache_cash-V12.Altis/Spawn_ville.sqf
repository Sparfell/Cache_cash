if !(isServer) exitWith {};

typecamp = 2; publicvariable "typecamp";

"1" setMarkerSize [40,40];

_marker = (_this select 0);
_pos = getmarkerpos _marker;
_dir = random 360;

if (CPC_WorldType == "vanilla") then {typeHouse = ["Land_i_Stone_HouseBig_V1_F","Land_i_Stone_Shed_V1_F","Land_i_Stone_HouseSmall_V1_F","Land_u_House_Small_02_V1_F","Land_u_House_Small_01_V1_F","Land_u_House_Big_02_V1_F"];};
if (CPC_WorldType == "desert") then {typeHouse = ["Land_House_K_1_EP1","Land_House_K_3_EP1","Land_House_K_8_EP1","Land_House_K_5_EP1","Land_House_K_6_EP1","Land_House_K_7_EP1"];};
if (CPC_WorldType == "afrique") then {typeHouse = ["Land_Unfinished_Building_01_F","Land_Unfinished_Building_02_F","Land_MarketShelter_F","Land_Slum_House02_F","Land_Slum_House03_F","Land_Slum_House01_F","Land_u_House_Small_02_V1_F","Land_i_Stone_Shed_V1_F","Land_i_Stone_Shed_V2_F","Land_d_Stone_Shed_V1_F","Land_d_House_Small_01_V3_F","Land_i_Stone_HouseSmall_V3_F"];};
if (CPC_WorldType == "jungle") then {typeHouse = ["Land_Slum_House02_F","Land_Slum_House03_F","Land_Slum_House01_F","Land_d_House_Small_01_V1_F","Land_d_House_Small_01_V1_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_Shed_V3_F","Land_i_Stone_Shed_V2_F","Land_Chapel_Small_V2_F","Land_BellTower_02_V2_F","Land_Unfinished_Building_01_F","Land_Unfinished_Building_02_F","Land_cmp_Hopper_F","Land_cmp_Shed_F","Land_FuelStation_Build_F"];};

_objet = "Flag_POWMIA_F" CreateVehicle [_pos select 0,_pos select 1,0];
_objet = "Land_Campfire_F" CreateVehicle [(_pos select 0) - 2,_pos select 1,0];

_d = 20;
{
	for "_i" from 1 to 310 step _x do {
		_type = selectRandom typeHouse;
		_objet = _type CreateVehicle [(_pos select 0) + ((sin (_dir + (_i)))*_d),(_pos select 1)  + ((cos (_dir + (_i)))*_d), 0];
		_objet setdir _dir + ((floor random 4)* 90);
		_objet setVectorUp [0,0,1];
	};
_d = _d + 15;
} foreach [80,52,23];