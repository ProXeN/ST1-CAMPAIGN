
// ============================================================================
//                                                                             |
//              Este script solo lo ejecuta el servidor .                      |
//                                                                             |
// ============================================================================
CODE = [(round(random 9)), (round(random 9)), (round(random 9)), (round(random 9)), (round(random 9)), (round(random 9))]; //6 digit code can be more or less
WIRE = ["BLUE", "WHITE", "YELLOW", "GREEN"] call bis_fnc_selectRandom;
publicVariable "CODE";
publicVariable "WIRE";

{_x addEventHandler ["handledamage", {
	if ((_this select 4) in ["SatchelCharge_Remote_Ammo","DemoCharge_Remote_Ammo","SatchelCharge_Remote_Ammo_Scripted","DemoCharge_Remote_Ammo_Scripted"]) then {
		(_this select 0) setdamage 1;
	};
}];
} forEach [cache1, cache2];

// =============================================================================
                                    sleep 1;

//  Todo lo que esté debajo de esta línea se ejecuta después del briefing .    |
// =============================================================================
{[_x, side_a_faction] call BRM_fnc_initAI} forEach units ambientgroup;
{[_x, "CSATPACIFIC"] call BRM_fnc_initAI} forEach units ambushgroup;

//Add Hold Action
[
caseBomb,              /* 0: Target */
"Desactivar Explosivo", 		      /* 1: Title */
"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_search_ca.paa",     /* 2: idleIcon */
"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_search_ca.paa",     /* 3: progressIcon */
"_this distance _target < 3",  /* 4: CondShow */
"_caller distance _target < 3",/* 5: codeProgress */
{},                       /* 6: codeStart */
{},                       /* 7: codeTick */
{"KeypadDefuse" remoteExec ["createDialog", _this select 1, false];},    /* 8: codeCompleted */
{},                        /* 9: codeInterrupted */
[],                        /* 10: Arguments */
6,                        /* 11: Duration */
0,                        /* 12: priority */
false,                    /* 13: Remove on completion */
false                    /* 14: Show if unconcious */
] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select isDedicated,true];

//Add Hold Action
[
codeHolder,              /* 0: Target */
"Hackear Portátil", 		      /* 1: Title */
"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_hack_ca.paa",     /* 2: idleIcon */
"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_hack_ca.paa",     /* 3: progressIcon */
"_this distance _target < 3",  /* 4: CondShow */
"_caller distance _target < 3",/* 5: codeProgress */
{},                       /* 6: codeStart */
{},                       /* 7: codeTick */
{"mission\custom-scripts\DEFUSE\searchAction.sqf" remoteExec ["execVM", _this select 1, false];},    /* 8: codeCompleted */
{},                        /* 9: codeInterrupted */
[],                        /* 10: Arguments */
6,                        /* 11: Duration */
0,                        /* 12: priority */
false,                    /* 13: Remove on completion */
false                    /* 14: Show if unconcious */
] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select isDedicated,true];

ST1_wpPosRdm = {
	private ["_p"];
	_p = ["mAirPos_1", "mAirPos_2", "mAirPos_3"] call BIS_fnc_selectRandom;
	_p
};

[] spawn {
	private ["_c", "_v", "_wp", "_heli", "_startPos", "_exitPos", "_wpPad", "_cp"];
	_startPos = call ST1_wpPosRdm;
	_exitPos = call ST1_wpPosRdm;
	if (_startPos == _exitPos) then {_exitPos = call ST1_wpPosRdm;};
	_heli = "B_Heli_Transport_03_F";
	_c = createGroup west;
	_v = [getMarkerPos _startPos, 0, _heli, _c] call BIS_fnc_spawnVehicle;
	_c setGroupIdGlobal ["6-1 AIRBUS"];
	vAirbus = _v select 0;
	vAirbus allowDamage false;
	vAirbus setcaptive true;
	vAirbus flyInHeight 500;
	_cp = driver vAirbus; _cp disableAI "AUTOTARGET"; _cp disableAI "TARGET"; _cp setBehaviour "COMBAT"; _cp setCombatMode "BLUE"; _cp enableAttack false;
	{_x unassignItem "NVGoggles"; _x removeItem "NVGoggles"; _x enableGunlights "forceOn";} forEach units _c;
	vAirbus flyInHeight 75;
	_wpPad = [oAirbusPad_1,oAirbusPad_2,oAirbusPad_3,oAirbusPad_4] call BIS_fnc_selectRandom;
	_wp = _c addWaypoint [getPos _wpPad, 0];
	_wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL"; _wp setWaypointCombatMode "GREEN";
	_wp setWaypointStatements ["true", "vAirbus land 'LAND';"];
	waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
	vAirbus flyInHeight 0;
	waitUntil {isTouchingGround vAirbus};
	vAirbus setDir (getDir _wpPad);
	{vAirbus animateDoor [_x, 1];} forEach ["door_L_source", "door_R_source", "Door_rear_source"];
	vAirbus setFuel 0;
	sleep ([60,120,180,240,300,600] call BIS_fnc_selectRandom);
	vAirbus setFuel 1;
	{vAirbus animateDoor [_x, 0];} forEach ["door_L_source", "door_R_source", "Door_rear_source"];
	_wp = _c addWaypoint [getMarkerPos _exitPos, 0];
	vAirbus flyInHeight 500;
	_wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";  _wp setWaypointCombatMode "GREEN";
	waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
	sleep 2;
	if !(isNil "vAirbus") then {{deleteVehicle _x} forEach (crew vAirbus); deleteVehicle vAirbus; vAirbus = nil};
};

[] spawn {
	sleep ((random 120) + (random 120));
	private ["_c", "_wp", "_wpPos", "_wpPad"];
	_c = createGroup west;
	_p = _c createUnit ["B_helipilot_F", getMarkerPos "mStart",[],0,"LIEUTENANT"]; _p moveInDriver vGunship;
	_p = _c createUnit ["B_helipilot_F", getMarkerPos "mStart",[],0,"LIEUTENANT"]; _p moveInGunner vGunship;
	_c setGroupIdGlobal ["6-6 PHANTOM"];
	{_x disableAI "AUTOTARGET"; _x disableAI "TARGET"; _x setBehaviour "COMBAT"; _x setCombatMode "BLUE"; _x enableAttack false; _x setcaptive true;} forEach units _c;
	vGunship flyInHeight 20;
	_wpPos = call ST1_wpPosRdm;
	_wp = _c addWaypoint [getMarkerPos _wpPos, 0];
	_wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL"; _wp setWaypointCombatMode "GREEN";
	waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
	if !(isNil "vGunship") then {{deleteVehicle _x} forEach (crew vGunship); deleteVehicle vGunship; vGunship = nil};
};
