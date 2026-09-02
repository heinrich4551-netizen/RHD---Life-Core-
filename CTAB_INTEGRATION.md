# RHD - LifeCore — cTab Integration

**Author: LT. Toad**

RHD uses [cTab+](https://github.com/jetelain/cTab) as the host surface for the player-facing RHD tablet.

## Required mods

- Arma 3
- CBA_A3 3.15 or later
- cTab+
- ACE3 for the full RHD interaction/admin feature set

Keep cTab+ and ACE3 installed as external mods. Do not copy their PBOs into the RHD mission.

## RHD player tablet

The RHD player UI is hosted on cTab's `cTab_Tablet_dlg` display. RHD creates its own controls there and provides one player surface for:

- Status and inventory
- Jobs
- RHD Market / shop
- Banking
- Gathering and refining services
- District pressure / conflict status

The tablet uses the RHD brand **RHD - LifeCore**.

F6/F7/F8 are convenience shortcuts into the same cTab-backed surface. They do not open separate RHD dialogs.

## District / Conflict page

The **DISTRICTS** page exposes the RHD Conflict layer. Editors define districts with `rhd_zone_*` markers in Eden.

Each district can report:

- Control state
- Heat / public-order pressure
- Supply level
- Nearby players
- Nearby Police presence

The Conflict layer is an RHD-owned implementation inspired by persistent-world pressure concepts from Antistasi Ultimate. Antistasi Ultimate is not loaded as a runtime dependency.

## Admin access

Administration remains deliberately separate from the player tablet.

The `RHD - LIFECORE | ADMIN` dialog retains the compact XEAT-style player/action/value layout and all privileged commands execute through the UID-gated server dispatcher.

Admins reach it through **ACE Self Actions -> RHD Administration**. No inventory item and no dedicated keyboard shortcut are required.

## cTab implementation notes

RHD calls cTab's mission-facing `cTab_fnc_open` function and creates RHD-owned controls on the active tablet display. The RHD code does not copy cTab addon source.

The external cTab project remains responsible for its own tablet behavior, navigation, device handling and lifecycle.

## Branding

The supplied Kavala artwork is used by the mission as the loading screen and overview picture. The project identity is `RHD - LifeCore` by `LT. Toad`.

## Testing status

The integration has been source-reviewed against the public cTab repository. An actual Arma 3 runtime test with CBA_A3 + cTab+ + ACE3 + RHD has not been performed in this environment.

Before public deployment, test the tablet open/close lifecycle, F6/F7/F8 routing, district page, shop and job transactions, ACE interactions and dedicated-server behavior.
