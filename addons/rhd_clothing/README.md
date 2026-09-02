# RHD - LifeCore Clothing

RHD clothing is a standalone addon built from base-game Arma 3 uniform assets.

## Combined pants + shirt outfits

Arma 3's standard uniform system equips a complete torso/leg garment through the uniform slot. RHD therefore exposes complete **combined outfits** rather than pretending the vanilla game has independent shirt and pants slots.

The current combined outfit classes are:

- `RHD_Outfit_TShirt_Tan_Casual`
- `RHD_Outfit_TShirt_Olive_Casual`
- `RHD_Outfit_TShirt_Black_Casual`
- `RHD_Outfit_Polo_White_Casual`
- `RHD_Outfit_Polo_Burgundy_Casual`
- `RHD_Outfit_Polo_Blue_Casual`
- `RHD_Outfit_Polo_Yellow_Casual`
- `RHD_Outfit_Polo_Striped_Casual`
- `RHD_Outfit_Field_Hunter_Green`
- `RHD_Outfit_Field_Hunter_Brown`
- `RHD_Outfit_Workwear_Poor_01`
- `RHD_Outfit_Workwear_Poor_02`
- `RHD_Outfit_Mechanic_Coveralls`

These are complete uniform items and are automatically visible to the existing RHD equipment shop because the shop catalog reads public `CfgWeapons` equipment from the active modset.

## Future true modular clothing

True independent pants + shirt swapping requires a custom character/uniform model that separates upper and lower garment geometry. The current addon deliberately avoids third-party clothing dependencies and does not copy external assets.
