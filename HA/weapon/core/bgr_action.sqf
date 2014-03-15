//EXAMPLE
/*
0 = [this,[["HA",[["KR","Командир роты"],["KV","Командир взвода"],["SN","Снайпер"],["R","Радист"],["M","Санитар"],["KO","Командир Отделения"],["P","Пулемётчик"],["G","Гранатомётчик"],["PG","Помощник Гранатомётчика"],["SS","Старший Стрелок"],["S","Стрелок"],["T","Экипад"],["L","Лётчик"],["V","Вертолётчик"],["A","Автоматчик"]]]]] execVM "weapon\core\bgr_action.sqf";

0 = [this,[["HATO",[["KR","Командир роты"],["KV","Командир взвода"],["SN","Снайпер"],["R","Радист"],["M","Санитар"],["KO","Командир Отделения"],["P","Пулемётчик"],["G","Гранатомётчик"],["PG","Помощник Гранатомётчика"],["SS","Старший Стрелок"],["S","Стрелок"],["T","Экипад"],["L","Лётчик"],["V","Вертолётчик"],["A","Автоматчик"]]]]] execVM "weapon\core\bgr_action.sqf";

0 = [this,[["FIA",[["KR","Командир роты"],["KV","Командир взвода"],["SN","Снайпер"],["R","Радист"],["M","Санитар"],["KO","Командир Отделения"],["P","Пулемётчик"],["G","Гранатомётчик"],["PG","Помощник Гранатомётчика"],["SS","Старший Стрелок"],["S","Стрелок"],["T","Экипад"],["L","Лётчик"],["V","Вертолётчик"],["A","Автоматчик"]]],["PMC",[["KR","Командир роты"],["KV","Командир взвода"],["SN","Снайпер"],["R","Радист"],["M","Санитар"],["KO","Командир Отделения"],["P","Пулемётчик"],["G","Гранатомётчик"],["PG","Помощник Гранатомётчика"],["SS","Старший Стрелок"],["S","Стрелок"],["T","Экипад"],["L","Лётчик"],["V","Вертолётчик"],["A","Автоматчик"]]]]] execVM "weapon\core\bgr_action.sqf";

*/
if (count _this == 2) then { //init
	//get [this,[["HA",[["KO","Squad leader"],["M","medic"]]],["CDF",[["KO","Squad leader"],["M","medic"]]]]]
	_box = _this select 0;
	_templates = _this select 1;
	
	_box setVariable ["bgr_curent_ammo_template", '', false];
	
	_priority = 1000;
	{
		_template = _x;
		_file = _template select 0;
		_priority = _priority-10;
		_box addaction [format["<t color='#FF0000'>Открыть снаряжения %1</t>",_file],"weapon\core\bgr_action.sqf",[1,_file,0],_priority,true,false,"",format ['_target getVariable ["bgr_curent_ammo_template",""]!="%1"',_file]];
		_box addaction [format["<t color='#FF0000'>Закрыть снаряжения %1</t>",_file],"weapon\core\bgr_action.sqf",[2,_file,0],_priority-1,true,false,"",format ['_target getVariable ["bgr_curent_ammo_template",""]=="%1"',_file]];
		_actions = _template select 1;
		{
			_box addaction [format["   Снаряжение %1 (%2)",(_x select 1),_file],"weapon\core\bgr_action.sqf",[3,_file,(_x select 0)],_priority-5,true,true,"",format ['_target getVariable ["bgr_curent_ammo_template",""]=="%1"',_file]];
		} foreach _actions;
	} foreach _templates;
}else{
	if ((_this select 3) select 0 == 1) then {
		(_this select 0) setVariable ["bgr_curent_ammo_template", (_this select 3) select 1, false];
	};
	if ((_this select 3) select 0 == 2) then {
		(_this select 0) setVariable ["bgr_curent_ammo_template", '', false];
	};
	if ((_this select 3) select 0 == 3) then {
		//get [obj, caller, id, [_type, "HA","KO"]]
		[(_this select 3) select 1,(_this select 3) select 2,(_this select 1)] call bgr_fnc_ammoLoad;	
	};
};
