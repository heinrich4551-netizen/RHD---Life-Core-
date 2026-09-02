/*
    RHD - LifeCore | Billboard Branding
    Author: LT. Toad

    PURPOSE
    -------
    Applies the RHD - LifeCore artwork to Land_Billboard_F objects.

    BEGINNER EDITORS
    -----------------
    You normally do not edit this script.

    In Eden:
      1. Place one or more "Land_Billboard_F" objects.
      2. Leave their texture at the normal/default texture.
      3. The server applies the RHD artwork automatically.

    To keep a specific billboard unchanged, set this variable on the object:
      rhd_billboard_skip = true

    The standard Land_Billboard_F uses texture selection 0 for the face.
*/

if (!isServer) exitWith {false};

private _texture = "assets\\branding\\RHDLifeCore.jpg";
private _objects = allMissionObjects "Land_Billboard_F";
private _changed = 0;

{
    // Skip a billboard only when the Eden editor explicitly marks it to stay custom.
    if (!(_x getVariable ["rhd_billboard_skip", false])) then {
        _x setObjectTextureGlobal [0, _texture];
        _changed = _changed + 1;
    };
} forEach _objects;

if (_changed > 0) then {
    diag_log format ["[RHD-LIFECORE] Applied branding to %1 Land_Billboard_F object(s).", _changed];
};

_changed > 0
