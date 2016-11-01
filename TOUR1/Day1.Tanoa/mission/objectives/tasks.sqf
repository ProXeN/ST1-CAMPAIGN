
// ============================================================================
//                                                                             |
//         Usa este script para todo lo relacionado con tareas y objetivos     |
//               pero ten presente que solo lo ejecuta el servidor.            |
//                                                                             |
//         Se incluyen algunos ejemplos y documentación al final del script    |
//                                                                             |
// ============================================================================

if (!isServer) exitWith {};
[{scriptDone(mission_settings)}, {
DEFUSED = false;
ARMED = false;
TaskBombFailed = false;
AmbushTask = false;
CacheDiscovered = false;
BombActive = false;
Ending = false;
// =============================================================================
[
side_a_side,
"TaskClear",
["Tomar la isla", "Despejar la isla de actividad insurgente.", "attack",[]],
["(true)","{triggerActivated _x} forEach [trgattack1, trgattack2]"],
2,
["", "", ""]
] spawn BRM_fnc_newTask;

[
side_a_side,
["TaskClear1", "TaskClear"],
["Despejar Lima", "Despejar la población de Lailai.", "l", getPos trgattack1],
["(true)","triggerActivated trgattack1"],
2,
["['TaskClear1', 'ASSIGNED'] call BRM_fnc_setTask", "['TaskClear2', 'ASSIGNED'] call BRM_fnc_setTask", ""]
] spawn BRM_fnc_newTask;

[
side_a_side,
["TaskClear2", "TaskClear"],
["Despejar Kilo", "Despejar la población de Katkoula.", "k", getPos trgattack2],
["(true)","triggerActivated trgattack2"],
2,
["", "", ""]
] spawn BRM_fnc_newTask;

[
side_a_side,
"TaskMSR",
["Asegurar MSR Paris", "Asegúrense de que MSR Paris está despejada.", "attack",[]],
["(true)","{triggerActivated _x} forEach [trgattack1, trgattack2]"],
2,
["", "", ""]
] spawn BRM_fnc_newTask;

[
side_a_side,
["TaskAmbush", "TaskMSR"],
["Rescatar Civiles", "Proporcionar asistencia sanitaria a los heridos en el accidente.", "heal", getPos ambushjeep],
["(AmbushTask)","(false)","triggerActivated ambushkilled"],
0,
["", "", ""]
] spawn BRM_fnc_newTask;

[
side_a_side,
"TaskCache",
["Destruir alijos", "Destruir los alijos de armas ocultos de Syndikat.", "destroy", getPos cache1],
["(CacheDiscovered)","({!alive _x} forEach [cache1, cache2])"],
1,
["", "", ""]
] spawn BRM_fnc_newTask;

[
side_a_side,
"TaskBomb",
["Desactivar Explosivos", "Localizar un portátil con los códigos de desactivación y usarlos para desactivar el detonador.", "destroy", []],
["(BombActive)","DEFUSED", "TaskBombFailed"],
2,
["", "remoteExec ['ST1_BombDeactivated', [0,-2] select isDedicated, false];", ""]
] spawn BRM_fnc_newTask;

[
side_a_side,
"TaskEnd",
["Asegurar Papa", "Avanzar hasta Papa y asegurar el puente.", "p", getpos trgend],
["(DEFUSED)","Ending"],
2,
["", "", ""]
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
