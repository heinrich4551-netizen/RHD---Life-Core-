class RHD_CTAB_Background: RscText {
    idc = 9800;
    colorBackground[] = {0.015,0.025,0.035,0.82};
};
class RHD_CTAB_Title: RscText {
    idc = 9801;
    sizeEx = 0.027;
    colorBackground[] = {0.04,0.16,0.23,0.96};
    colorText[] = {0.90,0.96,1,1};
};
class RHD_CTAB_Nav: RscButton {
    sizeEx = 0.018;
    colorBackground[] = {0.05,0.20,0.28,0.95};
    colorBackgroundActive[] = {0.10,0.38,0.50,1};
    colorText[] = {1,1,1,1};
};
class RHD_CTAB_Content: RscStructuredText {
    idc = 9807;
    colorBackground[] = {0.01,0.02,0.03,0.88};
    colorText[] = {0.90,0.94,0.98,1};
    sizeEx = 0.020;
};
class RHD_CTAB_List: RscListbox {
    idc = 9808;
    sizeEx = 0.018;
    colorBackground[] = {0.02,0.03,0.04,0.96};
    colorSelect[] = {1,1,1,1};
    colorSelectBackground[] = {0.08,0.30,0.40,1};
};
class RHD_CTAB_Button: RscButton {
    sizeEx = 0.017;
    colorBackground[] = {0.06,0.28,0.36,0.96};
    colorBackgroundActive[] = {0.10,0.42,0.52,1};
    colorText[] = {1,1,1,1};
};
class RHD_CTAB_Status: RscText {
    idc = 9811;
    sizeEx = 0.016;
    colorText[] = {0.50,0.80,0.90,1};
};
