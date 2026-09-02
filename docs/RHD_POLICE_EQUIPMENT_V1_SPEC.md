# RHD Police Equipment v1 — Option 06 Production Specification

## Base carrier

**Asset:** RHD Police Modular Duty Carrier

**Internal model name:** `rhd_police_carrier_option06.p3d`

### Geometry target

- Ergonomic plate-carrier silhouette with a moderate chest profile.
- Full-height MOLLE field on front and rear.
- Adjustable side cummerbund.
- Replaceable front placard.
- Dedicated radio and admin mounting zones.
- Low-poly support geometry separated from high-detail bake geometry.

### Arma selections

Suggested selections:

- `camo`
- `camo1`
- `camo2`
- `patch_rhd`
- `patch_unit`
- `placard_front`
- `pouch_left`
- `pouch_right`
- `pouch_admin`
- `pouch_radio`
- `pouch_medical`

The exact selection names are locked after the final Blender/Object Builder export.

## UV / texture targets

Master authoring resolution: **4096×4096**.

Workshop candidate resolution: **2048×2048**, provided detail retention remains acceptable.

Texture families:

- `rhd_police_option06_co` — albedo/base color
- `rhd_police_option06_nohq` — tangent-space normal
- `rhd_police_option06_smdi` — specular/roughness/metallic packing as required by the selected rvmat workflow
- `rhd_police_option06_as` — ambient/shadow information where required

### Material zones

1. ballistic plate cover — woven textile
2. carrier body — Cordura-style fabric
3. webbing — matte textile
4. polymer hardware — low-gloss polymer
5. metal hardware — controlled metallic response
6. RHD patch — embroidered/printed fabric

## Variant strategy

The same base carrier supports texture/material presets for:

- Multicam-inspired woodland
- green/tropic
- arid
- urban/gray
- black/low-visibility

The RHD project will not copy camouflage patterns from third-party mods without checking their license.

## 35 customization points

The 35 points documented in `README.md` are the logical customization slots. They are implemented using hidden selections, inherited classes, proxy attachments, or script/Arsenal compatibility as appropriate. Not every slot needs unique geometry.

## Night vision

Night-vision devices are dependency-based. RHD does not duplicate third-party NODS geometry. Compatibility wrappers should be added only after the dependency's public class names/API are verified.
