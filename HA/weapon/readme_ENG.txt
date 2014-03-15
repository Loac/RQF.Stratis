Created by Vadim Shchemelinin aka badger 
2012-2013 St.Petersburg Russia

Script for www.Our-Army.su

***Equipment adding Script***

For use the script of arms units by the template it is necessary to execute the following steps:
1) Copy in the folder with your mission the folder "weapon"
2) Add in the file description.ext lines: 
class CfgFunctions{
	class bgr{
		#include "weapon\core\Init.hpp"
	};
};
3) Write to the initialization line of the unit for example: 
		["EXAMPLE","S1",this] call bgr_fnc_ammoLoad;
4) Pick up the necessary template and type of equipment or create your own template.

To create your own template it is necessary to execute the following step:
1) Create the template file in the "weapon" folder like example file "EXAMPLE.sqf"

IMPORTANT! Please, don't edit the files of the "core" folder!