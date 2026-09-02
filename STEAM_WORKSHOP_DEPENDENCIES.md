# RHD - LifeCore — Steam Workshop & Dependency Guide

**Author: LT. Toad**

This guide is written for server owners and mission editors who may be new to Arma 3.

## Dependency summary

| Software | Required? | Purpose | Steam Workshop ID |
|---|---|---|---:|
| **Arma 3** | YES | Base game | — |
| **CBA_A3** | YES | cTab+ dependency and shared mod support | `450814997` |
| **ACE3** | YES for the full RHD feature set | ACE interaction layer, EMS interactions and RHD Administration | `463939057` |
| **cTab+** | YES | RHD player tablet | `2262006564` |
| **Antistasi Ultimate** | NO | Design reference only; RHD does not require it at runtime | — |

## Official Workshop links

### CBA_A3

Steam Workshop ID: `450814997`  
https://steamcommunity.com/sharedfiles/filedetails/?id=450814997

cTab+ documents CBA_A3 3.15 or later as a requirement. Use a current supported CBA_A3 release.

### ACE3

Steam Workshop ID: `463939057`  
https://steamcommunity.com/sharedfiles/filedetails/?id=463939057

RHD uses ACE3 for its interaction layer. Core LifeCore systems remain RHD-owned and server-authoritative.

### cTab+

Steam Workshop item/collection referenced by the upstream cTab+ project: `2262006564`  
https://steamcommunity.com/workshop/filedetails/?id=2262006564

RHD opens cTab's existing `cTab_Tablet_dlg` and places RHD-owned controls on it. RHD does not redistribute cTab PBOs.

### Antistasi Ultimate

Source project:  
https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate

**Do not add Antistasi Ultimate to the required mod list for RHD - LifeCore.**

RHD implements its own district-pressure/conflict layer inspired by persistent-world ideas. The RHD implementation lives in `core/conflict/`.

## Client/server mod setup

For the full RHD feature set, make sure the following are installed on the client and the dedicated server where applicable:

1. CBA_A3
2. ACE3
3. cTab+
4. RHD - LifeCore mission

The mission itself is not an addon PBO, so it does not belong in a normal `@Mod` folder.

## Steam Workshop release checklist

Your Workshop page should contain a visible block similar to this:

```text
RHD - LifeCore
Author: LT. Toad

REQUIRED MODS
- CBA_A3 (Workshop 450814997)
- ACE3 (Workshop 463939057)
- cTab+ (Workshop 2262006564)

Arma 3 is required.
Antistasi Ultimate is NOT required.
```

Keep the same dependency list in your server's mod preset/collection.

## Mission vs addon dependencies

RHD - LifeCore is a mission framework rather than a standalone addon PBO. Do not copy external addon PBOs into the RHD mission directory.

Install CBA_A3, ACE3 and cTab+ through their normal Workshop/mod distribution channels.

## First-time setup

1. Install Arma 3.
2. Subscribe to CBA_A3, ACE3 and cTab+.
3. Start Arma 3 and verify the three mods load without errors.
4. Open Eden Editor (3DEN).
5. Create a multiplayer mission on your selected terrain.
6. Copy the RHD - LifeCore mission files into that mission folder.
7. Edit `core/fn_init.sqf` and add the trusted administrator Steam64 IDs.
8. Place the RHD markers described in `3DEN_SETUP.md`.
9. Save the mission in Eden so `mission.sqm` is generated/updated.
10. Test locally, then test on a dedicated server.

## Troubleshooting

### cTab tablet does not open

Check that CBA_A3 and cTab+ are loaded and that the client has the same versions as the server. RHD reports an error when cTab is not detected.

### Admin menu does not appear

Check that ACE3 is loaded and that the administrator's Steam64 ID was entered in the `RHD_ADMIN_UIDS` section of `core/fn_init.sqf`.

### Districts are empty

Add one or more Eden markers named with the `rhd_zone_` prefix, for example `rhd_zone_kavala`.

### The mission has missing external assets

Do not copy cTab/ACE3/Antistasi addon folders into the mission. Install the external mods normally instead.

## Development note

The external projects are credited in `THIRD_PARTY_NOTICES.md`. RHD's player UI, Life systems, administration and district-pressure implementation are maintained as RHD code.
