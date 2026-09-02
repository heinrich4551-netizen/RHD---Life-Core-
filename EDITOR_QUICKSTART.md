# RHD - LifeCore — Editor Quickstart

**Author: LT. Toad**

This guide is for editors who are new to Arma 3 scripting.

## 1. Place the two RHD modules in 3DEN

### Antistasi Ultimate Base

`Systems -> RHD - LifeCore -> Antistasi Ultimate Base`

Place one at the campaign start / HQ location. Keep the three default options enabled.

This module starts the installed Antistasi Ultimate campaign. A3A remains responsible for strategic world state, campaign persistence, faction control, garrisons, patrols, QRFs, attacks, aggression, resources, HQ/Petros, arsenal and strategic background systems.

### Life RP Systems

`Systems -> RHD - LifeCore -> Life RP Systems`

Place one anywhere. Keep the options enabled for the features you want.

This module controls the RHD-only systems around the A3A campaign: economy, jobs, industry, police/EMS, persistence, ambient life, branding, cTab and Life RP district pressure.

## 2. Set up the map in Eden

Use Eden for all map-specific setup. Do not hard-code terrain coordinates into SQF.

RHD location markers:

```text
rhd_shop_
rhd_bank_
rhd_fuel_
rhd_farm_
rhd_mine_
rhd_refine_
rhd_zone_
rhd_jail_
```

See `3DEN_SETUP.md` for the exact naming examples.

## 3. Configure gameplay values

Edit only:

`core/fn_init.sqf`

This is where you change:

- Admin Steam64 IDs
- Job names and pay
- RHD virtual market prices
- Refining recipes
- Gatherable resources
- Dynamic shop price multipliers
- Exact vehicle/item price overrides
- Antistasi crime/aggression tuning
- RHD district pressure tuning

## 4. Shop content is automatic

The RHD shop reads the live Arma 3 configuration at runtime.

The vehicle shop includes public land/air/ship vehicles in the active modset.

The equipment shop includes public weapons, magazines, gear, goggles and backpacks in the active modset.

This means the same RHD shop automatically sees base-game content and public content from loaded dependency mods without a hard-coded class list for every addon.

## 5. Player tablet

Use ACE Self Actions -> `RHD LifeCore Tablet`.

The tablet contains:

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

The `CAMPAIGN` page reports the A3A-backed strategic world.

## 6. Admin

Administration is separate from cTab.

Use ACE Self Actions -> `RHD Administration`.

No admin item and no dedicated admin hotkey are required.

Admin access is configured by Steam64 ID in `core/fn_init.sqf`.

## 7. Branding

Mission name:

`RHD - LifeCore`

Author:

`LT. Toad`

Artwork:

`assets/branding/RHDLifeCore.jpg`

Normal `Land_Billboard_F` objects placed in Eden are automatically branded when billboard branding is enabled.

Set this object variable to opt out a single billboard:

```sqf
rhd_billboard_skip = true
```

## 8. Terrain support

RHD is designed around Antistasi Ultimate rather than replacing it.

A3A mapInfo is used when the active terrain provides it. The RHD Antistasi Base module can install a generic fallback for terrains without a mapInfo entry.

The fallback improves generic terrain compatibility but cannot invent terrain-specific airports, special buildings, factions or map data. Those cases still need terrain-specific A3A mapInfo and in-game validation.

## 9. What not to edit

Do not edit `mission.sqm` by hand.

Do not put terrain coordinates in `core/fn_init.sqf`.

Do not rename `fn_*.sqf` files casually.

Do not move economy or admin validation to client-only code.

Do not copy external A3A, ACE3, CBA_A3 or cTab PBOs into the mission folder.

## 10. Final test

1. Load Arma 3 with Antistasi Ultimate, CBA_A3, ACE3, cTab+ and the RHD addon.
2. Open the mission in Eden.
3. Place the two RHD modules.
4. Place at least one `rhd_shop_*` marker.
5. Add the other RHD locations you want.
6. Save the mission in Eden.
7. Run a local multiplayer preview.
8. Confirm Antistasi reaches its campaign startup state.
9. Confirm the RHD tablet, shop and ACE interactions.
10. Then test the identical modset on the dedicated server.
