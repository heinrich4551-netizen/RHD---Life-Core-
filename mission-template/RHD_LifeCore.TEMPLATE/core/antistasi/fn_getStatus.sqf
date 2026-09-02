/*
    RHD - LifeCore | Antistasi Base Status
    Author: LT. Toad

    Returns the A3A-backed world state used by the RHD player tablet and admin
    tools. The function is deliberately defensive so it can be queried while
    the campaign is still initializing.

    Return:
        [ready, version, startupState, aggression, hq, controlledMarkers,
         enemyAttackResources, enemyDefenceResources]
*/

private _ready = missionNamespace getVariable ["RHD_A3A_BASE_READY", false];
private _version = missionNamespace getVariable ["RHD_A3A_BASE_VERSION", "unknown"];
private _startup = missionNamespace getVariable ["A3A_startupState", "unknown"];
private _aggro = missionNamespace getVariable ["aggression", 0];
private _hq = missionNamespace getVariable ["RHD_A3A_HQ", objNull];
private _markers = missionNamespace getVariable ["RHD_A3A_ZONE_MARKERS", []];
private _attack = missionNamespace getVariable ["A3A_resourcesAttackInv", 0];
private _defence = missionNamespace getVariable ["A3A_resourcesDefenceInv", 0];

[_ready, _version, _startup, _aggro, _hq, _markers, _attack, _defence]
