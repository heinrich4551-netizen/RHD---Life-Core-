/*
    RHD - LifeCore | MISSION CONFIGURATION
    Author: LT. Toad

    EDIT THIS FILE FOR SERVER-SIDE RHD CONFIGURATION.
    ---------------------------------------------------------------------------
    Map layout belongs in Eden / 3DEN. Do not put coordinates here.
    Antistasi Ultimate and ACE3 are optional runtime enhancements.
    Required external addons are CBA_A3 and cTab+ (declared in the addon PBO).
    ---------------------------------------------------------------------------
*/

if (!isServer) exitWith {};

// ============================================================================
// IDENTITY / VERSION
// ============================================================================
missionNamespace setVariable ["RHD_VERSION", "2.1.1", true];
missionNamespace setVariable ["RHD_DISPLAY_NAME", "RHD - LifeCore", true];
missionNamespace setVariable ["RHD_AUTHOR", "LT. Toad", true];

// ============================================================================
// SAFE DEFAULTS
// The 3DEN Life RP Systems module is the authoritative on/off switch.
// ============================================================================
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

// ============================================================================
// ADMINISTRATION
// Use Steam64 IDs, for example: "76561198000000000"
// ============================================================================
missionNamespace setVariable ["RHD_ADMIN_UIDS", [], true];

// ============================================================================
// INTERNAL DATABASES
// ============================================================================
missionNamespace setVariable ["RHD_DB", createHashMap];
missionNamespace setVariable ["RHD_SHOPS", createHashMap];

// ============================================================================
// DYNAMIC SHOPS
// true = import base game + all currently loaded public addon content.
// Prices are recalculated server-side before every purchase.
// ============================================================================
missionNamespace setVariable ["RHD_SHOP_AUTO_IMPORT", true, true];
missionNamespace setVariable ["RHD_SHOP_VEHICLE_PRICE_MULTIPLIER", 1.0, true];
missionNamespace setVariable ["RHD_SHOP_ITEM_PRICE_MULTIPLIER", 1.0, true];
missionNamespace setVariable ["RHD_SHOP_MAX_VEHICLE_PRICE", 2500000, true];
missionNamespace setVariable ["RHD_SHOP_MAX_ITEM_PRICE", 100000, true];
// Exact class-price overrides win over the generated price.
missionNamespace setVariable ["RHD_SHOP_PRICE_OVERRIDES", createHashMap, true];

// ============================================================================
// JOBS
// [job_id, [Display Name, Pay Per Minute]]
// ============================================================================
missionNamespace setVariable ["RHD_JOBS", createHashMapFromArray [
    ["civ",     ["Civilian",        0]],
    ["farmer",  ["Farmer",          25]],
    ["miner",   ["Miner",           35]],
    ["refiner", ["Refinery Worker", 45]],
    ["police",  ["Police",          60]],
    ["medic",   ["EMS",             60]]
], true];

// ============================================================================
// RHD VIRTUAL LIFE-RP ITEMS
// These are independent of Arma inventory classnames.
// [Display Name, Unit Value, Gather/Recipe Cost Reference, Category]
// ============================================================================
missionNamespace setVariable ["RHD_ITEMS", createHashMapFromArray [
    ["apple",           ["Apple",           5,   2,   "food"]],
    ["cannabis_plant", ["Cannabis Plant", 40,  15,   "raw"]],
    ["coca_leaf",      ["Coca Leaf",       35,  12,   "raw"]],
    ["corn_cob",       ["Corn Cob",          6,   2,   "food"]],
    ["grapes",         ["Grapes",             8,   3,   "food"]],
    ["peaches",        ["Peaches",            7,   3,   "food"]],
    ["iron_ore",       ["Iron Ore",          18,   7,   "ore"]],
    ["copper_ore",     ["Copper Ore",        22,   8,   "ore"]],
    ["gold_ore",       ["Gold Ore",          70,  25,   "ore"]],
    ["diamond",        ["Diamond",           350, 120,  "ore"]],
    ["oil_sand",       ["Oil Sand",            30,  10,  "ore"]],
    ["iron",           ["Iron",                55,  20,   "refined"]],
    ["copper",         ["Copper",              65,  24,   "refined"]],
    ["gold",           ["Gold",               180,  70,   "refined"]],
    ["oil",            ["Oil",                 90,  35,   "refined"]],
    ["water",          ["Water",                5,   2,   "drink"]],
    ["bread",          ["Bread",                8,   3,   "food"]]
], true];

// ============================================================================
// REFINING RECIPES
// [input_item, [output_item, output_quantity, input_quantity]]
// ============================================================================
missionNamespace setVariable ["RHD_RECIPES", createHashMapFromArray [
    ["iron_ore",   ["iron",   1, 2]],
    ["copper_ore", ["copper", 1, 2]],
    ["gold_ore",   ["gold",   1, 3]],
    ["oil_sand",   ["oil",    1, 2]]
], true];

// ============================================================================
// GATHERABLES
// [virtual_item, quantity_per_action]
// ============================================================================
missionNamespace setVariable ["RHD_GATHER", createHashMapFromArray [
    ["apple", 1], ["cannabis_plant", 1], ["coca_leaf", 1],
    ["corn_cob", 1], ["grapes", 1], ["peaches", 1],
    ["iron_ore", 1], ["copper_ore", 1], ["gold_ore", 1],
    ["diamond", 1], ["oil_sand", 1]
], true];

// ============================================================================
// OPTIONAL ANTISTASI ULTIMATE INTEGRATION
// The bridge module decides whether an A3A campaign is actually connected.
// ============================================================================
missionNamespace setVariable ["RHD_A3A_REQUIRED", false, true];
missionNamespace setVariable ["RHD_A3A_WORLD_BRIDGE_ENABLE", true, true];
missionNamespace setVariable ["RHD_A3A_CRIME_AGGRESSION_MULTIPLIER", 0.5, true];
missionNamespace setVariable ["RHD_A3A_CRIME_AGGRESSION_MINUTES", 10, true];
missionNamespace setVariable ["RHD_A3A_ALLOW_RESOURCE_EVENTS", true, true];
missionNamespace setVariable ["RHD_A3A_ALLOW_BASE_VEHICLE_SPAWN", true, true];

// ============================================================================
// STANDALONE RHD CONFLICT / DISTRICT SETTINGS
// ============================================================================
missionNamespace setVariable ["RHD_CONFLICT_ENABLE", true, true];
missionNamespace setVariable ["RHD_CONFLICT_UPDATE_SECONDS", 60, true];
missionNamespace setVariable ["RHD_CONFLICT_ZONE_RADIUS", 400, true];
missionNamespace setVariable ["RHD_CONFLICT_MAX_HEAT", 100, true];
missionNamespace setVariable ["RHD_CONFLICT_HEAT_DECAY_WITH_POLICE", 1.5, true];
missionNamespace setVariable ["RHD_CONFLICT_HEAT_GROWTH_NO_POLICE", 0.25, true];
missionNamespace setVariable ["RHD_CONFLICT_START_SUPPLY", 100, true];

// ============================================================================
// PERSISTENCE / STARTUP TUNING
// ============================================================================
missionNamespace setVariable ["RHD_PERSISTENCE_SAVE_INTERVAL_SECONDS", 180, true];
missionNamespace setVariable ["RHD_A3A_BRIDGE_WAIT_SECONDS", 10, true];
missionNamespace setVariable ["RHD_STANDALONE_INIT_TIMEOUT_SECONDS", 15, true];

// Publish shared configuration.
{
    publicVariable _x;
} forEach [
    "RHD_VERSION",
    "RHD_DISPLAY_NAME",
    "RHD_AUTHOR",
    "RHD_ADMIN_UIDS",
    "RHD_JOBS",
    "RHD_ITEMS",
    "RHD_RECIPES",
    "RHD_GATHER",
    "RHD_A3A_REQUIRED",
    "RHD_A3A_WORLD_BRIDGE_ENABLE",
    "RHD_A3A_CRIME_AGGRESSION_MULTIPLIER",
    "RHD_A3A_CRIME_AGGRESSION_MINUTES",
    "RHD_A3A_ALLOW_RESOURCE_EVENTS",
    "RHD_A3A_ALLOW_BASE_VEHICLE_SPAWN",
    "RHD_CONFLICT_ENABLE",
    "RHD_CONFLICT_UPDATE_SECONDS",
    "RHD_CONFLICT_ZONE_RADIUS",
    "RHD_CONFLICT_MAX_HEAT",
    "RHD_CONFLICT_HEAT_DECAY_WITH_POLICE",
    "RHD_CONFLICT_HEAT_GROWTH_NO_POLICE",
    "RHD_CONFLICT_START_SUPPLY",
    "RHD_PERSISTENCE_SAVE_INTERVAL_SECONDS",
    "RHD_A3A_BRIDGE_WAIT_SECONDS",
    "RHD_STANDALONE_INIT_TIMEOUT_SECONDS"
];
