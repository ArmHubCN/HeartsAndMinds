onPlayerConnected { 

	if (count allPlayers > 17) then {

		btc_veh_17 setVehicleLock "UNLOCKED";

	};

	if (count allPlayers > 11) then {

		btc_veh_18 setVehicleLock "UNLOCKED";

	};

	if (count allPlayers > 17) then {

		btc_veh_19 setVehicleLock "UNLOCKED";

	};

};

onPlayerDisconnected {

	if (count allPlayers < 18) then {

		btc_veh_17 setVehicleLock "LOCKED"; //Apache

	};

	if (count allPlayers < 18) then {

		btc_veh_19 setVehicleLock "LOCKED"; //FA/18

	};

	if (count allPlayers < 12) then {

		btc_veh_18 setVehicleLock "LOCKED"; //Tank

	};

};


enableSaving [false, false];

if (hasInterface) then {btc_intro_done = [] spawn btc_fnc_intro;};

[] call compile preprocessFileLineNumbers "core\def\mission.sqf";
[] call compile preprocessFileLineNumbers "define_mod.sqf";

if (isServer) then {
    [] call compile preprocessFileLineNumbers "core\init_server.sqf";
};

[] call compile preprocessFileLineNumbers "core\init_common.sqf";

if (!isDedicated && hasInterface) then {
    [] call compile preprocessFileLineNumbers "core\init_player.sqf";
};

if (!isDedicated && !hasInterface) then {
    [] call compile preprocessFileLineNumbers "core\init_headless.sqf";
};



