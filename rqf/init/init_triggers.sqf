/*
    Author:
        Dmitry Loac.

    Description:
        Set triggers.

    External variables:
        targetPosition
        targetSize

    See:
      https://community.bistudio.com/wiki/setTriggerActivation
      https://community.bistudio.com/wiki/setTriggerStatements
*/

private [
    "_trigger"
];

// Check blue forces in target zone.
_trigger = createTrigger["EmptyDetector", targetPosition];
_trigger setTriggerArea[targetSize, targetSize, 0, false];
_trigger setTriggerActivation["WEST", "PRESENT", true];
_trigger setTriggerStatements["this", "blueHold = true", "blueHold = false"];

// Check red forces in target zone.
_trigger = createTrigger["EmptyDetector", targetPosition];
_trigger setTriggerArea[targetSize, targetSize, 0, false];
_trigger setTriggerActivation["EAST", "PRESENT", true];
_trigger setTriggerStatements["this", "redHold = true", "redHold = false"];