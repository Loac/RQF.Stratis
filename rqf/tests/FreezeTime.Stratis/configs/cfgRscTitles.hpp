#define true 1
#define false 0
#define CT_STATIC 0
#define ST_CENTER 0x02

class RscTitles
{
    class RscTimer
    {
        idd = 1000;
        duration = 1e+011;
        onLoad = "uiNamespace setVariable ['rscTimer', _this select 0];";
        onUnLoad = "uiNamespace setVariable ['rscTimer', nil]";
        controlsBackground[] = { };
        fadein = 1;
        fadeout = 1;
        objects[] = { };
        controls[] = { Display };

        class Display
        {
            idc = 1001;
            moving = false;
            type = CT_STATIC;
            style = ST_CENTER;
            text = "00:00";
            font = "PuristaMedium";
            sizeEx = 0.03;
            colorBackground[] = { 0, 0, 0, 0.7 };
            colorText[] = { 1, 1, 1, 1 };
            x = 0.4;
            y = 0.2;
            w = 0.2;
            h = 0.05;
        };
    };
};