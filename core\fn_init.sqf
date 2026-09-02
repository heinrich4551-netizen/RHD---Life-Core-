if (!isServer) exitWith {};

missionNamespace setVariable ["RHD_VERSION", "1.0.0", true];
missionNamespace setVariable ["RHD_DB", createHashMap, true];
missionNamespace setVariable ["RHD_SHOPS", createHashMap, true];
missionNamespace setVariable ["RHD_JOBS", createHashMapFromArray [
    ["civ", ["Civilian", 0]],
    ["farmer", ["Farmer", 25]],
    ["miner", ["Miner", 35]],
    ["refiner", ["Refinery Worker", 45]],
    ["police", ["Police", 60]],
    ["medic", ["EMS", 60]]
], true];

missionNamespace setVariable ["RHD_ITEMS", createHashMapFromArray [
    ["apple", ["Apple", 5, 2, "food"]],
    ["cannabis_plant", ["Cannabis Plant", 40, 15, "raw"]],
    ["coca_leaf", ["Coca Leaf", 35, 12, "raw"]],
    ["corn_cob", ["Corn Cob", 6, 2, "food"]],
    ["grapes", ["Grapes", 8, 3, "food"]],
    ["peaches", ["Peaches", 7, 3, "food"]],
    ["iron_ore", ["Iron Ore", 18, 7, "ore"]],
    ["copper_ore", ["Copper Ore", 22, 8, "ore"]],
    ["gold_ore", ["Gold Ore", 70, 25, "ore"]],
    ["diamond", ["Diamond", 350, 120, "ore"]],
    ["oil_sand", ["Oil Sand", 30, 10, "ore"]],
    ["iron", ["Iron", 55, 20, "refined"]],
    ["copper", ["Copper", 65, 24, "refined"]],
    ["gold", ["Gold", 180, 70, "refined"]],
    ["oil", ["Oil", 90, 35, "refined"]],
    ["water", ["Water", 5, 2, "drink"]],
    ["bread", ["Bread", 8, 3, "food"]]
], true];

missionNamespace setVariable ["RHD_RECIPES", createHashMapFromArray [
    ["iron_ore", ["iron", 1, 2]],
    ["copper_ore", ["copper", 1, 2]],
    ["gold_ore", ["gold", 1, 3]],
    ["oil_sand", ["oil", 1, 2]]
], true];

missionNamespace setVariable ["RHD_GATHER", createHashMapFromArray [
    ["apple", 1], ["cannabis_plant", 1], ["coca_leaf", 1], ["corn_cob", 1], ["grapes", 1], ["peaches", 1],
    ["iron_ore", 1], ["copper_ore", 1], ["gold_ore", 1], ["diamond", 1], ["oil_sand", 1]
], true];

publicVariable "RHD_VERSION";
publicVariable "RHD_ITEMS";
publicVariable "RHD_RECIPES";
publicVariable "RHD_GATHER";

[] spawn {
    waitUntil {time > 0};
    [] call RHD_fnc_init;
};
