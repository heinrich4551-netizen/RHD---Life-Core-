/*
    RHD - LifeCore | SHOP DELIVERY
    Client-side only. The server decides whether a purchase is valid and sends
    the already-validated class/type here.
*/

if (!hasInterface) exitWith {false};

params [
    ["_class", "", [""]],
    ["_type", "ITEM", [""]]
];

private _ok = false;

switch (toUpper _type) do {
    case "WEAPON": {
        player addWeapon _class;
        _ok = true;
    };

    case "MAGAZINE": {
        player addMagazine _class;
        _ok = true;
    };

    case "GLASSES": {
        player addGoggles _class;
        _ok = true;
    };

    case "BACKPACK": {
        // Never destroy the purchase because the player already has a backpack.
        private _holder = createVehicle ["GroundWeaponHolder_Simple", getPosATL player, [], 0, "CAN_COLLIDE"];
        _holder addBackpackCargoGlobal [_class, 1];
        _ok = true;
    };

    default {
        player addItem _class;
        _ok = true;
    };
};

_ok
