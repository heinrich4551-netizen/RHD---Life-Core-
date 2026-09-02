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

## User-requested Workshop items

The project owner also supplied these Steam Workshop IDs:

```text
1123403138
2618183963
2618122951
2623374243
2623373810
```

Their exact Workshop titles, addon class names and transitive dependency chains are **not guessed** here. Live Steam metadata is unavailable in this development environment. Confirm each Steam page before publishing a locked server preset.

| Workshop ID | Title | RHD use | Dependency chain |
|---:|---|---|---|
| `1123403138` | Pending official Steam verification | Integrate after API/assets are confirmed | Pending |
| `2618183963` | Pending official Steam verification | Integrate after API/assets are confirmed | Pending |
| `2618122951` | Pending official Steam verification | Integrate after API/assets are confirmed | Pending |
| `2623374243` | Pending official Steam verification | Integrate after API/assets are confirmed | Pending |
| `2623373810` | Pending official Steam verification | Integrate after API/assets are confirmed | Pending |

## Important architecture rule

**Antistasi Ultimate is now a runtime dependency, not just an inspiration.**

RHD waits for the A3A campaign to finish its server initialization and then uses its exposed world state and function API. The RHD bridge uses A3A for campaign/world state and selected world operations rather than starting a second strategic AI engine.

The upstream Antistasi server initialization creates/loads campaign state, initializes zones, garrisons and other systems, publishes `serverInitDone`, then starts the main background loops. fileciteturn426file0

## Recommended launch order

```text
Arma 3
  -> CBA_A3
  -> Antistasi Ultimate
  -> ACE3
  -> cTab+
  -> RHD - LifeCore mission
```

The exact mod load order can depend on your server launcher, but every client and the dedicated server must have compatible required mods enabled.

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

Antistasi Ultimate's main codebase is MIT-licensed, while the upstream repository explicitly identifies separate APL-ND components. RHD preserves that boundary and does not modify or redistribute those restricted components. fileciteturn427file0

See `THIRD_PARTY_NOTICES.md` and `LICENSES/ANTISTASI_ULTIMATE_LICENSE.txt`.
