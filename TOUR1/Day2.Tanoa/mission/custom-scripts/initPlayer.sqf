
// ============================================================================
//                                                                             |
//              Este script solo lo ejecutan los jugadores.                    |
//                                                                             |
// ============================================================================

//Ejemplo de comunicaciones que se activa al llamar la función BRM_fnc_simpleConv desde un trigger.
//Primero estableceis las lineas de la conversación.
line1 = ["RAZOR", "Broadway, aquí Razor. ¿Me recibe? Cambio."];
line2 = ["BROADWAY", "Aquí Broadway, adelante Razor. Cambio."];
line3 = ["RAZOR", "Razor acaba de insertar en LZ Charlie. Iniciamos la operación."];
line4 = ["BROADWAY", "Aquí Broadway, recibido. Buena suerte. Fin."];

// PARAMETROS
// 0 - Indicativo del Emisor. (STRING)
// 1 - Mensaje (STRING)

//USO
//En el editor colocad un trigger BLUFOR PRESENTE y en Activación poned:
// if (hasInterface) then {	[[line1, line2, line3, line4],"SIDE",0.15,false] spawn BRM_fnc_simpleConv; };

// PARAMETROS
// 0 - Líneas de conversación (ARRAY)
// 1 - Bando (STRING) "SIDE" / "GLOBAL" - Afecta al color del nombre del Emisor y al sonido de la radio.
// 2 - Multiplicador de espera (NUMBER) - Afecta al tiempo de espera entre líneas.
// 3 - Fondo (BOOL) - Muestra un fondo negro para facilitar lectura.

// =============================================================================
                                    sleep 1;

//  Todo lo que esté debajo de esta línea se ejecuta después del briefing.     |
// =============================================================================
