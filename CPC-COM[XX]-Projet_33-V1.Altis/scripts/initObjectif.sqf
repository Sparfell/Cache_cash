// Attente de la création des marqueurs pour désigner la zone de mission
waitUntil {CPC_MarkersCreated};

call compile preprocessfilelinenumbers "shk_pos\shk_pos_init.sqf";

// Là il faut gérer les différents types de missions crées

// Switch entre les différents types de missions
switch (paramsArray select 0) do {
	case 0 : {
		_rnd = floor random 3
		switch _rnd do {
				case 0 : {null = [] execVM "scripts\mission\cache.sqf";};
				case 1 : {null = [] execVM "scripts\mission\escort.sqf";};
				case 2 : {null = [] execVM "scripts\mission\intel.sqf";};
		};
	};
	case 1 : {null = [] execVM "scripts\mission\cache.sqf";};
	case 2 : {null = [] execVM "scripts\mission\escort.sqf";};
	case 3 : {null = [] execVM "scripts\mission\intel.sqf";};
};