# RHD Life Core — Editor Quickstart

This is the **"I don't understand Arma 3 scripting yet"** guide.

## The three places you need to know

### 1. Eden Editor

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

This file contains comments showing exactly what each value means.

### 3. `STEAM_WORKSHOP_DEPENDENCIES.md`

Use this file when setting up the Steam Workshop collection and server mod preset.

It lists the required Arma 3 dependencies and Workshop IDs.

---

## Where do I edit each thing?

| I want to change... | Edit... |
|---|---|
| Town layout | Eden Editor |
| Farming/mining locations | Eden Editor / `3DEN_SETUP.md` |
| Item price | `core/fn_init.sqf` |
| Job pay | `core/fn_init.sqf` |
| Refining output | `core/fn_init.sqf` |
| Admin access | `core/fn_init.sqf` |
| Player tablet pages | `core/ui/` |
| ACE interactions | `core/ace/` |
| Admin actions | `core/admin/` |
| Shops | `core/economy/` |
| Banking | `core/bank/` |
| Jobs | `core/jobs/` |
| Farming/mining/refining code | `core/industry/` |
| Police/EMS/RP | `core/rp/` |
| Vehicle services | `core/services/` |
| Ambient civilians/events | `core/ambient/` |
| Mission function registration | `description.ext` |

---

## Editing rules for beginners

### Safe to edit

Changing values in `core/fn_init.sqf` is the safest way to customize the economy.

Changing marker names/positions in Eden is also safe as long as you keep the documented prefixes.

### Think before editing

`description.ext`, `core/ui/ctab.hpp`, `core/admin/`, and network/security functions affect the whole mission.

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

To sell apples for $4 instead of $2:

```sqf
["apple", ["Apple", 5, 4, "food"]],
```

---

## Example: add an admin

Find:

```sqf
missionNamespace setVariable ["RHD_ADMIN_UIDS", [], true];
```

Replace it with:

```sqf
missionNamespace setVariable [
    "RHD_ADMIN_UIDS",
    ["76561198012345678"],
    true
];
```

Do not use a player's display name.

---

## Example: add a shop on the map

In Eden, create a marker.

Give it a name like:

```text
rhd_shop_kavala
```

Move it to the shop location.

The RHD shop system will find the marker by its prefix.

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

**Map setup** → Eden

**Beginner configuration** → `core/fn_init.sqf`

**UI** → `core/ui/`

**ACE** → `core/ace/`

**Administration** → `core/admin/`

**Game systems** → their own `core/<system>/` folders

This keeps the mission understandable without removing the ability for advanced developers to extend it.
