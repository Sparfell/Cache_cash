/*
Script d'extraction héliportée par Sparfell. V3
Merci à Scarlok, Warzen et Hardballer pour leur aide.

Effet :
Ce script crée un hélico IA qui vient chercher les joueur là où ils le souhaitent à la fin de la mission.
L'hélico peut être appelée à condition d'avoir la bonne radio ACRE réglée sur bon canal.
Lorsque c'est le cas, une action apparait dans le menu molette du joueur.
Lorsqu'il l'utilise, il ne lui reste plus qu'à ouvrir sa carte et à cliquer à l'endroit désiré pour désigner la LZ.
Une fois tout le monde à bord, utilisez l'action molette "Partir".

Utilisation :
1/ Placer le dossier "CPC_EXTRA" dans le dossier de la mission.
2/ Ajouter la ligne suivante dans fichier "init.sqf" de la mission :
null = execVM "CPC_EXTRA\call_extraction.sqf";
3/ Dans l'éditeur, ajouter un marqueur nommé "CPC_EXTRA_MSpawnHelo", celui-ci désignera le lieu de spawn de l'hélico.
4/ Modifier les paramètres comme désiré.
5/ Si vous désirez couper la mission lorsque l'hélico est sur le chemin du retour, utilisz la condition "CPC_EXTRA_LeaveLZ" et appliquez le compte à rebours de votre choix.

A propos de l'ouverture des portes :
le nom des anims pour les hélicos vanilla peuvent être trouvés là :
https://community.bistudio.com/wiki/Arma_3_Assets
ex pour le mohawk (I_Heli_Transport_02_F) :
rampe arrière : CargoRamp_Open
portes latérales : Door_Back_L Door_Back_R 
le 1 et le 2 sont là pour permettre l'ouverture de plusieurs portes
*/

// Paramètres modifiables à votre convenance
switch (paramsArray select 5) do {
		case 0 : {CPC_EXTRA_HeloType = "RHS_CH_47F";}; // US RHS
		case 1 : {CPC_EXTRA_HeloType = "CUP_B_CH53E_USMC";}; // US CUP
		case 2 : {CPC_EXTRA_HeloType = "RHS_Mi8mt_vvsc";}; // RU RHS
		case 3 : {CPC_EXTRA_HeloType = "RHS_Mi8mt_vvsc";}; // RU CUP
		case 4 : {CPC_EXTRA_HeloType = "RHS_Mi8amt_chdkz";}; // INS RHS
		case 5 : {CPC_EXTRA_HeloType = "RHS_Mi8amt_chdkz";}; // INS CUP
		case 6 : {CPC_EXTRA_HeloType = "CUP_C_Mi17_Civilian_RU";}; // INS TAK RHS
		case 7 : {CPC_EXTRA_HeloType = "CUP_C_Mi17_Civilian_RU";}; // INS TAK
		case 8 : {CPC_EXTRA_HeloType = "CUP_O_Mi17_TK";}; // TK RHS
		case 9 : {CPC_EXTRA_HeloType = "CUP_O_Mi17_TK";}; // TK CUP
		case 10 : {CPC_EXTRA_HeloType = "CUP_B_CH53E_GER";}; // GER Desert
		case 11 : {CPC_EXTRA_HeloType = "CUP_B_CH53E_GER";}; // GER Woodland
		case 12 : {CPC_EXTRA_HeloType = "B_Heli_Transport_03_unarmed_F";}; // OTAN
		case 13 : {CPC_EXTRA_HeloType = "O_Heli_Transport_04_covered_F";}; // CSAT
		case 14 : {CPC_EXTRA_HeloType = "I_Heli_Transport_02_F";}; // AAF
		case 15 : {CPC_EXTRA_HeloType = "CPC_Duala_B_GFD_SA330";}; // GFD
		case 16 : {CPC_EXTRA_HeloType = "CUP_C_Mi17_Civilian_RU";}; // NPFD
		case 17 : {CPC_EXTRA_HeloType = "CUP_I_SA330_Puma_HC1_RACS";}; // RACS
		case 18 : {CPC_EXTRA_HeloType = "CUP_O_Mi8_SLA_1";}; // SLA
		case 19 : {CPC_EXTRA_HeloType = "RHS_Mi8mt_vvsc";}; // Spetsnaz RHS
		case 20 : {CPC_EXTRA_HeloType = "RHS_CH_47F";}; // USMC SF SCAR
		case 21 : {CPC_EXTRA_HeloType = "RHS_CH_47F";}; // commando jungle
		case 22 : {CPC_EXTRA_HeloType = "CUP_B_Merlin_HC3_GB";}; // BAF desert
		case 23 : {CPC_EXTRA_HeloType = "CUP_B_Merlin_HC3_GB";}; // BAF woodland
		case 24 : {CPC_EXTRA_HeloType = "RHS_Mi8amt_chdkz";}; // Chedaki
		case 25 : {CPC_EXTRA_HeloType = "RHS_Mi8mt_vvsc";}; // URSS Afgha
		case 26 : {CPC_EXTRA_HeloType = "RHS_Mi8mt_vvsc";}; // RU modern RHS
};
CPC_EXTRA_AcreRadio = "ACRE_PRC148";					//Le Type de radio requis pour faire une demande d'extraction (classname)
CPC_EXTRA_AcreChan = 5;									//Le Channel radio qui doit être utilisé pour faire une demande d'extraction
CPC_EXTRA_HeloSide = blufor;						//Le camp de l'hélico. Peut être independent, opfor, blufor ou civilian (utiliser le side joueur)
CPC_EXTRA_HeloLandingType = "TR UNLOAD";				//Mode d'atterrissage : "TR UNLOAD" = descente frontale lente, "MOVE" = passe au dessus puis demi tour et posé.

switch (CPC_EXTRA_HeloType) do {
		case "RHS_CH_47F" : 					{CPC_EXTRA_DoorAnimName1 = "ramp_anim"; CPC_EXTRA_DoorAnimName2 = ""; CPC_EXTRA_AnimType = 2;};
		case "CUP_B_CH53E_USMC" : 				{CPC_EXTRA_DoorAnimName1 = "ramp_bottom"; CPC_EXTRA_DoorAnimName2 = "ramp_top"; CPC_EXTRA_AnimType = 1;};
		case "RHS_Mi8mt_vvsc" : 				{CPC_EXTRA_DoorAnimName1 = "RearDoors"; CPC_EXTRA_DoorAnimName2 = ""; CPC_EXTRA_AnimType = 2;};
		case "RHS_Mi8amt_chdkz" : 				{CPC_EXTRA_DoorAnimName1 = "RearDoors"; CPC_EXTRA_DoorAnimName2 = ""; CPC_EXTRA_AnimType = 2;};
		case "CUP_C_Mi17_Civilian_RU" : 		{CPC_EXTRA_DoorAnimName1 = ""; CPC_EXTRA_DoorAnimName2 = ""; CPC_EXTRA_AnimType = 1;};
		case "CUP_O_Mi17_TK" : 					{CPC_EXTRA_DoorAnimName1 = ""; CPC_EXTRA_DoorAnimName2 = ""; CPC_EXTRA_AnimType = 1;};
		case "CUP_B_CH53E_GER" : 				{CPC_EXTRA_DoorAnimName1 = "ramp_bottom"; CPC_EXTRA_DoorAnimName2 = "ramp_top"; CPC_EXTRA_AnimType = 1;};
		case "B_Heli_Transport_03_unarmed_F" : 	{CPC_EXTRA_DoorAnimName1 = "Door_rear_source"; CPC_EXTRA_DoorAnimName2 = ""; CPC_EXTRA_AnimType = 2;};
		case "O_Heli_Transport_04_covered_F" : 	{CPC_EXTRA_DoorAnimName1 = "Door_4_source"; CPC_EXTRA_DoorAnimName2 = "Door_5_source"; CPC_EXTRA_AnimType = 2;};
		case "I_Heli_Transport_02_F" : 			{CPC_EXTRA_DoorAnimName1 = "CargoRamp_Open"; CPC_EXTRA_DoorAnimName2 = "Door_Back_R"; CPC_EXTRA_AnimType = 2;};
		case "CPC_Duala_B_GFD_SA330" : 			{CPC_EXTRA_DoorAnimName1 = "ofrp_puma_porte_droite"; CPC_EXTRA_DoorAnimName2 = "ofrp_puma_porte_gauche"; CPC_EXTRA_AnimType = 1;};
		case "CUP_I_SA330_Puma_HC1_RACS" : 		{CPC_EXTRA_DoorAnimName1 = "ofrp_puma_porte_droite"; CPC_EXTRA_DoorAnimName2 = "ofrp_puma_porte_gauche"; CPC_EXTRA_AnimType = 1;};
		case "CUP_O_Mi8_SLA_1" : 				{CPC_EXTRA_DoorAnimName1 = ""; CPC_EXTRA_DoorAnimName2 = ""; CPC_EXTRA_AnimType = 1;};
		case "CUP_B_Merlin_HC3_GB" : 			{CPC_EXTRA_DoorAnimName1 = ""; CPC_EXTRA_DoorAnimName2 = ""; CPC_EXTRA_AnimType = 1;};
};

// Ne rien changer après ça

CPC_EXTRA_Created = false;
CPC_EXTRA_CanCallFirst = false;

waitUntil {time > 0};
while {alive player} do {
	sleep 1;
	if ((([] call acre_api_fnc_getCurrentRadioChannelNumber)-1 == CPC_EXTRA_AcreChan) AND (([([] call acre_api_fnc_getCurrentRadio)] call acre_api_fnc_getBaseRadio) == CPC_EXTRA_AcreRadio))
		then {if (!CPC_EXTRA_CanCallFirst) then {ActionAppelExtract = player addAction ["<t color='#892D97'>Appel Extraction</t>", "CPC_EXTRA\create_extraction.sqf",0,0,false,true,"","((_target == _this) AND (!CPC_EXTRA_Created))"]; CPC_EXTRA_CanCallFirst = true;};}
		else {if (CPC_EXTRA_CanCallFirst) then {player removeaction ActionAppelExtract; CPC_EXTRA_CanCallFirst = false;};};
	sleep 3;
};
