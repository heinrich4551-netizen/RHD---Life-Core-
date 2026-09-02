# RHD - LifeCore — Third-Party Notices

**RHD - LifeCore**  
**Author: LT. Toad**

This file explains which external projects are required by, integrated with, or referenced by RHD and what RHD redistributes.

## Antistasi Ultimate — base framework

Project:
https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate

**Runtime status: REQUIRED.**

RHD - LifeCore is designed as a Life RP layer on top of the Antistasi Ultimate campaign framework. RHD relies on the installed A3A campaign for strategic world state rather than running a parallel war engine.

RHD uses the A3A public function/state interface for selected operations including campaign initialization, aggression, enemy resources, strategic markers and collision-aware vehicle spawning. The RHD bridge waits for `serverInitDone` before enabling the A3A-dependent systems. fileciteturn426file0

The upstream repository describes the main Antistasi Ultimate / Plus / Community Edition code as MIT-licensed while identifying separately licensed integrated components. The upstream license specifically identifies APL-ND material such as `Tools\\StreetArtist` and `A3-Antistasi\\Garage`. RHD does not modify or redistribute those restricted components. fileciteturn345file0

The selected upstream development revision is tracked by the RHD Git submodule:

`vendor/antistasi-ultimate`

## cTab+

Project:
https://github.com/jetelain/cTab

**Runtime status: REQUIRED.**

cTab+ is the external host for the RHD player tablet. RHD creates RHD-owned controls on cTab's tablet display instead of copying the cTab addon into the mission.

## CBA_A3

**Runtime status: REQUIRED.**

CBA_A3 is a prerequisite for cTab+ and is installed separately through the normal Arma 3 mod distribution channel.

## ACE3

Project:
https://github.com/acemod/ACE3

**Runtime status: REQUIRED for the full RHD feature set.**

ACE3 supplies the contextual interaction layer used by RHD for administrator access, EMS treatment and vehicle interaction.

RHD does not redistribute ACE3 PBOs.

## XEAT_AdminTool interface reference

Project:
https://github.com/xedom/XEAT_AdminTool

The separate RHD administrator panel uses a compact player-list / action-list / value / execute arrangement adapted from the XEAT_AdminTool interface concept.

RHD keeps the required attribution and treats the adapted administrator UI material according to the upstream XEAT APL-SA terms.

## RHD branding artwork

The supplied Kavala artwork is stored at:

`assets/branding/RHDLifeCore.jpg`

Mission branding:

- Name: `RHD - LifeCore`
- Author: `LT. Toad`

`Land_Billboard_F` objects are automatically given the RHD artwork on server startup. An individual Eden object can opt out with:

```sqf
rhd_billboard_skip = true;
```

## Additional Steam Workshop integrations

The project owner supplied these Workshop IDs:

- `1123403138`
- `2618183963`
- `2618122951`
- `2623374243`
- `2623373810`

Their titles, `CfgPatches` names and transitive dependencies are **not guessed**. The Steam pages could not be live-verified in this development environment. See `STEAM_WORKSHOP_DEPENDENCIES.md` for the exact verification boundary.

## Distribution rule

External projects should be installed through their official Arma 3 / Steam distribution channels. Do not unpack their PBOs into the RHD mission folder.

Keep this notice with published RHD releases so the integration and licensing boundaries remain clear.
