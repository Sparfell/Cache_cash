// Script de modification de la météo en fonction des paramètres choisis par les joueurs


//CIEL
switch (CC_p_overcast) do {
	
	case 0 : // Dégagé
	{
		0 setOvercast 0;
			sleep 0.1;
		0 setWindForce 0.1;
		0 setRain 0;
		0 setRainbow 0;
		0 setLightnings 0;
		forceWeatherChange;
		999999 setOvercast 0;
		999999 setWindForce 0.1;
		999999 setRain 0;
		999999 setLightnings 0;
	};
	
	case 1 : // Légèrement nébuleux
	{
		0 setOvercast 0.3;
			sleep 0.1;
		0 setWindForce 0.2;
		0 setRain 0;
		0 setRainbow 0;
		0 setLightnings 0;
		forceWeatherChange;
		999999 setOvercast 0.3;
		999999 setWindForce 0.2;
		999999 setRain 0;
		999999 setLightnings 0;
	};
	
	case 2 : // Nuageux
	{
		0 setOvercast (random [0.6,0.75,1]);
			sleep 0.1;
		0 setWindForce 0.2;
		0 setRain 0;
		0 setRainbow 0;
		0 setLightnings 0;
		forceWeatherChange;
		3600 setOvercast (random [0.6,0.75,1]);
		999999 setWindForce 0.2;
		999999 setRain 0;
		999999 setLightnings 0;
	};
	
	case 3 : // Pluvieux
	{
		0 setOvercast (random [0.7,0.8,0.9]);
			sleep 0.1;
		0 setWindForce 0.1;
		0 setRain (random [0.2,0.4,0.8]);
		0 setRainbow 0;
		0 setLightnings 0;
		forceWeatherChange;
		3600 setOvercast (random [0.7,0.8,0.9]);
		999999 setWindForce 0.1;
		3600 setRain (random [0.2,0.4,0.8]);
		3600 setLightnings 0;
	};
	
	case 4 : // Orageux
	{
		0 setOvercast 1;
			sleep 0.1;
		0 setWindForce 0.1;
		0 setRain (random [0,0.8,1]);
		0 setRainbow 0;
		0 setLightnings (random [0.5,0.8,1]);
		forceWeatherChange;
		999999 setOvercast 1;
		999999 setWindForce 0.1;
		3600 setRain (random [0,0.8,1]);
		3600 setLightnings (random [0.5,0.8,1]);
	};
};

// Brouillard
switch (CC_p_fog) do {
	
	case 0 : // Aucun
	{
		0 setFog 0;
		forceWeatherChange;
		999999 setFog 0;
	};
	
	case 1 : // Léger
	{
		0 setFog 0.25;
		forceWeatherChange;
		999999 setFog 0.25;
	};
	
	case 2 : // Moyen
	{
		0 setFog 0.5;
		forceWeatherChange;
		999999 setFog 0.5;
	};
	
	case 3 : // Dense
	{
		0 setFog 0.8;
		forceWeatherChange;
		999999 setFog 0.8;
	};
};