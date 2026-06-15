// ============================================================
// AZZA TRICKSHOT MENU — Main Entry Point
// Private Match Only | iw4x
// ============================================================
// This is the entry point that iw4x loads.
// It handles player connection/spawn and initializes the menu.
// ============================================================

#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

init()
{
    level thread onPlayerConnect();

    // --- Server DVARs ---
    // Add any server-side dvars here (e.g. sv_cheats, jump settings, gravity)
    setDvar("sv_cheats", 1);
    setDvar("jump_slowdownenable", 0);
    setDvar("bg_bounces", 2);
    setDvar("bg_elevators", 2);
}

onPlayerConnect()
{
    while(true)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
    }
}

onPlayerSpawned()
{
    self endon("disconnect");

    while(true)
    {
        self waittill("spawned_player");

        // Only init menu for real players (not bots)
        if(!self.pers["isBot"])
        {
            self thread azza\menu\_setup::setupMenu();
            self freezeControls(false);
            self iPrintLn("^7[{+speed_throw}] + [{+actionslot 2}] ^0= ^7AZZA");

            // ============================================================
            // ADD YOUR CUSTOM THREADS HERE
            // Example: self thread azza\_binds::initBinds();
            // Example: self thread azza\_spins::initSpins();
            // ============================================================
        }
        else
        {
            // --- Bot Settings ---
            // Customize bot behavior here
            self.maxhealth = 1;
            self.health = 1;
        }
    }
}
