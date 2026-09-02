# RHD - LifeCore — cTab Integration

**Author: LT. Toad | Version 2.1.1**

RHD uses **cTab+** as the host surface for the player-facing RHD tablet.

## Dependency rules

Required for the RHD addon:

```text
CBA_A3
cTab+
```

Optional enhancement:

```text
ACE3
```

Do not copy CBA_A3, cTab+ or ACE3 PBOs into the RHD mission.

## RHD player tablet

The RHD player UI is hosted on cTab's `cTab_Tablet_dlg` display. RHD creates its own controls there and provides one player surface for:

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

F6/F7/F8 are convenience shortcuts into the same cTab-backed RHD surface in the current mission UI. They do not create a second tablet implementation.

## District / Conflict page

The **DISTRICTS** page exposes the RHD Conflict layer. Editors define districts with `rhd_zone_*` markers in Eden.

The page can expose RHD-owned control state, heat/public-order pressure, supply and nearby-player/police context. Antistasi strategic control remains A3A-owned when the optional bridge is active.

## Admin access

Administration is separate from the player tablet.

The `RHD - LIFECORE | ADMIN` dialog uses UID-gated server validation. With ACE3 installed, admins can reach the administration action through **ACE Self Actions -> RHD Administration**.

ACE3 is not required for the RHD addon to load. The RHD ACE integration exits safely when ACE3 is absent.

## cTab implementation notes

RHD calls cTab's mission-facing `cTab_fnc_open` function and creates RHD-owned controls on the active tablet display. RHD does not redistribute cTab source.

The external cTab project remains responsible for its own tablet lifecycle and device behavior.

## Branding

The mission can use `assets/branding/RHDLifeCore.jpg` for the loading screen and overview picture.

## Verification

Repository CI validates the RHD addon PBO build and configuration. A real Arma 3 runtime test still needs to be performed on the target server/modset, especially for tablet lifecycle, F6/F7/F8 routing and dedicated-server behavior.
