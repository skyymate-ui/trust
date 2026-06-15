// ============================================================
// AZZA MENU — Structure (Submenus & Options)
// ============================================================
// This is where you define your menu layout.
// Each submenu is created with createMenu() and filled with addOption().
//
// USAGE:
//   createMenu("Menu Name", "Parent Menu Name");
//   addOption("Menu Name", "Option Text", ::functionToCall, optionalInput);
//   addOption("Menu Name", "Submenu Name", ::loadMenu, undefined, "Submenu Name");
//   addToggle("Menu Name", "Toggle Name", ::toggleFunction, "Off");
//
// The parent of the root menu should be "exit" to close on back press.
// ============================================================

#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include azza\menu\_utils;

structure()
{
    // ============================================================
    // MAIN MENU
    // ============================================================
    self createMenu("Main", "exit");
    self addOption("Main", "Spins", ::loadMenu, "Spins");
    self addOption("Main", "Swaps", ::loadMenu, "Swaps");
    self addOption("Main", "Shots", ::loadMenu, "Shots");
    self addOption("Main", "Movement", ::loadMenu, "Movement");
    self addOption("Main", "Bots", ::loadMenu, "Bots");
    self addOption("Main", "Settings", ::loadMenu, "Settings");

    // ============================================================
    // SPINS SUBMENU
    // Add your spin binds here (360, 720, 1080, custom degree, etc.)
    // Example:
    //   self addOption("Spins", "360 Spin", ::spin360);
    //   self addOption("Spins", "720 Spin", ::spin720);
    //   self addToggle("Spins", "Auto Spin", ::toggleAutoSpin, "Off");
    // ============================================================
    self createMenu("Spins", "Main");
    // ADD SPIN OPTIONS HERE

    // ============================================================
    // SWAPS SUBMENU
    // Add your weapon swap binds here (YY, azza swap, instaswap, etc.)
    // Example:
    //   self addOption("Swaps", "YY Swap", ::yySwap);
    //   self addOption("Swaps", "Instaswap", ::instaSwap);
    //   self addToggle("Swaps", "Auto YY", ::toggleAutoYY, "Off");
    // ============================================================
    self createMenu("Swaps", "Main");
    // ADD SWAP OPTIONS HERE

    // ============================================================
    // SHOTS SUBMENU
    // Add your trickshot fire binds here (swap shot, noscope, reload cancel, etc.)
    // Example:
    //   self addOption("Shots", "Swap Shot", ::swapShot);
    //   self addOption("Shots", "Noscope", ::noscope);
    //   self addOption("Shots", "Reload Shot", ::reloadShot);
    // ============================================================
    self createMenu("Shots", "Main");
    // ADD SHOT OPTIONS HERE

    // ============================================================
    // MOVEMENT SUBMENU
    // Add movement binds here (ladder stall, bounce, strafe, sprint cancel, etc.)
    // Example:
    //   self addOption("Movement", "Ladder Stall", ::ladderStall);
    //   self addOption("Movement", "Bounce", ::spawnBounce);
    //   self addToggle("Movement", "Infinite Sprint", ::toggleInfSprint, "Off");
    // ============================================================
    self createMenu("Movement", "Main");
    // ADD MOVEMENT OPTIONS HERE

    // ============================================================
    // BOTS SUBMENU
    // Add bot controls here (spawn, freeze, teleport, health, etc.)
    // Example:
    //   self addOption("Bots", "Spawn Bot", ::spawnBot);
    //   self addOption("Bots", "Freeze Bots", ::freezeBots);
    //   self addOption("Bots", "Teleport Bots", ::teleportBots);
    // ============================================================
    self createMenu("Bots", "Main");
    // ADD BOT OPTIONS HERE

    // ============================================================
    // SETTINGS SUBMENU
    // Add game/match settings here (god mode, ammo, gravity, timescale, etc.)
    // Example:
    //   self addToggle("Settings", "God Mode", ::toggleGod, "Off");
    //   self addToggle("Settings", "Infinite Ammo", ::toggleInfAmmo, "Off");
    //   self addOption("Settings", "Restart Map", ::restartMap);
    // ============================================================
    self createMenu("Settings", "Main");
    // ADD SETTINGS OPTIONS HERE
}
