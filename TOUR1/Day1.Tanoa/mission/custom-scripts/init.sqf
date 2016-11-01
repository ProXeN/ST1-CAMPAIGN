
// ============================================================================
//                                                                             |
//                    Este script es ejecutado por todos                       |
//                                                                             |
// ============================================================================

CODEINPUT = [];
DEFUSED = false;
ARMED = false;

ST1_BombActivated = {
  if (hasInterface) then {
    _line1 = ["BROADWAY", "Raptor, aqui Broadway. Mensaje. Cambio."];
    _line2 = ["RAPTOR", "Aquí Raptor, adelante Broadway."];
    _line3 = ["BROADWAY", "Aquí Broadway, inteligencia advierte que la insurgencia planea tierra quemada para Kilo. Un contacto local informa que han colocado explosivos por toda la ciudad."];
    _line4 = ["BROADWAY", "Tenemos datos suficientes para indicarles como desactivarlos, pero deben actuar rápido, no tienen mucho tiempo."];
    _line5 = ["BROADWAY", "En primer lugar localicen el dispositivo que guarda las claves de desactivación. Probablemente se trate de un portátil."];
    _line6 = ["BROADWAY", "En segundo lugar tendrán que encontrar el detonador. Al parecer realiza un pitido cada pocos segundos, no debería ser difícil."];
    _line7 = ["BROADWAY", "En ese momento tan solo tendrán que introducir el código de desactivación en el detonador y todos los explosivos serán desactivados."];
    _line8 = ["BROADWAY", "Si no consiguen los códigos siempre pueden tratar de cortar uno de los cuatro cables del detonador al azar. Un 25 por cien de desactivación es mejor que nada."];
    _line9 = ["BROADWAY", "Buena suerte Raptor. Corto."];
    [[_line1, _line2, _line3, _line4, _line5, _line6, _line7, _line8, _line9],"SIDE",0.10,false] spawn BRM_fnc_simpleConv;
    0 spawn
    {
    	while { alive caseBomb && !DEFUSED } do
    	{
    		playSound3D ["A3\Sounds_F\sfx\Beep_Target.wss", caseBomb, false, getPos caseBomb, 10, 1, 20];
    		sleep 1;
    	};
    };
  };
  if (isServer) then {
    sleep 60;
    BombActive = true;
    [caseBomb, 1800] spawn COB_fnc_bombTimer;
    deletevehicle trgbomb;
  };
};

ST1_Ambush = {
  if (hasInterface) then {
  _line1 = ["RAPTOR", "Broadway, aquí Raptor. ¿Me recibe? Cambio."];
  _line2 = ["BROADWAY", "Aquí Broadway, 5 de 5 Raptor. Adelante."];
  _line3 = ["RAPTOR", "Aquí Raptor, tenemos en visual un vehículo civil averiado en MSR Paris 034 029, seguramente un ataque de las guerrillas. Interrogo. ¿Órdenes? Cambio."];
  _line4 = ["BROADWAY", "Aquí Broadway, recibido. Investiguen el accidente y busquen supervivientes. Traigan a cualquier civil herido de vuelta a Rogain. Fin. "];
  [[_line1, _line2, _line3, _line4],"SIDE",0.10,false] spawn BRM_fnc_simpleConv;
  };
  if (isServer) then {
  deletevehicle trgambushmsg;
  sleep 30;
  AmbushTask = true;
  };
};

ST1_Cache = {
  if (hasInterface) then {
    _line1 = ["RAPTOR", "Broadway, aquí Raptor. ¿Lleva copia? Cambio."];
    _line2 = ["BROADWAY", "Aquí Broadway, le recibo. Adelante."];
    _line3 = ["RAPTOR", "Aquí Raptor, hemos descubierto dos alijos de armas de la insurgencia en Lima. Cambio."];
    _line4 = ["BROADWAY", "Aquí Broadway, recibido Raptor. Tienen luz verde para destruirlos. Prosigan con la misión cuando acaben. Fin."];
    [[_line1, _line2, _line3, _line4],"SIDE",0.10,false] spawn BRM_fnc_simpleConv;
  };
  if (isServer) then {
    sleep 30;
    CacheDiscovered = true;
  };
};

ST1_End = {
  if (hasInterface) then {
    cutText ["","BLACK OUT",5];
    ["<t size='1' color='#FFFFFF' font='PuristaBold'>CONTINUARÁ</t>", 0, -1, 3, 6] spawn BIS_fnc_dynamicText;
  };
  if (isServer) then {
    sleep 9;
    Ending = true;
  };
};

// =============================================================================
                                    sleep 1;

//  Todo lo que esté debajo de esta línea se ejecuta después del briefing.     |
// =============================================================================
