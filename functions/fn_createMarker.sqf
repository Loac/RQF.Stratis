/*
    Author:
        Dmitry Loac.

    Description:
        Creates marker with given params.

    Parametes main:
        Name
        Position

    Parametes optional:
        Text
        Shape
            Available values: "ICON", "RECTANGLE" or "ELLIPSE".
        Type
            Marker type. See cfgMarkers for a list of standard markers.
        Brush
            Selects the fill texture for the marker ("RECTANGLE" or "ELLIPSE").
            Available values: "Solid", "Horizontal", "Vertical", "Grid", "FDiagonal", "BDiagonal", "DiagGrid", "Cross".
        Size
            Marker size. Size is in format [a-axis, b-axis].
        Dir
            Orientation of the marker. Angle is in degrees.
        Color
            Available values: "Default", "ColorBlack", "ColorRed", "ColorRedAlpha", "ColorGreen", "ColorGreenAlpha",
                "ColorBlue", "ColorYellow", "ColorOrange", "ColorWhite", "ColorPink", "ColorBrown", "ColorKhaki".
        Global
            Not used now.

    Example:
        _marker = ["MARKER", position player, [["type", "mil_dot"], ["text", "I'am here."]]] execVM "functions\fn_createMarker.sqf";
        _marker = ["MARKER", position player, [["shape", "ELLIPSE"], ["size", [50, 50]]]] call rqf_fnc_createMarker;

    See:
        https://community.bistudio.com/wiki/createMarker
        https://community.bistudio.com/wiki/cfgMarkers
        BIS_fnc_markerCreate.
*/

private [
    "_markerName",
    "_markerPos",
    "_params",
    "_name",
    "_value"
];

// Main parametrs.
_markerName = _this select 0;
_markerPos = _this select 1;
_params = _this select 2;

_marker = createMarker [_markerName, _markerPos];

// Optional parametrs.
{
    _name = _x select 0;
    _value = _x select 1;

    switch (_name) do {
        case "shape": { _marker setMarkerShape _value };
        case "size": { _marker setMarkerSize _value };
        case "type": { _marker setMarkerType _value };
        case "brush": { _marker setMarkerBrush _value };
        case "dir": { _marker setMarkerDir _value };
        case "color": { _marker setMarkerColor _value };
        case "text": { _marker setMarkerText _value };
        case "alpha": { _marker setMarkerAlpha _value };
    };

} foreach _params;

// Return.
_marker;