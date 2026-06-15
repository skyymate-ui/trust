// ============================================================
// AZZA — Main Entry Point
// Private Match Trickshot Menu for iw4x
// ============================================================

#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include azza\_util;
#include azza\menu\_utils;
#include azza\menu\_logic;
#include azza\menu\_setup;
#include azza\menu\_structure;
#include azza\_functions;
#include azza\_binds;
#include azza\_cfg;
#include azza\_aimbot;
#include azza\_bolt;
#include azza\_presets;

init()
{
    level thread onPlayerConnect();
    level thread OverflowFixInit();
    precacheShader("gradient_fadein_fadebottom");
    precacheMenu(game["menu_hostmigration"]);
    precacheItem("lightstick_mp");
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread onPlayerSpawn();
        if(player isHost())
            player.pers["access"] = "HOST";
        else if(player.pers["isBot"] == true)
            player.pers["access"] = "BOT";
        else
            player.pers["access"] = "PLAYER";
    }
}

onPlayerSpawn()
{
    self endon("disconnect");
    for(;;)
    {
        self waittill("spawned_player");

        if(!self isHost())
            continue;

        // Initialize menu on first spawn
        if(!isDefined(self.menuInitialized))
        {
            self.menuInitialized = true;
            self thread menuInit();
            self iPrintLn("^7[^1AZZA^7] ^7ADS + [{+actionslot 2}] to open");
        }

        // Setup bind functions on every spawn
        self thread setupBindsOnSpawn();

        // Initialize default dvars
        SetDvarIfUni("function_savepoint", 1);
        SetDvarIfUni("function_spawnsavepoint", 1);

        self freezeControls(false);
    }
}

setupBindsOnSpawn()
{
    self endon("disconnect");
    self endon("death");

    // Load saved bind states
    self SetupBind("instaswap", "Off", ::instaswap);
    self SetupBind("nacmodbind", "Off", ::nacmodbind);
    self SetupBind("velbind", "Off", ::velbind);
    self SetupBind("boltbind", "Off", ::boltbind);
    self SetupBind("forcebind", "Off", ::forcebind);
    self SetupBind("damagebind", "Off", ::damagebind);
    self SetupBind("hitmarker1", "Off", ::hitmarker1);
    self SetupBind("flashbind", "Off", ::flashbind);
    self SetupBind("stunsbind", "Off", ::stunsbind);
    self SetupBind("finalstandbind", "Off", ::finalstandbind);
    self SetupBind("laststandbind", "Off", ::laststandbind);
    self SetupBind("hostmigrabind", "Off", ::hostmigrabind);
    self SetupBind("fakeempbind", "Off", ::fakeempbind);
    self SetupBind("thirdeyebind", "Off", ::thirdeyebind);
    self SetupBind("omabind", "Off", ::omabind);
    self SetupBind("blastbind", "Off", ::blastbind);
    self SetupBind("illusion", "Off", ::illusion);
    self SetupBind("smooth2", "Off", ::smooth2);
    self SetupBind("gunlockbind", "Off", ::gunlockbind);
    self SetupBind("killbotbind", "Off", ::killbotbind);
    self SetupBind("animbind", "Off", ::animbind);
    self SetupBind("swapbind", "Off", ::swapbind);
    self SetupBind("radiusdmgbind", "Off", ::radiusdmgbind);
    self SetupBind("dvarbind", "Off", ::dvarbind);
    self SetupBind("cppos", "Off", ::cppos);
}
