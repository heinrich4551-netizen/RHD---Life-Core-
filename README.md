# RHD Life Core

A terrain-agnostic **Arma 3 Life RP mission framework** designed for **3DEN-first setup**.

The project is intentionally organized so a new server owner can change the important gameplay values without understanding every SQF system.

## Required dependencies

| Dependency | Required for | Steam Workshop ID |
|---|---|---:|
| **Arma 3** | Base game | — |
| **CBA_A3** | cTab+ and shared mod support | `450814997` |
| **cTab+** | RHD player tablet | `2262006564` |
| **ACE3** | ACE interactions, EMS interaction and admin access | `463939057` |

Workshop links and installation details are maintained in `STEAM_WORKSHOP_DEPENDENCIES.md`.

**Server rule:** install the same required mods on the clients and server before testing the mission.

## Included

- Persistent player identity, cash/bank, inventory, licenses, job and jail state.
- cTab-backed RHD player tablet for status, jobs, shop, banking and services.
- F6/F7/F8 shortcuts route to cTab pages instead of opening separate RHD dialogs.
- ACE Self Actions can open the player tablet; no RHD inventory item is required.
- Lightweight always-visible RHD HUD.
- Farming: Apples, Cannabis Plant, Coca Leaf, Corn Cob, Grapes, Peaches.
- Mining: Iron Ore, Copper Ore, Gold Ore, Diamond, Oil Sand.
- Refining: Iron Ore -> Iron, Copper Ore -> Copper, Gold Ore -> Gold, Oil Sand -> Oil.
- Generic buy/sell shop system using the centralized RHD economy configuration.
- Police, EMS and civilian job templates with basic ticketing and treatment.
- Terrain-independent bank, shop, fuel, farm, mine and refinery locations.
- Performance-conscious ambient civilians and traffic with hard caps and automatic cleanup.
- Rare roadside incidents that can dispatch temporary Police/EMS calls.
- Server-authoritative transactions with caller validation and anti-negative-money/inventory checks.
- Unified UID-gated RHD administrator panel adapted from the XEAT_AdminTool layout.
- Admin panel is separate from the player tablet and uses ACE Self Actions; no admin item or dedicated admin hotkey is required.
- Optional ACE-aware interactions while keeping RHD Life rules server-authoritative.
- No hard-coded terrain coordinates.

## Beginner editing

### The one file most server owners should edit

`core/fn_init.sqf`

This file contains clearly labeled sections for:

- Admin Steam64 IDs
- Jobs and pay rates
- Item names and prices
- Refining recipes
- Gatherable resources

The file includes examples and explains the array formats directly above each section.

### Map editing

Do map work in **Arma 3 Eden (3DEN)**.

Use `3DEN_SETUP.md` for marker names and recommended town layout.

### Advanced files

Experienced developers can work directly in:

- `core/admin/` — administrator actions
- `core/ace/` — ACE3 integration
- `core/ui/` — cTab player UI
- `core/economy/` — shop transactions
- `core/bank/` — banking
- `core/jobs/` — jobs
- `core/industry/` — gathering/refining
- `core/rp/` — police/EMS/RP
- `core/services/` — vehicle services
- `core/ambient/` — ambient population/events

`description.ext` registers these systems but is documented so beginners can understand what each section does.

## cTab+

RHD uses [cTab+](https://github.com/jetelain/cTab) as the player-facing tablet surface. The mission opens cTab's `cTab_Tablet_dlg` and creates RHD-owned controls on that display rather than copying the cTab addon source.

cTab+ requires CBA_A3. Keep cTab+ installed as an external Workshop mod; do not copy its PBOs into this mission.

See `CTAB_INTEGRATION.md` for implementation details.

## ACE3

RHD detects ACE3 at runtime. Without ACE3, the mission's core systems remain available, but ACE-dependent interactions are unavailable.

ACE3 supplies the interaction layer for:

- RHD Life Tablet access
- RHD Administration access
- Contextual EMS treatment interactions

RHD does not replace ACE medical or ACE interaction internals.

See `ADMIN_AND_ACE_SETUP.md` for admin authorization and third-party licensing notes.

## Admin control

All RHD administrator controls are consolidated into one `RHD_ADMIN` screen. Administrators are identified by Steam64 UID, not player name.

Edit `core/fn_init.sqf`:

```sqf
missionNamespace setVariable [
    "RHD_ADMIN_UIDS",
    ["76561198012345678"],
    true
];
```

The panel includes player inspection, heal/kill/freeze, teleport, spectate, economy edits, item/job assignment, vehicle repair/refuel/spawn/delete, world time/weather and server announcements.

## 3DEN setup

Create a mission in Eden on any terrain and place RHD locations using these marker prefixes:

- `rhd_farm_*` — farming areas
- `rhd_mine_*` — mining areas
- `rhd_refine_*` — refining areas
- `rhd_shop_*` — shops
- `rhd_bank_*` — banks/ATMs
- `rhd_fuel_*` — fuel stations
- `rhd_garage_*` — reserved for future garage expansion
- `rhd_spawn_*` — reserved spawn locations
- `rhd_jail_*` — jail area

No terrain coordinates are hard-coded.

## Ambient life

RHD does not simulate the entire island with permanent AI. A small server-side population is created around active players and removed when distant or too old.

Current global caps are deliberately conservative:

- Day: 10 civilian actors, 4 traffic vehicles
- Night: 5 civilian actors, 2 traffic vehicles
- Roadside incidents: 2

See `PERFORMANCE.md` before increasing these limits.

## Installation

1. Install Arma 3.
2. Subscribe to **CBA_A3**, **ACE3**, and **cTab+** on Steam Workshop.
3. Open the Workshop dependencies document for the exact IDs and links.
4. Create the mission in Eden on your chosen terrain.
5. Copy the RHD mission files into the mission folder.
6. Edit `core/fn_init.sqf` and add your admin Steam64 IDs.
7. Place the RHD markers described in `3DEN_SETUP.md`.
8. Save the mission in Eden so `mission.sqm` is generated/updated.
9. Test in local multiplayer.
10. Test again on a dedicated server before publishing.

The released mission does not depend on `-filePatching`. Use file patching only during development when needed.
