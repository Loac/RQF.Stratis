/*
    Author:
        Dmitry Loac.

    See:
    	https://community.bistudio.com/wiki/setTriggerActivation
    	https://community.bistudio.com/wiki/setTriggerStatements
 */

_targetPosition = getMarkerPos "TARGET";
_targetSize = getMarkerSize "TARGET";

// Присутсвие синих в зоне.
_trigger = createTrigger["EmptyDetector", _targetPosition];
_trigger setTriggerArea[_targetSize, _targetSize, 0, false];
_trigger setTriggerActivation["WEST", "PRESENT", true];
_trigger setTriggerStatements["this", "blueHold = true", "blueHold = false"];

// Присутсвие красных в зоне.
_trigger = createTrigger["EmptyDetector", _targetPosition];
_trigger setTriggerArea[_targetSize, _targetSize, 0, false];
_trigger setTriggerActivation["EAST", "PRESENT", true];
_trigger setTriggerStatements["this", "redHold = true", "redHold = false"];