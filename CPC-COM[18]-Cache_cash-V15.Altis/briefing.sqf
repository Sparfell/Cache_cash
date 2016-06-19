waitUntil {!(isNull player)};
waitUntil {player==player};
waitUntil {CPC_MarkersCreated};

//Task
task1 = player createSimpleTask ["Détruire la cache d'explosifs."];
task1 setSimpleTaskDescription ["Détruire la cache d'explosifs.","Détruire la cache d'explosifs.","Détruire la cache d'explosifs."];
task1 setSimpleTaskDestination markerpos "Mark_Cible";
task2 = player createSimpleTask ["Tuer tout les ennemis. (optionnel)"];
task2 setSimpleTaskDescription ["Tuer tout les ennemis. (optionnel)","Tuer tout les ennemis. (optionnel)","Tuer tout les ennemis. (optionnel)"];

switch (paramsArray select 7) do {
	case 0: {
		task3 = player createSimpleTask ["Tenir la base."];
		task3 setSimpleTaskDescription ["Tenir la base ennemie.","Tenir la base ennemie.","Tenir la base ennemie."];
	};
	case 1: {
		task3 = player createSimpleTask ["S'extraire."];
		task3 setSimpleTaskDescription ["S'extraire sur le point RDV.","S'extraire sur le point RDV.","S'extraire sur le point RDV."];
	};
	case 2: {
		task3 = player createSimpleTask ["S'extraire."];
		task3 setSimpleTaskDescription ["S'extraire sur le point d'insertion.","S'extraire sur le point d'insertion.","S'extraire sur le point d'insertion."];
	};
	case 3: {
		task3 = player createSimpleTask ["S'extraire."];
		task3 setSimpleTaskDescription ["S'extraire en appelant l'hélico sur le canal 5 de la PRC148.","S'extraire sur le point d'insertion.","S'extraire sur le point d'insertion."];
	};
};

player createDiaryRecord ["Diary",["Extraction",

switch (paramsArray select 7) do {
	case 0: {"| Aucune extraction |
<br/><br/>Restez quelques minutes dans la base ennemie une fois la cache détruite. (un chef de groupe peut fermer la mission avec le menu molette)
	"};
	case 1: {"| Extraction aléatoire |
<br/><br/>Une fois la cache détruite, le point RDV vous sera communiqué pour vous extraire. (un chef de groupe peut fermer la mission avec le menu molette)
	"};
	case 2: {"| Extraction sur insertion|
<br/><br/>Une fois la cache détruite, revenez sur le point d'insertion. (un chef de groupe peut fermer la mission avec le menu molette)
	"};
	case 3: {"| Extraction heliportée|
<br/><br/>Une fois la cache détruite, appellez l'hélicoptère d'extraction sur le canal 5 de la PRC148 (menu molette)
	"};
}]];

player createDiaryRecord ["Diary",["Insertion",

switch (paramsArray select 1) do { 

case 0:{
	"| Insertion aléatoire |
<br/><br/>Vous êtes en position <font color='#0066FF'><marker name='mark_inser'>ici</marker></font>. Attention l'ennemi peut être déjà proche. (Si c'est dans l'eau relancer la mission)
	"};

case 1:{
	"| Insertion Choisie |
<br/><br/>Les chefs de groupe choisi la position d'insertion de tout le monde par un click sur la carte. Attention de ne pas être trop loin. (Il est impossible être dans la zone rouge pour l'insertion)
<br/>Vous allez être insérés <font color='#0066FF'><marker name='mark_inser'>ici</marker></font>.
	"};
case 2;
case 3:{
	"| Insertion Héliportée |
<br/><br/>Vous êtes sur un aérodrome et deux hélico sont a votre disposition pour rejoindre la zone d'opération.
<br/>Vous être insérés <font color='#0066FF'><marker name='mark_inser'>ici</marker></font>.
	"};
case 4:{
	"| Insertion Parachutée |
<br/><br/>Les chefs de groupe choisissent la position du parachutage par un click sur la carte Attention de ne pas être trop loin. (Il est possible d'être parachuté dans la zone rouge.).
<br/>Vous être parachutés <font color='#0066FF'><marker name='mark_inser'>ici</marker></font>.
	"};
case 5:{
	"| Insertion HALO |
<br/><br/>Les chefs de groupe choisissent la position de départ de l'avion par un click sur la carte.
<br/>Puis il faut créer un marqueur nommé JUMP. Ce marqueur désignera l'endroit où les joueurs vont sauter de l'avion à 8000m d'altitude.
<br/>Au moins 5 kilomètres recommandés entre la position de création de l'avion et la position du saut.
<br/>Le saut des joueurs est automatique.
	"};
}]];

player createDiaryRecord ["Diary",["Mission",
"Un camp de l'ennemi (Chocapiste?) se cache dans <font color='#FF0000'><marker name='mark_cible_1'>cette zone</marker></font> ils y cachent une grosse quantité d'explosifs. Nous devons détruire ces explosifs et si tout les ennemis du secteur pouvaient disparaitre, ce serait encore mieux.<br/>
"]];

[] spawn {
	waitUntil {!isnull chefIA};
	["TaskAssigned",["","Chef Ennemi repéré."]] call BIS_fnc_showNotification;
	task4 = player createSimpleTask ["Tuer le chef. (optionnel)"];
	task4 setSimpleTaskDescription ["Tuer le chef. (optionnel)","Tuer le chef. (optionnel)","Tuer le chef. (optionnel)"];
	task4 setSimpleTaskDestination markerpos "chefmarker";
	waitUntil {!alive chefIA};
	["TaskSucceeded",["","Le chef ennemi est mort."]] call BIS_fnc_showNotification;
	task4 setTaskState "Succeeded"; 
};