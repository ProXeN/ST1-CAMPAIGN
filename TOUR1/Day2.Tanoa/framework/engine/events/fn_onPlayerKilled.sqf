
// ============================================================================
//                                                                             |
//         EVENT SCRIPT: Executes whenever a player unit is killed.            |
//                                                                             |
// ============================================================================

_unit = _this select 0;
_killer = _this select 1;

[_unit, _killer] call BRM_fnc_handleScore;

["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;
[player, true] call TFAR_fnc_forceSpectator;
