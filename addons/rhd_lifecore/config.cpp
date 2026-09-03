#define RHD_VERSION_TEXT "2.2.2"

/*
    RHD - LifeCore addon configuration
    UI definitions are intentionally NOT declared in this addon config.
    This prevents mission/UI base-class ordering errors such as RscStructuredText.
    One visible 3DEN module controls the RHD Life RP stack and the bridge to
    the already-running Antistasi Ultimate campaign.
*/

class CfgPatches
{
    class rhd_lifecore
    {
        name = "RHD - LifeCore";
        author = "LT. Toad";
        requiredVersion = 2.20;
        requiredAddons[] = {"cba_main", "ctab_core", "A3A_core", "A3_Modules_F"};
        units[] = {"RHD_Module_LifeCoreAntistasi"};
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
            class moduleLifeCoreAntistasi {};
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

    class RHD_Module_LifeCoreAntistasi: Module_F
    {
        scope = 2;
        scopeCurator = 2;
        displayName = "RHD - LifeCore | Master Life RP + Antistasi Ultimate";
        icon = "iconObjectCircle";
        portrait = "iconObjectCircle";
        category = "RHD_LifeCore";
        function = "RHD_fnc_moduleLifeCoreAntistasi";
        isGlobal = 1;
        isTriggerActivated = 1;
        author = "LT. Toad";
        class Attributes
        {
            class RHD_EnableEconomy {displayName = "Enable Economy / Shops"; tooltip = "RHD economy and shops."; property = "RHD_EnableEconomy"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableEconomy', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableJobs {displayName = "Enable Jobs"; tooltip = "RHD civilian, farmer, miner, refiner, police and EMS jobs."; property = "RHD_EnableJobs"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableJobs', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableIndustry {displayName = "Enable Farming / Mining / Refining"; tooltip = "RHD gathering and refining."; property = "RHD_EnableIndustry"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableIndustry', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableRP {displayName = "Enable Police / EMS / RP"; tooltip = "RHD police, EMS, tickets, treatment and dispatch."; property = "RHD_EnableRP"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableRP', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnablePersistence {displayName = "Enable Persistence"; tooltip = "RHD player persistence."; property = "RHD_EnablePersistence"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnablePersistence', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableAmbient {displayName = "Enable Ambient Life"; tooltip = "RHD ambient traffic and events."; property = "RHD_EnableAmbient"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableAmbient', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableBranding {displayName = "Enable RHD Branding"; tooltip = "RHD branding systems."; property = "RHD_EnableBranding"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableBranding', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableTablet {displayName = "Enable cTab Tablet"; tooltip = "RHD cTab player tablet."; property = "RHD_EnableTablet"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableTablet', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_EnableConflict {displayName = "Enable Conflict / Crime Pressure"; tooltip = "RHD crime and district pressure."; property = "RHD_EnableConflict"; control = "Checkbox"; expression = "_this setVariable ['RHD_EnableConflict', _value, true]"; defaultValue = "true"; typeName = "BOOL";};
            class RHD_CreateHQAnchors {displayName = "Create RHD HQ Anchors"; tooltip = "Leave off to keep Antistasi Ultimate fully authoritative for its HQ."; property = "RHD_CreateHQAnchors"; control = "Checkbox"; expression = "_this setVariable ['RHD_CreateHQAnchors', _value, true]"; defaultValue = "false"; typeName = "BOOL";};
        };
    };

    // Legacy module class names remain loadable for older bundled missions,
    // but they are hidden from the editor in favor of the master controller.
    class RHD_Module_AntistasiBase: Module_F
    {
        scope = 1;
        scopeCurator = 1;
        displayName = "RHD - LifeCore | Legacy Antistasi Bridge";
        function = "RHD_fnc_moduleAntistasiBase";
        isGlobal = 1;
        isTriggerActivated = 1;
    };

    class RHD_Module_LifeCore: Module_F
    {
        scope = 1;
        scopeCurator = 1;
        displayName = "RHD - LifeCore | Legacy Life RP";
        function = "RHD_fnc_moduleLifeCore";
        isGlobal = 1;
        isTriggerActivated = 1;
    };
};
