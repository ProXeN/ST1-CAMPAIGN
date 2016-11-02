
// ============================================================================
//                                                                             |
//         Usa este script para todo lo relacionado con tareas y objetivos     |
//               pero ten presente que solo lo ejecuta el servidor.            |
//                                                                             |
//         Se incluyen algunos ejemplos y documentación al final del script    |
//                                                                             |
// ============================================================================

if (!isServer) exitWith {};
hvtEscaped = false;
distraction = false;
deposito1 = nearestObject getMarkerPos "mObj_1";
deposito2 = nearestObject getMarkerPos "mObj_2";
[{scriptDone(mission_settings)}, {
// =============================================================================

[
side_a_side,
"TaskHVT",
["Eliminar a Hotel", "Hotel debe ser eliminado antes de que escape.", "kill", []],
["(true)","!(alive HVT)","(hvtEscaped)"],
2,
["", "", ""]
] spawn BRM_fnc_newTask;

[
side_a_side,
"TaskDistract",
["Crear distracción", "Eliminar depósitos de combustible para crear una distracción.", "destroy", []],
["(true)","(!alive deposito1) && (!alive deposito2)"],
2,
["", "distraction = true", ""]
] spawn BRM_fnc_newTask;

// =============================================================================
/*
[
// Bando al que se le asigna la tarea. side_a_side es el bando de los jugadores.
side_a_side,

// ID de la tarea.
"newTaskBLU1",

// Nombre de la tarea.
["Mata al oficial y protege al piloto.",

// Descripción.
"My description 1",

//Tipo de Tarea (Influye en el icono de la tarea. Consultar wiki de BIS para ver los tipos)
"kill",

//Localización de la tarea (dejar como array vacio [] si no se quiere indicar posición)
getPos oficial],

// Condiciones para: Tarea Asignada / Tarea Completada / Tarea Fallida (OPTIONAL)
["(true)","!(alive oficial)", "!(alive piloto)"],

// Prioridad de la tarea.
// 0 - Opcional (Se puede dejar sin hacer) | 1 - Secundaria (Debe completarse) | 2 - Principal (Debe completarse y si se falla se acaba la misión)
2,

// Código que se ejecuta cuando:
// Tarea Asignada | Tarea Completada | Tarea Fallida
["", "", ""]
] spawn BRM_fnc_newTask;
// =============================================================================

// =============================================================================
//  Ejemplo de Tarea Principal.
[
side_a_side,
"TaskHVT",
["Matar a Hitler",
"Hitler ha estado haciendo cosas nazis. Mátalo."],
["(true)","!(alive Hitler)"],
2,
["", "", ""],
"kill"
] spawn BRM_fnc_newTask;
*/
// =============================================================================

// =============================================================================
//  Recordad, las prioridades funcionan así:
//  0: Opcional. Se puede completar, fallar o dejar sin hacer.
//  1: Secundaria. Se debe completar para acabar la misión, pero no pasa nada si se falla.
//  2: Principal. Se debe completar para acabar la misión, y si se falla la misión finaliza al instante.
// =============================================================================

[] spawn BRM_fnc_checkTasks;

true
}, []] call CBA_fnc_waitUntilAndExecute;
