if !(isServer) exitWith {};

typecamp = 2; publicvariable "typecamp";

"1" setMarkerSize [40,40];

_marker = (_this select 0);
_pos = getmarkerpos _marker;
_dir = random 360;

if (CPC_WorldType == "vanilla") then {typeHouse = ["Land_i_Stone_HouseBig_V1_F","Land_i_Stone_Shed_V1_F","Land_i_Stone_HouseSmall_V1_F","Land_u_House_Small_02_V1_F","Land_u_House_Small_01_V1_F","Land_u_House_Big_02_V1_F"];};
if (CPC_WorldType == "desert") then {typeHouse = ["Land_House_K_1_EP1","Land_House_K_3_EP1","Land_House_K_8_EP1","Land_House_K_5_EP1","Land_House_K_6_EP1","Land_House_K_7_EP1"];};
if (CPC_WorldType == "afrique") then {typeHouse = ["Land_Unfinished_Building_01_F","Land_Unfinished_Building_02_F","Land_Market_stalls_01_EP1","Land_Market_stalls_02_EP1","Land_Slum_House02_F","Land_Slum_House03_F","Land_Slum_House01_F","Land_u_House_Small_02_V1_F","Land_i_Stone_Shed_V1_F","Land_i_Stone_Shed_V2_F","Land_d_Stone_Shed_V1_F","Land_d_House_Small_01_V3_F","Land_i_Stone_HouseSmall_V3_F","Land_House_K_1_EP1","Land_House_L_1_EP1","Land_House_L_3_EP1","Land_Dum_istan3_pumpa","Land_House_C_5_EP1"];};
if (CPC_WorldType == "jungle") then {typeHouse = ["Land_Hut02","Land_Hut03","Land_Hut04","Land_Hut06","Land_Slum_House02_F","Land_Slum_House03_F","Land_Slum_House01_F","Land_d_House_Small_01_V1_F","Land_d_House_Small_01_V1_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_Shed_V3_F","Land_i_Stone_Shed_V2_F","Land_Chapel_Small_V2_F","Land_BellTower_02_V2_F","Land_Unfinished_Building_01_F","Land_Unfinished_Building_02_F","Land_cmp_Hopper_F","Land_cmp_Shed_F","Land_FuelStation_Build_F"];};
if (CPC_WorldType == "chern") then {typeHouse = ["Land_i_Stone_HouseBig_V1_F","Land_i_Stone_Shed_V1_F","Land_i_Stone_HouseSmall_V1_F","Land_u_House_Small_02_V1_F","Land_u_House_Small_01_V1_F","Land_u_House_Big_02_V1_F","Land_HouseV_3I2","Land_HouseV_1I1","Land_HouseV_3I1","Land_HouseV_1I2","Land_HouseV_3I4","Land_Bouda2_vnitrek"];};
if (CPC_WorldType == "fidji") then {typeHouse = ["Land_Slum_01_F","Land_House_Native_02_F","Land_Mausoleum_01_F","Land_WoodenShelter_01_F","Land_House_Native_01_F","Land_House_Small_03_F","Land_ClothesLine_01_full_F","Land_Shed_07_F","Land_Shed_05_F","Land_Shed_03_F","Land_Slum_02_F","Land_House_Small_01_F","Land_Slum_04_F","Land_Shed_01_F"];};

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