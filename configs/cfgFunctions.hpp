class CfgFunctions
{
    class rqf
    {
        class functions
        {
            file = "functions";

            class createMarker { description = "Creates marker with given params."; };
            class getZoneMarkers { description = "Find all palyable markers."; };
            class deleteZoneMarkers { description = "Delete all palyable markers."; };
            class updateRatio { description = "Update ratio forces."; };
            class broadcast { description = "Broadcast variables for all clients."; };
            class endMission { description = "Initialisation end mission."; };
            class setEnvironment { description = "Set environment."; };
            class timeToTimer { description = "Convert time to string fomat 00:00."; };
            class getRandomValue { description = "Get random value from parameter."; };
        };
    };
};