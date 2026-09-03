#define RHD_VERSION_TEXT "2.2.2"

// Self-contained UI base controls. Do not depend on global Rsc* classes being
// visible while this addon config is parsed; this avoids undefined-base errors.
class RHD_RscText
{
    access = 0;
    type = 0;
    idc = -1;
    style = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    text = "";
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    shadow = 0;
};

class RHD_RscStructuredText
{
    access = 0;
    type = 13;
    idc = -1;
    style = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    font = "PuristaMedium";
    size = 0.04;
    sizeEx = 0.04;
    text = "";
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    shadow = 0;
};

class RHD_RscListbox
{
    access = 0;
    type = 5;
    idc = -1;
    style = 16;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    rowHeight = 0.04;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0.3};
    colorSelect[] = {1,1,1,1};
    colorSelectBackground[] = {0.2,0.2,0.2,1};
};

class RHD_RscButton
{
    access = 0;
    type = 1;
    idc = -1;
    style = 2;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    text = "";
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0.5};
    colorBackgroundActive[] = {0.2,0.2,0.2,0.8};
};

class RHD_RscEdit
{
    access = 0;
    type = 2;
    idc = -1;
    style = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    text = "";
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0.5};
};

class RHD_RscCombo
{
    access = 0;
    type = 4;
    idc = -1;
    style = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    font = "PuristaMedium";
    sizeEx = 0.04;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0.5};
};

class CfgPatches
{
    class rhd_lifecore
    {
        name = "RHD - LifeCore";
        author = "LT. Toad";
        requiredVersion = 2.20;
        requiredAddons[] = {"cba_main", "ctab_core", "A3A_core", "A3_UI_F", "A3_Modules_F"};
        units[] = {"RHD_Module_AntistasiBase","RHD_Module_LifeCore"};
        weapons[] = {};
    };
};

class CfgFactionClasses
{
    class RHD_LifeCore
    {
        displayName = "RHD - LifeCore";
        priority = 1;
        side = 7;
    };
};

class CfgFunctions
{
    class RHD
    {
        class Core
        {
            file = "core";
            class init {preInit = 1;};
            class initPlayer {};
            class initActions {};
            class savePlayer {server = 1;};
            class loadPlayer {server = 1;};
            class getItemCount {server = 1;};
            class addItem {server = 1;};
            class removeItem {server = 1;};
            class addCash {server = 1;};
            class removeCash {server = 1;};
            class notify {};
        };
        class Economy
        {
            file = "core/economy";
            class serverBuy {server = 1;};
            class serverSell {server = 1;};
            class shopOpen {};
            class getShopPrice {};
            class getShopCatalog {};
            class requestBuyVehicle {};
            class requestBuyEquipment {};
            class shopBuyVehicle {server = 1;};
            class shopBuyItem {server = 1;};
        };
        class Bank
        {
            file = "core/bank";
            class deposit {server = 1;};
            class withdraw {server = 1;};
            class requestDeposit {};
            class requestWithdraw {};
        };
        class Jobs
        {
            file = "core/jobs";
            class setJob {server = 1;};
            class startWork {};
            class stopWork {};
        };
        class Industry
        {
            file = "core/industry";
            class serverGather {server = 1;};
            class requestGather {};
            class refine {server = 1;};
            class requestRefine {};
        };
        class RP
        {
            file = "core/rp";
            class ticket {server = 1;};
            class requestTicket {};
            class heal {server = 1;};
            class requestHeal {};
            class dispatch {server = 1;};
            class receiveDispatch {};
        };
        class Services
        {
            file = "core/services";
            class requestRefuel {};
            class refuel {server = 1;};
        };
        class UI
        {
            file = "core/ui";
            class openMenu {};
            class keyHandler {};
            class refresh {};
            class requestBuy {};
            class requestSell {};
            class setTheme {};
            class initHud {};
            class ctabOpen {};
            class ctabBuild {};
            class ctabPage {};
            class ctabClear {};
            class ctabClose {};
        };
        class Admin
        {
            file = "core/admin";
            class isAdmin {};
            class adminOpenMenu {};
            class adminExecuteFromMenu {};
            class execute {server = 1;};
            class adminFreeze {};
            class adminSpectate {};
        };
        class Antistasi
        {
            file = "core/antistasi";
            class initBase {server = 1;};
            class antistasiAddAggression {server = 1;};
            class antistasiAddResources {server = 1;};
            class antistasiSpawnVehicle {server = 1;};
            class getStatus {};
        };
        class Conflict
        {
            file = "core/conflict";
            class conflictInit {};
            class conflictDirector {server = 1;};
            class getZoneStatus {};
            class recordCrime {server = 1;};
        };
        class Ambient
        {
            file = "core/ambient";
            class director {server = 1;};
            class events {server = 1;};
        };
        class ACE
        {
            file = "core/ace";
            class aceInit {};
        };
        class Runtime
        {
            file = "functions/runtime";
            class runtimeInit {postInit = 1; server = 1;};
            class runtimeInitPlayer {postInit = 1;};
        };
        class Modules
        {
            file = "functions/modules";
            class moduleAntistasiBase {};
            class moduleLifeCore {};
            class dynamicLocations {server = 1;};
            class dynamicLocationSync {server = 1;};
            class terrainAudit {server = 1;};
            class terrainFallback {};
        };
    };
};

class CfgRemoteExec
{
    class Functions
    {
        mode = 2;
        jip = 1;
        class RHD_fnc_notify {allowedTargets = 0;};
        class RHD_fnc_openMenu {allowedTargets = 1;};
        class RHD_fnc_shopOpen {allowedTargets = 1;};
        class RHD_fnc_serverBuy {allowedTargets = 2;};
        class RHD_fnc_serverSell {allowedTargets = 2;};
        class RHD_fnc_setJob {allowedTargets = 2;};
        class RHD_fnc_serverGather {allowedTargets = 2;};
        class RHD_fnc_refine {allowedTargets = 2;};
        class RHD_fnc_ticket {allowedTargets = 2;};
        class RHD_fnc_heal {allowedTargets = 2;};
        class RHD_fnc_deposit {allowedTargets = 2;};
        class RHD_fnc_withdraw {allowedTargets = 2;};
        class RHD_fnc_receiveDispatch {allowedTargets = 1;};
        class RHD_fnc_refuel {allowedTargets = 2;};
        class RHD_fnc_adminOpenMenu {allowedTargets = 1;};
        class RHD_fnc_execute {allowedTargets = 2;};
        class RHD_fnc_adminFreeze {allowedTargets = 1;};
        class RHD_fnc_adminSpectate {allowedTargets = 1;};
        class RHD_fnc_antistasiAddAggression {allowedTargets = 2;};
        class RHD_fnc_antistasiAddResources {allowedTargets = 2;};
        class RHD_fnc_antistasiSpawnVehicle {allowedTargets = 2;};
        class RHD_fnc_shopBuyVehicle {allowedTargets = 2;};
        class RHD_fnc_shopBuyItem {allowedTargets = 2;};
    };
};

class CfgVehicles
{
    class Module_F;
    class RHD_Module_AntistasiBase: Module_F
    {
        scope = 2;
        scopeCurator = 2;
        displayName = "RHD - LifeCore | Antistasi Ultimate Bridge";
        icon = "iconObjectCircle";
        portrait = "iconObjectCircle";
        category = "RHD_LifeCore";
        function = "RHD_fnc_moduleAntistasiBase";
        isGlobal = 1;
        isTriggerActivated = 1;
        author = "LT. Toad";
        class Attributes
        {
            class RHD_A3A_AutoStart
            {
                displayName = "Start / Bridge Antistasi Ultimate";
                tooltip = "Bridge RHD to an installed Antistasi Ultimate campaign.";
                property = "RHD_A3A_AutoStart";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_A3A_AutoStart', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };
            class RHD_A3A_CreateHQ
            {
                displayName = "Create Antistasi HQ Anchors";
                tooltip = "Creates RHD/A3A bridge anchors when using the bundled RHD mission.";
                property = "RHD_A3A_CreateHQ";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_A3A_CreateHQ', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };
            class RHD_A3A_TerrainFallback
            {
                displayName = "Enable Antistasi Terrain Adapter";
                tooltip = "Enables generic terrain adaptation for RHD locations.";
                property = "RHD_A3A_TerrainFallback";
                control = "Checkbox";
                expression = "_this setVariable ['RHD_A3A_TerrainFallback', _value, true]";
                defaultValue = "true";
                typeName = "BOOL";
            };
        };
    };

    class RHD_Module_LifeCore: Module_F
    {
        scope = 2;
        scopeCurator = 2;
        displayName = "RHD - LifeCore | Life RP Systems";
        icon = "iconObjectCircle";
        portrait = "iconObjectCircle";
        category = "RHD_LifeCore";
        function = "RHD_fnc_moduleLifeCore";
        isGlobal = 1;
        isTriggerActivated = 1;
        author = "LT. Toad";
        class Attributes
        {
            class RHD_EnableEconomy {displayName = "Enable Economy / Shops"; tooltip = "Enables the RHD virtual market and shops."; property = "RHD_EnableEconomy"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableEconomy', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableJobs {displayName = "Enable Jobs"; tooltip = "Enables civilian, farmer, miner, refiner, police and EMS jobs."; property = "RHD_EnableJobs"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableJobs', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableIndustry {displayName = "Enable Farming / Mining / Refining"; tooltip = "Enables gathering and refining."; property = "RHD_EnableIndustry"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableIndustry', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableRP {displayName = "Enable Police / EMS / RP"; tooltip = "Enables Life RP services, tickets, treatment and dispatch."; property = "RHD_EnableRP"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableRP', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnablePersistence {displayName = "Enable Life RP Persistence"; tooltip = "Saves RHD player state server-side."; property = "RHD_EnablePersistence"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnablePersistence', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableAmbient {displayName = "Enable Ambient Life"; tooltip = "Enables RHD civilian traffic and roadside incidents."; property = "RHD_EnableAmbient"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableAmbient', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableBranding {displayName = "Enable RHD Billboard Branding"; tooltip = "Applies RHD branding to supported billboards."; property = "RHD_EnableBranding"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableBranding', _value, true];"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableTablet {displayName = "Enable cTab Player Tablet"; tooltip = "Uses cTab+ for the RHD player interface."; property = "RHD_EnableTablet"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableTablet', _value, true];"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableConflict {displayName = "Enable Life District Pressure"; tooltip = "Enables crime/heat pressure around RHD districts."; property = "RHD_EnableConflict"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableConflict', _value, true];"; defaultValue = "true"; typeName = "BOOL";};
        };
    };
};

class RscTitles
{
    class RHD_HUD
    {
        idd = -1;
        movingEnable = 0;
        duration = 1e+011;
        fadeIn = 0;
        fadeOut = 0;
        onLoad = "uiNamespace setVariable ['RHD_HUD_DISPLAY', _this select 0]";
        class controls
        {
            class Status: RHD_RscStructuredText
            {
                idc = 7901;
                x = .015 * safezoneW + safezoneX;
                y = .955 * safezoneH + safezoneY;
                w = .97 * safezoneW;
                h = .025 * safezoneH;
                text = "RHD - LIFECORE";
                sizeEx = .018;
                shadow = 1;
                colorBackground[] = {0,0,0,.25};
            };
        };
    };
};

class RHD_ADMIN
{
    idd = 8500;
    movingEnable = 1;
    enableSimulation = 1;
    class controls
    {
        class Background: RHD_RscText {idc = 8501; x = .396875 * safezoneW + safezoneX; y = .291 * safezoneH + safezoneY; w = .221719 * safezoneW; h = .319 * safezoneH; colorBackground[] = {0,0,0,.78};};
        class Title: RHD_RscText {idc = 8502; x = .396875 * safezoneW + safezoneX; y = .269 * safezoneH + safezoneY; w = .221719 * safezoneW; h = .022 * safezoneH; text = "RHD - LIFECORE | ADMIN"; sizeEx = .020; colorBackground[] = {.02,.08,.12,.96};};
        class PlayersLabel: RHD_RscText {idc = 8503; x = .402031 * safezoneW + safezoneX; y = .302 * safezoneH + safezoneY; w = .103125 * safezoneW; h = .022 * safezoneH; text = "PLAYERS";};
        class Players: RHD_RscListbox {idc = 8504; x = .402031 * safezoneW + safezoneX; y = .335 * safezoneH + safezoneY; w = .103125 * safezoneW; h = .154 * safezoneH;};
        class ActionsLabel: RHD_RscText {idc = 8505; x = .510312 * safezoneW + safezoneX; y = .302 * safezoneH + safezoneY; w = .103125 * safezoneW; h = .022 * safezoneH; text = "ADMIN ACTIONS";};
        class Actions: RHD_RscListbox {idc = 8506; x = .510312 * safezoneW + safezoneX; y = .335 * safezoneH + safezoneY; w = .103125 * safezoneW; h = .154 * safezoneH;};
        class Execute: RHD_RscButton {idc = 8507; x = .402031 * safezoneW + safezoneX; y = .500 * safezoneH + safezoneY; w = .211406 * safezoneW; h = .033 * safezoneH; text = "EXECUTE"; action = "[] call RHD_fnc_adminExecuteFromMenu";};
        class ValueLabel: RHD_RscText {idc = 8509; x = .402031 * safezoneW + safezoneX; y = .544 * safezoneH + safezoneY; w = .0464063 * safezoneW; h = .022 * safezoneH; text = "VALUE";};
        class Value: RHD_RscEdit {idc = 8510; x = .453594 * safezoneW + safezoneX; y = .544 * safezoneH + safezoneY; w = .159844 * safezoneW; h = .022 * safezoneH; text = "1";};
        class VariableLabel: RHD_RscText {idc = 8511; x = .402031 * safezoneW + safezoneX; y = .577 * safezoneH + safezoneY; w = .0464063 * safezoneW; h = .022 * safezoneH; text = "ITEM / JOB";};
        class Variable: RHD_RscCombo {idc = 8512; x = .453594 * safezoneW + safezoneX; y = .577 * safezoneH + safezoneY; w = .159844 * safezoneW; h = .022 * safezoneH;};
        class Settings: RHD_RscButton {idc = 8513; x = .573 * safezoneW + safezoneX; y = .269 * safezoneH + safezoneY; w = .022 * safezoneW + safezoneX; h = .0218 * safezoneH; text = "@"; action = "[\"ADMIN CONFIG: edit RHD_ADMIN_UIDS in core/fn_init.sqf\",\"info\"] call RHD_fnc_notify";};
        class Quit: RHD_RscButton {idc = 8514; x = .5155 * safezoneW + safezoneX; y = .269 * safezoneH + safezoneY; w = .055 * safezoneW; h = .0218 * safezoneH; text = "EXIT"; action = "closeDialog 0";};
        class Footer: RHD_RscText {idc = 8515; x = .402031 * safezoneW + safezoneX; y = .611 * safezoneH + safezoneY; w = .211406 * safezoneW; h = .022 * safezoneH; text = "RHD - LIFECORE | ADMIN"; sizeEx = .016;};
    };
};