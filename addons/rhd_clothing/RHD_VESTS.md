# RHD - LifeCore 16-Vest Line

The RHD clothing addon now includes 16 modular tactical/support vest classes inspired by the supplied plate-carrier/chest-rig reference image.

## Vest classes

| Class | Role | Base geometry family | Cargo load |
|---|---|---|---:|
| `RHD_Vest_Plate_Ranger` | Ranger / general tactical | Plate carrier | 250 |
| `RHD_Vest_Plate_Multicam` | Multi-terrain / field | Plate carrier | 250 |
| `RHD_Vest_Plate_Black` | Urban tactical / security | Heavy plate carrier | 250 |
| `RHD_Vest_Plate_Tan` | Contractor / arid | Plate carrier | 250 |
| `RHD_Vest_Plate_Grey` | Urban utility | Tactical vest | 250 |
| `RHD_Vest_Plate_Woodland` | Woodland field | Plate carrier | 250 |
| `RHD_Vest_Medic` | Combat medic | Grenadier/plate carrier | 250 |
| `RHD_Vest_Police` | Police patrol | Tactical vest | 250 |
| `RHD_Vest_Security` | Private security | Tactical vest | 250 |
| `RHD_Vest_SOF` | Special operations | Heavy plate carrier | 250 |
| `RHD_Vest_Utility` | Industrial / civilian utility | Harness | 250 |
| `RHD_Vest_Comms` | Radio / communications | Plate carrier | 250 |
| `RHD_Vest_LMG` | Support gunner | Harness | 250 |
| `RHD_Vest_Marksman` | Recon / marksman | Harness | 250 |
| `RHD_Vest_Contractor` | Private contractor | Low-profile plate carrier | 250 |
| `RHD_Vest_Executive` | Executive protection / VIP | Tactical vest | 250 |

## Pouch rule

Each class contains an `RHD_PouchSlots[]` definition. Every listed pouch has `RHD_PouchCapacity = 1`, meaning the RHD virtual-pouch layer treats it as a dedicated one-item pouch.

Examples of pouch types are `magazine`, `radio`, `medical`, `utility`, `tool`, `grenade`, and `restraint`.

`maximumLoad = 250` is the vest inventory capacity. The pouch metadata itself does not consume that capacity. Vanilla Arma inventory still applies the normal item mass rules to physical items placed in the normal vest container; the dedicated zero-extra-weight behavior belongs to the RHD pouch layer and should not be confused with native Arma cargo weight.

## Visual reference

The 16-vest visual concept sheet generated from the supplied reference is provided with the release/build artifacts. The production addon currently uses existing Arma 3 vest geometries as the base models so the classes remain lightweight and do not redistribute third-party mesh assets.
