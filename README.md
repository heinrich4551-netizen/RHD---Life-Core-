# RHD - LifeCore

**Arma 3 Life RP framework | Author: LT. Toad | Version 2.1.1**

RHD is intentionally separated into a **mod** and a **mission**. The mod supplies compiled PBOs and Eden modules. The mission supplies `description.ext`, bootstrap scripts, RHD configuration, and map-specific Eden content.

## 1. Repository layout

```text
RHD---Life-Core-
├─ addons/                         <- MOD SOURCE; build into @RHD-LifeCore
│  ├─ rhd_lifecore/
│  └─ rhd_clothing/
├─ mission-template/
│  ├─ README.md
│  └─ RHD_LifeCore.TEMPLATE/       <- COMPLETE COPY-READY MISSION SOURCE
│     ├─ description.ext
│     ├─ initServer.sqf
│     ├─ initPlayerLocal.sqf
│     ├─ onPlayerRespawn.sqf
│     ├─ core/
│     └─ assets/
├─ core/                            <- mission-source master copy
├─ description.ext                  <- legacy/root mission source copy
├─ initServer.sqf                   <- legacy/root mission source copy
├─ initPlayerLocal.sqf              <- legacy/root mission source copy
├─ onPlayerRespawn.sqf              <- legacy/root mission source copy
├─ assets/                           <- mission branding master copy
└─ .github/workflows/               <- build + package automation
```

For new missions, use `mission-template/RHD_LifeCore.TEMPLATE/`. The root mission files are retained as source/reference copies.

## 2. REQUIRED EXTERNAL ADDONS

Only these external Steam Workshop addons are hard dependencies of the RHD addon:

| Addon | Workshop ID | RHD requirement |
|---|---:|---|
| CBA_A3 | `450814997` | **Required** |
| cTab+ | `2262006564` | **Required** |
| Antistasi Ultimate / A3A | — | Optional runtime integration |
| ACE3 | — | Optional runtime enhancement |

RHD's `CfgPatches.requiredAddons[]` contains only `cba_main` and `ctab_core`. A3A and ACE3 are checked at runtime instead of being declared as hard dependencies.

## 3. MOD INSTALL — ARMA 3 LAUNCHER

Build/download the mod so the final layout is:

```text
Arma 3/
└─ @RHD-LifeCore/
   └─ addons/
      ├─ rhd_rhd_lifecore.pbo
      └─ rhd_rhd_clothing.pbo
```

In the Arma 3 Launcher, enable:

```text
CBA_A3
cTab+
RHD - LifeCore
```

Load Antistasi Ultimate, ACE3, and other content mods only when the mission uses them.

## 4. COPY-READY MISSION SETUP

Start from:

```text
mission-template/RHD_LifeCore.TEMPLATE/
```

Copy the **entire folder** into your Arma 3 user mission directory and rename it to the standard Arma mission format:

```text
<MissionName>.<TerrainName>
```

Example:

```text
RHD_LifeCore.Altis
```

Do not add `.pbo` while editing in Eden.

The template contains all RHD mission-side code. The only important file it does not contain is `mission.sqm`, because Eden must generate that file after you place the required modules and your map objects.

### Mission-side layout

```text
RHD_LifeCore.Altis/
├─ description.ext
├─ initServer.sqf
├─ initPlayerLocal.sqf
├─ onPlayerRespawn.sqf
├─ core/
│  ├─ fn_init.sqf              <- BEGINNER CONFIG FILE
│  ├─ economy/
│  ├─ bank/
│  ├─ jobs/
│  ├─ industry/
│  ├─ rp/
│  ├─ services/
│  ├─ ui/
│  ├─ admin/
│  ├─ antistasi/
│  ├─ conflict/
│  ├─ ambient/
│  ├─ ace/
│  └─ branding/
├─ assets/
│  └─ branding/
└─ mission.sqm                  <- Eden-generated
```

Never put RHD PBOs inside this folder.

## 5. 3DEN — REQUIRED MODULE

Open **3DEN -> Systems** and place exactly one:

```text
RHD - LifeCore | Life RP Systems
```

Recommended defaults:

| Attribute | Default | What it controls |
|---|---|---|
| Economy / Shops | ON | Virtual market + dynamic vehicle/equipment shops |
| Jobs | ON | Civilian/Farmer/Miner/Refiner/Police/EMS |
| Farming / Mining / Refining | ON | Virtual resource gathering and refining |
| Police / EMS / RP | ON | Tickets, medical, dispatch |
| Life RP Persistence | ON | RHD player save/load |
| Ambient Life | ON | Civilian/incident systems |
| RHD Billboard Branding | ON | RHD artwork on supported billboards |
| cTab Player Tablet | ON | Player tablet via cTab+ |
| Life District Pressure | ON | RHD civilian crime/heat layer |

The module is the authoritative editor switch for RHD systems. Without it, RHD player features remain disabled.

## 6. 3DEN — OPTIONAL ANTISTASI BRIDGE

Only when Antistasi Ultimate is installed **and** you want campaign integration, place exactly one:

```text
RHD - LifeCore | Antistasi Ultimate Bridge (Optional)
```

Place it at your chosen campaign/HQ anchor point.

Attributes:

| Attribute | Default | Function |
|---|---|---|
| Use Antistasi Ultimate when installed | ON | Connects RHD to A3A when present |
| Create Antistasi HQ Anchors | ON | Creates safe host anchors for the bridge |
| Enable Antistasi Terrain Adapter | ON | Adds generic fallback handling before A3A startup |

The bridge may be omitted even when A3A is installed. In that case RHD deliberately runs in `STANDALONE` mode and does not wait for A3A startup.

## 7. EDEN MAP SETUP

Put map-specific locations in Eden. Do not hard-code terrain coordinates into SQF.

Marker prefixes:

```text
rhd_shop_<name>
rhd_bank_<name>
rhd_fuel_<name>
rhd_farm_<resource>_<name>
rhd_mine_<resource>_<name>
rhd_refine_<resource>_<name>
rhd_zone_<name>
rhd_jail_<name>
```

Examples:

```text
rhd_shop_city
rhd_shop_industrial
rhd_bank_city
rhd_fuel_city
rhd_farm_apples_north
rhd_farm_cannabis_south
rhd_farm_coca_hills
rhd_farm_corn_fields
rhd_farm_grapes_vineyard
rhd_farm_peaches_orchard
rhd_mine_iron_quarry
rhd_mine_copper_quarry
rhd_mine_gold_quarry
rhd_mine_diamond_quarry
rhd_mine_oil_oilsands
rhd_refine_iron_factory
rhd_refine_copper_factory
rhd_refine_gold_factory
rhd_refine_oil_refinery
rhd_zone_city
rhd_jail_city
```

For shops, players must stand near an `rhd_shop_*` marker. Banks/services/resources use their matching marker families.

### Billboard branding

Place normal `Land_Billboard_F` objects. With branding enabled, RHD uses:

```text
assets/branding/RHDLifeCore.jpg
```

Skip an individual billboard with:

```sqf
this setVariable ["rhd_billboard_skip", true, true];
```

## 8. BEGINNER CONFIG — core/fn_init.sqf

This is the main mission configuration file. Edit this file rather than spreading gameplay values through the SQF tree.

### Identity

```text
RHD_VERSION
RHD_DISPLAY_NAME
RHD_AUTHOR
```

### Admins

```sqf
missionNamespace setVariable ["RHD_ADMIN_UIDS", [
    "76561198000000000",
    "76561198000000001"
], true];
```

Use Steam64 IDs only.

### Dynamic shop configuration

```text
RHD_SHOP_AUTO_IMPORT
RHD_SHOP_VEHICLE_PRICE_MULTIPLIER
RHD_SHOP_ITEM_PRICE_MULTIPLIER
RHD_SHOP_MAX_VEHICLE_PRICE
RHD_SHOP_MAX_ITEM_PRICE
RHD_SHOP_PRICE_OVERRIDES
```

`RHD_SHOP_AUTO_IMPORT = true` makes the shop build its catalogue from the active Arma 3 config. Public base-game and loaded-mod vehicles can be offered as vehicles; public weapons, magazines, gear, goggles and backpacks can be offered as equipment.

Exact price override example:

```sqf
missionNamespace setVariable ["RHD_SHOP_PRICE_OVERRIDES", createHashMapFromArray [
    ["B_MRAP_01_F", 150000],
    ["arifle_MX_F", 5000]
], true];
```

The server validates the class, shop distance and final price again when a purchase is requested.

### Jobs

Format:

```text
[job_id, [Display Name, Pay Per Minute]]
```

Defaults:

```text
civ      Civilian
farmer   Farmer
miner    Miner
refiner  Refinery Worker
police   Police
medic    EMS
```

### Virtual Life RP items

Format:

```text
[item_id, [Display Name, Unit Value, Cost Reference, Category]]
```

Current defaults include:

```text
apple
cannabis_plant
coca_leaf
corn_cob
grapes
peaches
iron_ore
copper_ore
gold_ore
diamond
oil_sand
iron
copper
gold
oil
water
bread
```

These are RHD virtual items, not physical Arma inventory classes.

### Refining

Format:

```text
[input_item, [output_item, output_quantity, input_quantity]]
```

Current defaults:

```text
iron_ore   -> iron    | 2 -> 1
copper_ore -> copper  | 2 -> 1
gold_ore   -> gold    | 3 -> 1
oil_sand   -> oil     | 2 -> 1
```

### Gathering

Format:

```text
[virtual_item, quantity_per_action]
```

### Optional A3A integration settings

```text
RHD_A3A_REQUIRED
RHD_A3A_WORLD_BRIDGE_ENABLE
RHD_A3A_CRIME_AGGRESSION_MULTIPLIER
RHD_A3A_CRIME_AGGRESSION_MINUTES
RHD_A3A_ALLOW_RESOURCE_EVENTS
RHD_A3A_ALLOW_BASE_VEHICLE_SPAWN
```

`RHD_A3A_REQUIRED` should remain `false`; it is a compatibility flag, not a mechanism for turning A3A into a hard addon dependency.

### RHD district pressure settings

```text
RHD_CONFLICT_ENABLE
RHD_CONFLICT_UPDATE_SECONDS
RHD_CONFLICT_ZONE_RADIUS
RHD_CONFLICT_MAX_HEAT
RHD_CONFLICT_HEAT_DECAY_WITH_POLICE
RHD_CONFLICT_HEAT_GROWTH_NO_POLICE
RHD_CONFLICT_START_SUPPLY
```

These control the RHD civilian pressure layer around `rhd_zone_*` markers.

### Startup/persistence settings

```text
RHD_PERSISTENCE_SAVE_INTERVAL_SECONDS
RHD_A3A_BRIDGE_WAIT_SECONDS
RHD_STANDALONE_INIT_TIMEOUT_SECONDS
```

The persistence interval controls periodic RHD saves. The bridge wait controls how long the server waits for the optional A3A bridge. The standalone timeout bounds the client wait for the Life RP module.

## 9. RUNTIME MODES

### Standalone

```text
CBA_A3 + cTab+ + RHD
```

No A3A or ACE3 is required. RHD supplies its own Life RP state and vehicle shop spawn fallback.

### Antistasi integration

```text
CBA_A3 + cTab+ + RHD + Antistasi Ultimate
```

Place the optional bridge module. A3A remains authoritative for campaign strategy, save/load, strategic zones, garrisons and other campaign state.

### ACE enhancement

```text
... + ACE3
```

RHD detects ACE3 at runtime and adds ACE interaction hooks for tablet/admin/EMS paths. Without ACE3, those calls are skipped safely.

## 10. PLAYER TABLET

The RHD tablet is hosted by cTab+ and exposes:

```text
STATUS
JOBS
MARKET
VEHICLES
EQUIPMENT
BANK
SERVICES
DISTRICTS
CAMPAIGN
```

The current mission routes F6/F7/F8 convenience shortcuts into the cTab-backed RHD surface.

## 11. ADMINISTRATION

Administration is a separate UID-gated RHD surface.

Configure:

```text
core/fn_init.sqf -> RHD_ADMIN_UIDS
```

Privileged actions are server validated. Do not create public actions that bypass the UID allowlist.

## 12. SERVER DEPLOYMENT

Recommended dedicated-server layout:

```text
Arma3Server/
├─ @RHD-LifeCore/
│  └─ addons/
│     ├─ rhd_rhd_lifecore.pbo
│     └─ rhd_rhd_clothing.pbo
└─ MPMissions/
   └─ RHD_LifeCore.<world>.pbo
```

Clients and server need the same required external addons: CBA_A3 and cTab+. Additional mission-specific mods must also match the mission's intended modset.

The **Arma 3 Launcher loads mods**. The dedicated server loads the mission PBO from `MPMissions`; these are separate deployment channels.

## 13. AUTOMATED SERVER PACKAGE

The workflow `.github/workflows/package-server.yml` builds the PBOs and creates three useful artifacts:

```text
RHD-LifeCore-ServerPackage
RHD-LifeCore-Mod
RHD-LifeCore-MissionSource
```

The server package itself contains:

```text
RHD-LifeCore-ServerPackage/
├─ @RHD-LifeCore/
│  └─ addons/*.pbo
├─ mission-source/
│  ├─ description.ext
│  ├─ initServer.sqf
│  ├─ initPlayerLocal.sqf
│  ├─ onPlayerRespawn.sqf
│  ├─ core/
│  └─ assets/
└─ README-INSTALL.txt
```

For a new Eden mission, the copy-ready source at `mission-template/RHD_LifeCore.TEMPLATE/` is the easiest starting point.

## 14. BUILD / VALIDATION

The CI build runs HEMTT:

```text
hemtt check
hemtt build
```

It also validates required PBO presence, source-only file leakage and the expected compiled RHD clothing classes. The server-package workflow additionally validates the mission source layout and the two-dependency rule.

A successful CI build proves the configured addon sources compile. It does not substitute for an in-game test of your exact `mission.sqm`, terrain, player count and loaded modset.

## 15. DO NOT EDIT BY HAND

```text
mission.sqm       <- generated/owned by Eden
addons/*.pbo      <- generated by HEMTT
vendor/*          <- development/auditing source reference
```

Keep coordinates/object placement in Eden. Keep RHD gameplay configuration in `core/fn_init.sqf`.

## 16. FINAL CHECKLIST

```text
[ ] CBA_A3 enabled
[ ] cTab+ enabled
[ ] @RHD-LifeCore enabled
[ ] mission template copied
[ ] mission folder renamed to <Mission>.<Terrain>
[ ] One RHD Life RP Systems module placed
[ ] Optional A3A bridge placed only when campaign integration is wanted
[ ] Shops/banks/fuel/resource/refinery/zones/jail markers placed
[ ] Admin Steam64 IDs configured
[ ] Mission saved from Eden
[ ] Eden-generated mission.sqm exists
[ ] Mission PBO deployed to MPMissions
[ ] Server/client modsets match
```

## Documentation

`mission-template/README.md` — copy-ready mission source.

`3DEN_SETUP.md` — Eden setup reference.

`3DEN_MODULES.md` — module attributes and behavior.

`STEAM_WORKSHOP_DEPENDENCIES.md` — hard/optional dependency matrix.

`ADMIN_AND_ACE_SETUP.md` — admin + optional ACE integration.

`CTAB_INTEGRATION.md` — cTab integration.

`ANTISTASI_BASE.md` — optional A3A integration.

`ADDON_BUILD.md` — HEMTT/PBO build instructions.

`PERFORMANCE.md` — runtime/performance notes.
