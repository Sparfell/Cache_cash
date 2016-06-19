village = [
	["Land_CampingChair_V2_F",[-3.125,-4.18262,0],89.9197,1,0,[0,0],"","",true,false], 
	["Land_CampingTable_small_F",[-3.85107,-4.00415,0],283.939,1,0,[0,0],"","",true,false], 
	["Land_u_House_Small_02_V1_F",[9.12793,-2.75366,0],0,1,0,[0,0],"","",true,false], 
	["Flag_AAF_F",[-7.19678,-3.18799,0],0,1,0,[0,0],"","",true,false], 
	["Land_u_Addon_01_V1_F",[-5.39795,3.39844,0],0,1,0,[0,0],"","",true,false], 
	["Land_d_Stone_Shed_V1_F",[6.75781,9.11743,0],295.843,1,0,[0,0],"","",true,false], 
	["Land_d_Stone_HouseBig_V1_F",[-5.59326,10.707,0],180.682,1,0,[0,0],"","",true,false]
];
camp = [
	["Land_TentA_F",[3.95117,2.26172,0],228.268,1,0,[0,0],"","",true,false], 
	["Land_Bench_F",[5.43994,5.88818,0],20.544,1,0,[0,0],"","",true,false], 
	["Land_TentA_F",[8.33569,1.64258,2.09808e-005],152.962,1,0,[0,-0],"","",true,false], 
	["Land_House_Small_03_V1_ruins_F",[3.25366,-8.27295,-3.8147e-006],0,1,0,[0,0],"","",true,false], 
	["Land_Campfire_F",[7.17798,5.44971,0.0299988],0,1,0,[0,0],"","",true,false], 
	["Land_Unfinished_Building_02_ruins_F",[-6.8811,5.83887,0],0,1,0,[0,0],"","",true,false], 
	["Land_TentDome_F",[4.65991,9.11426,0],230.426,1,0,[0,0],"","",true,false], 
	["Land_LifeguardTower_01_F",[-9.57129,-5.90234,0],57.1488,1,0,[0,0],"","",true,false]
];
ArrayBases = [village,camp];
camprandom = selectrandom ArrayBases;

bleep = [[3535.7,5903.78,0],(random 360),camprandom] call BIS_fnc_ObjectsMapper;

/*

Utilisez ça dans la console de débug pour chopper toutes les infos utiles relatives à la composition. Vous devez changer la position du centre de la composition ([x,y,z]).

bleep = [[3644.94,5940.13,0],100,true] call BIS_fnc_ObjectsGrabber; copyToClipboard str bleep;

https://community.bistudio.com/wiki/BIS_fnc_exportCfgGroups

*/