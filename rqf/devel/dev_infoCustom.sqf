player enableFatigue false;
player allowDamage false;

waitUntil {
    _hint = "";
    _hint = _hint + "Blue timer (hold): %1 (%2) \n";
    _hint = _hint + "Red timer (hold): %3 (%4) \n";
    _hint = _hint + "Ratio (B:R): %5:%6 \n";

    hintSilent format [_hint,
        blueTimer,
        blueHold,
        redTimer,
        redHold,
        blueUnits,
        redUnits
    ];

    sleep 0.5;
};
