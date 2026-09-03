# RHD - LifeCore | GSRI Gear Compatibility

This optional PBO connects RHD-Life-Core's equipment shop/Arsenal classification to the public GSRI Gear package.

Source repositories:
- https://github.com/Thibugs/GSRI-Gear
- https://github.com/team-gsri/mods-gear (same GSRI source tree/content mirror)
- https://github.com/jetelain/AceArsenalExtended (Arsenal categorisation/configuration support)

The actual GSRI models and textures remain supplied by `gsri_equipment`. This RHD compatibility PBO does not duplicate third-party PAA/P3D binaries.

Install order:
1. Install GSRI-Gear so `gsri_equipment` is present.
2. Install `@RHD-Life-Core`.
3. Load the optional `RHD GSRI Compatibility` PBO alongside the RHD addons.
4. Load ACE Arsenal Extended when using its XtdGear model/category presentation.

The normal RHD dynamic equipment shop already enumerates loaded CfgWeapons/CfgVehicles/CfgGlasses content; this PBO adds curated GSRI classification so the selected uniforms, headgear, vests and backpacks are easier to find in Arsenal.
