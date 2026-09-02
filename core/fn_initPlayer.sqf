player setVariable ["RHD_UID", getPlayerUID player, false];
player setVariable ["RHD_CASH", 500, false];
player setVariable ["RHD_BANK", 2500, false];
player setVariable ["RHD_JOB", "civ", false];
player setVariable ["RHD_INV", createHashMap, false];
player setVariable ["RHD_LICENSES", ["driver"], false];
player setVariable ["RHD_JAILED", false, false];
player setVariable ["RHD_WORKING", false, false];

player addEventHandler ["Killed", {
    player setVariable ["RHD_WORKING", false, false];
}];

player addAction ["Gather at nearby RHD location", {[] call RHD_fnc_requestGather}, nil, 1.5, true, true, "", "true", 5, false, ""];
player addAction ["Refine at nearby RHD refinery", {[] call RHD_fnc_requestRefine}, nil, 1.5, true, true, "", "true", 5, false, ""];
player addAction ["Open RHD Shop", {[] call RHD_fnc_shopOpen}, nil, 1.5, true, true, "", "true", 5, false, ""];
