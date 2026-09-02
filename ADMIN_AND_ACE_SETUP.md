# RHD - LifeCore — Admin + ACE3 Setup

**Author: LT. Toad | Version 2.1.1**

This guide covers the optional ACE3 integration and the separate RHD administrator control surface.

## ACE3 is optional

RHD detects ACE3 at runtime using `CfgPatches >> ace_main`.

Required for RHD:

```text
CBA_A3
cTab+
```

Optional:

```text
ACE3
```

The player-facing RHD tablet uses cTab+. ACE3 adds contextual interaction actions and the convenient admin entry point, but RHD remains functional without ACE3.

The ACE integration uses ACE's supported interaction-menu functions when ACE3 is present.

## Admin authorization

Open:

```text
core/fn_init.sqf
```

Find `RHD_ADMIN_UIDS` and enter trusted Steam64 IDs:

```sqf
missionNamespace setVariable [
    "RHD_ADMIN_UIDS",
    ["76561198012345678"],
    true
];
```

Use Steam64 IDs only. Do not authorize by player name.

## Unified admin panel

The admin panel is `RHD_ADMIN` and uses the RHD player/action/value/execute layout.

Current privileged operations include player information, heal/restore, kill, freeze/unfreeze, spectate, teleport, cash/bank changes, item/job changes, vehicle service, vehicle spawn/delete, world time, weather and server announcements. The server re-checks the administrator UID before execution.

## Admin access

With ACE3 installed, allowlisted admins receive **RHD Administration** under ACE Self Actions.

Administration is deliberately separate from the player cTab tablet.

No inventory item or dedicated administrator hotkey is required.

## Player cTab access

Players receive **RHD Life Tablet** through the RHD ACE integration when ACE3 is installed. Without ACE3, the normal RHD keyboard/tablet path remains available.

F6/F7/F8 are convenience shortcuts into the same cTab-backed RHD surface.

## District / Conflict system

The RHD Conflict layer is RHD-owned. Editors create districts with `rhd_zone_*` markers in Eden. The server tracks RHD heat/supply and nearby police/player context.

Antistasi Ultimate is not required for this system.

## EMS interaction

When ACE3 is installed, EMS players receive **RHD EMS: Treat Patient** through ACE interaction. The treatment request remains server-authoritative in LifeCore.

## Third-party attribution

XEAT_AdminTool layout reference:
https://github.com/xedom/XEAT_AdminTool

cTab:
https://github.com/jetelain/cTab

ACE3:
https://github.com/acemod/ACE3

Antistasi Ultimate:
https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate

See `THIRD_PARTY_NOTICES.md` for attribution and distribution boundaries. RHD does not redistribute third-party PBOs.
