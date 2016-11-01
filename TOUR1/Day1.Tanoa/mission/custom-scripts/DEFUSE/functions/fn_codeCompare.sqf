if !(hasInterface) exitWith {};
//Parameters
private ["_code", "_inputCode"];
_code      = [_this, 0, [], [[]]] call BIS_fnc_param;
_inputCode = [_this, 1, [], [[]]] call BIS_fnc_param;

//compare codes
private "_compare";
_compare = [_code, _inputCode] call BIS_fnc_areEqual;

if (_compare) then {
	cutText ["BOMBA DESACTIVADA", "PLAIN DOWN"];
	DEFUSED = true;
	publicVariable "DEFUSED";
	playSound "button_close";
} else {
	cutText ["BOMBA ACTIVADA", "PLAIN DOWN"];
	ARMED = true;
	publicVariable "ARMED";
	playSound "button_wrong";
};

CODEINPUT = [];

//Return Value
_code
