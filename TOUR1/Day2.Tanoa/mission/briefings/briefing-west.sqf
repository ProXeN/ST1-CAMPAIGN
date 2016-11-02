// =============================================================================
// Briefings go here!
// don't forget to add a "<br/>" every time you want to break a line down.
// =============================================================================

// =============================================================================
//  RADIO FREQUENCIES, GENERATED AUTOMATICALLY IF YOU HAVE THE PLUGIN ENABLED.
// =============================================================================

mission_author_name = [mission_author_name] call BRM_fnc_verboseArray;

// =============================================================================

///// CREDITS
//[] execVM "framework\credits.sqf";
// player createDiaryRecord ["Diary",["Creditos", "
// <font color='#E6E6E6' size='14'>CREDITOS</font><br/>
// <font color='#9DA698'>Mision por Proxen para ST1<br/><br/>
// Gracias a los creadores de BromA Framework y ADF Framework.</font>
// "]];
player createDiaryRecord ["Diary", ["Creditos","
<font color='#E6E6E6' size='14'>CREDITOS</font><br/>
<font color='#9DA698'>Misión versión <font color='#E6E6E6'>" + mission_version + "</font> hecha por <font color='#E6E6E6'>" + mission_author_name + "</font> para la ST1 <font color='#E6E6E6'>http://www.st1arma.es</font><br/><br/>
Framework assembled by <font color='#E6E6E6'>Proxen</font> using the work of:<br/>
BromA Mission Making Team <font color='#E6E6E6'>http://broma.co.uk</font><br/>
Whiztler's ADF Framework <font color='#E6E6E6'>https://github.com/whiztler/ADF</font><br/>
R34P3r's Workshop missions <font color='#E6E6E6'>https://steamcommunity.com/profiles/76561197969198888</font><br/>
All credits given to their respective creators.</font>"]];


player createDiaryRecord ["Diary",["Sistema Médico",
// =============================================================================
"
<font color='#E6E6E6' size='14'>SISTEMA MÉDICO</font><br/>
<br/>
<font color='#E6E6E6' size='14'>Abrasiones.</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Caidas, quemaduras, colisión con vehículo.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - muy ligero.<br/>
         | Hemorragia - muy lenta.<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Básico.<br/>
         | Mediana - Básico.<br/>
         | Grande  - Básico/Compresivo/Elástico.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Avulsiones.</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Explosiones, colisión con vehículo, impactos de proyectil.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - muy alto.<br/>
         | Hemorragia - muy rápida (depende del tamaño).<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Compresivo.<br/>
         | Mediana - Compresivo y Básico.<br/>
         | Grande  - Compresivo x2.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Tejido triturado.</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Impactos de proyectil, Back-blast, colisión con vehículo, caidas.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - ligero.<br/>
         | Sin Hemorragia.<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Básico/Elástico/Quickclot.<br/>
         | Mediana - Elástico.<br/>
         | Grande  - Elástico.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Cortes.</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Colisión con vehículo, explosiones.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - ligero.<br/>
         | Hemorragia - rápida (depende del tamaño).<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Básico.<br/>
         | Mediana - Básico.<br/>
         | Grande  - Básico.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Laceraciones.</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Colisión con vehículo.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - ligero.<br/>
         | Hemorragia - lenta/intermedia (depende del tamaño).<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Compresivo/Elástico.<br/>
         | Mediana - Elástico y Básico.<br/>
         | Grande  - Elástico y Quickclot.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Herida de bala.</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Impactos de proyectil, granadas y explosiones.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - muy alto.<br/>
         | Hemorragia - intermedia (depende del tamaño).<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Compresivo.<br/>
         | Mediana - Elástico y Básico.<br/>
         | Grande  - Quickclot x2.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Herida punzante</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Granadas.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - ligero.<br/>
         | Hemorragia - lenta.<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Básico/Elástico.<br/>
         | Mediana - Compresivo y Quickclot.<br/>
         | Grande  - Elástico y Quickclot.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Contusiones.</font color>
<font color='#9DA698'><br/>
    | <font color='#E6E6E6'>Origen:</font> Caidas, colisión con vehículo.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - ligero.<br/>
         | Hemorragia - lenta.<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Básico.<br/>
         | Mediana - Básico.<br/>
         | Grande  - Quickclot x2.<br/>
</font>
"]];

///// SUPPORT & LOGISTICS
player createDiaryRecord ["Diary",["Servicio y Apoyo", "
<font color='#E6E6E6' size='14'>EQUIPACIÓN</font><br/>
<font color='#9DA698'>Equipo estándar de la ST1.</font>

<br/><br/><font color='#E6E6E6' size='14'>VEHICULOS</font><br/>
<font color='#9DA698'>
Transporte:<br/>
- Sin vehículos<br/>
Combate:<br/>
- Sin vehículos
</font>

<br/><br/><font color='#E6E6E6' size='14'>ZONA DE INICIO</font><br/></font>
<font color='#9DA698'>El punto de inicio de la operación es en </font><marker name='mStart' color='#E6E6E6'>LZ CHARLIE</marker><font color='#9DA698'>.</font>
"]];

player createDiaryRecord ["Diary",["Ejecución","
<font color='#E6E6E6' size='14'>EJECUCIÓN</font><br/>
<font color='#9DA698'>
Explicado por CM.<br/><br/>
</font>
"]];

player createDiaryRecord ["Diary",["Misión","
<font color='#E6E6E6' size='14'>MISIÓN</font><br/>
<font color='#9DA698'>Los objetivos son: <br/><br/>
Principales<br/>
- Localizar y hackear el terminal de comunicaciones que se encuentra en algún lugar del <marker name='mLima' color='#E6E6E6'>Sector LIMA</marker><font color='#9DA698'></font>.<br/>
- Abandonar la zona y reagrupar en <marker name='mEnd' color='#E6E6E6'>X-RAY</marker><font color='#9DA698'></font>.<br/>
</font>
"]];


///// SITUATION

player createDiaryRecord ["Diary",["Situación", "
<font color='#E6E6E6' size='14'>SITUACIÓN</font>
<br/><font color='#9DA698'>
Jodida.
</font>

<br/><br/><font color='#E6E6E6' size='14'>INTELIGENCIA SOBRE EL ENEMIGO</font><br/>
<font color='#9DA698'>
Tropas regulares del CSAT asiático, alrededor de 50 infantes con armas ligeras distribuidas por Sector LIMA y alrededores.<br/>
De dos a cuatro vehículos de asalto ligeros patrullando por la zona.
</font>

<br/><br/><font color='#E6E6E6' size='14'>TERRENO</font><br/>
<font color='#9DA698'>Pequeñas poblaciones dispersas por la isla, vegetación y cobertura abundante, visibilidad limitada en zonas selváticas.<br/>
</font>

<br/><br/><font color='#E6E6E6' size='14'>CLIMATOLOGÍA</font><br/>
<font color='#9DA698'>La misión comienza a las 0700 hrs. Cielos despejados, humedad intermedia, buena visibilidad.</font>
"]];

///// LOG
player createDiarySubject ["ST1 Log","ST1 Log"];
player createDiaryRecord ["ST1 Log",["Comunicaciones","<br/><br/><font color='#9DA698'>El historial de comunicaciones almacena todos los mensajes transmitidos entre la ST1 y HQ<br/>Los mensajes se guardan después de que aparezcan en pantalla en orden de aparición.</font><br/><br/>"]];
