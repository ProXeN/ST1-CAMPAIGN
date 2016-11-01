
// ============================================================================
//                                                                             |
//              Este script solo lo ejecutan los jugadores.                    |
//                                                                             |
// ============================================================================

ST1_Explosion = {
  _line1 = ["RAPTOR", "¡Broadway, aquí Raptor! ¡El explosivo ha detonado, repito, el explosivo ha detonado!"];
  _line2 = ["BROADWAY", "Aquí Broadway, recibido Raptor. Sin duda esto dificultará el resto de nuestra campaña en las islas."];
  _line3 = ["BROADWAY", "RTB Raptor, misión abortada"];
  [[_line1, _line2, _line3],"SIDE",0.10,false] spawn BRM_fnc_simpleConv;
};

ST1_BombDeactivated = {
  _line1 = ["RAPTOR", "Broadway, aquí Raptor. Explosivo desactivado. Cambio."];
  _line2 = ["BROADWAY", "¡Excelente trabajo, Raptor! Prosigan hasta Papa cuando Kilo esté asegurada. Corto."];
  [[_line1, _line2],"SIDE",0.10,false] spawn BRM_fnc_simpleConv;
};

ST1_AmbushWin = {
  _line1 = ["RAPTOR", "Broadway, aquí Raptor. Cambio."];
  _line2 = ["BROADWAY", "Aquí Broadway, Adelante Raptor."];
  _line3 = ["RAPTOR", "Aquí Raptor, el vehículo averiado era una emboscada. Hemos sido atacados por enemigos sin identificar. Por la equipación diría CSAT. Cambio."];
  _line4 = ["BROADWAY", "Aquí Broadway, recibido. Prosigan con la misión. Cambio."];
  _line5 = ["RAPTOR", "Aquí Raptor, recibido. Interrogo. ¿Qué hace aquí el CSAT, Broadway? Cambio."];
  _line6 = ["BROADWAY", "Aquí Broadway. Irrelevante. Olviden lo ocurrido y céntrense en la misión. Corto."];
  [[_line1, _line2, _line3, _line4, _line5, _line6],"SIDE",0.10,false] spawn BRM_fnc_simpleConv;

};

// =============================================================================
                                    sleep 1;

//  Todo lo que esté debajo de esta línea se ejecuta después del briefing.     |
// =============================================================================
