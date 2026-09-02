# Antistasi Ultimate as the RHD - LifeCore Base

**RHD - LifeCore**  
**Author: LT. Toad**

RHD - LifeCore is now designed as a **Life RP layer on top of the Antistasi Ultimate campaign framework**.

## Architecture

The base layer is responsible for the persistent multiplayer world:

- Campaign lifecycle and save/load state.
- Strategic zones, cities and faction control.
- Dynamic aggression and enemy activity.
- Enemy attack / defence resource pools.
- Garrisons, patrols, QRFs, convoys and dynamic attacks.
- Headquarters / Petros state.
- Arsenal and faction equipment systems.
- Existing Antistasi support, mission and event systems.
- World-specific initialization and map analysis.

RHD adds the Life RP layer around that world:

- Player identity, cash and bank accounts.
- Jobs and pay.
- Farming, mining and refining.
- Shops and market pricing.
- Police / EMS RP.
- ACE interactions.
- cTab player tablet.
- Separate UID-gated RHD administration.
- RHD branding and billboard advertising.
- Crime records and Life RP consequences.

## How RHD uses A3A

The RHD bridge waits for the Antistasi campaign to report `serverInitDone` before enabling the base integration. This prevents the Life systems from creating a second competing strategic simulation.

RHD also calls documented/public A3A functions for selected world interactions, including:

```text
A3A_fnc_addAggression
A3A_fnc_addEnemyResources
A3A_fnc_spawnVehicleAtMarker
```

Crime events can therefore increase the Antistasi Occupant aggression model. Server administration can use Antistasi-safe vehicle spawning rather than bypassing the base campaign systems.

## Source base

A pinned Git submodule points to the Antistasi Ultimate `unstable` source tree used as the development base:

```text
vendor/antistasi-ultimate
```

This keeps the exact upstream revision visible without silently copying the complete upstream repository into the RHD project history.

## Licensing boundary

The upstream Antistasi Ultimate repository contains MIT-licensed Antistasi Ultimate / Plus / Community Edition code, but also identifies separately licensed integrated content under APL-ND.

RHD must not modify or redistribute those restricted components. The upstream `LICENSE` file names the restricted locations, including `Tools\\StreetArtist` and `A3-Antistasi\\Garage`.

See `LICENSES/ANTISTASI_ULTIMATE_LICENSE.txt` and `THIRD_PARTY_NOTICES.md`.

## Beginner rule

For normal mission editing:

- Use **Eden** for map placement.
- Use **`core/fn_init.sqf`** for RHD gameplay configuration.
- Leave `vendor/antistasi-ultimate` alone unless you are developing the underlying campaign base.

Advanced developers can work against the pinned A3A source and extend RHD's bridge without changing the Life RP public API.
