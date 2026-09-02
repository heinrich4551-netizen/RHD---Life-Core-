# RHD Police Equipment v1 — Public Source / License Audit

RHD - LifeCore may inspect public Arma 3 repositories for implementation patterns, reference geometry, and textures, but no third-party asset is redistributed until its license permits the intended use.

| Source | Use | License evidence | RHD status |
|---|---|---|---|
| EpochModTeam/Epoch | Arma config/P3D workflow reference | Repository sources identify the Arma Public License Share Alike (APL-SA) | Reference only until individual asset terms are checked |
| ferstaberinde/F3 | Config/code structure and simulation-content reference | README grants a personal, non-exclusive license for designing, developing, testing and distributing non-commercial ArmA 3 simulation content | Reference only; not assumed redistributable for commercial/Workshop packaging |
| othersock93/ADFrecut_Tweaks | P3D contribution/licensing example | ASSETS_LICENSE.md states new P3D contributions are licensed under APL-SA and may be used, modified and distributed as part of the mod | Candidate source family; individual asset provenance still required |
| RHD repository | Existing LifeCore integration | Current config already depends on A3A/CBA/ACE/cTab | Internal target |

## Rule for imported models

1. Record the exact upstream repository, commit and file path.
2. Record the applicable license text or license URL.
3. Confirm modification is allowed.
4. Confirm redistribution in an Arma 3/Steam Workshop mod is allowed.
5. Preserve attribution and license notices where required.
6. Keep the original and modified asset provenance in this file.

## Night vision

Night vision is planned as a dependency on the user-selected NODS / Night Operations Workshop item. RHD should reference its public class/API surface rather than copy its models or optics unless its own license explicitly permits redistribution.

## Important distinction

A GitHub repository being public does not by itself make its binaries or models public-domain. The RHD project therefore treats public repositories as reference sources until the exact asset license is verified.
