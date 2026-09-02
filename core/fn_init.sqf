/*
    RHD - LifeCore | SERVER CONFIGURATION
    Author: LT. Toad
    ---------------------------------------------------------------------------
    NEW TO ARMA 3?
    This is the main file to edit for server balancing and RHD integration.

    SAFE TO EDIT HERE
    -----------------
    - Admin Steam64 IDs
    - Job names and pay
    - Item names and prices
    - Refining recipes
    - Gatherable resources
    - Antistasi/RHD bridge tuning
    - Local Conflict tuning

    DO MAP WORK IN EDEN
    -------------------
    Locations are placed in 3DEN using the marker names documented in
    3DEN_SETUP.md. Do not put terrain coordinates in this file.
    ---------------------------------------------------------------------------
*/

if (!isServer) exitWith {};

// ============================================================================
// RHD - LIFECORE IDENTITY
// ============================================================================
missionNamespace setVariable ["RHD_VERSION", "2.0.0-A3A", true];
missionNamespace setVariable ["RHD_DISPLAY_NAME", "RHD - LifeCore", true];
missionNamespace setVariable ["RHD_AUTHOR", "LT. Toad", true];

// ============================================================================
// ADMINISTRATORS - EDIT THIS LIST
// ============================================================================
// Replace the example IDs with the Steam64 IDs of your trusted administrators.
// IMPORTANT: use Steam64 IDs, NOT player names.
missionNamespace setVariable [
    "RHD_ADMIN_UIDS",
    [],
    true
];

// ============================================================================
// INTERNAL DATABASES - DO NOT EDIT FOR NORMAL SERVER SETUP
// ============================================================================
missionNamespace setVariable ["RHD_DB", createHashMap];
missionNamespace setVariable ["RHD_SHOPS", createHashMap];

// ============================================================================
// JOBS - EDIT PAY RATES HERE
// ============================================================================
// Format: ["job_id", ["Display Name", Pay Per Minute]]
missionNamespace setVariable ["RHD_JOBS", createHashMapFromArray [
    ["civ",     ["Civilian",        0]],
    ["farmer",  ["Farmer",          25]],
    ["miner",   ["Miner",           35]],
    ["refiner", ["Refinery Worker", 45]],
    ["police",  ["Police",          60]],
    ["medic",   ["EMS",             60]]
], true];

// ============================================================================
// ITEMS - EDIT NAMES AND PRICES HERE
// ============================================================================
// Format: ["item_id", ["Display Name", Buy Price, Sell Price, "Category"]]
missionNamespace setVariable ["RHD_ITEMS", createHashMapFromArray [
    // FARMING / FOOD
    ["apple",           ["Apple",            5,   2,   "food"]],
    ["cannabis_plant", ["Cannabis Plant",   40,  15,  "raw"]],
    ["coca_leaf",      ["Coca Leaf",         35,  12,  "raw"]],
    ["corn_cob",       ["Corn Cob",           6,   2,   "food"]],
    ["grapes",         ["Grapes",              8,   3,   "food"]],
    ["peaches",        ["Peaches",             7,   3,   "food"]],

    // MINING
    ["iron_ore",       ["Iron Ore",            18,   7, "ore"]],
    ["copper_ore",     ["Copper Ore",          22,   8, "ore"]],
    ["gold_ore",       ["Gold Ore",            70,  25, "ore"]],
    ["diamond",        ["Diamond",            350, 120, "ore"]],
    ["oil_sand",       ["Oil Sand",             30,  10, "ore"]],

    // REFINED MATERIALS
    ["iron",           ["Iron",                 55,  20, "refined"]],
    ["copper",         ["Copper",               65,  24, "refined"]],
    ["gold",           ["Gold",                 180,  70, "refined"]],
    ["oil",            ["Oil",                   90,  35, "refined"]],

    // BASIC SUPPLIES
    ["water",          ["Water",                  5,   2, "drink"]],
    ["bread",          ["Bread",                  8,   3, "food"]]
], true];

// ============================================================================
// REFINING RECIPES - EDIT PRODUCTION HERE
// ============================================================================
// Format: ["input_item", ["output_item", Input Amount, Output Amount]]
missionNamespace setVariable ["RHD_RECIPES", createHashMapFromArray [
    ["iron_ore",   ["iron",   1, 2]],
    ["copper_ore", ["copper", 1, 2]],
    ["gold_ore",   ["gold",   1, 3]],
    ["oil_sand",   ["oil",    1, 2]]
], true];

// ============================================================================
// GATHERABLE RESOURCES
// ============================================================================
missionNamespace setVariable ["RHD_GATHER", createHashMapFromArray [
    ["apple",           1],
    ["cannabis_plant",  1],
    ["coca_leaf",       1],
    ["corn_cob",        1],
    ["grapes",          1],
    ["peaches",         1],
    ["iron_ore",        1],
    ["copper_ore",      1],
    ["gold_ore",        1],
    ["diamond",         1],
    ["oil_sand",        1]
], true];

// ============================================================================
// ANTISTASI ULTIMATE BASE / RHD WORLD BRIDGE
// ============================================================================
// Antistasi Ultimate is the required strategic world/campaign base.
// RHD adds Life RP systems around that campaign state.
missionNamespace setVariable ["RHD_A3A_REQUIRED", true, true];
missionNamespace setVariable ["RHD_A3A_WORLD_BRIDGE_ENABLE", true, true];

// Crime -> A3A aggression conversion.
missionNamespace setVariable ["RHD_A3A_CRIME_AGGRESSION_MULTIPLIER", 0.5, true];
missionNamespace setVariable ["RHD_A3A_CRIME_AGGRESSION_MINUTES", 10, true];

// Optional bridge controls used by future RHD world events.
missionNamespace setVariable ["RHD_A3A_ALLOW_RESOURCE_EVENTS", true, true];
missionNamespace setVariable ["RHD_A3A_ALLOW_BASE_VEHICLE_SPAWN", true, true];

// ============================================================================
// LOCAL RHD DISTRICT / CONFLICT SETTINGS
// ============================================================================
// A3A owns strategic control. These values add Life RP pressure around towns.
missionNamespace setVariable ["RHD_CONFLICT_ENABLE", true, true];
missionNamespace setVariable ["RHD_CONFLICT_UPDATE_SECONDS", 60, true];
missionNamespace setVariable ["RHD_CONFLICT_ZONE_RADIUS", 400, true];
missionNamespace setVariable ["RHD_CONFLICT_MAX_HEAT", 100, true];
missionNamespace setVariable ["RHD_CONFLICT_HEAT_DECAY_WITH_POLICE", 1.5, true];
missionNamespace setVariable ["RHD_CONFLICT_HEAT_GROWTH_NO_POLICE", 0.25, true];
missionNamespace setVariable ["RHD_CONFLICT_START_SUPPLY", 100, true];

// ============================================================================
// SHARE SAFE CONFIGURATION WITH CLIENTS
// ============================================================================
publicVariable "RHD_VERSION";
publicVariable "RHD_DISPLAY_NAME";
publicVariable "RHD_AUTHOR";
publicVariable "RHD_ADMIN_UIDS";
publicVariable "RHD_ITEMS";
publicVariable "RHD_RECIPES";
publicVariable "RHD_GATHER";
