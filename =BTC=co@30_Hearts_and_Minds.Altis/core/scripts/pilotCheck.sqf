// Original pilotcheck by Kamaradski [AW]. 
// Since then been tweaked by many hands!
// Notable contributors: chucky [allFPS], Quiksilver.

_pilots = ["B_Helipilot_F","B_officer_F"];//飞行员类别名，不为空，随便填则代表只有白名单可飞
_aircraft_nocopilot = ["RHS_MELB_MH6M"];

waitUntil {player == player};

_iampilot = ({typeOf player == _x} count _pilots) > 0;

/* Remove comments and insert UIDs into the whitelist to exempt individuals from this script */
_uid = getPlayerUID player;
_whitelist = ["76561198196173878","76561198281326352","76561198017138674"];//白名单

if (_uid in _whitelist) exitWith {};

while { true } do {
_oldvehicle = vehicle player;
waitUntil {vehicle player != _oldvehicle};

if(vehicle player != player) then {
_veh = vehicle player;

//------------------------------ pilot can be pilot seat only

if((_veh isKindOf "Helicopter" || _veh isKindOf "Plane") && !(_veh isKindOf "ParachuteBase")) then {
_forbidden = [_veh turretUnit [0]];
if(player in _forbidden) then {
if (!_iampilot) then {
hint "只有飞行员能上飞机副驾驶位";
player action ["getOut",_veh];
};
};
if(!_iampilot) then {
_forbidden = [driver _veh];
if (player in _forbidden) then {
hint "只有飞行员能上飞机驾驶位";
player action ["getOut", _veh];
};
};
};
//	if(!(_veh isKindOf "Helicopter" || _veh isKindOf "Plane")&& !(_veh isKindOf "Quadbike_01_base_F")) then {
//	if(_iampilot) then {
//	hint "飞行员只能上飞机";
//	player action ["getOut", _veh];
//	};
//	};//如果不允许飞行员上其它载具则放开注释
};
};