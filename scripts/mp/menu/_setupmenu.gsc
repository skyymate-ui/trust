#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;

SetupMenu() {
    self.menu = SpawnStruct();
    self.menu.isopen = false;
    self.menu.smoothscroll = false;
    self.menu.color = [];
    self.menu.color["backgorund"] = (0, 0, 0);
    self.menu.color["black"] = (0.1, 0.1, 0.1);
    self.menu.color["accent"] = (0.08, 0.08, 0.08);
    self.menu.color["white"] = (1, 1, 1);
    self.menutitle = "COUNTER UAV";
    self.menu.maxsize = 10;
    self.menu.maxsizehalf = 6;

    self thread updateBarColors();
    self thread scripts\mp\menu\_menulogic::MenuButtons();
    self thread closeOnDeath();
    self CreateNotifys();
}

CreateNotifys() {
    foreach(value in StrTok("+actionslot 1,+actionslot 2,+actionslot 3,+actionslot 4,+frag,+smoke,+usereload", ",")) {
        self NotifyOnPlayerCommand(value, value);
    }
}

closeOnDeath()
{
    self endon("disconnect");
    for(;;)
    {
        self waittill("death");
        self thread scripts\mp\menu\_menuutils::DestroyMenuHud();
        self.menu.isopen = false;
        self freezeControls(false);
    }
}





