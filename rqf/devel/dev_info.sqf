player enableFatigue false;
player allowDamage false;

while {true} do {
    mypos = getPosATL player;
    mydir = getDir player;
    myvelo = velocity player;
    unitcount = count allUnits;
    histarget = assignedTarget cursorTarget;

    hintSilent format ["PositionATL:\n%1\n\nAzimuth:\n%2\n\nCursorTarget:\n%3\n\nVelocity:\n%4\n\nTime:\n%5\n\nAliveUnitCount:\n%6\n\nAssignedTarget:\n%7\n\nWindStr/WindDir:\n%8/%9\n",mypos,mydir,cursortarget,myvelo,daytime,unitcount,histarget,windStr,windDir];
    sleep 0.2;
};
