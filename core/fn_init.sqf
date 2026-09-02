/* RHD - LifeCore | SERVER CONFIGURATION | Author: LT. Toad
   Beginner: edit this file for admins, jobs, prices, recipes and RHD tuning.
   Map layout belongs in Eden / 3DEN. */

if (!isServer) exitWith {};

// IDENTITY
missionNamespace setVariable ["RHD_VERSION", "2.1.0-A3A", true];
missionNamespace setVariable ["RHD_DISPLAY_NAME", "RHD - LifeCore", true];
missionNamespace setVariable ["RHD_AUTHOR", "LT. Toad", true];

// Safe defaults: no RHD-only system can operate until the 3DEN Life module runs.
missionNamespace setVariable ["RHD_LIFE_MODULE_READY", false, true];
missionNamespace setVariable ["RHD_LIFE_ENABLE_ECONOMY", false, true];
missionNamespace setVariable ["RHD_LIFE_ENABLE_JOBS", false, true];
missionNamespace setVariable ["RHD_LIFE_ENABLE_INDUSTRY", false, true];
missionNamespace setVariable ["RHD_LIFE_ENABLE_RP", false, true];
missionNamespace setVariable ["RHD_LIFE_ENABLE_PERSISTENCE", false, true];
missionNamespace setVariable ["RHD_LIFE_ENABLE_AMBIENT", false, true];
missionNamespace setVariable ["RHD_LIFE_ENABLE_BRANDING", false, true];
missionNamespace setVariable ["RHD_LIFE_ENABLE_TABLET", false, true];
missionNamespace setVariable ["RHD_LIFE_ENABLE_CONFLICT", false, true];

// ADMINISTRATORS - replace the example IDs with trusted Steam64 IDs.
missionNamespace setVariable ["RHD_ADMIN_UIDS", [], true];

// INTERNAL DATABASES
missionNamespace setVariable ["RHD_DB", createHashMap];
missionNamespace setVariable ["RHD_SHOPS", createHashMap];

// DYNAMIC SHOP - base game AND all currently loaded addon/mod content.
missionNamespace setVariable ["RHD_SHOP_AUTO_IMPORT", true, true];
missionNamespace setVariable ["RHD_SHOP_VEHICLE_PRICE_MULTIPLIER", 1.0, true];
missionNamespace setVariable ["RHD_SHOP_ITEM_PRICE_MULTIPLIER", 1.0, true];
missionNamespace setVariable ["RHD_SHOP_MAX_VEHICLE_PRICE", 2500000, true];
missionNamespace setVariable ["RHD_SHOP_MAX_ITEM_PRICE", 100000, true];
// Example exact overrides:
// createHashMapFromArray [["B_MRAP_01_F", 150000], ["arifle_MX_F", 5000]]
missionNamespace setVariable ["RHD_SHOP_PRICE_OVERRIDES", createHashMap, true];

// JOBS: [job_id, [Display Name, Pay Per Minute]]
missionNamespace setVariable ["RHD_JOBS", createHashMapFromArray [
    ["civ",     ["Civilian",        0]],
    ["farmer",  ["Farmer",          25]],
    ["miner",   ["Miner",           35]],
    ["refiner", ["Refinery Worker", 45]],
    ["police",  ["Police",          60]],
    ["medic",   ["EMS",             60]]
], true];

// RHD VIRTUAL RP ITEMS - separate from Arma equipment classes.
missionNamespace setVariable ["RHD_ITEMS", createHashMapFromArray [
    ["apple",           ["Apple",            5,   2,   "food"]],
    ["cannabis_plant", ["Cannabis Plant",   40,  15,  "raw"]],
    ["coca_leaf",       ["Coca Leaf",         35,  12, "raw"]],
    ["corn_cob",        ["Corn Cob",           6,   2, "food"]],
    ["grapes",           ["Grapes",              8,   3, "food"]],
    ["peaches",          ["Peaches",             7,   3, "food"]],
    ["iron_ore",         ["Iron Ore",            18,  7, "ore"]],
    ["copper_ore",       ["Copper Ore",          22,  8, "ore"]],
    ["gold_ore",         ["Gold Ore",             70, 25, "ore"]],
    ["diamond",          ["Diamond",             350, 120, "ore"]],
    ["oil_sand",         ["Oil Sand",              30, 10, "ore"]],
    ["iron",             ["Iron",                  55, 20, "refined"]],
    ["copper",           ["Copper",                65, 24, "refined"]],
    ["gold",             ["Gold",                 180, 70, "refined"]],
    ["oil",              ["Oil",                   90, 35, "refined"]],
    ["water",            ["Water",                  5,  2, "drink"]],
    ["bread",            ["Bread",                  8,  3, "food"]]
], true];

// REFINING
missionNamespace setVariable ["RHD_RECIPES", createHashMapFromArray [
    ["iron_ore",   ["iron",   1, 2]],
    ["copper_ore", ["copper", 1, 2]],
    ["gold_ore",   ["gold",   1, 3]],
    ["oil_sand",   ["oil",    1, 2]]
], true];

// GATHERABLES
missionNamespace setVariable ["RHD_GATHER", createHashMapFromArray [
    ["apple", 1], ["cannabis_plant", 1], ["coca_leaf", 1],
    ["corn_cob", 1], ["grapes", 1], ["peaches", 1],
    ["iron_ore", 1], ["copper_ore", 1], ["gold_ore", 1],
    ["diamond", 1], ["oil_sand", 1]
], true];

// ANTISTASI ULTIMATE BASE BRIDGE
missionNamespace setVariable ["RHD_A3A_REQUIRED", true, true];
missionNamespace setVariable ["RHD_A3A_WORLD_BRIDGE_ENABLE", true, true];
missionNamespace setVariable ["RHD_A3A_CRIME_AGGRESSION_MULTIPLIER", 0.5, true];
missionNamespace setVariable ["RHD_A3A_CRIME_AGGRESSION_MINUTES", 10, true];
missionNamespace setVariable ["RHD_A3A_ALLOW_RESOURCE_EVENTS", true, true];
missionNamespace setVariable ["RHD_A3A_ALLOW_BASE_VEHICLE_SPAWN", true, true];

// LOCAL RHD LIFE DISTRICT SETTINGS
missionNamespace setVariable ["RHD_CONFLICT_ENABLE", true, true];
missionNamespace setVariable ["RHD_CONFLICT_UPDATE_SECONDS", 60, true];
missionNamespace setVariable ["RHD_CONFLICT_ZONE_RADIUS", 400, true];
missionNamespace setVariable ["RHD_CONFLICT_MAX_HEAT", 100, true];
missionNamespace setVariable ["RHD_CONFLICT_HEAT_DECAY_WITH_POLICE", 1.5, true];
missionNamespace setVariable ["RHD_CONFLICT_HEAT_GROWTH_NO_POLICE", 0.25, true];
missionNamespace setVariable ["RHD_CONFLICT_START_SUPPLY", 100, true];

// Publish shared RHD configuration.
publicVariable "RHD_VERSION";
publicVariable "RHD_DISPLAY_NAME";
publicVariable "RHD_AUTHOR";
publicVariable "RHD_ADMIN_UIDS";
publicVariable "RHD_ITEMS";
publicVariable "RHD_RECIPES";
publicVariable "RHD_GATHER";
