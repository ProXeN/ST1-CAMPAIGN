if !(isServer) exitWith {};
private ["_bomb", "_time"];
_bomb = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_time = [_this, 1, 0, [0]] call BIS_fnc_param;
_houses = (nearestObjects [getPos _bomb, ["house"], 150]);

//Validate parameters
if (isNull _bomb) exitWith {"Object parameter must not be objNull. Accepted: OBJECT" call BIS_fnc_error};

_light = createVehicle ["PortableHelipadLight_01_red_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_light attachTo [_bomb,[0,0,0.45]];
_attachments = [_light];
{
	_x params["_offset", "_dirAndUp"];
	_c4 = createSimpleObject ["a3\weapons_f\explosives\c4_charge_small.p3d", [0,0,0]];
	_c4 attachTo [_bomb, _offset];
	_c4 setVectorDirAndUp _dirAndUp;
	_attachments pushBack _c4;
} forEach [
	[[0,0.3,0], [[1,0,0],[0,1,0]]],
	[[0,-0.3,0], [[-1,0,0],[0,-1,0]]],
	[[0.3,0,0], [[0,-1,0],[1,0,0]]],
	[[-0.3,0,0], [[0,1,0],[-1,0,0]]]
];

while {_time > 0 && !DEFUSED} do {
	_time = _time - 1;

	if (_time < 1) then {
		remoteExec ['ST1_Explosion', [0,-2] select isDedicated, false];
		createVehicle ["Bo_GBU12_LGB_MI10", [getpos _bomb select 0, getpos _bomb select 1, 2],[],0,"CAN_COLLIDE"];
		_bomb setdamage 1;
		for "_i" from 0 to ((ceil(count _houses)*0.5) min 15) do {
			_splosion = _houses select (random ((count _houses) - 1));
			createVehicle ["Bo_GBU12_LGB_MI10", [getpos _splosion select 0, getpos _splosion select 1, 2],[],0,"CAN_COLLIDE"];
			sleep (0.5 + random 1.25);
		};
		sleep 30;
		TaskBombFailed = true;
	};
	if (ARMED) then {
		_time = 5;
		ARMED = false;
	};

	sleep 1;
};

//Return Value
_bomb
