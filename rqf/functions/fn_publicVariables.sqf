/*
    Author:
        Dmitry Loac.

    Description:
        Send public variables to all clients.

    See:
        publicVariable

    External variables:
        blueTimer
        redTimer
        bluePosition
        redPosition
 */

{
    publicVariable _this;
} forEach _this;

// or.

publicVariable "blueTimer";
publicVariable "redTimer";
publicVariable "bluePosition";
publicVariable "redPosition";