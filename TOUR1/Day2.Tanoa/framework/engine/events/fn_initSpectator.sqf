/*

    Initializes spectator units.

*/

(_this select 0) spawn {
    _this enableSimulation false;
    _this allowDamage false;
    _this setPos [0,0,30];

    sleep 3;

    ["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;
    default { _this setDamage 1 };
    
};