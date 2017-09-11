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

CPC_MAP = toLower worldName;
publicVariable "CPC_MAP";

switch (CPC_MAP) do {

//Altis
case "altis" : {

	CPC_WorldType = "vanilla";
	publicVariable "CPC_WorldType";
	CPC_FullMoon = [2016,5,30,0,0];
	publicVariable "CPC_FullMoon";

	_marker_x = createMarker ["64",[22358.6,7595.3,0]]; "64" SetMarkerShape "RECTANGLE"; "64" setMarkerSize [413.912,647.154]; "64" setMarkerDir 148.972;
	_marker_x = createMarker ["65",[20721.4,10417.7,0]]; "65" SetMarkerShape "RECTANGLE"; "65" setMarkerSize [515.093,1368.83]; "65" setMarkerDir 190.719;
	_marker_x = createMarker ["66",[7008.93,15672.9,0]]; "66" SetMarkerShape "RECTANGLE"; "66" setMarkerSize [1843.41,485.569]; "66" setMarkerDir 177.321;
	_marker_x = createMarker ["67",[10083.5,12066.3,0]]; "67" SetMarkerShape "RECTANGLE"; "67" setMarkerSize [424.325,1271.44]; "67" setMarkerDir 129.763;
	_marker_x = createMarker ["68",[24771.5,19745.8,0]]; "68" SetMarkerShape "ELLIPSE"; "68" setMarkerSize [737.336,899.925]; "68" setMarkerDir 89.533;
	_marker0 = createMarker ["69", [19492.094,12333.145,0]]; "69" setMarkerShape "ELLIPSE";	"69" setMarkerSize [600, 1500];	"69" setMarkerDir 70.668; 
	_marker1 = createMarker ["70", [22872.4,20867.8,0]]; "70" setMarkerShape "RECTANGLE";	"70" setMarkerSize [600, 800];	"70" setMarkerDir 336.272;
	_marker2 = createMarker ["71", [21988.215,19201.723,0]]; "71" setMarkerShape "RECTANGLE";	"71" setMarkerSize [600, 800];	"71" setMarkerDir 41.943;
	_marker3 = createMarker ["72", [19806.152,16299.153,0]]; "72" setMarkerShape "RECTANGLE";	"72" setMarkerSize [700, 900];	"72" setMarkerDir 0;
	_marker4 = createMarker ["73", [9639.513,21193.887,0]];	"73" setMarkerShape "ELLIPSE";	"73" setMarkerSize [600, 800];	"73" setMarkerDir 30.439;
	_marker5 = createMarker ["74", [8313.503,21418.5,0]]; "74" setMarkerShape "RECTANGLE";	"74" setMarkerSize [700, 1300];	"74" setMarkerDir 0;
	_marker6 = createMarker ["75", [13406.479,15835.049,0]]; "75" setMarkerShape "ELLIPSE";	"75" setMarkerSize [600, 800];	"75" setMarkerDir 0;
	_marker7 = createMarker ["76", [22552.45,16711.605,0]];	"76" setMarkerShape "ELLIPSE";	"76" setMarkerSize [700, 900];	"76" setMarkerDir 293.209;
	_marker8 = createMarker ["77", [8048.571,12673.027,0]];	"77" setMarkerShape "RECTANGLE";	"77" setMarkerSize [700, 1100];	"77" setMarkerDir 0;
	_marker9 = createMarker ["78", [15818.385,19036.488,0]]; "78" setMarkerShape "ELLIPSE";	"78" setMarkerSize [1000, 1200];	"78" setMarkerDir 322.814;
	_marker10 = createMarker ["79", [8446.367,19307.980,0]]; "79" setMarkerShape "RECTANGLE";	"79" setMarkerSize [800, 800];	"79" setMarkerDir 0;
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

//Tanoa
case "tanoa" : {

	CPC_WorldType = "fidji";
	publicVariable "CPC_WorldType";
	CPC_FullMoon = [2016,6,30,0,0];
	publicVariable "CPC_FullMoon";

	_marker_x = createMarker ["99",[4593.54,3280.12,0]]; "99" SetMarkerShape "ELLIPSE"; "99" setMarkerSize [580.515,1080.09]; "99" setMarkerDir 0;
	_marker_x = createMarker ["98",[5770.36,4597.66,0]]; "98" SetMarkerShape "ELLIPSE"; "98" setMarkerSize [1244.13,323.702]; "98" setMarkerDir 198.442;
	_marker_x = createMarker ["97",[3210.33,2735.82,0]]; "97" SetMarkerShape "ELLIPSE"; "97" setMarkerSize [430.132,654.708]; "97" setMarkerDir 137.154;
	_marker_x = createMarker ["96",[5684.11,9323.27,0]]; "96" SetMarkerShape "RECTANGLE"; "96" setMarkerSize [442.956,820.482]; "96" setMarkerDir 269.954;
	_marker_x = createMarker ["95",[9142.05,10927.5,0]]; "95" SetMarkerShape "ELLIPSE"; "95" setMarkerSize [649.63,605.116]; "95" setMarkerDir 0;
	_marker_x = createMarker ["94",[9826.88,9704.25,0]]; "94" SetMarkerShape "ELLIPSE"; "94" setMarkerSize [972.167,402.178]; "94" setMarkerDir 190.598;
	_marker_x = createMarker ["93",[9529.81,7310.09,0]]; "93" SetMarkerShape "ELLIPSE"; "93" setMarkerSize [1031.25,817.616]; "93" setMarkerDir 0;
	_marker_x = createMarker ["92",[11447.8,7454.2,0]]; "92" SetMarkerShape "RECTANGLE"; "92" setMarkerSize [875.616,778.936]; "92" setMarkerDir 0;
	_marker_x = createMarker ["91",[6125.73,7875.56,0]]; "91" SetMarkerShape "ELLIPSE"; "91" setMarkerSize [688.832,506.22]; "91" setMarkerDir 202.944;
	_marker_x = createMarker ["90",[7233.76,10893.6,0]]; "90" SetMarkerShape "ELLIPSE"; "90" setMarkerSize [1042.33,660.798]; "90" setMarkerDir 191.669;
	_marker_x = createMarker ["89",[3189.54,6133.91,0]]; "89" SetMarkerShape "ELLIPSE"; "89" setMarkerSize [1051.81,543.481]; "89" setMarkerDir 203.112;
	_marker_x = createMarker ["88",[1897.84,7372.51,0]]; "88" SetMarkerShape "ELLIPSE"; "88" setMarkerSize [450.158,1099.79]; "88" setMarkerDir 151.621;
	_marker_x = createMarker ["87",[8112.41,9099.19,0]]; "87" SetMarkerShape "ELLIPSE"; "87" setMarkerSize [571.829,667.089]; "87" setMarkerDir 225.383;
	_marker_x = createMarker ["86",[2887.86,12345.1,0]]; "86" SetMarkerShape "ELLIPSE"; "86" setMarkerSize [657.894,1579.92]; "86" setMarkerDir 208.319;
	_marker_x = createMarker ["85",[12030.9,9520.62,0]]; "85" SetMarkerShape "ELLIPSE"; "85" setMarkerSize [541.788,674.784]; "85" setMarkerDir 212.459;
	_marker_x = createMarker ["84",[12801.2,7937.67,0]]; "84" SetMarkerShape "ELLIPSE"; "84" setMarkerSize [955.759,314.487]; "84" setMarkerDir 194.387;
		
	"Mark_Inser" setMarkerPos [11687,13115.1,0];
	"M_helipad1" setMarkerPos [11778.7,13115.9,0];
	"M_helipad2" setMarkerPos [11860.9,13089.2,0];
};

//Takistan
case "takistan" : {

	CPC_WorldType = "desert";
	publicVariable "CPC_WorldType";
	CPC_FullMoon = [2016,6,29,0,0];
	publicVariable "CPC_FullMoon";

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

//chernarus
case "chernarus" : {

	CPC_WorldType = "chern";
	publicVariable "CPC_WorldType";
	CPC_FullMoon = [2016,3,30,0,0];
	publicVariable "CPC_FullMoon";

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

//chernarus summer
case "chernarus_summer" : {

	CPC_WorldType = "chern";
	publicVariable "CPC_WorldType";
	CPC_FullMoon = [2016,3,30,0,0];
	publicVariable "CPC_FullMoon";

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
case "isladuala3" : {

	CPC_WorldType = "afrique";
	publicVariable "CPC_WorldType";
	CPC_FullMoon = [2016,6,29,0,0];
	publicVariable "CPC_FullMoon";

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

//Sahrani
case "sara" : {

	CPC_WorldType = "vanilla";
	publicVariable "CPC_WorldType";
	CPC_FullMoon = [2016,6,29,0,0];
	publicVariable "CPC_FullMoon";

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
case "fdf_isle1_a" : {

	CPC_WorldType = "chernarus";
	publicVariable "CPC_WorldType";
	CPC_FullMoon = [2016,3,30,0,0];
	publicVariable "CPC_FullMoon";

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
case "woodland_acr" : {

	CPC_WorldType = "chernarus";
	publicVariable "CPC_WorldType";
	CPC_FullMoon = [2016,3,30,0,0];
	publicVariable "CPC_FullMoon";

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
case "pja305" : {

	CPC_WorldType = "jungle";
	publicVariable "CPC_WorldType";
	CPC_FullMoon = [2016,6,29,0,0];
	publicVariable "CPC_FullMoon";

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
	_marker_x = createMarker ["88",[16505.4,6759.86,0]]; "88" SetMarkerShape "ELLIPSE"; "88" setMarkerSize [345.998,608.523]; "88" setMarkerDir 210.7;
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
	
	"Mark_Inser" setMarkerPos [13797.8,779.114,0];
	"M_helipad1" setMarkerPos [13838.5,809.967,0];
	"M_helipad2" setMarkerPos [13843.8,755.957,0];
};

//daryiah
case "pja307" : {

	CPC_WorldType = "desert";
	publicVariable "CPC_WorldType";
	CPC_FullMoon = [2016,6,29,0,0];
	publicVariable "CPC_FullMoon";

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

//Nogova
case "noe" : {

	CPC_WorldType = "vanilla";
	publicVariable "CPC_WorldType";
	CPC_FullMoon = [2016,6,29,0,0];
	publicVariable "CPC_FullMoon";


	_marker_x = createMarker ["99",[9406.34,3844.64,0]]; "99" SetMarkerShape "ELLIPSE"; "99" setMarkerSize [653.454,1167.76]; "99" setMarkerDir 152.283;
	_marker_x = createMarker ["98",[11361.2,4256.65,0]]; "98" SetMarkerShape "ELLIPSE"; "98" setMarkerSize [608.971,1108.82]; "98" setMarkerDir 188.572;
	_marker_x = createMarker ["97",[9769.39,6369.1,0]]; "97" SetMarkerShape "ELLIPSE"; "97" setMarkerSize [922.197,509.972]; "97" setMarkerDir 195.764;
	_marker_x = createMarker ["96",[10127.7,7946.65,0]]; "96" SetMarkerShape "ELLIPSE"; "96" setMarkerSize [1219.74,707.624]; "96" setMarkerDir 159.768;
	_marker_x = createMarker ["95",[11072.6,10286.1,0]]; "95" SetMarkerShape "ELLIPSE"; "95" setMarkerSize [488.309,886.193]; "95" setMarkerDir 0;
	_marker_x = createMarker ["94",[2757.97,4136.47,0]]; "94" SetMarkerShape "ELLIPSE"; "94" setMarkerSize [504.474,1364.57]; "94" setMarkerDir 241.849;
	_marker_x = createMarker ["93",[2256.01,7289.57,0]]; "93" SetMarkerShape "ELLIPSE"; "93" setMarkerSize [496.106,1302.63]; "93" setMarkerDir 210.78;
	_marker_x = createMarker ["92",[5317.49,6707.62,0]]; "92" SetMarkerShape "ELLIPSE"; "92" setMarkerSize [1074.61,988.864]; "92" setMarkerDir 0;
	_marker_x = createMarker ["91",[5485.68,4036.05,0]]; "91" SetMarkerShape "ELLIPSE"; "91" setMarkerSize [1239.02,783.374]; "91" setMarkerDir 214.445;
	_marker_x = createMarker ["90",[7461.18,6452.24,0]]; "90" SetMarkerShape "ELLIPSE"; "90" setMarkerSize [576.517,1155]; "90" setMarkerDir 188.973;
	_marker_x = createMarker ["89",[4192.9,8627.67,0]]; "89" SetMarkerShape "ELLIPSE"; "89" setMarkerSize [933.118,1176.46]; "89" setMarkerDir 153.567;
	_marker_x = createMarker ["88",[1037.44,11128.2,0]]; "88" SetMarkerShape "ELLIPSE"; "88" setMarkerSize [571.067,941.602]; "88" setMarkerDir 161.174;
	_marker_x = createMarker ["87",[7586.1,10025.3,0]]; "87" SetMarkerShape "ELLIPSE"; "87" setMarkerSize [858.925,494.953]; "87" setMarkerDir 0;
	
	"Mark_Inser" setMarkerPos [8903.34,12557,0];
	"M_helipad1" setMarkerPos [8971.26,12574.6,0];
	"M_helipad2" setMarkerPos [9009.84,12575,0];
};

//Everon
case "eden" : {

	CPC_WorldType = "vanilla";
	publicVariable "CPC_WorldType";
	CPC_FullMoon = [2016,6,29,0,0];
	publicVariable "CPC_FullMoon";

	_marker_x = createMarker ["99",[4143.5,6022.54,0]]; "99" SetMarkerShape "ELLIPSE"; "99" setMarkerSize [1194.55,1004.47]; "99" setMarkerDir 202.986;
	_marker_x = createMarker ["98",[3502.96,4437.24,0]]; "98" SetMarkerShape "ELLIPSE"; "98" setMarkerSize [1328.82,593.151]; "98" setMarkerDir 204.042;
	_marker_x = createMarker ["97",[2524.88,6426.4,0]]; "97" SetMarkerShape "RECTANGLE"; "97" setMarkerSize [285.833,932.175]; "97" setMarkerDir 0;
	_marker_x = createMarker ["96",[7633.85,2775.25,0]]; "96" SetMarkerShape "ELLIPSE"; "96" setMarkerSize [472.262,1394.58]; "96" setMarkerDir 165.148;
	_marker_x = createMarker ["95",[9261.05,3633,0]]; "95" SetMarkerShape "RECTANGLE"; "95" setMarkerSize [325.965,1464.84]; "95" setMarkerDir 151.02;
	_marker_x = createMarker ["94",[6369.11,7960.48,0]]; "94" SetMarkerShape "ELLIPSE"; "94" setMarkerSize [1149.31,668.067]; "94" setMarkerDir 148.887;
	_marker_x = createMarker ["93",[6252.49,5804.72,0]]; "93" SetMarkerShape "ELLIPSE"; "93" setMarkerSize [662.495,1329.76]; "93" setMarkerDir 0;
	_marker_x = createMarker ["92",[4914.12,8974.39,0]]; "92" SetMarkerShape "ELLIPSE"; "92" setMarkerSize [494.935,1370.63]; "92" setMarkerDir 206.219;
	
	"Mark_Inser" setMarkerPos [4862.15,11870.1,0];
	"M_helipad1" setMarkerPos [4871.29,11817.6,0];
	"M_helipad2" setMarkerPos [4872.43,11771.4,0];
};

};

//Cacher les marqueurs de zone
for "_x" from 1 to 100 do
{
	format ["%1",_x] setMarkerAlpha 0;
};


CPC_MarkersCreated = true;
publicVariable "CPC_MarkersCreated";
