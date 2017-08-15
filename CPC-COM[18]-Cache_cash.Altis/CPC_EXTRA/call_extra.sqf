/*
	Script d'insertion/extraction héliportée
	Auteur : Sparfell
	Merci à Scarlok, Warzen et Hardballer pour leur aide.

	Effet :
	Ce script crée un hélico IA qui vient chercher les joueur là où ils le souhaitent à la fin de la mission.
	L'hélico peut être appelée à condition d'avoir la bonne radio ACRE réglée sur bon canal.
	Lorsque c'est le cas, une action apparait dans le menu molette du joueur.
	Lorsqu'il l'utilise, il ne lui reste plus qu'à ouvrir sa carte et à cliquer à l'endroit désiré pour désigner la LZ.
	Une fois tout le monde à bord, utilisez l'action molette "Partir".
	Note : Si vous désirez couper la mission lorsque l'hélico est sur le chemin du retour, utilisz la condition "CPC_EXTRA_LeaveLZ" et appliquez le compte à rebours de votre choix.

	Paramètres :
	_this select 0: Type de radio (classname)
	_this select 1: Channel qui doit être sélectionné (number)
	_this select 2: Type de l'hélico (classname)
	_this select 3: Side de l'hélico (side)
	_this select 4: position de départ de l'hélico (position)
	_this select 5: (optionnel) Type d'atterissage ("TR UNLOAD" = descente frontale lente (default), "MOVE" = passe au dessus puis demi tour et posé)
	
	Exemple :
	Ajoutez la ligne suivante dans le fichier "init.sqf" de votre mission et modifiez les paramètres comme désiré
	null = ["ACRE_PRC148",5,independent,"I_Heli_Transport_02_F",(MarkerPos "mk_pos_extra")] execVM "CPC_EXTRA\call_extra.sqf";
	
	Note : Si vous désirez couper la mission lorsque l'hélico est sur le chemin du retour, utilisz la condition "CPC_EXTRA_LeaveLZ" et appliquez le compte à rebours de votre choix.
*/

private ["_radio","_chan","_action","_HasAction","_acre"];

_radio = _this select 0;
_chan = _this select 1;
CPC_EXTRA_Side = _this select 2;
switch (paramsArray select 5) do {
		case 0 : {CPC_EXTRA_Veh = "B_Heli_Transport_03_unarmed_F";}; // NATO
		case 1 : {CPC_EXTRA_Veh = "O_Heli_Transport_04_covered_F";}; // CSAT
		case 2 : {CPC_EXTRA_Veh = "I_Heli_Transport_02_F";}; // AAF
		case 3 : {CPC_EXTRA_Veh = "RHS_CH_47F";}; // US Army RHS
		case 4 : {CPC_EXTRA_Veh = "RHS_CH_47F";}; // USMC RHS
		case 5 : {CPC_EXTRA_Veh = "RHS_CH_47F";}; // US SF RHS
		case 6 : {CPC_EXTRA_Veh = "RHS_Mi8AMT_vvsc";}; // RU 2000
		case 7 : {CPC_EXTRA_Veh = "RHS_Mi8AMT_vvsc";}; // RU 2015
		case 8 : {CPC_EXTRA_Veh = "RHS_Mi8AMT_vvsc";}; // RU SF
		case 9 : {CPC_EXTRA_Veh = "CUP_B_CH53E_GER";}; // KSK
		case 10 : {CPC_EXTRA_Veh = "CUP_B_Merlin_HC3_GB";}; // BAF
		case 11 : {CPC_EXTRA_Veh = "CUP_I_SA330_Puma_HC1_RACS";}; // RACS
		case 12 : {CPC_EXTRA_Veh = "CUP_O_Mi17_TK";}; // TAK
		case 13 : {CPC_EXTRA_Veh = "rhsgref_ins_Mi8amt";}; // INS
		case 14 : {CPC_EXTRA_Veh = "CUP_C_Mi17_Civilian_RU";}; // TAK INS
		case 15 : {CPC_EXTRA_Veh = "rhssaf_airforce_ht48";}; // SAF
		case 16 : {CPC_EXTRA_Veh = "rhsgref_cdf_b_reg_Mi8amt";}; // CDF
		case 17 : {CPC_EXTRA_Veh = "MU_MERC_Mohawk";}; // PMC
		case 18 : {CPC_EXTRA_Veh = "CUP_B_SA330_Puma_HC2_BAF";}; // FR
};
CPC_EXTRA_Pos = _this select 4;
if (count _this > 5) then {
	CPC_EXTRA_Landing = _this select 5;
} else {
	CPC_EXTRA_Landing = "TR UNLOAD";
};
CPC_EXTRA_LeaveLZ = false;
CPC_EXTRA_Created = false;

waitUntil {time > 0};

if (isClass(configFile >> "CfgPatches" >> "acre_main")) then {_acre = true;} else {_acre = false;};

if (hasInterface) then {
	_HasAction = false;
	if (_acre) then {
		while {alive player} do {
			if ((([] call acre_api_fnc_getCurrentRadioChannelNumber)-1 == _chan) AND (([([] call acre_api_fnc_getCurrentRadio)] call acre_api_fnc_getBaseRadio) == _radio)) then {
				if (!_HasAction) then {
					_action = player addAction ["<t color='#892D97'>Appel Extraction</t>", "CPC_EXTRA\create_extra.sqf",0,0,false,true,"","!CPC_EXTRA_Created"];
					_HasAction = true;
				};
			} else {
				if (_HasAction) then {
					player removeaction _action; _HasAction = false;
				};
			};
			sleep 4;
		};
	} else {
		while {alive player} do {
			if (isFormationLeader player) then {
				if (!_HasAction) then {
					_action = player addAction ["<t color='#892D97'>Appel Extraction</t>", "CPC_EXTRA\create_extra.sqf",0,0,false,true,"","!CPC_EXTRA_Created"];
					_HasAction = true;
				};
			} else {
				if (_HasAction) then {
					player removeaction _action; _HasAction = false;
				};
			};
			sleep 4;
		};
	};
};
