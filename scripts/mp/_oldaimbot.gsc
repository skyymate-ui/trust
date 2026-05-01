#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;
#include maps\mp\perks\_perkfunctions;
#include maps\mp\perks\_perks;
#include scripts\mp\menu\_structure;
#include scripts\mp\_functions;

aimbot_calls()
{
    setdvarifuni("aimbotWeapon", "All Weapons");
    setdvarifuni("hitmarkerWeapon", "All Weapons");

    self setPersIfUni("headshotAimbot", "Off");

    self.aimbotStrength = "Off";
    self.aimbothitmarker = "Off";
    self.headshotAimbot = "Off";
    self.aimbotDelay = 0;
}


headshotAimbot()
{
    if(self getPers("headshotAimbot") == "Off")
        self setPers("headshotAimbot", "On");
    else
        self setPers("headshotAimbot", "Off");
}

aimbotWeapon()
{
    if(getDvar("aimbotWeapon") == "All Weapons")
    setDvar("aimbotWeapon",self getCurrentWeapon());
    else
    setDvar("aimbotWeapon", "All Weapons");
}

aimbotStrength()
{
    self notify("endAimbot");
    switch(self.aimbotStrength)
    {
        case "Off":
            self.aimbotStrength = "Strong";
            break;
        case "Strong":
            self.aimbotStrength = "Everywhere";
            break;
		case "Everywhere":
            self.aimbotStrength = "Off";
            break;
    }
    if(self.aimbotStrength != "^5Off")
        self thread doAimbot();
}

aimbotDelay(value)
{
    self.aimbotDelay += value;

    if (self.aimbotDelay < 0)
    {
        self.aimbotDelay = 0;
        self iPrintlnBold("[^5Aimbot Delay Error^7]");
    }
}

doAimbot()
{
    self endon("disconnect");
    self endon("endAimbot");
    aimAt = undefined;
    for(;;)
    {
        self waittill("weapon_fired");
        if(self.aimbotStrength == "Strong") aimDistance = 900;
        else if(self.aimbotStrength == "Everywhere") aimDistance = 99999;
        else aimDistance = 0;

        /* Bullet Location */
        forward = self getTagOrigin("tag_eye");
        end = vectorScale(anglesToForward(self getPlayerAngles()), 1000000);
        bulletLocation = bulletTrace(forward, end, false, self)["position"];

        /* Random Player */
        foreach(player in level.players)
        {
            if((player == self) || (!isAlive(player)) || (level.teamBased && player.pers["team"] == self.pers["team"])) continue;
            else aimAt = player;
        }

        /* Distance Check */
        if(distance(aimAt.origin, bulletLocation) < aimDistance)
        {

			if(getDvar("aimbotWeapon") == "All Weapons") aimbotWeapon = self getCurrentWeapon();
            else aimbotWeapon = getDvar("aimbotWeapon");

            if(getPers("headshotAimbot") == "On")
            {
                aimMod = "MOD_HEAD_SHOT"; 
                hitLoc = "head";
            }
            else { 
                aimMod = "MOD_RIFLE_BULLET"; 
                hitLoc = "body";
            }

            if(self getCurrentWeapon() == aimbotWeapon)
            {
				
                aimAt thread [[level.callbackPlayerDamage]](self, self, 30, 8, aimMod, getDvar("aimbotWeapon"), (0,0,0), (0,0,0), hitLoc, 0, 0);
                wait self.aimbotDelay;
                aimAt thread [[level.callbackPlayerDamage]](self, self, 9999, 8, aimMod, getDvar("aimbotWeapon"), (0,0,0), (0,0,0), hitLoc, 0, 0);
            }

        }
    }
}

/* aimbot hitmarker */
hitmarkerWeapon()
{
    if(getDvar("hitmarkerWeapon") == "All Weapons")
    setDvar("hitmarkerWeapon",self getCurrentWeapon());
    else
    setDvar("hitmarkerWeapon", "All Weapons");
}


aimbot_hitmarker()
{
    self notify("endHitmarker");
    if (!isdefined(self.aimbothitmarker))
        self.aimbothitmarker = "Off"; 
    switch(self.aimbothitmarker)
    {
        case "Off":
            self.aimbothitmarker = "Hitmarker";
            break;
        case "Hitmarker":
            self.aimbothitmarker = "Off";
            break;
    }
    if(self.aimbothitmarker != "Off")
        self thread doHitmarker();
}

doHitmarker()
{
    self endon("disconnect");
    self endon("endHitmarker");
    aimAt = undefined;
    for(;;)
    {
        self waittill("weapon_fired");
		if(self.aimbothitmarker == "Hitmarker") aimDistance = 99999;
        else aimDistance = 0;

        /* Bullet Location */
        forward = self getTagOrigin("tag_eye");
        end = vectorScale(anglesToForward(self getPlayerAngles()), 1000000);
        bulletLocation = bulletTrace(forward, end, false, self)["position"];

        /* Random Player */
        foreach(player in level.players)
        {
            if((player == self) || (!isAlive(player)) || (level.teamBased && player.pers["team"] == self.pers["team"])) continue;
            else aimAt = player;
        }

        /* Distance Check */
        if(distance(aimAt.origin, bulletLocation) < aimDistance)
        {

            if(getDvar("hitmarkerWeapon") == "All Weapons") hitmarkerWeapon = self getCurrentWeapon();
            else hitmarkerWeapon = getDvar("hitmarkerWeapon");

            if(self.headshotAimbot == true)
            {
                aimMod = "MOD_HEAD_SHOT"; 
                hitLoc = "head";
            }
            else { 
                aimMod = "MOD_RIFLE_BULLET"; 
                hitLoc = "body";
            }

            if(self getCurrentWeapon() == hitmarkerWeapon)
            {

				if(self.aimbothitmarker == "Hitmarker")
				{
				aimAt thread [[level.callbackPlayerDamage]](self, self, 1, 8, aimMod, hitmarkerWeapon, (0,0,0), (0,0,0), hitLoc, 0, 0);
				}
                
            }

        }
    }
}


