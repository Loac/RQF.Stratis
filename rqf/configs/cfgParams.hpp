class Params
{
    class targetSize
    {
        title = "Target size";
        values[] = { 10, 50, 100, 150, 200 };
        texts[] = { "10", "50", "100", "150", "200" };
        default = 50;
        code = "targetSize = %1";
    };

    class targetDistance
    {
        title = "Target distance";
        values[] = { 100, 200, 300, 500, 600 };
        texts[] = { "100", "200", "300", "400", "500", "600" };
        default = 100;
        code = "targetDistance = %1";
    };

    class sideDeviation
    {
        title = "Side deviation";
        values[] = { 0, 50, 100, 200 };
        texts[] = { "0", "50", "100", "200" };
        default = 50;
        code = "targetDistance = %1";
    };

    class sideTimer
    {
        title = "Hold time positions";
        values[] = { 30, 60, 90, 120 };
        texts[] = { "00:30", "01:00", "01:30", "02:00" };
        default = 30;
        code = "blueTimer = %1; redTimer = %1;";
    };

    class randomWeather {
        title = "Random weather";
        values[] = { true, false };
        texts[] = { "Yes", "No" };
        default = false;
        code = "randomWeather = %1";
    };

    class randomDayTime {
        title = "Random time of day";
        values[] = { true, false };
        texts[] = { "Yes", "No" };
        default = false;
        code = "randomDayTime = %1";
    };
};