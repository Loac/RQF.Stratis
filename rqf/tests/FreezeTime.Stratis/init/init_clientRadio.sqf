/*
    Author:
        Dmitry Loac.
    See:
        BIS_fnc_codePerformance
        https://community.bistudio.com/wiki/setTriggerActivation
        https://community.bistudio.com/wiki/setTriggerStatements
        https://community.bistudio.com/wiki/Arma_3_Communication_Menu
*/

trgCondition = {
    isFormationLeader player;
};

trgActivation = {
	switch (playerSide) do {
		case west: {
			player globalChat "Blue is ready";
			blueReady = 0; publicVariable "blueReady";
		};
		case east: {
			player globalChat "Red is ready";
			redReady = 0; publicVariable "redReady";
		};
	};

//    freezeOver = true;
};

_trigger = createTrigger["EmptyDetector", [0, 0, 0]];
_trigger setTriggerActivation["ALPHA", "PRESENT", true];
_trigger setTriggerText "Ready";
_trigger setTriggerStatements["[] call trgCondition", "[] call trgActivation", ""];

// _supportHeli = [player, "teamReady"] call BIS_fnc_addCommMenuItem;
