/*
    RHD LIFE CORE - SERVER CONFIGURATION
    ---------------------------------------------------------------------------
    This file contains the settings most server owners will want to edit.

    NEW TO ARMA 3?
    - Edit only the clearly marked sections below.
    - Steam64 IDs look like: 76561198000000000
    - Money values are whole numbers.
    - Job pay is the amount earned per minute.
    - Item entries use: [Display Name, Buy Price, Sell Price, Category]
    - Recipe entries use: [Output Item, Input Amount, Output Amount]
    ---------------------------------------------------------------------------
*/

if (!isServer) exitWith {};

// ============================================================================
// SERVER VERSION
// ============================================================================
missionNamespace setVariable ["RHD_VERSION", "1.1.0", true];

// ============================================================================
// ADMINISTRATORS - EDIT THIS LIST
// ============================================================================
// Put your trusted admins' Steam64 IDs inside the brackets.
// Example:
// ["76561198012345678", "76561198087654321"]
//
// IMPORTANT: Do NOT use player names. Names can change; Steam64 IDs do not.
missionNamespace setVariable ["RHD_ADMIN_UIDS", [], true];

// ============================================================================
// INTERNAL DATABASES
// ============================================================================
// Leave these alone unless you are extending the framework itself.
missionNamespace setVariable ["RHD_DB", createHashMap];
missionNamespace setVariable ["RHD_SHOPS", createHashMap];

// ============================================================================
// JOBS
// ============================================================================
// Format:
// ["job_id", ["Display Name", Pay Per Minute]]
//
// Example:
// ["mechanic", ["Mechanic", 50]]
missionNamespace setVariable ["RHD_JOBS", createHashMapFromArray [
    ["civ",     ["Civilian",        0]],
    ["farmer",  ["Farmer",          25]],
    ["miner",   ["Miner",           35]],
    ["refiner", ["Refinery Worker",  45]],
    ["police",  ["Police",           60]],
    ["medic",   ["EMS",              60]]
], true];

// ============================================================================
// ITEMS
// ============================================================================
// Format:
// ["item_id", ["Display Name", Buy Price, Sell Price, "Category"]]
//
// Categories are labels used by RHD. They do not have to match real-world
// inventory types. You can add your own category names.
missionNamespace setVariable ["RHD_ITEMS", createHashMapFromArray [
    // Food / farming
    ["apple",           ["Apple",            5,   2,  "food"]],
    ["cannabis_plant", ["Cannabis Plant",   40,  15,  "raw"]],
    ["coca_leaf",      ["Coca Leaf",         35,  12,  "raw"]],
    ["corn_cob",       ["Corn Cob",           6,   2,  "food"]],
    ["grapes",         ["Grapes",              8,   3,  "food"]],
    ["peaches",        ["Peaches",             7,   3,  "food"]],

    // Mining
    ["iron_ore",       ["Iron Ore",            18,  7,  "ore"]],
    ["copper_ore",     ["Copper Ore",          22,  8,  "ore"]],
    ["gold_ore",       ["Gold Ore",            70, 25,  "ore"]],
    ["diamond",        ["Diamond",             350, 120, "ore"]],
    ["oil_sand",       ["Oil Sand",             30, 10, "ore"]],

    // Refined materials
    ["iron",            ["Iron",                55, 20, "refined"]],
    ["copper",          ["Copper",              65, 24, "refined"]],
    ["gold",             ["Gold",               180, 70, "refined"]],
    ["oil",              ["Oil",                 90, 35, "refined"]],

    // Basic supplies
    ["water",            ["Water",                5,  2, "drink"]],
    ["bread",            ["Bread",                8,  3, "food"]]
], true];

// ============================================================================
// REFINING RECIPES
// ============================================================================
// Format:
// ["input_item", ["output_item", Input Amount, Output Amount]]
//
// Example:
// One iron ore -> two iron.
missionNamespace setVariable ["RHD_RECIPES", createHashMapFromArray [
    ["iron_ore",   ["iron",   1, 2]],
    ["copper_ore", ["copper", 1, 2]],
    ["gold_ore",   ["gold",   1, 3]],
    ["oil_sand",   ["oil",    1, 2]]
], true];

// ============================================================================
// GATHERABLE ITEMS
// ============================================================================
// Each item below can be returned by an RHD gather location.
// To stop an item from being gathered, remove its line from this list.
missionNamespace setVariable ["RHD_GATHER", createHashMapFromArray [
    ["apple",           1],
    ["cannabis_plant", 1],
    ["coca_leaf",      1],
    ["corn_cob",       1],
    ["grapes",         1],
    ["peaches",        1],
    ["iron_ore",       1],
    ["copper_ore",     1],
    ["gold_ore",       1],
    ["diamond",        1],
    ["oil_sand",       1]
], true];

// ============================================================================
// MAKE SERVER CONFIG AVAILABLE TO CLIENTS
// ============================================================================
publicVariable "RHD_VERSION";
publicVariable "RHD_ADMIN_UIDS";
publicVariable "RHD_ITEMS";
publicVariable "RHD_RECIPES";
publicVariable "RHD_GATHER";
