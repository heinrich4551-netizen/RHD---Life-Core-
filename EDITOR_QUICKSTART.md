# RHD - LifeCore — Editor Quickstart

**Author: LT. Toad**

This is the **"I don't understand Arma 3 scripting yet"** guide.

## The four places you need to know

### 1. Eden Editor (3DEN)

Use Eden for the map.

Place buildings, vehicles, NPCs, service locations, RHD markers and `Land_Billboard_F` objects here.

Do not edit `mission.sqm` by hand.

### 2. `core/fn_init.sqf`

This is the **main beginner configuration file**.

Use it for:

- Admin Steam64 IDs
- Job names and salaries
- Item names and prices
- Refining recipes
- Gatherable resources
- Antistasi bridge tuning
- RHD district pressure tuning

### 3. `STEAM_WORKSHOP_DEPENDENCIES.md`

Use this for the required Steam/Arma 3 mod stack.

The full RHD build requires **Antistasi Ultimate + CBA_A3 + ACE3 + cTab+**, in addition to Arma 3 itself.

The five additional Workshop IDs requested by the project owner are listed there as pending verification until their official Steam metadata can be checked.

### 4. `ANTISTASI_BASE.md`

Read this before changing the campaign integration.

Antistasi Ultimate is now the strategic foundation. RHD is intentionally a Life RP layer around it rather than a second competing strategic war system.

---

## Branding

Mission name:

`RHD - LifeCore`

Author:

`LT. Toad`

Branding artwork:

`assets/branding/RHDLifeCore.jpg`

Every `Land_Billboard_F` placed in the mission is automatically given the RHD artwork on server startup.

To leave one billboard unchanged, set this object variable in Eden:

```sqf
rhd_billboard_skip = true
```

---

## Where do I edit each thing?

| I want to change... | Edit... |
|---|---|
| Town layout | Eden Editor |
| Farming/mining locations | Eden Editor / `3DEN_SETUP.md` |
| District/conflict locations | Eden Editor / `3DEN_SETUP.md` |
| Billboards | Eden Editor (`Land_Billboard_F`) |
| Item price | `core/fn_init.sqf` |
| Job pay | `core/fn_init.sqf` |
| Refining output | `core/fn_init.sqf` |
| Admin access | `core/fn_init.sqf` |
| A3A crime/aggression bridge | `core/fn_init.sqf` |
| Conflict heat/radius | `core/fn_init.sqf` |
| Player tablet pages | `core/ui/` |
| ACE interactions | `core/ace/` |
| Admin actions | `core/admin/` |
| Antistasi integration | `core/antistasi/` |
| Shops | `core/economy/` |
| Banking | `core/bank/` |
| Jobs | `core/jobs/` |
| Farming/mining/refining code | `core/industry/` |
| District pressure | `core/conflict/` |
| Police/EMS/RP | `core/rp/` |
| Vehicle services | `core/services/` |
| Ambient civilians/events | `core/ambient/` |
| Mission function registration | `description.ext` |

---

## Editing rules for beginners

### Safe to edit

Changing values in `core/fn_init.sqf` is the safest way to customize the economy, jobs, Antistasi bridge tuning and district pressure.

Changing marker names/positions in Eden is also safe as long as you keep the documented prefixes.

### Think before editing

`description.ext`, `core/ui/ctab.hpp`, `core/admin/`, `core/ace/`, and network/security code affect the whole mission.

Make a backup before changing them.

### Keep server authority

Do not move money, inventory, job, admin or transaction validation from server-side functions to the client.

### Keep A3A as the strategic authority

Do not create a second system that tries to replace A3A strategic zones, garrisons, attacks, aggression or campaign persistence.

Use the RHD bridge in `core/antistasi/` to communicate with the installed A3A campaign.

---

## Example: add a new job

Open `core/fn_init.sqf`, find the `JOBS` section and add:

```sqf
["mechanic", ["Mechanic", 50]],
```

The job ID is the internal name. The second value is the player-facing name. The final value is pay per minute.

---

## Example: change a shop price

Find the item in `ITEMS`:

```sqf
["apple", ["Apple", 5, 2, "food"]],
```

The values mean:

```text
Apple = display name
5     = buy price
2     = sell price
food  = category
```

---

## Example: add an admin

Find `RHD_ADMIN_UIDS` in `core/fn_init.sqf` and enter the trusted Steam64 ID(s).

```sqf
missionNamespace setVariable [
    "RHD_ADMIN_UIDS",
    ["76561198012345678"],
    true
];
```

Do not use a player's display name.

---

## Example: add a district

In Eden, create a marker named:

```text
rhd_zone_kavala
```

The RHD district layer tracks Life RP heat around the A3A strategic world.

The cTab **DISTRICTS** page reads the resulting state.

---

## Example: add a shop

In Eden, create a marker named:

```text
rhd_shop_kavala
```

Move it to the shop location.

---

## Example: add another farming location

Create a marker with the appropriate prefix, such as:

```text
rhd_farm_apples_west
```

The scripts discover the prefix automatically, so multiple locations are supported.

---

## Test after every important edit

1. Save the edited file.
2. Start a local multiplayer preview.
3. Check the feature you changed.
4. Check the RPT/log for script errors.
5. Test the same modset on a dedicated server.

---

## Project design philosophy

```text
ANTISTASI ULTIMATE -> strategic persistent world
        |
        +-> RHD - LifeCore -> Life RP layer
                              |
                              +-> economy
                              +-> jobs
                              +-> crime
                              +-> police / EMS
                              +-> services
                              +-> cTab tablet
                              +-> ACE interaction
                              +-> separate admin
                              +-> RHD branding
```

The goal is to keep RHD understandable without sacrificing the power of the Antistasi campaign base.
