/*-----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
***	Author: Hardballer

***	Description : 
	Loadouts de la mission

*** Utilisation :
	1/ Copiez les fichiers 'loadout.sqf', 'initPlayerLocal.sqf' et 'inventory_briefing.sqf' dans le dossier de votre mission.
	2/ Modifiez le fichier loadout.sqf à votre convenance.
		- Vous pouvez creer vos loadouts dans l'arsenal virtuel de Arma 3, les exporter avec la commande ingame et les coller dans le script comme ci-dessous.
		- Une fois ceci fait, remplacez tout les 'this' par '_unit'.
	3/ Dans l'éditeur, placez la commande ci-dessous dans les init d'unités jouables pour leur attribuer le loadout souhaité :
		this setVariable ["loadout", "cc_sl"];
		
	PS :Dans l'exemple ci-dessous les lignes des commentaires issues de l'exportation avec l'arsenal vitruel ont été supprimées pour une meilleure lisibilité.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/
private ["_rhsennemy","_uniform","_helmet","_nvg","_lamp",];

hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	_rhsennemy = false;
	if ((paramsArray select 6) in [0,2,14,100,106]) then {_rhsennemy = true};
	_nvg = false;
	_lamp = false;
	_uniform = [];
	_helmet = [];
	//WDL
	if (worldName in ["Altis","Tanoa","Chernarus","Sara","FDF_Isle1_a","Woodland_ACR","pja305","noe","eden"]) then 
	{
		_uniform = [];
		_helmet = [];
	};
	//DES
	if (worldName in ["Takistan","IslaDuala3","pja307"]) then 
	{
		_uniform = [];
		_helmet = [];
	};
	if ((paramsArray select 3) == 1) then {_nvg = true};
	if ((paramsArray select 3) == 2) then {_lamp = true};
	
	switch _loadout do 
	{
		case "cc_off": {[_unit] call loadoutCC_OFF}; // 1
		case "cc_tl": {[_unit] call loadoutCC_TL}; // 2
		case "cc_doc": {[_unit] call loadoutCC_DOC}; //3
		case "cc_ar": {[_unit] call loadoutCC_AR}; //4
		case "cc_aar": {[_unit] call loadoutCC_AAR}; //5
		case "cc_mg": {[_unit] call loadoutCC_MG}; //6
		case "cc_amg": {[_unit] call loadoutCC_AMG}; //7
		case "cc_at": {[_unit] call loadoutCC_AT}; //8
		case "cc_aat": {[_unit] call loadoutCC_AAT}; //9
		case "cc_demo": {[_unit] call loadoutCC_DEMO}; //10
		case "cc_m": {[_unit] call loadoutCC_M}; //11
		case "cc_gl": {[_unit] call loadoutCC_GL}; //12
		case "cc_a": {[_unit] call loadoutCC_A}; //13
		case "cc_lat": {[_unit] call loadoutCC_LAT}; //14
		case "cc_r": {[_unit] call loadoutCC_R}; //15
		case "cc_crew": {[_unit] call loadoutCC_CREW}; //16
		case "cc_pilot": {[_unit] call loadoutCC_PILOT}; //17
		case "cc_sniper": {[_unit] call loadoutCC_SNIPER}; //18
		case "cc_obs": {[_unit] call loadoutCC_OBS}; //19
		case "cc_jtac": {[_unit] call loadoutCC_JTAC}; //20
	};
};



loadoutCC_OFF = //
{
	_unit = _this select 0;
	

};

loadoutCC_TL = //
{
	_unit = _this select 0;
	

};

loadoutCC_DOC = //
{
	_unit = _this select 0;
	

};

loadoutCC_AR = //
{
	_unit = _this select 0;
	

};

loadoutCC_AAR = //
{
	_unit = _this select 0;
	

};

loadoutCC_MG = //
{
	_unit = _this select 0;
	

};

loadoutCC_AMG = //
{
	_unit = _this select 0;
	

};

loadoutCC_AT = //
{
	_unit = _this select 0;
	

};

loadoutCC_AAT = //
{
	_unit = _this select 0;
	

};

loadoutCC_DEMO = //
{
	_unit = _this select 0;
	

};

loadoutCC_M = //
{
	_unit = _this select 0;
	

};

loadoutCC_GL = //
{
	_unit = _this select 0;
	

};

loadoutCC_A = //
{
	_unit = _this select 0;
	

};

loadoutCC_LAT = //
{
	_unit = _this select 0;
	

};

loadoutCC_R = //
{
	_unit = _this select 0;
	

};

loadoutCC_CREW = //
{
	_unit = _this select 0;
	

};

loadoutCC_PILOT = //
{
	_unit = _this select 0;
	

};

loadoutCC_SNIPER = //
{
	_unit = _this select 0;
	

};

loadoutCC_OBS = //
{
	_unit = _this select 0;
	

};

loadoutCC_JTAC = //
{
	_unit = _this select 0;
	

};
