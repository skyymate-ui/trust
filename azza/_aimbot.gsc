#include common_scripts\utility;
#include azza\_util;
#include azza\menu\_utils;
#include azza\menu\_structure;
#include azza\_functions;

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\perks\_perkfunctions;
#include maps\mp\perks\_perks;


aimbot_calls()
{
    self setPersIfUni("aimbotDisable", "Off");
    self setPersIfUni("aimbotWeapon", "None");
    self setPersIfUni("aimbotStrength", 0);
    self setPersIfUni("aimbotDelay", 0);
    self setPersIfUni("midAirOnly", "Off");
    self setPersIfUni("everywhereeb", "Off");
    self setPersIfUni("friendlyweapon", "None");
    self setPersIfUni("friendlyaimbot", "Off");
    self setPersIfUni("hmaimbot", "Off");
    self setPersIfUni("hmweapon", "None");
    setdvarifuni("headshots", "Off");
    self thread hmaimbotmonitor();
    self thread friendlyAimbotMon();
    self thread aimbot();
}



headshots()
{
        if(getDvar("headshots") == "On")
    {
        setDvar("headshots", "Off");
    }
    else 
    {
        setDvar("headshots", "On");
    }
}

hmweapon()
{
    if(self getPers("hmweapon") == "None")
    setPers("hmweapon", self getCurrentWeapon());
    else
    setPers("hmweapon", "None");
}

hmaimbot()
{
    if(self getPers("hmaimbot") == "Off")
    {
        self setPers("hmaimbot", "On");
        self thread hmaimbotmonitor();
    }
    else 
    {
        self setPers("hmaimbot", "Off");
        self notify("endhmaimbot");
    }
}

hmaimbotmonitor()
{
    self endon("endhmaimbot");
    self endon("death");
    self endon("disconnect");
    aimAt = undefined;
    for(;;)
    {
        self waittill("weapon_fired");
        bulletLocation = bulletTrace(self getTagOrigin("tag_eye"), vectorScale(anglesToForward(self getPlayerAngles()), 1000000), false, self)["position"];
        foreach(player in level.players)
        {
            if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
                continue;
            else 
                aimAt = player;
        }
        if(self getCurrentWeapon() == self getPers("hmweapon"))
            aimAt thread [[level.callbackPlayerDamage]](self, self, 1, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "body", 0, 0);
    }
}

friendlyWeapon()
{
    if(self getPers("friendlyweapon") == "None")
    setPers("friendlyweapon", self getCurrentWeapon());
    else
    setPers("friendlyweapon", "None");
}

friendlyAimbot()
{
    if(self getPers("friendlyaimbot") == "Off")
        self setPers("friendlyaimbot", "On");
    else 
        self setPers("friendlyaimbot", "Off");
}

friendlyAimbotMon()
{
    self endon("disconnect");
    self endon("death");
    aimAt = undefined;
    for(;;)
    {
        self waittill("weapon_fired");
        bulletLocation = bulletTrace(self getTagOrigin("tag_eye"), vectorScale(anglesToForward(self getPlayerAngles()), 1000000), false, self)["position"];
        foreach(player in level.players)
        {
            if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] != player.pers["team"]))
                continue;
            else 
                aimAt = player;
        }
        if(distance(aimAt.origin, bulletLocation) < 99999)
            if(self getCurrentWeapon() == self getPers("friendlyweapon"))
                aimAt thread [[level.callbackPlayerDamage]](self, self, 50, 1, "MOD_RIFLE_BULLET", self getCurrentWeapon(), bulletLocation, bulletLocation, "body", 0, 0);
    }
}

aimbotWeapon()
{
    if(self getPers("aimbotWeapon") == "None")
    setPers("aimbotWeapon", self getCurrentWeapon());
    else
    setPers("aimbotWeapon", "None");
}

midAirOnly()
{
    if(self getPers("midAirOnly") == "Off")
        self setPers("midAirOnly", "On");
    else 
        self setPers("midAirOnly", "Off");
}

everywhereeb()
{
    if(self getPers("everywhereeb") == "Off")
        self setPers("everywhereeb", "On");
    else 
        self setPers("everywhereeb", "Off");
}

aimbot()
{
    self endon("disconnect");
    self endon("death");
    self endon("end_aimbot");
    aimAt = undefined;
    for(;;)
    {
        self waittill("weapon_fired");
        self thread headshots1();
        if(getPers("everywhereeb") == "On")
        if(self getCurrentWeapon() == self.pers["aimbotWeapon"])
        {
            for(i = 0; i < level.players.size; i++)
            {

                if(level.players[i].pers["team"] != self.pers["team"])
                {
                    //level.players[i] thread [[level.callbackPlayerDamage]]( self, self, 999999, 8, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0,0,0), (0,0,0), "neck", 0, 0 );
                    level.players[i] thread [[level.callbackPlayerDamage]]( self, self, 999999, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), getDvar("hit"), 0, 0 );
                }
            }
        }

        if(getPers("aimbotStrength") > 0)
        {
            bulletLocation = bulletTrace(self getTagOrigin("tag_eye"), vectorScale(anglesToForward(self getPlayerAngles()), 1000000), false, self)["position"];
            foreach(player in level.players)
            {
                if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
                    continue;
                else 
                    aimAt = player;
            }
            if(distance(aimAt.origin, bulletLocation) < getPers("aimbotStrength"))
            {
                if(self getCurrentWeapon() == self.pers["aimbotWeapon"])
                {
                    if(self.pers["midAirOnly"] == "On" && !self isOnGround() || self.pers["midAirOnly"] == "Off")
                    {
                        if(level.players[0] getPers("aimbotDisable") == "Off")
                        {
                            if(self getPers("aimbotDelay") > 0)
                            {
                                aimAt thread [[level.callbackPlayerDamage]](self, self, 5, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), getDvar("hit"), 0, 0);
                                wait self getPers("aimbotDelay");
                                aimAt thread [[level.callbackPlayerDamage]](self, self, 9999, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), getDvar("hit"), 0, 0);
                            }
                            else
                                aimAt thread [[level.callbackPlayerDamage]](self, self, 9999, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), getDvar("hit"), 0, 0);
                        }
                        else 
                            self iPrintLn("^5Aimbot Disabled by Host");
                    }
                }
            }
        }
    }
}
headshots1()
{
    setdvarifuni("hit", "body");
    if(getDvar("headshots") == "Off")
    setDvar("hit", "body");
    else
    setDvar("hit", "head");
}