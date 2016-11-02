
// ============================================================================
//                                                                             |
//              Este script solo lo ejecuta el servidor .                      |
//                                                                             |
// ============================================================================

// =============================================================================
                                    sleep 1;

//  Todo lo que esté debajo de esta línea se ejecuta después del briefing .    |
// =============================================================================

0 spawn {
  _g = group hvt;
  hvt disableAI "AUTOCOMBAT";
  hvt allowFleeing 0;
	hvt moveInDriver carHVT;
	_wp1 = _g addWaypoint [getMarkerPos "mWP_1", 0];
	_wp1 setWaypointType "MOVE";	_wp1 setWaypointBehaviour "SAFE"; _wp1 setWaypointSpeed "NORMAL";
	_wp2 = _g addWaypoint [getMarkerPos "mWP_2", 0];
	_wp2 setWaypointType "GETOUT";	_wp2 setWaypointBehaviour "SAFE"; _wp2 setWaypointSpeed "LIMITED";
  _wp3 = _g addWaypoint [getMarkerPos "mWP_3", 0];
	_wp3 setWaypointType "MOVE";	_wp3 setWaypointBehaviour "SAFE"; _wp3 setWaypointSpeed "LIMITED";
  waitUntil {triggerActivated trgAlert};
  _wp4 = _g addWaypoint [getPos carHVT, 0];
	_wp4 setWaypointType "GETIN";	_wp4 setWaypointBehaviour "SAFE"; _wp4 setWaypointSpeed "NORMAL";
  _wp5 = _g addWaypoint [getMarkerPos "mWP_1", 0];
	_wp5 setWaypointType "MOVE";	_wp5 setWaypointBehaviour "SAFE"; _wp5 setWaypointSpeed "NORMAL";
  _wp6 = _g addWaypoint [getMarkerPos "mWP_4", 0];
	_wp6 setWaypointType "MOVE";	_wp6 setWaypointBehaviour "SAFE"; _wp6 setWaypointSpeed "NORMAL";
  _wp6 setWaypointStatements ["true", "hvtEscaped = true;"];
};
