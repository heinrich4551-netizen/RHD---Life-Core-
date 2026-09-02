# RHD - LifeCore — Steam Workshop & Dependency Guide

**Author: LT. Toad**

RHD - LifeCore is an Antistasi Ultimate-backed Life RP framework. The A3A campaign is the strategic foundation; RHD adds the civilian/economy/RP layer.

## Full required stack

| Component | Status | Purpose | Workshop / Source |
|---|---|---|---|
| Arma 3 | REQUIRED | Base game | Arma 3 on Steam |
| Antistasi Ultimate | REQUIRED | Campaign/world foundation | https://github.com/Antistasi-Ultimate-Community/A3-Antistasi-Ultimate |
| CBA_A3 | REQUIRED | Shared framework / cTab dependency | `450814997` |
| ACE3 | REQUIRED | Interaction, EMS and admin access | `463939057` |
| cTab+ | REQUIRED | RHD player tablet | `2262006564` |

## Police Equipment v1 dependencies supplied by project owner

| Workshop ID | Purpose | Status |
|---:|---|---|
| `3352708204` | Customizable equipment / modular gear system | Pending exact Workshop title, addon class names, API and redistribution terms |
| `2260572637` | Night vision dependency | Pending exact Workshop title, addon class names, API and redistribution terms |

**Important:** Steam Workshop IDs are not valid Arma `requiredAddons[]` class names. The final config must use the dependency addon class names exposed by the actual PBOs. No class names are invented in this branch.

## Previously supplied Workshop items

```text
1123403138
2618183963
2618122951
2623374243
2623373810
```

Their exact Workshop titles, addon class names and transitive dependency chains remain pending official Steam verification.

## Architecture rule

**Antistasi Ultimate is a runtime dependency, not just an inspiration.** RHD waits for the A3A campaign initialization and uses its exposed world state and function API rather than starting a second strategic AI engine.

## Recommended launch order

```text
Arma 3
  -> CBA_A3
  -> Antistasi Ultimate
  -> ACE3
  -> cTab+
  -> customization dependency (3352708204)
  -> night vision dependency (2260572637)
  -> RHD - LifeCore
```

The exact order may vary by server launcher, but clients and the dedicated server must have compatible required mods enabled.

## Development checkout

RHD tracks the selected Antistasi Ultimate source revision as a Git submodule:

```text
vendor/antistasi-ultimate
```

Clone:

```bash
git clone --recurse-submodules https://github.com/heinrich4551-netizen/RHD---Life-Core-.git
git submodule update --init --recursive
```

The official compiled Antistasi Ultimate addon should still be distributed through the normal Arma/Workshop channel for actual server use.

## Mission vs external mods

RHD - LifeCore remains mission-side code. Do not unpack ACE3, CBA_A3, cTab+ or Antistasi PBOs into the RHD mission folder.

## Licensing

Antistasi Ultimate's main codebase is MIT-licensed, while the upstream repository explicitly identifies separate APL-ND components. RHD preserves that boundary and does not modify or redistribute those restricted components.

See `THIRD_PARTY_NOTICES.md` and `LICENSES/ANTISTASI_ULTIMATE_LICENSE.txt`.
