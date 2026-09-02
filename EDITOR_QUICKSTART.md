# RHD - LifeCore — Editor Quickstart

**Author: LT. Toad**

This is the **"I don't understand Arma 3 scripting yet"** guide.

## The three places you need to know

### 1. Eden Editor (3DEN)

Use Eden for the map.

Place buildings, vehicles, NPCs and RHD markers here.

Do not edit `mission.sqm` by hand.

### 2. `core/fn_init.sqf`

Use this file for most server balancing.

You can change:

- Admin Steam64 IDs
- Job salaries
- Item names
- Buy prices
- Sell prices
- Refining recipes
- Gatherable resources
- District pressure settings

The file contains comments showing exactly what each value means.

### 3. `STEAM_WORKSHOP_DEPENDENCIES.md`

Use this file when setting up the Steam Workshop collection and server mod preset.

It lists Arma 3, CBA_A3, ACE3 and cTab+ requirements and their Workshop IDs.

---

## Branding

The mission name is:

`RHD - LifeCore`

Author:

`LT. Toad`

The mission loading/overview artwork is:

`assets/branding/RHDLifeCore.jpg`

You normally do not need to edit the branding files.

---

## Where do I edit each thing?

| I want to change... | Edit... |
|---|---|
| Town layout | Eden Editor |
| Farming/mining locations | Eden Editor / `3DEN_SETUP.md` |
| District/conflict locations | Eden Editor / `3DEN_SETUP.md` |
| Item price | `core/fn_init.sqf` |
| Job pay | `core/fn_init.sqf` |
| Refining output | `core/fn_init.sqf` |
| Admin access | `core/fn_init.sqf` |
| Conflict heat/radius | `core/fn_init.sqf` |
| Player tablet pages | `core/ui/` |
| ACE interactions | `core/ace/` |
| Admin actions | `core/admin/` |
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

Changing values in `core/fn_init.sqf` is the safest way to customize the economy, jobs and district pressure.

Changing marker names/positions in Eden is also safe as long as you keep the documented prefixes.

### Think before editing

`description.ext`, `core/ui/ctab.hpp`, `core/admin/`, `core/ace/`, and network/security functions affect the whole mission.

Make a backup before changing them.

### Do not rename function files casually

RHD function names are registered in `description.ext`. Renaming an `fn_*.sqf` file without updating `CfgFunctions` can break the mission.

### Keep server authority

Do not move money, inventory, job, admin or transaction validation from server-side functions to the client. The current design intentionally keeps privileged and economic changes authoritative on the server.

---

## Example: add a new job

Open `core/fn_init.sqf`.

Find the `JOBS` section and add a line:

```sqf
["mechanic", ["Mechanic", 50]],
```

The format is:

```text
job ID, display name, pay per minute
```

The job ID is the internal name used by scripts. The display name is what players see.

---

## Example: change a shop price

Find the item in the `ITEMS` section:

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

Move it to the center of the district.

The RHD Conflict layer will track the district and display its status on the cTab **DISTRICTS** page.

---

## Example: add a shop on the map

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

The script searches by the `rhd_farm_` prefix, so you can have multiple locations.

---

## Test after every important edit

1. Save the edited file.
2. Start a local multiplayer preview.
3. Check the feature you changed.
4. Check the RPT/log for script errors.
5. Only then move the change to your dedicated server.

---

## Project design philosophy

RHD deliberately separates:

**Map setup** -> Eden  
**Beginner configuration** -> `core/fn_init.sqf`  
**Player UI** -> `core/ui/`  
**ACE integration** -> `core/ace/`  
**Administration** -> `core/admin/`  
**Conflict/district system** -> `core/conflict/`  
**Game systems** -> their own `core/<system>/` folders

The goal is to keep RHD - LifeCore understandable without removing the ability for advanced developers to extend it.
