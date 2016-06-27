
// Pour le test, définitions des params si non défini
if (isNil "paramsArray") then {
	paramsArray = [0,0,0]
};

// Briefing
null = [] execVM "briefing\briefing.sqf";
// Team Roster dans le briefing
[2,true,true] execVM "briefing\roster.sqf";

// Déterminer la localité pour faire pop les IAs (HC ou éditeur)
MODE_EDITEUR = false;
MODE_HC = false;
if !(isMultiplayer) then {MODE_EDITEUR = true;}
else
{if !(hasInterface or isServer) then {MODE_HC = true;};};

// Enclenche le spawn des ennemis :
null = [] execVM "scripts\spawn_IA\spawn_IA.sqf";

// Fait disparaitre les marqueurs de zone
for "_x" from 1 to 100 do
{
	format ["%1",_x] setMarkerAlpha 0;
};