#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include azza\_util;
#include azza\menu\_utils;
#include azza\menu\_structure;
#include azza\_functions;

binds_calls()
{
    self setupBind("dvarbind", "Off", ::dvarbind);

    self setupBind("velbind", "Off", ::velbind);
    self setupBind("vel2bind", "Off", ::vel2bind);
    self setupBind("killbotbind", "Off", ::killbotbind);
    self setupBind("nacmodbind", "Off", ::nacmodbind);
    self setupBind("saveloc", "Off", ::saveLocBind);
	self setupBind("saveseth", "Off", ::saveLocSeth);
    self setupBind("loadloc", "+actionslot 2", ::loadLocBind);
	self setupBind("loadseth", "+actionslot 4", ::loadLocSeth);
	self setupBind("loadbotloc", "+actionslot 3", ::loadLocBots);
	self setupBind("ebotweapbind", "Off", ::ebotweaponBind);
    self setupBind("forcebind", "Off", ::forcebind);
    self setupBind("forcebindHold", "Off", ::forcebindHold);
    self setupBind("botmantlebind", "Off", ::botmantlebind);
    self setupBind("ebotvelbind", "Off", ::ebotvelbind);
    self setupBind("botkilltest", "Off", ::botkilltest);
    self setupBind("fbotvelbind", "Off", ::fbotvelbind);
    self setupBind("gunlockbind", "Off", ::gunlockbind);
    self setupBind("instaswap", "Off", ::zaliumInsta);
    self setupBind("zaliumInsta", "Off", ::zaliumInsta);
    self setupBind("cppos", "Off", ::cppos);
    self setupBind("ammobind", "Off", ::ammobind);
    self setupBind("dropdeletebind", "Off", ::dropdeletebind);
    self setupBind("radiusdmgbind", "Off", ::radiusdmgbind);
    self setupBind("anim2bind", "Off", ::anim2bind);
    self setupBind("animbind", "Off", ::animbind);
    self setupBind("stunsbind", "Off", ::stunsbind);
    self setupBind("flashbind", "Off", ::flashbind);
    self setupBind("kssplashbind", "Off", ::kssplashbind);
    self setupBind("FriendlyKnock", "Off", ::FriendlyKnock);
    self setupBind("illusion", "Off", ::illusion);
    self setupBind("cpmala", "Off", ::cpmala);
    self setupBind("predmala", "Off", ::predmala);
    self setupBind("damagebind", "Off", ::damagebind);
    self setupBind("damagenobind", "Off", ::damagenobind);
    self setupBind("finalstandbind", "Off", ::finalstandbind);
	self setupBind("sentrybind", "Off", ::sentrybind);
	self setupBind("BotEmp", "Off", ::BotEmp);
	self setupBind("SelfEmp", "Off", ::SelfEmp);
	self setupBind("altswap", "Off", ::altswap);
    self setupBind("laststandbind", "Off", ::laststandbind);
    self setupBind("hostmigrabind", "Off", ::hostmigrabind);
    self setupBind("hitmarker1", "Off", ::hitmarker1);
    self setupBind("omabind", "Off", ::omabind);
    self setupBind("dropbind", "Off", ::dropbind);
    self setupBind("destroytac", "Off", ::destroytac);
    self setupBind("thirdeyebind", "Off", ::thirdeyebind);
    self setupBind("swapbind", "Off", ::swapbind); 
    self setupBind("smooth2", "Off", ::smooth2); 
    self setupBind("blastbind", "Off", ::blastbind);
    self setupBind("boltbind", "Off", ::boltbind);
	self setupBind("slowreload", "Off", ::slowreload);
	
    setDvarIfUninitialized("Anim", 24);
    setDvarIfUninitialized("Anim2", 13);



}

ebotweaponBind(bind, endonon)
{
    // stop this loop when the button is unbound
    self endon("stop" + endonon);

    for (;;)
    {
        // wait for the D-pad down press
        self waittill(bind);

        // only when you’re prone and not in a menu:
        if (!self isInMenu() && self getStance() == "prone")
        {
            // fire off your existing ebotweapon() thread
            self thread ebotweapon();
        }
    }
}

slowreload(bind, endonon)
{
	self endon("stop" + endonon);
    self endon(endonon);

    for (;;)
    {
        self waittill(bind);

        if (!self isInMenu())
        {
            self setWeaponAnim(13, 1);
        }
    }
}

dropdeletebind(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {   
            self thread drop_weapon();
            self thread delete_dropped_weapon();
            //self iPrintLnBold("Weapon Respawned");
        }
    }
}


blastbind(bind, endonon) 
{
    self endon("stop" + endonon);
    if (!isdefined(self.blastShieldActive)) {
        self.blastShieldActive = "Off";
    }
    for (;;) 
    {
        self waittill(bind);

        if (!self isInMenu()) 
        {  
            if (self.blastShieldActive == "Off") 
            {
                self VisionSetNakedForPlayer("black_bw", 0.15);
                wait(0.15);
                self _setPerk("_specialty_blastshield");
                self VisionSetNakedForPlayer(getDvar("mapname"), 0);
                self playSoundToPlayer("item_blast_shield_on", self);

                self.blastShieldActive = "On";
            } 
            else if (self.blastShieldActive == "On") 
            {
                self VisionSetNakedForPlayer("black_bw", 0.15);
                wait(0.15);
                self _unsetPerk("_specialty_blastshield");
                self VisionSetNakedForPlayer(getDvar("mapname"), 0);
                self playSoundToPlayer("item_blast_shield_off", self);

                self.blastShieldActive = "Off";
            }
        }
    }
}




ammobind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {  
            self setWeaponAmmoClip(getDvar("primary_weapon"), getDvarInt("primary_clip"));
            self setWeaponAmmoStock(getDvar("primary_weapon"), getDvarInt("primary_stock"));
            self setWeaponAmmoClip(getDvar("secondary_weapon"), getDvarInt("secondary_clip"));
            self setWeaponAmmoStock(getDvar("secondary_weapon"), getDvarInt("secondary_stock"));
        }
    }
}

cppos(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {   
        setDvar("function_carepackphysic", 1);
        x = getDvarFloat("cpposx");
        y = getDvarFloat("cpposy");
        z = getDvarFloat("cpposz");
        level maps\mp\killstreaks\_airdrop::doFlyBy( self, (x,y,z), randomFloat( 360 ), "airdrop" );
        self notify("airDropMarkerActivate");
        wait 5;
        }
    }
}

dropbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            x = self dropitem(self getCurrentWeapon());
        }
    }
}

omabind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            my_weapon = self getCurrentWeapon();
            self takeWeapon(my_weapon);
            waitframe();
            self giveWeapon("onemanarmy_mp");
            self switchToWeapon("onemanarmy_mp");
        }
    }
}

predmala(bind, endonon)
{
    self endon("stop" + endonon);

    for (;;)
    {
        self waittill(bind);

        if (!self isInMenu())
        {
            weap = self getCurrentWeapon();
            clip = self getWeaponAmmoClip(weap);
            stock = self getWeaponAmmoStock(weap);
            isAkimbo = isSubStr(weap, "akimbo");

            self giveWeapon("killstreak_predator_missile_mp");
            self switchToWeapon("killstreak_predator_missile_mp");

            // Wait until player is no longer holding it
            while (self getCurrentWeapon() == "killstreak_predator_missile_mp")
                wait 0.05;

            wait 0.05; // buffer
            self giveWeapon(weap, 0, isAkimbo);
            self setWeaponAmmoClip(weap, clip);
            self setWeaponAmmoStock(weap, stock);
        }
    }
}

cpmala(bind, endonon)
{
    self endon("stop" + endonon);

    for (;;)
    {
        self waittill(bind);

        if (!self isInMenu())
        {
            weap = self getCurrentWeapon();
            clip = self getWeaponAmmoClip(weap);
            stock = self getWeaponAmmoStock(weap);
            isAkimbo = isSubStr(weap, "akimbo");

            self giveWeapon("airdrop_marker_mp");
            self switchToWeapon("airdrop_marker_mp");

            // Wait until player throws it
            while (self getCurrentWeapon() == "airdrop_marker_mp")
                wait 0.05;

            wait 0.05; // Buffer
            self giveWeapon(weap, 0, isAkimbo);
            self setWeaponAmmoClip(weap, clip);
            self setWeaponAmmoStock(weap, stock);
        }
    }
}
nacmodbind(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {   
        x = getDvar("nacmod1");
        y = getDvar("nacmod2");
        nacmodD = self getCurrentWeapon();
        akimbo = false;
        if (nacmodD == x)
        {
            clip = self getWeaponAmmoClip(x);
            stock = self getWeaponAmmoStock(x);
            self takeWeapon(x);
            self switchToWeapon(y);
            wait 0.1;
            self giveWeapon(x);
            self setweaponammoclip(x, clip );
            self setweaponammostock(x, stock );
        }
        else if (nacmodD == y)
        {
            clip = self getWeaponAmmoClip(y);
            stock = self getWeaponAmmoStock(y);
            if(isSubStr(y, "akimbo"))
                akimbo = true;
            self takeWeapon(y);
            self switchToWeapon(x);
            wait 0.1;
            self giveWeapon(y, 0, akimbo);
            self setweaponammoclip(y, clip );
            self setweaponammostock(y, stock );
        }
    }
}
}

saveLocBind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu() && self getStance() == "crouch")
        {
            self savepos();
        }
    }
}

saveLocSeth(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu() && self getStance() == "crouch")
        {
            self sethpos();
        }
    }
}

loadLocBind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu() && self getStance() == "crouch")
        {
            self loadpos();
            if(self getPers("cponpos") == "On")
            {
                level.airDropCrates = getEntArray( "care_package", "targetname" );
                level.oldAirDropCrates = getEntArray( "airdrop_crate", "targetname" );

                if ( level.airDropCrates.size  <  1 )
                {
                carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate( self.pers["cp_location"] + (0,0,40), "airdrop", self.pers["cp_location"] + (0,0,40), true, undefined, self.pers["cp_location"] + (0,0,40));
                self notify("drop_crate");
                }
            }
        }
    }
}

loadLocBots(bind, endonon)
{
    self endon("stop" + endonon);
    for (;;)
    {
        self waittill(bind);
        if (!self isInMenu() && self getStance() == "prone")
            self loadLocationBot();
    }
}

loadLocSeth(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu() && self getStance() == "crouch")
        {
            self loadseth();
            if(self getPers("cponpos") == "On")
            {
                level.airDropCrates = getEntArray( "care_package", "targetname" );
                level.oldAirDropCrates = getEntArray( "airdrop_crate", "targetname" );

                if ( level.airDropCrates.size  <  1 )
                {
                carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate( self.pers["cp_location"] + (0,0,40), "airdrop", self.pers["cp_location"] + (0,0,40), true, undefined, self.pers["cp_location"] + (0,0,40));
                self notify("drop_crate");
                }
            }
        }
    }
}

forcebind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            currentoffhand = self GetCurrentOffhand();
            if (currentoffhand == "throwingknife_mp" || currentoffhand == "throwingknife_rhand_mp")
            {
            self setWeaponAmmoClip(currentoffhand, 9999);
            self GiveMaxAmmo(currentoffhand);
            wait 0.05;

            self[[game[self.team + "_model"]["SNIPER"]]]();
            waitframe();
            self[[game[self.team + "_model"]["GHILLIE"]]]();
            exec("+frag;-frag");
            }
        }
    }
}

forcebindHold(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            currentoffhand = self GetCurrentOffhand();
            if (currentoffhand == "throwingknife_mp" || currentoffhand == "throwingknife_rhand_mp")
            {
            self setWeaponAmmoClip(currentoffhand, 9999);
            self GiveMaxAmmo(currentoffhand);
            wait 0.05;

            self[[game[self.team + "_model"]["SNIPER"]]]();
            waitframe();
            self[[game[self.team + "_model"]["GHILLIE"]]]();
            exec("+frag");
            wait 0.5;
            self illusionfun();
            wait 0.5;
            exec("-frag");
            }
        }
    }
}



gunlockbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            FPS = getDvarInt("com_maxfps");
            currentWeapon = self getCurrentWeapon();
            currentWeaponParts = strTok(currentWeapon, "_");
            nextWeapon = self getNextWeapon(currentWeapon);
            nextWeaponParts = strTok(nextWeapon, "_");
            
            if(isSlowDrop(nextWeaponParts[0]) == true)
            {
                switch(currentWeaponParts[0])
                {
                    case "aa12":
                    case "ak47":
                    case "fal":
                    case "m21":
                    case "m240":
                    case "mg4":
                    case "rpd":
                        waitTime = 0.6;
                    case "at4":
                    case "scar":
                        waitTime = 0.66;
                    case "aug":
                        waitTime = 0.532;
                    case "barrett":
                        waitTime = 0.699;
                        break;
                    case "beretta393":
                    case "beretta":
                    case "coltanaconda":
                    case "deserteagle":
                    case "m16":
                    case "m4":
                    case "masada":
                    case "usp":
                        waitTime = 0.449;
                        break;
                    case "cheytac":
                        waitTime = 1.2;
                        break;
                    case "famas":
                    case "fn2000":
                    case "m1014":
                    case "spas12":
                    case "striker":
                    case "m79":
                    case "onemanarmy":
                        waitTime = 0.829;
                        break;
                    case "glock":
                    case "kriss":
                    case "mp5k":
                    case "airdrop_marker":
                        waitTime = 0.5;
                        break;
                    case "javelin":
                    case "model1887":
                    case "sa80":
                        waitTime = 0.75;
                        break;
                    case "p90":
                    case "ump":
                        waitTime = 0.8;
                        break;
                    case "pp2000":
                    case "tmp":
                        waitTime = 0.419;
                        break;
                    case "tavor":
                        waitTime = 0.55;
                        break;
                    case "rpg":
                        waitTime = 0.467;
                        break;
                    case "riotshield":
                        waitTime = 0.58;
                        break;
                    default:
                        waitTime = 0;
                        self iPrintLn("^5Weapon Not Defined Yet");
                        break;
                }
            }
            else if(isQuickDrop(nextWeaponParts[0]) == true)
            {
                switch(currentWeaponParts[0])
                {
                    case "aa12":
                    case "ak47":
                    case "at4":
                    case "aug":
                    case "barrett":
                    case "beretta393":
                    case "beretta":
                    case "cheytac":
                    case "coltanaconda":
                    case "deserteagle":
                    case "fal":
                    case "famas":
                    case "fn2000":
                    case "glock":
                    case "m1014":
                    case "m16":
                    case "m21":
                    case "m4":
                    case "masada":
                    case "model1887":
                    case "mp5k":
                    case "p90":
                    case "tmp":
                    case "pp2000":
                    case "sa80":
                    case "scar":
                    case "spas12":
                    case "striker":
                    case "rpg":
                    case "m79":
                    case "usp":
                    case "airdrop_marker":
                    case "onemanarmy":
                    case "tavor":
                        waitTime = 0.25;
                        break;
                    case "javelin":
                        waitTime = 0.349;
                        break;
                    case "kriss":
                        waitTime = 0.259;
                        break;
                    case "m240":
                    case "mg4":
                    case "rpd":
                        waitTime = 0.4;
                        break;
                    case "riotshield":
                        waitTime = 0.3;
                        break;
                    default:
                        waitTime = 0;
                        self iPrintLn("^5Weapon Not Defined Yet");
                        break;
                }
            }
            else 
            {
                waitTime = 0;
                self iPrintLn("^5Error");
            }
            
            if(waitTime != 0)
            {
                setDvar("com_maxfps", 58);
                self switchToWeapon(nextWeapon);
                wait waitTime;
                [[game[self.pers["team"]+"_model"]["SNIPER"]]]();
                waitframe();
                [[game[self.pers["team"]+"_model"]["GHILLIE"]]]();
                setDvar("com_maxfps", FPS);
            }
        }
    }
}

isSlowDrop(weapon)
{
    switch(weapon)
    {
        case "riotshield":
        case "ak47":
        case "m16":
        case "m4":
        case "fn2000":
        case "masada":
        case "famas":
        case "fal":
        case "scar":
        case "tavor":
        case "mp5k":
        case "uzi":
        case "p90":
        case "kriss":
        case "ump45":
        case "barrett":
        case "wa2000":
        case "m21":
        case "cheytac":
        case "rpd":
        case "sa80":
        case "mg4":
        case "m240":
        case "aug":
        case "pp2000":
        case "tmp":
        case "glock":
        case "beretta393":
        case "m79":
        case "rpg":
        case "thumper":
        case "at4":
        case "stinger":
        case "javelin":
        case "ranger":
        case "model1887":
        case "striker":
        case "aa12":
        case "m1014":
        case "spas12":
        case "onemanarmy":
            return true;
        default:
            return false;
    }
}

isQuickDrop(weapon)
{
    switch(weapon)
    {
        case "beretta":
        case "usp":
        case "deserteagle":
        case "coltanaconda":
        case "tmp":
        case "cheytac":
            return true;
        default:
            return false;
    }
}

smooth2(button, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(button);
        if(!self isInMenu())
        {    
            self setSpawnWeapon(self getCurrentWeapon());
            self instashoot();
            self setweaponanim(1);
            wait 0.01;
        }
    }
}

zaliumInsta(bind, endonon)
{    
    self endon("stop" + endonon);
    for(;;)
	{
        self waittill(bind);
        if(!self isInMenu())
        {
		nacmod = self getCurrentWeapon();
		if (nacmod == self.PrimaryWeapon)
		{
			Secondary = self.SecondaryWeapon;
			wait .05;
			self SetSpawnWeapon( secondary );
		}
		else if (nacmod == self.SecondaryWeapon)
		{
			Primary = self.PrimaryWeapon;
			wait .05;
			self SetSpawnWeapon( primary );
        }
		}
	}
}

instaswap(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self illusionfun();
            waitframe();
            self setSpawnWeapon(self getNextWeapon());
        }
    }
}

vel2bind(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {   
        velx = getDvarInt("velx2");
		velz = getDvarInt("velz2");
		vely = getDvarInt("vely2");
		
		self setVelocity((velx,velz,vely));
        }
    }
}

velbind(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {   
        velx = getDvarInt("velx");
		velz = getDvarInt("velz");
		vely = getDvarInt("vely");
		
		self setVelocity((velx,velz,vely));
        }
    }
}


fbotvelbind(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
        foreach ( player in level.players )
		if(isSubStr(player.guid, "bot"))
        if(player.pers["team"] == self.pers["team"])
        {
	        botx = getDvarFloat("fbotvelx");
	        botz = getDvarFloat("fbotvelz");
	        boty = getDvarFloat("fbotvely");
	        player setVelocity((botx,botz,boty));
            player.pers["savePoss"] = player.origin;
            player.pers["saveAngs"] = player.angles;
            wait 4;
		    player setOrigin( player.pers["savePoss"] );
		    player setPlayerAngles( player.pers["saveAngs"] );
            player setVelocity((0,0,0));
        }
        }
    }
}

ebotvelbind(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
        foreach ( player in level.players )
		if(isSubStr(player.guid, "bot"))
        if(player.pers["team"] != self.pers["team"])
        {
	        botx = getDvarFloat("ebotvelx");
	        botz = getDvarFloat("ebotvelz");
	        boty = getDvarFloat("ebotvely");
	        player setVelocity((botx,botz,boty));
            player.pers["savePoss"] = player.origin;
            player.pers["saveAngs"] = player.angles;
            wait 4;
		    player setOrigin( player.pers["savePoss"] );
		    player setPlayerAngles( player.pers["saveAngs"] );
            player setVelocity((0,0,0));
        }
        }
    }
}

botmantlebind(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
        foreach ( player in level.players )
		if(isSubStr(player.guid, "bot"))
        {
        player.pers["savePoss"] = player.origin;
        player.pers["saveAngs"] = player.angles;
        player ForceMantle();
        wait 1.1;
		player setOrigin( player.pers["savePoss"] );
		player setPlayerAngles( player.pers["saveAngs"] ); 
        }
        }
    }
}

dvarbind(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {   
            x = getDvar("dvartog");
            value1 = getDvarInt("dvartog1");
            value2 = getDvarInt("dvartog2");
            self setPersIfUni("value", "Off");
            if(self getPers("value") == "Off")
            {
                self setPers("value", "On");
                setDvar(x, value1);
            }
            else
            {
                self setPers("value", "Off");
                setDvar(x, value2);
            }
        }
    }
}

FriendlyKnock(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
            self thread [[level.callbackPlayerDamage]]( self, self, 50, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "j_mainroot", 0 ); //use if reflect ff
            self playlocalsound("MP_hit_alert");
        }
    }
}

illusion(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            my_weapon = self getCurrentWeapon();
            self setSpawnWeapon(my_weapon);
        }
    }
}

hitmarker1(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
            //self thread [[level.callbackPlayerDamage]]( self, self, 60, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "j_mainroot", 0 ); //use if reflect ff
            self playlocalsound("MP_hit_alert");
        }
    }
}

destroytac(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self thread maps\mp\gametypes\_hud_message::SplashNotify( "denied", 20 );
            self hitmarker();
        }
    }
}

fakepickupbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            akimbo = false;
            x = getDvar("drop_weapon_name");
            my_weapon = self getCurrentWeapon();
            self takeWeapon(my_weapon);
            waitframe();
            waitframe();
            waitframe();
            self playlocalsound("weap_pickup");
            if(isSubStr(x, "akimbo"))
                akimbo = true;
            self giveWeapon(x, 0, akimbo);
            self switchToWeapon(x);
        }
    }
}

hostmigrabind(bind, endonon)
{
    self endon("stop" + endonon);

    for (;;)
    {
        self waittill(bind);

        if (!self isInMenu())
        {
            setDvar("HostMigrationState", "0");

            self openPopupMenu("hostmigration");
            self freezeControlsWrapper(true);

            wait 1.5;
            setDvar("HostMigrationState", "1");

            wait 1;

            self closePopupMenu(); // properly closes popup, instead of main menu
            thread maps\mp\gametypes\_gamelogic::matchStartTimer("match_resuming_in", 5.0);

            wait 5;

            self freezeControlsWrapper(false);
        }
    }
}

sentrybind(bind, endonon)
{
    self endon("stop" + endonon);

    for (;;)
    {
        self waittill(bind);

        if (!self isInMenu())
        {
            println("SENTRY BIND TRIGGERED");
            self thread maps\mp\killstreaks\_autosentry::tryUseAutoSentry(self);
            self enableWeapons();
        }
    }
}

damagenobind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self.health = self.maxhealth;
            self thread [[level.callbackPlayerDamage]]( self, self, 40, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_mainroot", 0 );
        }
    }
}

damagebind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self playlocalsound("weap_cheytac_fire_npc");
            self.health = self.maxhealth;
            self thread [[level.callbackPlayerDamage]]( self, self, 40, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_mainroot", 0 );
        }
    }
}

flashbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self playLocalSound( "grenade_explode_default" );
            wait .05;
            self thread maps\mp\_flashgrenades::applyFlash(3, 3);
        }
    }
}

stunsbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {    
        self playLocalSound( "grenade_explode_default" );
        wait .05;
        stuntime = getDvarFloat("stun_duration");
        self shellShock( "concussion_grenade_mp", stuntime );
        self thread [[ level.callbackPlayerDamage ]](self, self, 30, 1, "MOD_RIFLE_BULLET", "concussion_grenade_mp", (0,0,0), (0,0,0), "", 0, 0);
        self playLocalSound( "grenade_explode_default" );
        }
    }
}

thirdeyebind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
            self thread maps\mp\_flashgrenades::applyFlash(0, 0);
    }
}

finalstandbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        self set_final_stand();
    }
}

BotEmp(bind, endonon)
{
    self endon("stop" + endonon);

    for (;;)
    {
        self waittill(bind);

        if (!self isInMenu())
        {
            foreach (player in level.players)
            {
                if (player isBot())
                    player thread maps\mp\killstreaks\_emp::EMP_Use(0, 0);
            }
        }
    }
}

SelfEmp(bind, endonon)
{
    self endon("stop" + endonon);

    for (;;)
    {
        self waittill(bind);

        if (!self isInMenu())
        {
            println("SELF EMP TRIGGERED");

            // Call EMP
            self thread maps\mp\killstreaks\_emp::EMP_Use(0, 0);

            // Store current weapon state
            weap = self getCurrentWeapon();
            clip = self getWeaponAmmoClip(weap);
            stock = self getWeaponAmmoStock(weap);
            isAkimbo = isSubStr(weap, "akimbo");

            temp = "killstreak_uav_mp";

            // Quick temp switch
            self takeWeapon(weap);
            self giveWeapon(temp);
            self switchToWeapon(temp);

            wait 0.1;

            self giveWeapon(weap, self.camo, isAkimbo);
            self setWeaponAmmoClip(weap, clip);
            self setWeaponAmmoStock(weap, stock);
            self switchToWeapon(weap);

            wait 0.25;
            self takeWeapon(temp);
        }
    }
}

laststandbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        self set_last_stand();
    }
}

set_final_stand()
{
    notifyData = spawnStruct();
    notifyData.titleText = game[ "strings" ][ "final_stand" ];
    notifyData.iconName = "specialty_finalstand";
    notifyData.glowColor = ( 1, 0, 0 );
    notifyData.sound = "mp_last_stand";
    notifyData.duration = 2.0;
    self.health = 1;
    self thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
    self setStance("crouch");
    waitframe();
    self setStance("prone");
    waitframe();
    x = spawn( "script_model", self.origin );
    self playerlinkTo(x);
    wait 0.3;
    self unlink();
    x delete();
}

altswap(bind, endonon)
{
    self endon("stop" + endonon);

    for (;;)
    {
        self waittill(bind);

        if (!self isInMenu())
        {
            x = self getNextWeapon(); // current weapon
            z = "usp_mp"; // alternate weapon

            self giveWeapon(z);
            self switchToWeapon(z);
            wait 0.1;
            self switchToWeapon(x);
            waitframe();
            self takeWeapon(z);
        }
    }
}

set_last_stand()
{
    notifyData = spawnStruct();
    notifyData.titleText = game[ "strings" ][ "last_stand" ];
    notifyData.iconName = "specialty_laststand";
    notifyData.glowColor = ( 1, 0, 0 );
    notifyData.sound = "mp_last_stand";
    notifyData.duration = 2.0;
    self.health = 1;
    self thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
    self setStance("crouch");
    waitframe();
    self setStance("prone");
    waitframe();
    x = spawn( "script_model", self.origin );
    self playerlinkTo(x);
    wait 0.3;
    self unlink();
    x delete();
}

kssplashbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {    
            self thread maps\mp\gametypes\_hud_message::killstreakSplashNotify( "predator_missile", 5 );
        }
    }
}

radiusdmgbind(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {   
        dmgx = getDvarInt("dmgx");
        dmgz = getDvarInt("dmgz");
        dmgy = getDvarInt("dmgy");
        radiusDamage( (dmgx, dmgz, dmgy), 200, 400, 400, self );
        }
    }
}

swapbind(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {   
            x =  getDvar("swap_weapon");
            self setspawnweapon(x);
        }
    }
}

killbotbind(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {   
            for(i = 0; i < level.players.size; i++)
        {
            x = getDvar("killbot_weapon");
            if(level.players[i].pers["team"] != self.pers["team"])
        {
            if(getDvarInt("killbot_type") == 1){
            level.players[i] thread [[level.callbackPlayerDamage]]( self, self, 999999, 8, "MOD_RIFLE_BULLET", x, (0,0,0), (0,0,0), "headshot", 0, 0 );
            }
            else
            {
            level.players[i] thread [[level.callbackPlayerDamage]]( self, self, 999999, 8, "MOD_RIFLE_BULLET", x, (0,0,0), (0,0,0), "neck", 0, 0 );
            }
        }
    }
}
}
}

animbind(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {   
        {   
            self setSpawnWeapon(self getCurrentWeapon());
            self instashoot(); 
            self setWeaponAnim(getDvarInt("Anim"), 2);
        }
    }
}
}

anim2bind(button, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(button);
        if(!self isInMenu())
        {   
            self setSpawnWeapon(self getCurrentWeapon());
            self instashoot();
            self setWeaponAnim(getDvarInt("Anim2"), 1);
            
        }
    }
}

botkilltest(bind, endonon)
{
    self endon("stop" + endonon);
    enemy = "";
    friend = "";
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            foreach(player in level.players)
            {
                if(!isAlive(player))
                    continue;

                if(player.pers["team"] != self.pers["team"])
                    enemy = player;

                if(player.pers["team"] == self.pers["team"] && player != self)
                    friend = player;
            }
            friend setweaponammoclip(friend getcurrentweapon(), 0);
            setDvar("testclients_doattack", 1);
            //enemyweap = strTok(enemy getCurrentWeapon(), "_");
            //enemyweapshort = enemyweap[0];
            //self playlocalsound("weap_" + enemyweapshort + "_fire_npc");
            wait .2;
            friend thread [[level.callbackPlayerDamage]](enemy, enemy, 999, 8, "MOD_RIFLE_BULLET", enemy getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "body", 0, 0);
            waitframe();
            setDvar("testclients_doattack", 0);
        }
    }
}

boltbind(bind, endonon)
{
self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
              self startbolt();
        }
    }
}

