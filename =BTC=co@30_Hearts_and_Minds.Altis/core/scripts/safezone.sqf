/*
I can't give credit to the original creator of this script, as I have no idea who it is.
to call the script, create two markers on the map, BASE OPFOR and BASE BLUFOR define the distance in the SAFETY_ZONES ARRAY
and again in the setTriggerArea lines.
call the script in init.sqf with execVM
etc. []execVM 'scripts\safezone.sqf';
cheers mate - js2k6 aka JakeHekesFists[DMD]
*/
 
 
 
//--- Spawn Protection ---//
#define SAFETY_ZONES    [["safezone", 100]]
#define MESSAGE                 "DO NOT SHOOT in the base"
SPAWN_Restriction=["APERSBoundingMine_Range_Ammo","ATMine_Range_Ammo","DemoCharge_Remote_Ammo","SatchelCharge_Remote_Ammo","SLAMDirectionalMine_Wire_Ammo","APERSTripMine_Wire_Ammo","APERSMine_Range_Ammo","GrenadeHand","smokeshell","F_20mm_Green","F_20mm_Red","F_20mm_White","F_20mm_Yellow","F_40mm_Green","F_40mm_Cir","F_40mm_Red","F_40mm_White","F_40mm_Yellow","NLAW_F","R_TBG32V_F","R_PG32V_F","M_Titan_AP","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShell","SmokeShellYellow","G_40mm_SmokeBlue","G_40mm_SmokeGreen","G_40mm_SmokeOrange","G_40mm_SmokePurple","G_40mm_SmokeRed","G_40mm_Smoke","G_40mm_SmokeYellow","ClaymoreDirectionalMine_Remote_Ammo","mini_Grenade","GrenadeHand_stone","G_40mm_HE","M_NLAW_AT_F","M_Titan_AT"];
 
waitUntil {!isNull player};
 
player addEventHandler ["Fired", {
        if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
        {
        _type = typeOf(_this select 6);
 
        if(_type in SPAWN_Restriction)then{
                        hint format [" restricted ammo : %1", _type];
                        deleteVehicle (_this select 6);
                        titleText [MESSAGE, "PLAIN", 3];               
                        };
        };
}];
 
_PlayerInAreas          = [];
_OldPlayerInAreas       = [];
_TriggerList            = [];
_Debug                          = false;
 
//--- Initialization for an area ---//
_MarkerName             = "BASE OPFOR";
_Pos                     = getMarkerPos _MarkerName ;
_SpawnProtection = createTrigger ["EmptyDetector",_Pos];
_SpawnProtection setTriggerArea [75,75,0,true];
_SpawnProtection setTriggerActivation ["ANY","PRESENT",true];
_SpawnProtection setTriggerStatements ["","",""];
_TriggerList set [ count _TriggerList, [_SpawnProtection, EAST]];
//--- Initialization for an area ---//
_MarkerName             = "BASE BLUFOR";
_Pos                     = getMarkerPos _MarkerName;
_SpawnProtection = createTrigger ["EmptyDetector",_Pos];
_SpawnProtection setTriggerArea [75,75,0,true];
_SpawnProtection setTriggerActivation ["ANY","PRESENT",true];
_SpawnProtection setTriggerStatements ["","",""];
_TriggerList set [ count _TriggerList, [_SpawnProtection, WEST]];
sleep 1;
while{true}do{
        {
        _InZoneArea = _x select 0;
        _InZoneArea = list _InZoneArea;
        _SideZone       = _x select 1;
        {
//--- for infantry ---//
                        if(side _x == _SideZone)then{
                                _x allowDamage false;
                                _PlayerInAreas set [count _PlayerInAreas, _x];
                        };     
//--- for vehicle ---//
                if(side _x == _SideZone && ((_x isKindOf  "Air") ||(_x isKindOf  "Car")||(_x isKindOf  "Ship") ||(_x isKindOf  "Tank")||(_x isKindOf  "Helicopter")))then{
                        if( count crew _x > 0)then{
                                        _friendlies = false;
                                        {
                                                if(side _x == _SideZone)then{_x allowDamage false;_PlayerInAreas set [count _PlayerInAreas, _x];};
                                        }forEach (crew _x);
                                }else{_x allowDamage false;_PlayerInAreas set [count _PlayerInAreas, _x];};
                        };
                }forEach _InZoneArea;
//--- Find the player who left the area and setDamage true ---//
                {
                        if(!(_x in _PlayerInAreas))then{
                                _x allowDamage true;
                                if(_Debug)then{hint format ["left the area %1", _x];};
                        }else{if(_Debug)then{hint format  ["in the area %1", _x];};};
                }forEach _OldPlayerInAreas;
        }foreach _TriggerList;
//--- refresh index---//
_OldPlayerInAreas = _PlayerInAreas;
_PlayerInAreas = [];
sleep 5;
};
