/*
//Pour récupérer les marqueurs créés sur une map (il faut les nommer entre 60 et 99 avant (en commançant par 99))

br = toString [13,10];
arraystrmark = [];
strmark = "";
{
_markstr_x = format ["_marker_x = createMarker [""%1"",%2]; ""%1"" SetMarkerShape ""%4""; ""%1"" setMarkerSize %5; ""%1"" setMarkerDir %3;", _x, getMarkerPos _x, markerDir _x, markerShape _x, getMarkerSize _x];
arraystrmark pushback _markstr_x;

} forEach allMapMarkers;

{
strmark = strmark + br + _x;
} forEach arraystrmark;
copyToClipboard strmark;

*/

//Altis
if (CPC_loadedworld == "Altis") then {

	CPC_WorldType = "vanilla";
	publicVariable "CPC_WorldType";

	_marker0 = createMarker ["69", [19492.094,12333.145,0]]; "69" setMarkerShape "ELLIPSE";	"69" setMarkerSize [600, 1500];	"69" setMarkerDir 70.668; 
	_marker1 = createMarker ["70", [22872.4,20867.8,0]]; "70" setMarkerShape "RECTANGLE";	"70" setMarkerSize [600, 800];	"70" setMarkerDir 336.272;
	_marker2 = createMarker ["71", [21988.215,19201.723,0]];	"71" setMarkerShape "RECTANGLE";	"71" setMarkerSize [600, 800];	"71" setMarkerDir 41.943;
	_marker3 = createMarker ["72", [19806.152,16299.153,0]];	"72" setMarkerShape "RECTANGLE";	"72" setMarkerSize [700, 900];	"72" setMarkerDir 0;
	_marker4 = createMarker ["73", [9639.513,21193.887,0]];	"73" setMarkerShape "ELLIPSE";	"73" setMarkerSize [600, 800];	"73" setMarkerDir 30.439;
	_marker5 = createMarker ["74", [8313.503,21418.5,0]];	"74" setMarkerShape "RECTANGLE";	"74" setMarkerSize [700, 1300];	"74" setMarkerDir 0;
	_marker6 = createMarker ["75", [13406.479,15835.049,0]];	"75" setMarkerShape "ELLIPSE";	"75" setMarkerSize [600, 800];	"75" setMarkerDir 0;
	_marker7 = createMarker ["76", [22552.45,16711.605,0]];	"76" setMarkerShape "ELLIPSE";	"76" setMarkerSize [700, 900];	"76" setMarkerDir 293.209;
	_marker8 = createMarker ["77", [8048.571,12673.027,0]];	"77" setMarkerShape "RECTANGLE";	"77" setMarkerSize [700, 1100];	"77" setMarkerDir 0;
	_marker9 = createMarker ["78", [15818.385,19036.488,0]];	"78" setMarkerShape "ELLIPSE";	"78" setMarkerSize [1000, 1200];	"78" setMarkerDir 322.814;
	_marker10 = createMarker ["79", [8446.367,19307.980,0]];	"79" setMarkerShape "RECTANGLE";	"79" setMarkerSize [800, 800];	"79" setMarkerDir 0;
	_marker11 = createMarker ["80", [4336.629,19723.94,0]];	"80" setMarkerShape "RECTANGLE";	"80" setMarkerSize [700, 1500];	"80" setMarkerDir 0;
	_marker12 = createMarker ["81", [6397.73,20752.672,0]];	"81" setMarkerShape "RECTANGLE";	"81" setMarkerSize [1200, 1200];	"81" setMarkerDir 0;
	_marker13 = createMarker ["82", [6327.377,18092.133,0]];"82" setMarkerShape "RECTANGLE";	"82" setMarkerSize [1200, 1200];	"82" setMarkerDir 0;
	_marker14 = createMarker ["83", [9083.498,17046.023,0]];"83" setMarkerShape "RECTANGLE";"83" setMarkerSize [900, 900];	"83" setMarkerDir 0;
	_marker15 = createMarker ["84", [7596.737,14672.451,0]];"84" setMarkerShape "ELLIPSE";"84" setMarkerSize [700, 1400];	"84" setMarkerDir 72.741;
	_marker16 = createMarker ["85", [6040.862,12820.987,0]];"85" setMarkerShape "RECTANGLE";"85" setMarkerSize [1300, 1000];	"85" setMarkerDir 0;
	_marker17 = createMarker ["86", [11998.823,20629.66,0]];"86" setMarkerShape "RECTANGLE";"86" setMarkerSize [1700, 1200];	"86" setMarkerDir 0;
	_marker18 = createMarker ["87", [12061.399,18170.816,0]];"87" setMarkerShape "RECTANGLE";"87" setMarkerSize [1500, 1000];	"87" setMarkerDir 0;
	_marker19 = createMarker ["88", [11019.598,15956.458,0]];"88" setMarkerShape "RECTANGLE";"88" setMarkerSize [800, 1000];	"88" setMarkerDir 0;
	_marker20 = createMarker ["89", [9718.211,13582.32,0]];	"89" setMarkerShape "RECTANGLE";"89" setMarkerSize [900, 1100];	"89" setMarkerDir 0;
	_marker21 = createMarker ["90", [11097.404,8274.051,0]];"90" setMarkerShape "RECTANGLE";"90" setMarkerSize [1200, 1200];	"90" setMarkerDir 0;
	_marker22 = createMarker ["91", [26223.074,22349.465,0]];"91" setMarkerShape "ELLIPSE";"91" setMarkerSize [700, 1000];	"91" setMarkerDir 316.012;
	_marker23 = createMarker ["92", [24243.422,22084.652,0]];"92" setMarkerShape "ELLIPSE";"92" setMarkerSize [800, 1000];	"92" setMarkerDir 53.013;
	_marker24 = createMarker ["93", [20201.094,18090.277,0]];"93" setMarkerShape "ELLIPSE";"93" setMarkerSize [800, 1000];	"93" setMarkerDir 40.153;
	_marker25 = createMarker ["94", [19772.39,14479.796,0]];"94" setMarkerShape "ELLIPSE";"94" setMarkerSize [900, 1800];	"94" setMarkerDir 72.975;
	_marker26 = createMarker ["95", [17706.629,16764.738,0]];"95" setMarkerShape "RECTANGLE";"95" setMarkerSize [700, 900];	"95" setMarkerDir 0;
	_marker27 = createMarker ["96", [14541.494,21775.215,0]];"96" setMarkerShape "ELLIPSE";"96" setMarkerSize [700, 1400];	"96" setMarkerDir 298.276;
	_marker28 = createMarker ["97", [18425.277,10341.412,0]];"97" setMarkerShape "ELLIPSE";"97" setMarkerSize [1200, 1600];	"97" setMarkerDir 285.894;
	_marker29 = createMarker ["98", [20057.008,7820.042,0]];"98" setMarkerShape "ELLIPSE";"98" setMarkerSize [1200, 800];	"98" setMarkerDir 0;
	_marker30 = createMarker ["99", [20176.395,6254.457,0]];"99" setMarkerShape "ELLIPSE";"99" setMarkerSize [400, 1400];	"99" setMarkerDir 292.152;
};

//Takistan
if (CPC_loadedworld == "Takistan") then {

	CPC_WorldType = "desert";
	publicVariable "CPC_WorldType";

	_marker0 = createMarker ["99", [5295.17,2657.773,0]];	"99" setMarkerShape "RECTANGLE";	"99" setMarkerSize [1000, 1000];	"99" setMarkerDir 0;
	_marker1 = createMarker ["98", [9633.053,3390.555,0]];	"98" setMarkerShape "RECTANGLE";	"98" setMarkerSize [800, 800];	"98" setMarkerDir 0;
	_marker2 = createMarker ["97", [10387.033,5214.611,0]];	"97" setMarkerShape "RECTANGLE";	"97" setMarkerSize [1000, 1000];	"97" setMarkerDir 0;
	_marker3 = createMarker ["96", [7090.24,8119.508,0]];	"96" setMarkerShape "RECTANGLE";	"96" setMarkerSize [1000, 700];	"96" setMarkerDir 0;
	_marker4 = createMarker ["95", [10124.1344,1300.347,0]];	"95" setMarkerShape "ELLIPSE";	"95" setMarkerSize [1100, 800];	"95" setMarkerDir 332.287;
	_marker5 = createMarker ["94", [10858.46,9510.365,0]];	"94" setMarkerShape "RECTANGLE";	"94" setMarkerSize [1000, 1000];	"94" setMarkerDir 0;
	_marker6 = createMarker ["93", [11245.096,11505.419,0]];	"93" setMarkerShape "ELLIPSE";	"93" setMarkerSize [800, 700];	"93" setMarkerDir 45.421;
	_marker7 = createMarker ["92", [1807.530,1917.689,0]];	"92" setMarkerShape "ELLIPSE";	"92" setMarkerSize [1000, 1200];	"92" setMarkerDir 52.615;
	_marker8 = createMarker ["91", [3645.667,2425.021,0]];	"91" setMarkerShape "RECTANGLE";	"91" setMarkerSize [600, 1000];	"91" setMarkerDir 0;
	_marker9 = createMarker ["90", [3380.719,6613.070,0]];	"90" setMarkerShape "RECTANGLE";	"90" setMarkerSize [1200, 1200];	"90" setMarkerDir 0;
	_marker10 = createMarker ["89", [4821.299,7805.4,0]];	"89" setMarkerShape "RECTANGLE";	"89" setMarkerSize [700, 1300];	"89" setMarkerDir 346.244;
	_marker11 = createMarker ["88", [9794.284,7754.105,0]];	"88" setMarkerShape "RECTANGLE";	"88" setMarkerSize [700, 700];	"88" setMarkerDir 0;
	_marker12 = createMarker ["87", [7586.144,6424.855,0]];	"87" setMarkerShape "RECTANGLE";	"87" setMarkerSize [1400, 1000];	"87" setMarkerDir 0;
	_marker13 = createMarker ["86", [7183.935,9858.763,0]];	"86" setMarkerShape "RECTANGLE";	"86" setMarkerSize [800, 800];	"86" setMarkerDir 0;
	_marker14 = createMarker ["85", [1837.089,8815.625,0]];	"85" setMarkerShape "RECTANGLE";	"85" setMarkerSize [1200, 900];	"85" setMarkerDir 0;
	_marker15 = createMarker ["84", [8465.91,11679.027,0]];	"84" setMarkerShape "RECTANGLE";	"84" setMarkerSize [1000, 700];	"84" setMarkerDir 0;
	_marker16 = createMarker ["83", [4557.061,10087.461,0]];	"83" setMarkerShape "RECTANGLE";	"83" setMarkerSize [500, 1000];	"83" setMarkerDir 55.17;
	_marker17 = createMarker ["82", [2856.727,11077.944,0]];	"82" setMarkerShape "RECTANGLE";	"82" setMarkerSize [700, 1000];	"82" setMarkerDir 45.111;
	_marker18 = createMarker ["81", [1303.583,10419.07,0]];	"81" setMarkerShape "RECTANGLE";	"81" setMarkerSize [600, 600];	"81" setMarkerDir 0;
	_marker19 = createMarker ["80", [1014.626,11851.829,0]];	"80" setMarkerShape "ELLIPSE";	"80" setMarkerSize [500, 700];	"80" setMarkerDir 41.740;
	_marker20 = createMarker ["79", [1210.962,6876.678,0]];	"79" setMarkerShape "RECTANGLE";	"79" setMarkerSize [600, 1000];	"79" setMarkerDir 0;
	_marker21 = createMarker ["78", [1497.531,4721.287,0]];	"78" setMarkerShape "RECTANGLE";	"78" setMarkerSize [750, 750];	"78" setMarkerDir 0;
	_marker22 = createMarker ["77", [6117.523,4518.379,0]];	"77" setMarkerShape "RECTANGLE";	"77" setMarkerSize [600, 800];	"77" setMarkerDir 0;
	_marker23 = createMarker ["76", [4598.750,4507,0]];	"76" setMarkerShape "RECTANGLE";	"76" setMarkerSize [600, 800];	"76" setMarkerDir 0;
	_marker24 = createMarker ["75", [7271.281,3086.016,0]];	"75" setMarkerShape "RECTANGLE";	"75" setMarkerSize [600, 600];	"75" setMarkerDir 0;
	_marker25 = createMarker ["74", [8651.838,10376.397,0]];	"74" setMarkerShape "RECTANGLE";	"74" setMarkerSize [600, 600];	"74" setMarkerDir 0;
	_marker26 = createMarker ["73", [8930.296,9083.795,0]];	"73" setMarkerShape "RECTANGLE";	"73" setMarkerSize [800, 600];	"73" setMarkerDir 0;
	_marker27 = createMarker ["72", [11377.796,7352.242,0]];	"72" setMarkerShape "RECTANGLE";	"72" setMarkerSize [800, 800];	"72" setMarkerDir 0;
	_marker28 = createMarker ["71", [7869.035,4528.701,0]];	"71" setMarkerShape "RECTANGLE";	"71" setMarkerSize [900, 900];	"71" setMarkerDir 0;
	_marker29 = createMarker ["70", [11244.815,3479.027,0]];	"70" setMarkerShape "RECTANGLE";	"70" setMarkerSize [800, 800];	"70" setMarkerDir 0;
	_marker30 = createMarker ["69", [2636.3,4016.727,0]];	"69" setMarkerShape "RECTANGLE";	"69" setMarkerSize [500, 1000];	"69" setMarkerDir 211.347;
	_marker31 = createMarker ["68", [11650.564,1589.769,0]];	"68" setMarkerShape "RECTANGLE";	"68" setMarkerSize [500, 900];	"68" setMarkerDir 0;
	
	"Mark_Inser" setMarkerPos [5996.956,11453.947,0];
	"M_helipad1" setMarkerPos [5914.13,11441.5,0];
	"M_helipad2" setMarkerPos [5938.9,11466.3,0];
	
};

//Chernarus
if (CPC_loadedworld == "Chernarus") then {

	CPC_WorldType = "chernarus";
	publicVariable "CPC_WorldType";

	_marker0 = createMarker ["99", [8586.314,4862.615,0]];	"99" setMarkerShape "ELLIPSE";	"99" setMarkerSize [800, 1500];	"99" setMarkerDir 16.394;
	_marker1 = createMarker ["98", [10403.963,5503.989,0]];	"98" setMarkerShape "RECTANGLE";	"98" setMarkerSize [800, 800];	"98" setMarkerDir 0;
	_marker2 = createMarker ["97", [8939.259,7842.991,0]];	"97" setMarkerShape "RECTANGLE";	"97" setMarkerSize [900, 900];	"97" setMarkerDir 33.069;
	_marker3 = createMarker ["96", [9509.53,13624.558,0]];	"96" setMarkerShape "RECTANGLE";	"96" setMarkerSize [1200, 1200];	"96" setMarkerDir 0;
	_marker4 = createMarker ["95", [11003.854,8890.053,0]];	"95" setMarkerShape "RECTANGLE";	"95" setMarkerSize [700, 700];	"95" setMarkerDir 0;
	_marker5 = createMarker ["94", [7492.971,9723.364,0]];	"94" setMarkerShape "RECTANGLE";	"94" setMarkerSize [1300, 1600];	"94" setMarkerDir 34.181;
	_marker6 = createMarker ["93", [11138.988,10956.055,0]];	"93" setMarkerShape "RECTANGLE";	"93" setMarkerSize [900, 900];	"93" setMarkerDir 0;
	_marker7 = createMarker ["92", [12023.264,13920.54,0]];	"92" setMarkerShape "RECTANGLE";	"92" setMarkerSize [1200, 1000];	"92" setMarkerDir 0;
	_marker8 = createMarker ["91", [14106.51,14326.849,0]];	"91" setMarkerShape "ELLIPSE";	"91" setMarkerSize [600, 900];	"91" setMarkerDir 297.659;
	_marker9 = createMarker ["90", [10324.725,3829.688,0]];	"90" setMarkerShape "RECTANGLE";	"90" setMarkerSize [800, 800];	"90" setMarkerDir 0;
	_marker10 = createMarker ["89", [1274.108,6241.96,0]];	"89" setMarkerShape "RECTANGLE";	"89" setMarkerSize [900, 1000];	"89" setMarkerDir 0;
	_marker11 = createMarker ["88", [5731.61,6486.167,0]];	"88" setMarkerShape "RECTANGLE";	"88" setMarkerSize [600, 1000];	"88" setMarkerDir 0;
	_marker12 = createMarker ["87", [4228.387,7609.473,0]];	"87" setMarkerShape "RECTANGLE";	"87" setMarkerSize [700, 1100];	"87" setMarkerDir 44.629;
	_marker13 = createMarker ["86", [6786.976,13593.651,0]];	"86" setMarkerShape "RECTANGLE";	"86" setMarkerSize [1500, 1100];	"86" setMarkerDir 0;
	_marker14 = createMarker ["85", [4596.599,3689.145,0]];	"85" setMarkerShape "RECTANGLE";	"85" setMarkerSize [1000, 800];	"85" setMarkerDir 0;
	_marker15 = createMarker ["84", [974.905,3821.192,0]];	"84" setMarkerShape "RECTANGLE";	"84" setMarkerSize [500, 1100];	"84" setMarkerDir 0;
	_marker16 = createMarker ["83", [1574.631,8505.422,0]];	"83" setMarkerShape "RECTANGLE";	"83" setMarkerSize [1200, 1100];	"83" setMarkerDir 0;
	_marker17 = createMarker ["82", [1860.045,11469.156,0]];	"82" setMarkerShape "RECTANGLE";	"82" setMarkerSize [1400, 1400];	"82" setMarkerDir 0;
	_marker18 = createMarker ["81", [4074.107,13798.995,0]];	"81" setMarkerShape "RECTANGLE";	"81" setMarkerSize [1200, 900];	"81" setMarkerDir 0;
	_marker19 = createMarker ["80", [1670.274,13791.468,0]];	"80" setMarkerShape "RECTANGLE";	"80" setMarkerSize [1200, 900];	"80" setMarkerDir 0;
	_marker20 = createMarker ["79", [7350.930,6308.432,0]];	"79" setMarkerShape "RECTANGLE";	"79" setMarkerSize [700, 700];	"79" setMarkerDir 0;
	_marker21 = createMarker ["78", [2577.283,3689.438,0]];	"78" setMarkerShape "RECTANGLE";	"78" setMarkerSize [700, 1100];	"78" setMarkerDir 0;
	_marker22 = createMarker ["77", [6790.852,4612.241,0]];	"77" setMarkerShape "RECTANGLE";	"77" setMarkerSize [700, 700];	"77" setMarkerDir 0;
	_marker23 = createMarker ["76", [12107.618,4707.653,0]];	"76" setMarkerShape "RECTANGLE";	"76" setMarkerSize [700, 700];	"76" setMarkerDir 0;
	_marker24 = createMarker ["75", [10434.571,7174.042,0]];	"75" setMarkerShape "RECTANGLE";	"75" setMarkerSize [700, 700];	"75" setMarkerDir 290.486;
	_marker25 = createMarker ["74", [4932.900,11821.14,0]];	"74" setMarkerShape "RECTANGLE";	"74" setMarkerSize [1600, 600];	"74" setMarkerDir 0;
	_marker26 = createMarker ["73", [9563.786,11483.009,0]];	"73" setMarkerShape "RECTANGLE";	"73" setMarkerSize [600, 900];	"73" setMarkerDir 0;
	_marker27 = createMarker ["72", [13041.561,11845.738,0]];	"72" setMarkerShape "ELLIPSE";	"72" setMarkerSize [700, 1000];	"72" setMarkerDir 31.243;
	_marker28 = createMarker ["71", [12143.367,6319.077,0]];	"71" setMarkerShape "RECTANGLE";	"71" setMarkerSize [700, 700];	"71" setMarkerDir 0;
	_marker29 = createMarker ["70", [3906.768,5674.265,0]];	"70" setMarkerShape "RECTANGLE";	"70" setMarkerSize [700, 700];	"70" setMarkerDir 0;
	
	"Mark_Inser" setMarkerPos [4758.284,10219.22,0];
	"M_helipad1" setMarkerPos [4780.02,10128.2,0];
	"M_helipad2" setMarkerPos [4739.15,10194.5,0];
	
};

//IslaDuala3
if (CPC_loadedworld == "IslaDuala3") then {

	CPC_WorldType = "afrique";
	publicVariable "CPC_WorldType";

	_marker0 = createMarker ["99", [7678.856,6275.589,0]];	"99" setMarkerShape "RECTANGLE";	"99" setMarkerSize [600, 400];	"99" setMarkerDir 180;
	_marker1 = createMarker ["98", [7218.446,5368.355,0]];	"98" setMarkerShape "RECTANGLE";	"98" setMarkerSize [700, 500];	"98" setMarkerDir 0;
	_marker2 = createMarker ["97", [7359.932,4481.246,0]];	"97" setMarkerShape "RECTANGLE";	"97" setMarkerSize [450, 350];	"97" setMarkerDir 0;
	_marker3 = createMarker ["96", [6887.236,3733.355,0]];	"96" setMarkerShape "RECTANGLE";	"96" setMarkerSize [300, 330];	"96" setMarkerDir 0;
	_marker4 = createMarker ["95", [5212.677,1656.636,0]];	"95" setMarkerShape "RECTANGLE";	"95" setMarkerSize [725, 300];	"95" setMarkerDir 0;
	_marker5 = createMarker ["94", [7357.869,1688.149,0]];	"94" setMarkerShape "ELLIPSE";	"94" setMarkerSize [680, 300];	"94" setMarkerDir 192.433;
	_marker6 = createMarker ["93", [8812.769,3884.012,0]];	"93" setMarkerShape "ELLIPSE";	"93" setMarkerSize [275, 200];	"93" setMarkerDir 167;
	_marker7 = createMarker ["92", [9055.421,3456.130,0]];	"92" setMarkerShape "ELLIPSE";	"92" setMarkerSize [275, 200];	"92" setMarkerDir 120;
	_marker8 = createMarker ["91", [8800.492,2072.387,0]];	"91" setMarkerShape "ELLIPSE";	"91" setMarkerSize [350, 250];	"91" setMarkerDir 160;
	_marker9 = createMarker ["90", [8138.903,956.865,0]];	"90" setMarkerShape "ELLIPSE";	"90" setMarkerSize [425, 275];	"90" setMarkerDir 160;
	_marker10 = createMarker ["89", [2576.868,3218.459,0]];	"89" setMarkerShape "RECTANGLE";	"89" setMarkerSize [560, 200];	"89" setMarkerDir 217.485;
	_marker11 = createMarker ["88", [1809.682,3788.353,0]];	"88" setMarkerShape "ELLIPSE";	"88" setMarkerSize [300, 350];	"88" setMarkerDir 0;
	_marker12 = createMarker ["87", [2569.234,3910.778,0]];	"87" setMarkerShape "ELLIPSE";	"87" setMarkerSize [420, 260];	"87" setMarkerDir 44.629;
	_marker13 = createMarker ["86", [514.327,4852.573,0]];	"86" setMarkerShape "ELLIPSE";	"86" setMarkerSize [240, 360];	"86" setMarkerDir 150;
	_marker14 = createMarker ["85", [2249.841,5031.735,0]];	"85" setMarkerShape "RECTANGLE";	"85" setMarkerSize [510, 170];	"85" setMarkerDir 188;
	_marker15 = createMarker ["84", [4373.691,4546.013,0]];	"84" setMarkerShape "RECTANGLE";	"84" setMarkerSize [600, 400];	"84" setMarkerDir 0;
	_marker16 = createMarker ["83", [4261.858,5542.583,0]];	"83" setMarkerShape "RECTANGLE";	"83" setMarkerSize [425, 530];	"83" setMarkerDir 0;
	_marker17 = createMarker ["82", [3576.816,6938.296,0]];	"82" setMarkerShape "ELLIPSE";	"82" setMarkerSize [340, 425];	"82" setMarkerDir 221.5;
	_marker18 = createMarker ["81", [1988.493,8427.563,0]];	"81" setMarkerShape "ELLIPSE";	"81" setMarkerSize [150, 275];	"81" setMarkerDir 247;
	_marker19 = createMarker ["80", [4999.240,7346.015,0]];	"80" setMarkerShape "ELLIPSE";	"80" setMarkerSize [675, 460];	"80" setMarkerDir 203;
	_marker20 = createMarker ["79", [7662.563,7602.196,0]];	"79" setMarkerShape "ELLIPSE";	"79" setMarkerSize [550, 550];	"79" setMarkerDir 0;
	_marker21 = createMarker ["78", [6551.101,8323.791,0]];	"78" setMarkerShape "RECTANGLE";	"78" setMarkerSize [450, 250];	"78" setMarkerDir 0;
	_marker22 = createMarker ["77", [3621.006,9028.313,0]];	"77" setMarkerShape "RECTANGLE";	"77" setMarkerSize [480, 225];	"77" setMarkerDir 209.281;
	_marker23 = createMarker ["76", [4504.603,9726.983,0]];	"76" setMarkerShape "ELLIPSE";	"76" setMarkerSize [325, 620];	"76" setMarkerDir 82;
	_marker24 = createMarker ["75", [5913.125,9583.607,0]];	"75" setMarkerShape "ELLIPSE";	"75" setMarkerSize [360, 500];	"75" setMarkerDir 76;
	
	"Mark_Inser" setMarkerPos [5775.83,6169.68,0];
	"M_helipad1" setMarkerPos [5794.88,6200.63,0];
	"M_helipad2" setMarkerPos [5756.78,6200.42,0];
	
};

//smd_sahrani_a3
if (CPC_loadedworld == "smd_sahrani_a3") then {

	CPC_WorldType = "vanilla";
	publicVariable "CPC_WorldType";

	_marker0 = createMarker ["99", [7121.018,7341.33,0]];	"99" setMarkerShape "ELLIPSE";	"99" setMarkerSize [800, 600];	"99" setMarkerDir 0;
	_marker1 = createMarker ["98", [8521.892,6539.810,0]];	"98" setMarkerShape "ELLIPSE";	"98" setMarkerSize [1000, 600];	"98" setMarkerDir 66.102;
	_marker2 = createMarker ["97", [10165.068,6634.188,0]];	"97" setMarkerShape "ELLIPSE";	"97" setMarkerSize [800, 1400];	"97" setMarkerDir 157.882;
	_marker3 = createMarker ["96", [9185.896,9071.885,0]];	"96" setMarkerShape "ELLIPSE";	"96" setMarkerSize [500, 800];	"96" setMarkerDir 64.030;
	_marker4 = createMarker ["95", [11685.964,7520.789,0]];	"95" setMarkerShape "ELLIPSE";	"95" setMarkerSize [400, 900];	"95" setMarkerDir 36.790;
	_marker5 = createMarker ["94", [15587.426,9907.769,0]];	"94" setMarkerShape "ELLIPSE";	"94" setMarkerSize [900, 1600];	"94" setMarkerDir 61.295;
	_marker6 = createMarker ["93", [14629.192,11695.867,0]];	"93" setMarkerShape "ELLIPSE";	"93" setMarkerSize [600, 1600];	"93" setMarkerDir 56.727;
	_marker7 = createMarker ["92", [17965.408,12846.345,0]];	"92" setMarkerShape "RECTANGLE";	"92" setMarkerSize [800, 1100];	"92" setMarkerDir 284.052;
	_marker8 = createMarker ["91", [14876.619,13734.535,0]];	"91" setMarkerShape "ELLIPSE";	"91" setMarkerSize [900, 2000];	"91" setMarkerDir 294.531;
	_marker9 = createMarker ["90", [12544.535,13406.87,0]];	"90" setMarkerShape "RECTANGLE";	"90" setMarkerSize [700, 1200];	"90" setMarkerDir 314.843;
	_marker10 = createMarker ["89", [12789.651,15962.770,0]];	"89" setMarkerShape "RECTANGLE";	"89" setMarkerSize [700, 1000];	"89" setMarkerDir 119.536;
	_marker11 = createMarker ["88", [10451.539,15359.218,0]];	"88" setMarkerShape "RECTANGLE";	"88" setMarkerSize [1200, 500];	"88" setMarkerDir 40.467;
	_marker12 = createMarker ["87", [8169.373,16412.352,0]];	"87" setMarkerShape "ELLIPSE";	"87" setMarkerSize [1300, 700];	"87" setMarkerDir 9.254;
	
	"Mark_Inser" setMarkerPos [2598.23,2813.93,0];
	"M_helipad1" setMarkerPos [2528.77,2806.91,0];
	"M_helipad2" setMarkerPos [2525.53,2866.95,0];
	
};

//Podagorsk
if (CPC_loadedworld == "FDF_Isle1_a") then {

	CPC_WorldType = "chernarus";
	publicVariable "CPC_WorldType";

	_marker0 = createMarker ["99", [7355.296,19517.443,0]];	"99" setMarkerShape "RECTANGLE";	"99" setMarkerSize [2000, 300];	"99" setMarkerDir 0;
	_marker1 = createMarker ["98", [11803.866,19539.521,0]];	"98" setMarkerShape "RECTANGLE";	"98" setMarkerSize [2400, 300];	"98" setMarkerDir 0;
	_marker2 = createMarker ["97", [7773.407,18458.477,0]];	"97" setMarkerShape "RECTANGLE";	"97" setMarkerSize [1200, 700];	"97" setMarkerDir 0;
	_marker3 = createMarker ["96", [10196.978,18499.789,0]];	"96" setMarkerShape "RECTANGLE";	"96" setMarkerSize [1200, 700];	"96" setMarkerDir 0;
	_marker4 = createMarker ["95", [12275.6,18548.494,0]];	"95" setMarkerShape "ELLIPSE";	"95" setMarkerSize [900, 700];	"95" setMarkerDir 0;
	_marker5 = createMarker ["94", [8116.678,17232.311,0]];	"94" setMarkerShape "RECTANGLE";	"94" setMarkerSize [900, 500];	"94" setMarkerDir 0;
	_marker6 = createMarker ["93", [9906.007,17297.916,0]];	"93" setMarkerShape "RECTANGLE";	"93" setMarkerSize [900, 500];	"93" setMarkerDir 0;
	_marker7 = createMarker ["92", [11306.796,3456.130,0]];	"92" setMarkerShape "RECTANGLE";	"92" setMarkerSize [550, 500];	"92" setMarkerDir 0;
	_marker8 = createMarker ["91", [9585.060,16300.894,0]];	"91" setMarkerShape "RECTANGLE";	"91" setMarkerSize [1300, 500];	"91" setMarkerDir 0;
	_marker9 = createMarker ["90", [9186.204,15077.744,0]];	"90" setMarkerShape "RECTANGLE";	"90" setMarkerSize [1500, 500];	"90" setMarkerDir 0;
	_marker10 = createMarker ["89", [9661.241,14025.393,0]];	"89" setMarkerShape "RECTANGLE";	"89" setMarkerSize [1200, 550];	"89" setMarkerDir 0;
	_marker11 = createMarker ["88", [11455.771,13358.019,0]];	"88" setMarkerShape "RECTANGLE";	"88" setMarkerSize [700, 900];	"88" setMarkerDir 0;
	_marker12 = createMarker ["87", [9470.926,12963.303,0]];	"87" setMarkerShape "RECTANGLE";	"87" setMarkerSize [1300, 500];	"87" setMarkerDir 0;
	_marker13 = createMarker ["86", [8851.484,11471.58,0]];	"86" setMarkerShape "RECTANGLE";	"86" setMarkerSize [700, 1000];	"86" setMarkerDir 0;
	_marker14 = createMarker ["85", [10377.329,11476.3,0]];	"85" setMarkerShape "RECTANGLE";	"85" setMarkerSize [700, 1000];	"85" setMarkerDir 0;
	_marker15 = createMarker ["84", [9278.27,9978.145,0]];	"84" setMarkerShape "RECTANGLE";	"84" setMarkerSize [1500, 500];	"84" setMarkerDir 0;
	_marker16 = createMarker ["83", [11663.177,9898.113,0]];	"83" setMarkerShape "RECTANGLE";	"83" setMarkerSize [900, 400];	"83" setMarkerDir 0;
	_marker17 = createMarker ["82", [11702.649,11485.668,0]];	"82" setMarkerShape "ELLIPSE";	"82" setMarkerSize [600, 1000];	"82" setMarkerDir 20;
	_marker18 = createMarker ["81", [7618.449,4884.406,0]];	"81" setMarkerShape "ELLIPSE";	"81" setMarkerSize [500, 700];	"81" setMarkerDir 0;
	_marker19 = createMarker ["80", [9204.411,8778.32,0]];	"80" setMarkerShape "RECTANGLE";	"80" setMarkerSize [900, 700];	"80" setMarkerDir 0;
	_marker20 = createMarker ["79", [10777.267,8306.346,0]];	"79" setMarkerShape "RECTANGLE";	"79" setMarkerSize [450, 1200];	"79" setMarkerDir 0;
	_marker21 = createMarker ["78", [12404.287,9030.893,0]];	"78" setMarkerShape "RECTANGLE";	"78" setMarkerSize [950, 500];	"78" setMarkerDir 0;
	_marker22 = createMarker ["77", [9588.691,7101.364,0]];	"77" setMarkerShape "ELLIPSE";	"77" setMarkerSize [1000, 1000];	"77" setMarkerDir 0;
	_marker23 = createMarker ["76", [12666.157,7726.207,0]];	"76" setMarkerShape "ELLIPSE";	"76" setMarkerSize [700, 1300];	"76" setMarkerDir 59.894;
	_marker24 = createMarker ["75", [14251.766,7153.137,0]];	"75" setMarkerShape "RECTANGLE";	"75" setMarkerSize [600, 700];	"75" setMarkerDir 289.511;
	
	"Mark_Inser" setMarkerPos [5775.83,6169.68,0];
	"M_helipad1" setMarkerPos [5794.88,6200.63,0];
	"M_helipad2" setMarkerPos [5756.78,6200.42,0];
	
};

//Bystrica
if (CPC_loadedworld == "Woodland_ACR") then {

	CPC_WorldType = "chernarus";
	publicVariable "CPC_WorldType";

	_marker0 = createMarker ["99", [1065.433,6059.067,0]];	"99" setMarkerShape "RECTANGLE";	"99" setMarkerSize [600, 600];	"99" setMarkerDir 0;
	_marker1 = createMarker ["98", [3032.660,5875.657,0]];	"98" setMarkerShape "RECTANGLE";	"98" setMarkerSize [1100, 1100];	"98" setMarkerDir 0;
	_marker2 = createMarker ["97", [5934.108,6519.026,0]];	"97" setMarkerShape "RECTANGLE";	"97" setMarkerSize [600, 600];	"97" setMarkerDir 0;
	_marker3 = createMarker ["96", [1301.281,3854.274,0]];	"96" setMarkerShape "RECTANGLE";	"96" setMarkerSize [700, 800];	"96" setMarkerDir 0;
	_marker4 = createMarker ["95", [2319.608,780.471,0]];	"95" setMarkerShape "ELLIPSE";	"95" setMarkerSize [1200, 600];	"95" setMarkerDir 0;
	_marker5 = createMarker ["94", [3037.04,3752.449,0]];	"94" setMarkerShape "RECTANGLE";	"94" setMarkerSize [700, 900];	"94" setMarkerDir 31.792;
	_marker6 = createMarker ["93", [5278.417,5345.128,0]];	"93" setMarkerShape "RECTANGLE";	"93" setMarkerSize [500, 700];	"93" setMarkerDir 302.608;
	_marker7 = createMarker ["92", [6653.627,4878.559,0]];	"92" setMarkerShape "RECTANGLE";	"92" setMarkerSize [500, 500];	"92" setMarkerDir 0;
	_marker8 = createMarker ["91", [6617.272,3663.268,0]];	"91" setMarkerShape "RECTANGLE";	"91" setMarkerSize [700, 700];	"91" setMarkerDir 0;
	_marker9 = createMarker ["90", [4880.500,3505.622,0]];	"90" setMarkerShape "RECTANGLE";	"90" setMarkerSize [900, 900];	"90" setMarkerDir 0;
	_marker10 = createMarker ["89", [4180.048,2201.658,0]];	"89" setMarkerShape "RECTANGLE";	"89" setMarkerSize [700, 700];	"89" setMarkerDir 0;
	_marker11 = createMarker ["88", [6483.064,1114.850,0]];	"88" setMarkerShape "ELLIPSE";	"88" setMarkerSize [800, 1000];	"88" setMarkerDir 230.437;
	
	"Mark_Inser" setMarkerPos [985.561,2038.16,0];
	"M_helipad1" setMarkerPos [1054.43,2052.54,0];
	"M_helipad2" setMarkerPos [1035.84,2029,0];
	
};

//N'Ziwasogo
if (CPC_loadedworld == "pja305") then {

	CPC_WorldType = "jungle";
	publicVariable "CPC_WorldType";

	_marker_x = createMarker ["99",[3418.23,1963.03,0]]; "99" SetMarkerShape "RECTANGLE"; "99" setMarkerSize [900,1300]; "99" setMarkerDir 0;
	_marker_x = createMarker ["98",[1491.54,2068.41,0]]; "98" SetMarkerShape "RECTANGLE"; "98" setMarkerSize [600,1400]; "98" setMarkerDir 0;
	_marker_x = createMarker ["97",[2415.94,5261.99,0]]; "97" SetMarkerShape "RECTANGLE"; "97" setMarkerSize [1400,1200]; "97" setMarkerDir 0;
	_marker_x = createMarker ["96",[5304.32,4442.93,0]]; "96" SetMarkerShape "RECTANGLE"; "96" setMarkerSize [900,1300]; "96" setMarkerDir 0;
	_marker_x = createMarker ["95",[5852.04,1913.25,0]]; "95" SetMarkerShape "RECTANGLE"; "95" setMarkerSize [750,1200]; "95" setMarkerDir 0;
	_marker_x = createMarker ["94",[7591.82,5507.68,0]]; "94" SetMarkerShape "RECTANGLE"; "94" setMarkerSize [750,750]; "94" setMarkerDir 0;
	_marker_x = createMarker ["93",[7223.5,7678.25,0]]; "93" SetMarkerShape "ELLIPSE"; "93" setMarkerSize [1400,800]; "93" setMarkerDir 0;
	_marker_x = createMarker ["92",[4280.47,8898.85,0]]; "92" SetMarkerShape "ELLIPSE"; "92" setMarkerSize [1300,1000]; "92" setMarkerDir 218.746;
	_marker_x = createMarker ["91",[2175.6,12887,0]]; "91" SetMarkerShape "RECTANGLE"; "91" setMarkerSize [1300,1400]; "91" setMarkerDir 0;
	_marker_x = createMarker ["90",[2388.04,17912.1,0]]; "90" SetMarkerShape "RECTANGLE"; "90" setMarkerSize [1400,1400]; "90" setMarkerDir 0;
	_marker_x = createMarker ["89",[8099.76,9926.55,0]]; "89" SetMarkerShape "ELLIPSE"; "89" setMarkerSize [1322.84,726.621]; "89" setMarkerDir 150.789;
	_marker_x = createMarker ["87",[6183.18,16351.8,0]]; "87" SetMarkerShape "RECTANGLE"; "87" setMarkerSize [1816.67,881.381]; "87" setMarkerDir 0;
	_marker_x = createMarker ["86",[12598.4,14599.8,0]]; "86" SetMarkerShape "ELLIPSE"; "86" setMarkerSize [2088.71,923.825]; "86" setMarkerDir 201.337;
	_marker_x = createMarker ["85",[13918.3,18213,0]]; "85" SetMarkerShape "ELLIPSE"; "85" setMarkerSize [1008.69,1467.05]; "85" setMarkerDir 211.969;
	_marker_x = createMarker ["84",[17185.5,12605.9,0]]; "84" SetMarkerShape "RECTANGLE"; "84" setMarkerSize [1075.52,1044.48]; "84" setMarkerDir 0;
	_marker_x = createMarker ["83",[16745.6,17141,0]]; "83" SetMarkerShape "ELLIPSE"; "83" setMarkerSize [1356.52,1321.05]; "83" setMarkerDir 0;
	_marker_x = createMarker ["82",[16881.7,10558.7,0]]; "82" SetMarkerShape "RECTANGLE"; "82" setMarkerSize [1084.09,1001.11]; "82" setMarkerDir 0;
	_marker_x = createMarker ["81",[14231.9,9345.72,0]]; "81" SetMarkerShape "ELLIPSE"; "81" setMarkerSize [404.735,1095.65]; "81" setMarkerDir 219.02;
	_marker_x = createMarker ["80",[18688.1,6811,0]]; "80" SetMarkerShape "ELLIPSE"; "80" setMarkerSize [1203.34,1653.13]; "80" setMarkerDir 191.804;
	_marker_x = createMarker ["79",[19257.4,1488.49,0]]; "79" SetMarkerShape "ELLIPSE"; "79" setMarkerSize [482.657,812.186]; "79" setMarkerDir 206.565;
	_marker_x = createMarker ["78",[18286.3,1042.37,0]]; "78" SetMarkerShape "RECTANGLE"; "78" setMarkerSize [287.942,308.002]; "78" setMarkerDir 0;
	_marker_x = createMarker ["77",[17566.2,14740.7,0]]; "77" SetMarkerShape "RECTANGLE"; "77" setMarkerSize [919.683,574.856]; "77" setMarkerDir 0;
	_marker_x = createMarker ["76",[18993.8,18350.7,0]]; "76" SetMarkerShape "RECTANGLE"; "76" setMarkerSize [689.077,1159.72]; "76" setMarkerDir 0;
	_marker_x = createMarker ["75",[10287,16808.8,0]]; "75" SetMarkerShape "ELLIPSE"; "75" setMarkerSize [779.623,1469.83]; "75" setMarkerDir 27.103;
	_marker_x = createMarker ["74",[7967.67,13991.7,0]]; "74" SetMarkerShape "ELLIPSE"; "74" setMarkerSize [1827.93,977.271]; "74" setMarkerDir 0;
	_marker_x = createMarker ["73",[2497.22,15388.7,0]]; "73" SetMarkerShape "RECTANGLE"; "73" setMarkerSize [1475.58,644.156]; "73" setMarkerDir 0;
	_marker_x = createMarker ["72",[11517.4,8608.55,0]]; "72" SetMarkerShape "ELLIPSE"; "72" setMarkerSize [251.406,183.438]; "72" setMarkerDir 0;
	_marker_x = createMarker ["71",[16505.4,6759.86,0]]; "71" SetMarkerShape "ELLIPSE"; "71" setMarkerSize [345.998,608.523]; "71" setMarkerDir 210.7;
	
	"Mark_Inser" setMarkerPos [13797.8,779.114,0];
	"M_helipad1" setMarkerPos [13838.5,809.967,0];
	"M_helipad2" setMarkerPos [13843.8,755.957,0];
};

//daryiah
if (CPC_loadedworld == "pja307") then {

	CPC_WorldType = "desert";
	publicVariable "CPC_WorldType";

	_marker_x = createMarker ["80",[12216.1,18560.9,0]]; "80" SetMarkerShape "RECTANGLE"; "80" setMarkerSize [500,500]; "80" setMarkerDir 0;
	_marker_x = createMarker ["81",[12469.7,17554.8,0]]; "81" SetMarkerShape "RECTANGLE"; "81" setMarkerSize [500,500]; "81" setMarkerDir 0;
	_marker_x = createMarker ["82",[12739.5,15836.8,0]]; "82" SetMarkerShape "RECTANGLE"; "82" setMarkerSize [1000,1000]; "82" setMarkerDir 0;
	_marker_x = createMarker ["83",[12717.6,14131.9,0]]; "83" SetMarkerShape "RECTANGLE"; "83" setMarkerSize [500,500]; "83" setMarkerDir 0;
	_marker_x = createMarker ["84",[11381.2,7518.43,0]]; "84" SetMarkerShape "RECTANGLE"; "84" setMarkerSize [700,700]; "84" setMarkerDir 0;
	_marker_x = createMarker ["86",[13611.3,12720.5,0]]; "86" SetMarkerShape "RECTANGLE"; "86" setMarkerSize [800,800]; "86" setMarkerDir 0;
	_marker_x = createMarker ["87",[14113.6,9157.65,0]]; "87" SetMarkerShape "RECTANGLE"; "87" setMarkerSize [1000,1000]; "87" setMarkerDir 0;
	_marker_x = createMarker ["88",[9794.28,7754.1,0]]; "88" SetMarkerShape "RECTANGLE"; "88" setMarkerSize [700,700]; "88" setMarkerDir 0;
	_marker_x = createMarker ["89",[13275.4,6706.64,0]]; "89" SetMarkerShape "RECTANGLE"; "89" setMarkerSize [900,900]; "89" setMarkerDir 0;
	_marker_x = createMarker ["90",[14926.1,4405.07,0]]; "90" SetMarkerShape "RECTANGLE"; "90" setMarkerSize [1200,1200]; "90" setMarkerDir 0;
	_marker_x = createMarker ["91",[13841.8,2784.14,0]]; "91" SetMarkerShape "RECTANGLE"; "91" setMarkerSize [700,700]; "91" setMarkerDir 0;
	_marker_x = createMarker ["92",[15139.8,2002.28,0]]; "92" SetMarkerShape "RECTANGLE"; "92" setMarkerSize [700,700]; "92" setMarkerDir 0;
	_marker_x = createMarker ["93",[14028.7,10914,0]]; "93" SetMarkerShape "RECTANGLE"; "93" setMarkerSize [800,800]; "93" setMarkerDir 0;
	_marker_x = createMarker ["94",[10563.9,9564.46,0]]; "94" SetMarkerShape "RECTANGLE"; "94" setMarkerSize [1000,1000]; "94" setMarkerDir 0;
	_marker_x = createMarker ["95",[12483.1,4445.84,0]]; "95" SetMarkerShape "RECTANGLE"; "95" setMarkerSize [400,400]; "95" setMarkerDir 0;
	_marker_x = createMarker ["96",[18493.8,5834.42,0]]; "96" SetMarkerShape "RECTANGLE"; "96" setMarkerSize [500,500]; "96" setMarkerDir 0;
	_marker_x = createMarker ["97",[16745.7,7544.46,0]]; "97" SetMarkerShape "RECTANGLE"; "97" setMarkerSize [700,700]; "97" setMarkerDir 0;
	_marker_x = createMarker ["98",[17972.7,3952.25,0]]; "98" SetMarkerShape "RECTANGLE"; "98" setMarkerSize [500,500]; "98" setMarkerDir 0;
	_marker_x = createMarker ["85",[8174.09,7029.82,0]]; "85" SetMarkerShape "RECTANGLE"; "85" setMarkerSize [700,700]; "85" setMarkerDir 0;
	_marker_x = createMarker ["99",[7451.88,2619.68,0]]; "99" SetMarkerShape "RECTANGLE"; "99" setMarkerSize [400,400]; "99" setMarkerDir 0;
	
	"Mark_Inser" setMarkerPos [5325.86,14558.6,0];
	"M_helipad1" setMarkerPos [5288,14527.8,0];
	"M_helipad2" setMarkerPos [5287.86,14592.1,0];
};



CPC_MarkersCreated = true;
publicVariable "CPC_MarkersCreated";

/*
if (CPC_loadedworld == "Altis") then {cpc_shop setpos [23729.7,16199.6,0.00143862];};
if (CPC_loadedworld == "Stratis") then {cpc_shop setpos [3265.57,5785.52,0.00144529];};
if (CPC_loadedworld == "Intro") then {cpc_shop setpos [2583.79,2808.39,0.00143909];};
if (CPC_loadedworld == "Sara") then {cpc_shop setpos [17288.8,14113.1,0.00143909];};
if (CPC_loadedworld == "SaraLite") then {cpc_shop setpos [4698.91,5768.17,0.00144958];};
if (CPC_loadedworld == "Sara_dbe1") then {cpc_shop setpos [7998.78,7774.97,0.00143433];};
if (CPC_loadedworld == "Chernarus") then {cpc_shop setpos [6298.27,7809.14,0.00143433];};
if (CPC_loadedworld == "Chernarus_Summer") then {cpc_shop setpos [3609.48,2167.72,0.00166082];};
if (CPC_loadedworld == "Porto") then {cpc_shop setpos [2091.05,2177.29,0.00154042];};
if (CPC_loadedworld == "FDF_Isle1_a") then {cpc_shop setpos [10222.5,8883.83,0.00143814];};
if (CPC_loadedworld == "Takistan") then {cpc_shop setpos [8254.76,2131.9,0.00143433];};
if (CPC_loadedworld == "utes") then {cpc_shop setpos [2970.26,4514.79,0.00143814];};
if (CPC_loadedworld == "Zargabad") then {cpc_shop setpos [3944.05,2766.71,0.00143623];};
if (CPC_loadedworld == "imrali") then {cpc_shop setpos [6020.89,7134.42,0.00143909];};
if (CPC_loadedworld == "gsep_zernovo") then {cpc_shop setpos [2702.21,648.074,0.00143909];};
if (CPC_loadedworld == "pja307") then {cpc_shop setpos [7095.95,6966.03,0.00140381];};
if (CPC_loadedworld == "MCN_Aliabad") then {cpc_shop setpos [2723.55,1217.55,0.00144958];};
if (CPC_loadedworld == "MCN_HazarKot") then {cpc_shop setpos [3246.67,2979.38,0.0015564];};
if (CPC_loadedworld == "Caribou") then {cpc_shop setpos [4752.1,4153.69,0.00136375];};
if (CPC_loadedworld == "Thirsk") then {cpc_shop setpos [680.827,660.464,0.00162697];};
if (CPC_loadedworld == "ThirskW") then {cpc_shop setpos [4553.56,2897.65,0.00149345];};
if (CPC_loadedworld == "smd_sahrani_a3") then {cpc_shop setpos [12300,6844.22,0.00145531];};
if (CPC_loadedworld == "Mountains_ACR") then {cpc_shop setpos [3287.3,4369.88,0.00146484];};
if (CPC_loadedworld == "Woodland_ACR") then {cpc_shop setpos [1614.21,1640.87,0.0015974];};
if (CPC_loadedworld == "Bootcamp_ACR") then {cpc_shop setpos [1021.84,3153.15,0.0015564];};
if (CPC_loadedworld == "Desert_E") then {cpc_shop setpos [1359.03,1451.62,0.0014267];};
if (CPC_loadedworld == "ProvingGrounds_PMC") then {cpc_shop setpos [719.613,1196.68,0.00143814];};
if (CPC_loadedworld == "Shapur_BAF") then {cpc_shop setpos [1559.18,1109.37,0.00140762];};
if (CPC_loadedworld == "IslaDuala3") then {cpc_shop setpos [4853.53,5181.87,0.00143909];};
if (CPC_loadedworld == "pja305") then {cpc_shop setpos [7910.61,3355.99,0.00145876];};
*/