player enableFatigue false;
player allowDamage false;

waitUntil {
    hintSilent format ["blueTimer: %1 \nblueHold: %2 \nredTimer: %3 \nredHold: %4", blueTimer, blueHold, redTimer, redHold];
    sleep 0.5;
};
