case "ESTABLISHING": {
    [player, toUpper(worldName)+", "+(_posPlayer call BIS_fnc_locationDescription), 1.5, 1, 280, 0] spawn BIS_fnc_establishingShot;
    0 spawn {
        sleep 15;
        enableSaving [false, false];
    };
};

case "TEXT": {
    [[
        [toUpper(worldName) + ", ","align='left' valign='bottom' font='PuristaBold'",""],
        [_posPlayer call BIS_fnc_locationDescription,"align='left'","#fff"]
    ]] spawn BIS_fnc_typeText2;
};

case "CINEMA": {
    _location = nearestLocation [ getPos player, "nameVillage"];
    _location = text _location;
    if (_location == "") then { _location = "Virtual Reality" };
    _minute = (date select 4); if ([str(_minute)] call CBA_fnc_strLen == 1) then { _minute = "0"+str(_minute) };

    _time = format ["%1:%2",(date select 3),_minute];

    [0,2,false,true] call BIS_fnc_cinemaBorder;

    [_location, _time] spawn BIS_fnc_infoText;

    sleep 3;
    [1,2,false,true] call BIS_fnc_cinemaBorder;

    enableSaving [false, false];
};

case "CUSTOM": {
    ST1_MissionIntroImage = "mission\images\group-logo.paa";
    ST1_MissionDesc = getText (missionConfigFile >> "onLoadMission");
    [mission_init_time, ST1_MissionIntroImage, toUpper(ST1_MissionDesc)] spawn {
        _l = ["tLayer"] call BIS_fnc_rscLayer;
		_l cutText ["", "BLACK FADED", 100];
		_month = ["Unknowinus", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio",
		  "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
 		select (date select 1);
        playmusic "LeadTrack01a_F_EXP";
        sleep 1;
        ["<img size= '9' shadow='false' image='" + (_this select 1) + "'/><br/><br/><t size='.7' color='#FFFFFF'>PRESENTA</t>", 0, 0, 3, 6] spawn BIS_fnc_dynamicText;
        sleep 12;
        ["<t size='1.5' color='#FF8C00'>" + (_this select 2) + "</t>",0,0.45,4,7] spawn BIS_fnc_dynamicText;
        sleep 2;
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [6];
		"dynamicBlur" ppEffectCommit 0;
		"dynamicBlur" ppEffectAdjust [0.0];
		"dynamicBlur" ppEffectCommit 10;
        _l cutText ["", "BLACK IN", 3];
		sleep 12;
		[
		 [
		  worldname
		 ],
		 [
		  (str(date select 2) + " de " + _month + " " + str(date select 0)),
		  1,
		  5
		 ],
		 [
		  "Equipo " + groupID(group player),
		  1,
		  1,
		  4
		 ]
		] spawn BIS_fnc_EXP_camp_SITREP;
    };
};

case "QUOTE": {
	enableEnvironment false;
	0 fadesound 0.2;
	cutText ["", "BLACK FADED", 999];
	playmusic "musica";
	// time, [widht, height]
	_handle = [17] spawn BRM_Intros_fnc_fadeQuote;
	waitUntil {scriptDone _handle};
	enableEnvironment true;
    sleep 2;

	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [3];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0.0];
	"dynamicBlur" ppEffectCommit 5;
	cutText ["", "BLACK IN", 2];
	sleep 2;
	5 fadeSound 1;
	_location = nearestLocation [ getPos player, "nameVillage"];
    _location = text _location;
	if (_location == "") then { _location = "Virtual Reality" };
	_handle = [10,
		["<t color='#FF0000'>" + getText (missionConfigFile >> "onLoadMission") + "</t>",
	    "Equipo Razor 1",
		"Tanoa, Horizon Islands",
	    "%1"],
		safeZoneY + safeZoneH*0.7, /* Optional, can also be array [x,y]  or empty*/
		["<t color='#E6E6E6'>", "</t>"] /* Optional, defaults to no prefix or suffix */
	] spawn  BRM_Intros_fnc_introDsp;

    waitUntil {scriptDone _handle};
	sleep 2;
	100012 cutfadeout 1;
};

case "APEX": {
    ST1_MissionIntroImage = "mission\images\group-logo.paa";
    ST1_MissionDesc = getText (missionConfigFile >> "onLoadMission");
    [mission_init_time, ST1_MissionIntroImage, toUpper(ST1_MissionDesc)] spawn {
		0 fadeSound 0;
    _sound = [0,1,2] call BIS_fnc_selectRandom;
    _l = ["tLayer"] call BIS_fnc_rscLayer;
		_l cutText ["", "BLACK FADED", 100];
		_month = ["Unknowinus", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio",
		  "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
 		select (date select 1);
		playmusic "intro";
        sleep 1.2;
		[
		 [
		  worldname
		 ],
		 [
		  (str(date select 2) + " de " + _month + " " + str(date select 0)),
		  1,
		  5
		 ],
		 [
		  "Equipo " + groupID(group player),
		  1,
		  1,
		  4
		 ]
		] spawn BIS_fnc_EXP_camp_SITREP;
		sleep 15;
		["<t size='1' color='#FFFFFF' font='PuristaBold'>SIMULACIÓN TIER 1 PRESENTA</t>", 0, -1, 3, 6] spawn BIS_fnc_dynamicText;
    sleep 2;
    enableSentences true;
    switch (_sound) do{
      case 0: {player globalRadio "Start1"; ["HQ", "De acuerdo caballeros, solo tenemos una oportunidad. Adelante. Corto"] call BIS_fnc_showSubtitle;};
      case 1: {player globalRadio "Start2"; ["HQ", "A todas las unidades. ¡Nos movemos!"] call BIS_fnc_showSubtitle;};
      case 2: {player globalRadio "Start3"; ["HQ", "Procedan con la operación. Buena suerte. Corto."] call BIS_fnc_showSubtitle;};
    };
    sleep 9;
    enableSentences false;
    ["<t size='1.5' font='PuristaBold' color='#FFFFFF'>" + (_this select 2) + "</t>",0,0.45,4,0] spawn BIS_fnc_dynamicText;
		10 fadeSound 1;
        sleep 2;
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [6];
		"dynamicBlur" ppEffectCommit 0;
		"dynamicBlur" ppEffectAdjust [0.0];
		"dynamicBlur" ppEffectCommit 10;
        _l cutText ["", "BLACK IN", 3];
    };
};
