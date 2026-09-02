# RHD - LifeCore — Third-Party Notices

**RHD - LifeCore**  
**Author: LT. Toad**

This file explains which external projects influenced or support RHD and what RHD actually redistributes.

## Antistasi Ultimate

Project:
https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate

The current Antistasi Ultimate repository describes the main Antistasi Ultimate, Antistasi Plus and Antistasi Community Edition code as MIT-licensed, while separately identifying integrated components with different licenses. fileciteturn345file0

RHD uses **Antistasi-style persistent-world design ideas** for its Conflict layer: district pressure, local public-order state, police presence, supply state and server-side crime pressure.

### What RHD does not redistribute

RHD does not copy Antistasi Ultimate PBOs into the mission and does not require Antistasi Ultimate at runtime.

The Antistasi Ultimate repository explicitly identifies separately licensed APL-ND material, including:

- `Tools\\StreetArtist`
- `A3-Antistasi\\Garage`

RHD does not copy, modify or redistribute those restricted components. fileciteturn345file0

### RHD implementation

The RHD implementation is located in:

`core/conflict/`

Key files:

- `fn_conflictInit.sqf` — initializes the RHD district state.
- `fn_conflictDirector.sqf` — server-side district pressure loop.
- `fn_getZoneStatus.sqf` — public district status helper.
- `fn_recordCrime.sqf` — server-side crime/pressure recorder.

Districts are placed by editors in Eden with marker names beginning with:

`rhd_zone_`

The current RHD Conflict layer is explicitly documented as RHD-owned code rather than a runtime Antistasi dependency. fileciteturn363file0

## cTab+

Project:
https://github.com/jetelain/cTab

cTab+ is an external Arma 3 mod used as the host surface for the RHD player tablet. RHD calls cTab's mission-facing interface and creates RHD-owned controls on the active cTab tablet display.

RHD does not redistribute cTab PBOs.

## ACE3

Project:
https://github.com/acemod/ACE3

ACE3 is an external Arma 3 mod used by RHD for interaction-menu integration, contextual EMS interaction and administrator access.

RHD does not redistribute ACE3 PBOs.

## XEAT_AdminTool interface reference

Project:
https://github.com/xedom/XEAT_AdminTool

The RHD administrator panel uses a compact player-list / action-list / value / execute layout adapted from the XEAT_AdminTool interface concept.

RHD keeps the required attribution and the adapted administrator UI is treated as APL-SA material according to the upstream XEAT license.

## RHD branding artwork

The supplied Kavala artwork is included in:

`assets/branding/RHDLifeCore.jpg`

Mission branding:

- Name: `RHD - LifeCore`
- Author: `LT. Toad`

The image is used for the mission overview/loading art and as the automatic texture applied to `Land_Billboard_F` objects. A billboard can opt out by setting:

```sqf
rhd_billboard_skip = true;
```

on the Eden object.

## Additional Steam Workshop integrations

Four additional Workshop IDs were supplied by the RHD project owner:

- `2618183963`
- `2618122951`
- `2623374243`
- `2623373810`

Their exact titles, `CfgPatches` identifiers and transitive dependency chains are intentionally **not guessed** in this repository until their official Steam metadata is verified. See `STEAM_WORKSHOP_DEPENDENCIES.md`.

## Distribution rule for server owners

Install external projects through their normal official distribution channels. Do not unpack or merge their PBOs into the RHD mission folder.

When publishing RHD, keep this notice file with the mission so the source projects and integration boundaries remain visible to users.
