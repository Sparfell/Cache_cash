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
		this setVariable ["loadout", "cc_r"];
		
	PS :Dans l'exemple ci-dessous les lignes des commentaires issues de l'exportation avec l'arsenal vitruel ont été supprimées pour une meilleure lisibilité.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/


hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	switch _loadout do 
	{
		case "cc_r": {[_unit] call loadoutCC_R};
		case "cc_sl": {[_unit] call loadoutCC_SL};
	};
};



loadoutCC_R = //
{
	_unit = _this select 0;
	
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	_unit forceAddUniform "U_I_OfficerUniform";
	for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_9x21_Mag";};
	_unit addVest "V_BandollierB_oli";
	for "_i" from 1 to 3 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_9x21_Mag";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "Chemlight_green";
	_unit addHeadgear "H_Beret_blk";
	_unit addGoggles "G_Tactical_Clear";
	_unit addWeapon "SMG_02_F";
	_unit addPrimaryWeaponItem "optic_Holosight";
	_unit addWeapon "hgun_ACPC2_F";
	_unit addWeapon "Binocular";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemRadio";
};

loadoutCC_SL = //
{
	_unit = _this select 0;
	
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	_unit forceAddUniform "U_I_OfficerUniform";
	for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_9x21_Mag";};
	_unit addVest "V_BandollierB_oli";
	for "_i" from 1 to 3 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_9x21_Mag";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "Chemlight_green";
	_unit addHeadgear "H_Beret_blk";
	_unit addGoggles "G_Tactical_Clear";
	_unit addWeapon "SMG_02_F";
	_unit addPrimaryWeaponItem "optic_Holosight";
	_unit addWeapon "hgun_ACPC2_F";
	_unit addWeapon "Binocular";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemRadio";
};
