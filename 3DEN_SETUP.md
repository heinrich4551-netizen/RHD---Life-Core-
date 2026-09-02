# RHD Life Core — 3DEN Setup Guide

This guide is for mission makers who are new to Arma 3 as well as experienced developers.

**Important:** RHD is terrain-agnostic. Build the map in Eden and keep the script package the same between terrains.

---

## 1. Before you start

Install these Workshop dependencies:

- Arma 3
- CBA_A3
- ACE3
- cTab+

See `STEAM_WORKSHOP_DEPENDENCIES.md` for the Workshop links and IDs.

---

## 2. Create the mission in Eden

1. Open **Arma 3 → Eden Editor**.
2. Choose your terrain.
3. Create a multiplayer mission.
4. Save it once.
5. Copy the RHD mission files into that mission's folder.
6. Return to Eden and save again.

Let Eden generate `mission.sqm`. Do not hand-edit `mission.sqm` unless you understand exactly what you are changing.

---

## 3. Admin setup

Open:

`core/fn_init.sqf`

Find:

```sqf
missionNamespace setVariable ["RHD_ADMIN_UIDS", [], true];
```

Put your Steam64 ID between the brackets:

```sqf
missionNamespace setVariable [
    "RHD_ADMIN_UIDS",
    ["76561198012345678"],
    true
];
```

Multiple admins:

```sqf
missionNamespace setVariable [
    "RHD_ADMIN_UIDS",
    [
        "76561198012345678",
        "76561198087654321"
    ],
    true
];
```

RHD never uses player names for admin authentication.

---

## 4. Marker naming rules

The scripts identify locations from marker **names**. Marker shape and color are up to you.

### Farming

Use one or more of these:

- `rhd_farm_apples`
- `rhd_farm_cannabis`
- `rhd_farm_coca`
- `rhd_farm_corn`
- `rhd_farm_grapes`
- `rhd_farm_peaches`

### Mining

- `rhd_mine_iron`
- `rhd_mine_copper`
- `rhd_mine_gold`
- `rhd_mine_diamond`
- `rhd_mine_oil`

### Refining

- `rhd_refine_iron`
- `rhd_refine_copper`
- `rhd_refine_gold`
- `rhd_refine_oil`

The recipes are configured in `core/fn_init.sqf`.

Current recipes:

| Input | Output |
|---|---|
| 1 Iron Ore | 2 Iron |
| 1 Copper Ore | 2 Copper |
| 1 Gold Ore | 3 Gold |
| 1 Oil Sand | 2 Oil |

### Shops

Name shop markers like:

`rhd_shop_kavala`

`rhd_shop_industrial`

`rhd_shop_harbor`

The shop uses the items and prices defined in `core/fn_init.sqf`.

### Banks

Use names such as:

`rhd_bank_kavala`

`rhd_bank_industrial`

### Fuel

Use names such as:

`rhd_fuel_kavala`

`rhd_fuel_industrial`

`rhd_fuel_harbor`

### Jail

Use:

`rhd_jail_main`

Additional jail markers can use the same `rhd_jail_` prefix.

---

## 5. Optional Eden object variables

On an NPC or object, you can assign these variable names for future expansion:

- `rhd_shop`
- `rhd_bank`
- `rhd_garage`
- `rhd_farm`
- `rhd_mine`
- `rhd_refine`
- `rhd_fuel`

The framework currently uses marker positions as the portable baseline, so these variables are optional.

---

## 6. Player interface

RHD uses **cTab+** as the player-facing tablet. The tablet contains:

- Player status
- Inventory
- Jobs
- Shop
- Banking
- Gathering
- Refining

The old F6/F7/F8 interfaces are now shortcuts into cTab pages rather than separate RHD windows.

The normal player interface does not require an RHD inventory item.

---

## 7. Administrator interface

Administrators have a completely separate interface.

Open ACE Self Actions and choose:

**RHD Administration**

There is no administrator item and no dedicated administrator hotkey.

All privileged commands are sent to the server and the admin Steam64 ID is checked again before execution.

---

## 8. Recommended town layout

For each town, place:

1. Player/spawn area.
2. RHD shop.
3. RHD bank/ATM.
4. Fuel station.
5. Police station.
6. EMS station.
7. Civilian/job center.
8. Farms.
9. Mines.
10. Refinery.
11. Jail/holding area.

You can use any terrain and any building pack.

---

## 9. Editing prices, jobs and recipes

For beginners, almost all economic balancing is done in one file:

`core/fn_init.sqf`

That file contains clear sections for:

- Administrators
- Jobs
- Items
- Refining recipes
- Gatherable resources

Examples are included directly in the file. The goal is that a new server owner can change a price or job salary without searching through the whole project.

---

## 10. Testing checklist

Test these in a local multiplayer preview first:

- Player joins and receives a RHD identity.
- cTab tablet opens.
- Status page shows cash/bank/job/inventory.
- Job selection works.
- Shop works at a `rhd_shop_*` marker.
- Bank works at a `rhd_bank_*` marker.
- Gathering only works in the correct location/job.
- Refining consumes the input and gives the configured output.
- ACE interactions appear when ACE3 is loaded.
- Admin panel is visible only to allowlisted Steam64 IDs.
- Admin actions are rejected for non-admin clients.
- Dedicated-server test passes before public release.

---

## 11. Performance rule

Do not add hundreds of always-running AI units just to make a town look busy. RHD's ambient system is intentionally capped and cleans up distant actors.

See `PERFORMANCE.md` before increasing population limits.
