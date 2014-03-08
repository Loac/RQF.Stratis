 /*
    Author:
        Dmitry Loac.

    Description:
  		Initialize of end mission with parameters for each sides.

    See:
        playerSide
        side group player
        BIS_fnc_MP

    Example:
    	[[west, "blueHoldTarget"], "rqf_fnc_endMission"] spawn BIS_fnc_MP;
*/

private [
	"_winner",
	"_scenario",
	"_debriefing",
	"_isVictory"
];

// Winner side, west or east.
_winner = _this select 0;

// Scenario.
_scenario = _this select 1;

// Final (see cfgDebriefing.hpp).
_debriefing = str(playerSide) + "_" + _scenario;

// Victory flag.
_isVictory = (playerSide == _winner);

// Initialisation end mission.
[_debriefing, _isVictory, true] call BIS_fnc_endMission;
