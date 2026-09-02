# RHD Police Equipment v1 — Source / License Audit

This file records source candidates before any third-party asset is copied, modified, or redistributed.

## User-requested Workshop dependencies

| Purpose | Steam Workshop ID | Status |
|---|---:|---|
| Modular/customizable equipment system | 3352708204 | Pending inspection of the Workshop item title, license, API/class names, and redistribution terms |
| Night vision dependency | 2260572637 | Pending inspection of the Workshop item title, license, API/class names, and redistribution terms |

The Steam Workshop pages could not be directly inspected through the available repository connector in this pass, so no addon class names are being invented. Once the item metadata is available, the exact `requiredAddons[]` entries and compatibility config will be added.

## Public GitHub candidates inspected

### Epoch / EpochCore

Repository: https://github.com/EpochModTeam/EpochCore  
The repository is public and its Arma configuration sources explicitly state the Arma Public License Share Alike (APL-SA). This makes it a useful example for license-aware Arma config/source reuse, but individual files/assets must still be checked before adoption. 

### F3

Repository: https://github.com/ferstaberinde/F3  
Its README contains a contributor license granting a personal, non-exclusive license for designing, developing, testing, and distributing non-commercial ArmA 3 simulation content. This is relevant to non-commercial code/content reuse but is not blanket permission for unrelated third-party models.

### ADFrecut_Tweaks

Repository: https://github.com/othersock93/ADFrecut_Tweaks  
Its `ASSETS_LICENSE.md` states that new model contributions to that repository are licensed under APL-SA and may be used, modified, and distributed as part of the mod. However, its contributing documentation also notes that the repository does not contain `.p3d` files, so it is not currently selected as a direct model source.

## Not selected without permission

- CUP assets
- RHS assets
- 3CB assets
- BreakingPoint assets
- Other Workshop-only models whose redistribution terms cannot be verified

These may be used as visual references or dependency targets where their own licenses permit, but RHD will not copy their model/texture binaries into the repository without explicit compatible licensing.

## Required record for every adopted asset

```text
Asset name:
Original author:
Repository / Workshop URL:
Commit / version:
Original file path:
License:
Modification permitted:
Redistribution permitted:
Attribution required:
Commercial use permitted:
RHD changes:
RHD destination path:
```
