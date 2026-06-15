#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\perks\_perkfunctions;

#include azza\_util;
#include azza\menu\_utils;
#include azza\menu\_logic;
#include azza\menu\_structure;



functions_calls()
{
    setdvarifuninitialized("dvartog1", 0);
    setdvarifuninitialized("dvartog2", 0);
    setdvarifuninitialized("dvartog", "None");
    setdvarifuninitialized("dvar2tog1", 0);
    setdvarifuninitialized("dvar2tog2", 0);
    setdvarifuninitialized("dvar2tog", "None");
    setdvarifuninitialized("scr_oma_usetime", "3");
	
	level.sdXpList = strTok("50,69,420,666,777,999,AD,OMEN", ",");
    setdvarifuni("def_sprintintime", 0.3)
   
    setdvarifuni("bot_player", "default");
	//self thread printCoordsOnDeath();
    self setPersIfUni("classchangeadelia", "Off");
    self setPersIfUni("classinfsprint", "Off");
    self setPersIfUni("classmelee", "Off");
    self setPersIfUni("classlunge", "Off");
    self setPersIfUni("classdrop", "Off");
    self setPersIfUni("classcanswap", "Off");
    self setPersIfUni("bullets", "On");
    self setPersIfUni("maxammo", "On");
    self setPersIfUni("goodnade", "Off");
    self setPersIfUni("grabInfos", "None");
	thread autoProneLoop();
	thread monitorReloadRefillLoop();
	self thread monitorKillDistance();
	self thread monitorWeaponSwap();
	self thread canswaps();
	thread midairprone();
	
	setDvarIfUninitialized( "scr_autoPlantBomb", "Off" );
	setDvarIfUninitialized("function_killdistance", 1);
	setDvarIfUninitialized("function_canswapweap", "None");
	setdvarifuni("function_sethpoint", 1);
    setdvarifuni("function_spawnsethpoint", 1);
    setdvarifuni("function_loadsethspawn",1);
	
	setDvarIfUninitialized("function_deathbarrier_mode", "On");
	setDvarIfUninitialized("omen_rpg_push", "0");
	setdvarifuni("function_pronespins", "Off");
	setdvarifuni("function_midprone","Off");
	setDvarIfUninitialized("show_bomb_icons",0);
	setDvarIfUninitialized("function_selfuav", 1);
	
	
	thread watchRPGPushback();
	
	level.bounces = [];
	level.bounce_index = 0;
	
	setDvarIfUninitialized("toggle_saved_ammo", "Off");
	level thread AttachBotWeapon();
	thread refillAmmo();
	self thread monitor_reload();
	
	self setPersIfUni("smartbots", "Off");
	self setPersIfUni("botsLook", "Off");
	setDvarIfUninitialized("ui_botsMove",   "Off");
	setDvarIfUninitialized("ui_botsAttack", "Off");
	self thread monitorDeathBarrier();
	setDvarIfUninitialized("function_camoindex", "2");
	self.camo = getDvarInt("function_camoindex");
	thread loopcamoindex();


    self setPersIfUni("killcamtimer", "On");
    self setPersIfUni("god", "Off");
    self setPersIfUni("crouch", "Off");
    self setPersIfUni("omanac", "Off");
    self setPersIfUni("omasprint", "Off");
    self setPersIfUni("omasprintsecond", "Off");
    self setPersIfUni("doubleoma", "Off");
    self setPersIfUni("alwayscanswap", "Off");
    self setPersIfUni("change_map", "mp_afghan");
    self setPersIfUni("deathbarriers", "On");
    self setPersIfUni("greenscreen", "On");
    self setPersIfUni("bluescreen", "Off");
    self setPersIfUni("redscreen", "Off");
    self setPersIfUni("blackscreen", "Off");
    self setPersIfUni("knifelunges", "Off");
    self setPersIfUni("elevators", "On");
    self setPersIfUni("bounces", "On");
    self setPersIfUni("instaswaps", "Off");
    self setPersIfUni("instashoots", "Off");
    self setPersIfUni("function_infammo", "Off");
    self setPersIfUni("cp_location", (0,0,0));
    self setPersIfUni("cponpos", "Off");
    self setPersIfUni("timerthing", "On");
	self setPersIfUni("timerthing_enabled", "On");
    self setPersIfUni("noclip", "On");
    self setPersIfUni("unlimitedeq", "Off");
    self setPersIfUni("fixADS", "Off");

    setdvarifuni("instashoots_weapon", "All Weapons");
	setdvarifuni("function_botAmmo", "Off");
    setdvarifuni("player_health", 100);
    setdvarifuni("roundswon", 0);
    setdvarifuni("roundslost", 0);
    setdvarifuni("killcam_softland","Off");
    setdvarifuni("function_precamsoft","Off");
    setdvarifuni("function_killcamlag","Off");
	setdvarifuni("function_aprone", "Off");
	setdvarifuni("function_reloadrefill", "On");
    setdvarifuni("velx", 0);
    setdvarifuni("velz", 0);
    setdvarifuni("vely", 0);
    setdvarifuni("scr_killcam_time", 4);
    setdvarifuni("function_savepoint", 1);
    setdvarifuni("function_spawnsavepoint", 1);
    setdvarifuni("function_loadonspawn",1);
    setdvarifuni("nacmod1","none");
    setdvarifuni("nacmod2","none");
	setdvarifuni("bouncex",0);
    setdvarifuni("bouncez",0);
    setdvarifuni("bouncey",9999999);
    setdvarifuni("cpposx",0);
    setdvarifuni("cpposy",0);
    setdvarifuni("cpposy",0);
    setdvarifuni("ebotvelx", 0);
    setdvarifuni("ebotvelz", 0);
    setdvarifuni("ebotvely", 0);
    setdvarifuni("fbotvelx", 0);
    setdvarifuni("fbotvelz", 0);
    setdvarifuni("fbotvely", 0);
	
	setdvarifuni("function_moveablebots", 0);
	
    setdvarifuni("primary_weapon","none");
    setdvarifuni("primary_clip","none");
    setdvarifuni("primary_stock","none");
    setdvarifuni("secondary_weapon","none");
    setdvarifuni("secondary_clip","none");
    setdvarifuni("secondary_stock","none");
    setdvarifuni("drop_weapon_name","none");
    setdvarifuni("drop_weapon_clip","none");
    setdvarifuni("drop_weapon_stock","none");
    setDvarIfUninitialized("function_carepackphysic", "On");
    setdvarifuni("function_deathbarriersoff", 0);
    setdvarifuni("killbot_weapon","none");
    setdvarifuni("swap_weapon","none");
    

    self.maxhealth = getDvarInt("player_health");

	if (!isDefined(getDvar("match_mode")))
	{
	setDvar("match_mode", "1"); // default to Public
	
	}
     if(getDvar("function_killcamlag") == "On")
    {
    level waittill("killcam_ended");
    setDvar("sv_padpackets", 0);
    }
    
	 if (self.pers["smartbots"] == "On")
    {
        setDvar("function_moveablebots", 1);
        setDvar("testclients_domove",    1);
        setDvar("testclients_doattack",  1);
        self thread dosmarts();
    }

	
	if (!isDefined(self getPers("canswap_label")))
	self setPers("canswap_label", "Off");
	
	 if (!isDefined(self.pers["function_aprone"]))
    self.pers["function_aprone"] = "Off";

	 if (self.pers["function_aprone"] == "On")
    self thread autoProneLoop();
	
     if(self getPers("killcamtimer") == "Off")
        self.kc_timer.alpha = 0;

     if(self getPers("function_infammo") == "On")
    self thread infiniteammo();

     if(self getPers("instaswaps") == "On")
    self thread monitorInstaswap();
	
	 if (!isDefined(game["bounces"]))
      game["bounces"] = [];

	if (!isDefined(self getPers("rpg_push")))
    self setPers("rpg_push", "Off");

     if (!isDefined(game["bounce_index"]))
      game["bounce_index"] = 0;
	
		if (!isDefined(self.pers["function_reloadrefill"]))
	self.pers["function_reloadrefill"] = "On";
	
     if(self getPers("instashoots") == "On")
    self thread instashoots();
    
     if(self getPers("elevators") == "On")
    setDvar("bg_elevators", 2);

     if(self getPers("bounces") == "On")
    setDvar("bg_bounces", 2);

     if(self getPers("knifelunges") == "On")
    setDvar("perk_extendedmeleerange", 9999);

     if(self getPers("alwayscanswap") == "On")
    self thread alwayscanswapmonitor();

	self _setperk("specialty_bulletaccuracy");
	self _setperk("specialty_extendedmelee");
	self _setperk("specialty_fallheight");
	
	setDvar("bg_bounces", 2);
	setDvar("bg_bounceAllAngles", 2);
	setDvar("bg_bouncesAllAngles", 2);
	//setDvar("scr_player_maxhealth", "30");
	setDvar("bg_playerCollision", 0);
	setDvar("bg_playerEjection", 0);
	setDvar("bg_fallDamageMaxHeight", 9999);
	setDvar("bg_fallDamageMinHeight", 9999);
	
	self thread monitor_bounce();
    self thread loadposspawn();
    self thread loadLocationBot();
    self thread drop_weapon();
    self thread dobarrier();
    self thread timercheck();
    self thread bolt_calls();
    self thread noclipbind();
    self thread bots_title_emble();

	level thread AttachBotRefills();


}


dvartog(w)
{
    setDvar("dvartog", w);
}

/* miscel */


radiusdmglocation()
{
    setDvar("dmgx",self.origin[0]);
    setDvar("dmgz",self.origin[1]);
    setDvar("dmgy",self.origin[2]);
    self iPrintLn("Radius Damage Location ^2:"+ self.origin);
}

swap_weapon()
{
    if(getDvar("swap_weapon") == "none")
    setDvar("swap_weapon",self getCurrentWeapon());
    else
    setDvar("swap_weapon", "none");
}

killbot_weapon()
{
    if(getDvar("killbot_weapon") == "none")
    setDvar("killbot_weapon",self getCurrentWeapon());
    else
    setDvar("killbot_weapon", "none");
}

setammo()
{
    setDvar("primary_weapon", self getCurrentWeapon());
    setDvar("primary_clip", self getWeaponAmmoClip(getDvar("primary_weapon")));
    setDvar("primary_stock", self getWeaponAmmoStock(getDvar("primary_weapon")));
    setDvar("secondary_weapon", self getNextWeapon());
    setDvar("secondary_clip", self getWeaponAmmoClip(getDvar("secondary_weapon")));
    setDvar("secondary_stock", self getWeaponAmmoStock(getDvar("secondary_weapon")));
}
setsavedammo()
{
    self setWeaponAmmoClip(getDvar("primary_weapon"),getDvarInt("primary_clip"));
    self setWeaponAmmoStock(getDvar("primary_weapon"),getDvarInt("primary_stock"));
    self setWeaponAmmoClip(getDvar("secondary_weapon"),getDvarInt("secondary_clip"));
    self setWeaponAmmoStock(getDvar("secondary_weapon"),getDvarInt("secondary_stock"));
}

changeMap(map)
{
    map(map);
}

PrecamSoftTog()
{
    if(getDvar("function_precamsoft") == "Off")
    {
        setDvar("function_precamsoft", "On");
        setDvar( "bg_falldamagemaxheight", "1" );
		setDvar( "bg_falldamageminheight", "1" );
		setDvar( "snd_enable3d", "0" );

    }
    else
    {
        setDvar("function_precamsoft", "Off");
        setDvar("bg_fallDamageMaxHeight", 300);
        setDvar("bg_fallDamageMinHeight", 128);
        setDvar( "snd_enable3d", "1" );
    }
}

KillcamSoftTog()
{
    if(getDvar("killcam_softland") == "Off")
    {
        setDvar("killcam_softland", "On");
    }
    else
    {
        setDvar("killcam_softland", "Off");
    }
}

KillcamLagTog()
{
    if(getDvar("function_killcamlag") == "Off")
    {
        setDvar("function_killcamlag", "On");
    }
    else
    {
        setDvar("function_killcamlag", "Off");
    }
}

killcamTimer()
{
    if(self getPers("killcamtimer") == "Off")
        self setPers("killcamtimer", "On");
    else 
        self setPers("killcamtimer", "Off");
}

nacmod1()
{
    if(getDvar("nacmod1") == "none")
    setDvar("nacmod1",self getCurrentWeapon());
    else
    setDvar("nacmod1", "none");
}

nacmod2()
{
    if(getDvar("nacmod2") == "none")
    setDvar("nacmod2",self getCurrentWeapon());
    else
    setDvar("nacmod2", "none");
}

resetvel()
{
    setdvar("velx",0);
    setdvar("vely",0);
    setdvar("velz",0);
}

resetvel2()
{
    setdvar("velx2",0);
    setdvar("vely2",0);
    setdvar("velz2",0);
}

savepos()
{
    x = getDvarInt("function_savepoint");
    setDvar("function_savex" + x,self.origin[0]);
    setDvar("function_savez" + x,self.origin[1]);
    setDvar("function_savey" + x,self.origin[2]);
    setDvar("function_savea" + x,self.angles[1]);
    setDvar("function_savemap" + x,getDvar("mapname"));
    self iPrintLnBold("^7Location: [^5Saved^7]");
}

loadpos()
{
    x = getDvarInt("function_savepoint");
    if(getDvar("function_savemap" + x) == getDvar("mapname"))
    if(getDvar("function_savex"+ x != ""))
    {
        self setOrigin((getDvarFloat("function_savex"+ x),getDvarFloat("function_savez"+ x),getDvarFloat("function_savey"+ x)));
        self setPlayerAngles((0,getDvarFloat("function_savea"+ x),0));
    }

}

loadposspawn()
{
    if(self isHost())
    {
        x = getDvarInt("function_savepoint");
        z = getDvarInt("function_spawnsavepoint");
        setDvar("function_savepoint",z);
        self loadpos();
        setDvar("function_savepoint",x);
    }
}

suicideTU6()
{
    self suicide();
}


illusionfun()
{

my_weapon = self getCurrentWeapon();
self setSpawnWeapon(my_weapon);

}

getnextweapon()
{
   z = self getWeaponsListPrimaries();
   x = self getCurrentWeapon();
   for(i = 0 ; i < z.size ; i++)
   {
      if(x == z[i])
      {
         if(isDefined(z[i + 1]))
            return z[i + 1];
         else
            return z[0];
      }
   }
}


hitmarker()
{
    self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
    self playlocalsound("MP_hit_alert");
}

bullets()
{
    if(self getPers("bullets") == "Off")
    {
        self setPers("bullets", "On");
        setDvar("fx_marks", 1);
    }
    else
    {
        self setPers("bullets", "Off");
        setDvar("fx_marks", 0);
    }
}


playerhealth()
{
    x = getDvarInt("player_health");
    if(x == 100)
    {
        setDvar("player_health",250);
        self.maxhealth = 250;
    }
    else if(x == 250)
    {
        setDvar("player_health",500);
        self.maxhealth = 500;
    }
    else if(x == 500)
    {
        setDvar("player_health",750);
        self.maxhealth = 750;
    }
    else if(x == 750)
    {
        setDvar("player_health",9999);
        self.maxhealth = 9999;
    }
	
	    else if(x == 9999)
    {
        setDvar("player_health",30);
        self.maxhealth = 30;
    }
	
    else if(x == 30)
    {
        setDvar("player_health",100);
        self.maxhealth = 100;
    }
}

knifelunges()
{
    if(self getPers("knifelunges") == "Off")
    {
        self setPers("knifelunges", "On");
        setDvar("perk_extendedmeleerange", 9999);
    }
    else{ 
        self setPers("knifelunges", "Off");
        setDvar("perk_extendedmeleerange", 128);
}
}

depatch_elev()
{
    if(self getPers("elevators") == "Off")
    {
        self setPers("elevators", "On");
        setDvar("bg_elevators", 2);
    }
    else{ 
        self setPers("elevators", "Off");
        setDvar("bg_elevators", 0);
}
}


depatch()
{
    if(self getPers("bounces") == "Off")
    {
        self setPers("bounces", "On");
        setDvar("bg_bounces", 2);
    }
    else{ 
        self setPers("bounces", "Off");
        setDvar("bg_bounces", 0);
}
}

kickPlayer(player)
{
    kick(player GetEntityNumber());
}

teleportplayer(player)
{
    player setOrigin(gettrace());
}

giveUnlocks(player)
{
    player setPlayerData("experience", 2516000);
    player endon( "disconnect" ) ;
    player endon( "death" ) ; 
    player setPlayerData( "iconUnlocked", "cardicon_prestige10_02", 1) ;
    chalProgress = 0;
    useBar = createPrimaryProgressBar( 25 );
    useBarText = createPrimaryProgressBarText( 25 );
    foreach ( challengeRef, challengeData in level.challengeInfo )
    {
        finalTarget = 0;
        finalTier = 0;
        for ( tierId = 1; isDefined( challengeData["targetval"][tierId] ); tierId++ )
        {
            finalTarget = challengeData["targetval"][tierId];
            finalTier = tierId + 1;
        }
        if ( player isItemUnlocked( challengeRef ) )
        {
            player setPlayerData( "challengeProgress", challengeRef, finalTarget );
            player setPlayerData( "challengeState", challengeRef, finalTier );
        }
            chalProgress++;
            chalPercent = ceil( ((chalProgress/480)*100) );
            useBarText setText( chalPercent + " percent done" );
            useBar updateBar( chalPercent / 100 );
            wait ( 0.04 );
    }
    useBar destroyElem();
    useBarText destroyElem();
}

sndroundreset(){ 

    x = getDvarInt("roundswon");
    y = getDvarInt("roundslost");
	wait 1.1;
    self thread precamsoftcheck();
	level.resetscores = true;
	allies = 0;
	game["roundsWon"]["axis"] = y;
	game["roundsWon"]["allies"] = x;
	game["roundsPlayed"] = (x+y);
	game["teamScores"]["allies"] = y;
	game["teamScores"]["axis"] = x;	
	maps\mp\gametypes\_gamescore::updateTeamScore( "axis" );
	maps\mp\gametypes\_gamescore::updateTeamScore( "allies" );
	setDvar("sv_padpackets", 0);
    wait 1;
    level waittill("round_end_finished");
    x = getDvar("function_killcamlag");
    if (x == "On")
    {
	    setDvar("sv_padpackets", 6000);
    }
    else if (x == "Off")
    {
        setDvar("sv_padpackets", 0);
    }
    y = getDvar("killcam_softland");
    if (y == "On")
    {
        wait .1;
	    setDvar( "bg_falldamagemaxheight", "1" );
		setDvar( "bg_falldamageminheight", "1" );
    }
    else 
    {
	    setDvar( "bg_falldamagemaxheight", "300" );
		setDvar( "bg_falldamageminheight", "128" );
    }

}

precamsoftcheck()
{
    x = getDvar("function_precamsoft");
    wait .1;
    if(x == "On")
    {
        setDvar( "bg_falldamagemaxheight", "1" );
		setDvar( "bg_falldamageminheight", "1" );
		setDvar( "snd_enable3d", "0" );
    }
     if(x == "Off")
    {
        setDvar("bg_fallDamageMaxHeight", 300);
        setDvar("bg_fallDamageMinHeight", 128);
        setDvar( "snd_enable3d", "1" );
    }

}

sndroundreset2(){ 

    x = getDvarInt("roundswon");
    y = getDvarInt("roundslost");
	wait .1;
	level.resetscores = true;
	allies = 0;
	game["roundsWon"]["axis"] = y;
	game["roundsWon"]["allies"] = x;
	game["roundsPlayed"] = (x+y);
	game["teamScores"]["allies"] = y;
	game["teamScores"]["axis"] = x;	
	maps\mp\gametypes\_gamescore::updateTeamScore( "axis" );
	maps\mp\gametypes\_gamescore::updateTeamScore( "allies" );
    self iPrintLnBold("Rounds will reset after every rounds to the correct score");
}

onclasschange()
{
    if(self getPers("classchangeadelia") == "On" && isDefined(self getPers("classchangeadelia")))
	{
		waitframe();
        self setWeaponAnim(24);
        waitframe();
        self setWeaponAnim(1);
    }
    else if(self getPers("classinfsprint") == "On" && isDefined(self getPers("classinfsprint")))
	self setWeaponAnim(24, 2);
    else if(self getPers("classmelee") == "On" && isDefined(self getPers("classmelee")))
	self setWeaponAnim(8, 2);
    else if(self getPers("classlunge") == "On" && isDefined(self getPers("classlunge")))
	self setWeaponAnim(9, 2);
    else if(self getPers("classdrop") == "On" && isDefined(self getPers("classdrop")))
	self setWeaponAnim(10, 2);
    else if(self getPers("classcanswap") == "On" && isDefined(self getPers("classcanswap")))
	self setWeaponAnim(12, 2);
    if(getPers("maxammo") == "On" && isDefined(self getPers("maxammo")))
	self thread maxammo();
}

classcanswap()
{
    if(self getPers("classcanswap") == "Off")
        self setPers("classcanswap", "On");
    else 
        self setPers("classcanswap", "Off");
}



classdrop()
{
    if(self getPers("classdrop") == "Off")
        self setPers("classdrop", "On");
    else 
        self setPers("classdrop", "Off");
}

classlunge()
{
    if(self getPers("classlunge") == "Off")
        self setPers("classlunge", "On");
    else 
        self setPers("classlunge", "Off");
}

classmelee()
{
    if(self getPers("classmelee") == "Off")
        self setPers("classmelee", "On");
    else 
        self setPers("classmelee", "Off");
}

classinfsprint()
{
    if(self getPers("classinfsprint") == "Off")
        self setPers("classinfsprint", "On");
    else 
        self setPers("classinfsprint", "Off");
}

classChangeAdelia()
{
    if(self getPers("classchangeadelia") == "Off")
        self setPers("classchangeadelia", "On");
    else 
        self setPers("classchangeadelia", "Off");
}

set_infiniteammo()
{
    if(self getPers("function_infammo") == "Off")
    {
        self setPers("function_infammo", "On");
    }
    else if(self getPers("function_infammo") == "On")
    {
        self setPers("function_infammo", "Off");
    }
    if(self.pers["function_infammo"] != false)
        self thread infiniteammo();
}

infiniteammo()
{
    self endon("death");
    self endon("disconnect");
    level endon("game_ended");
    
    self endon("end_infiniteammo");

    for(;;)
    {
        self maps\mp\perks\_perks::givePerk(maps\mp\gametypes\_class::cac_getPerk(self.class_num, 0));
        waitframe();
        self waittill_any("reload", "grenade_fire");
    }
}

maxammotog()
{
        if(self getPers("maxammo") == "Off")
        self setPers("maxammo", "On");
    else 
        self setPers("maxammo", "Off");
}

maxammo()
{
    nextweapon = self getNextWeapon(); 
    currentWeapon = self getCurrentWeapon();
	if ( currentWeapon != "none" )
	{
		self GiveMaxAmmo( currentWeapon );
        self GiveMaxAmmo( nextweapon ); 
		self _setperk("specialty_bulletaccuracy");
	}

}

giveStreak(s)
{
    self maps\mp\killstreaks\_killstreaks::giveKillstreak(s);
}

removeKS()
{
	self maps\mp\killstreaks\_killstreaks::giveKillstreak( "none", true);
	wait 1;
	foreach ( index, streakStruct in self.pers["killstreaks"] )
		self.pers["killstreaks"][index] = undefined;
}

delete_carepack()
{
        level.airDropCrates = getEntArray( "care_package", "targetname" );
        level.oldAirDropCrates = getEntArray( "airdrop_crate", "targetname" );
        
        if ( level.airDropCrates.size )
        {
            foreach ( crate in level.AirDropCrates )
            {
                _objective_delete( crate.objIdFriendly );
                _objective_delete( crate.objIdEnemy );
                crate delete();
            }
        }
}

spawncarepackagecross()
{
    carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate( self gettrace(), "airdrop", self gettrace(), true, undefined, self gettrace());
    self notify("drop_crate");
}


spawncarepackageself()
{
    carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate( self.origin + (0,0,-20), "airdrop", self.origin + (0,0,-20), true, undefined, self.origin + (0,0,-20));
    self notify("drop_crate");
}

setcppos()
{
    setDvar("cpposx",self.origin[0]);
    setDvar("cpposy",self.origin[1]);
    setDvar("cpposz",self.origin[2]);
    self iPrintLn("Carepackage Position ^:"+ self.origin);
}

cponpos()
{
    if(self getPers("cponpos") == "Off")
    {
        self setPers("cponpos", "On");
        carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate( self.pers["cp_location"] + (0,0,40), "airdrop", self.pers["cp_location"] + (0,0,40), true, undefined, self.pers["cp_location"] + (0,0,40));
        self notify("drop_crate");
        self iPrintLnBold("CP will respawn when you load location");
    }
    else
    {
        self setPers("cponpos", "Off");
        self thread delete_carepack();
    }
}


cp_location()
{
    self.pers["cp_location"] = self getOrigin();
    self iPrintLnBold("CP Location Saved: ^2" + self.origin);
}

timercheck()
{
    if(self getPers("timerthing") == "On")
    {
    setDvar("scr_sd_timelimit", 2.5);
    }
    else{
        setDvar("scr_sd_timelimit", "");
    }
    if(self getPers("cponpos") == "On")
    {
        carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate( self.pers["cp_location"] + (0,0,40), "airdrop", self.pers["cp_location"] + (0,0,40), true, undefined, self.pers["cp_location"] + (0,0,40));
        self notify("drop_crate");
    }
}

timerToggle()
{
    if(self getPers("timerthing") == "Off")
    {
        self setPers("timerthing", "On");
        setDvar("scr_sd_timelimit", 2.5);
    }
    else
    {
        self setPers("timerthing", "Off");
        setDvar("scr_sd_timelimit", "");
    }
}

change_cratedvar(w)
{
    setDvar("crate_type", w);
}


gettrace()
{
    x = bullettrace(self gettagorigin("j_head"), self gettagorigin("j_head") + anglesToForward(self getplayerangles()) * 1000000, 0, self)["position"];
    return x;
}

camo_editor_primary(camo)
{

    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
  	self setPlayerData( "customClasses", class_num, "weaponSetups", 0, "camo", camo ); //Primary Camo
    self reset_class();
    self azza\menu\_utils::loadMenu("Class Settings");
    
}

camo_editor_secondary(camo)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
  	self setPlayerData( "customClasses", class_num, "weaponSetups", 1, "camo", camo); //Secondary Camo
    self reset_class();
    self azza\menu\_utils::loadMenu("Class Settings");
    
}

equipment_editor(equipment_name, weapon, slot)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    self setPlayerData("customClasses", class_num, "perks", 0, equipment_name);
    self reset_class();
    self azza\menu\_utils::loadMenu("Class Settings");
}

special_grenade_editor(equipment_name)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    self setPlayerData("customClasses", class_num, "specialGrenade", equipment_name);
    self reset_class();
    self azza\menu\_utils::loadMenu("Class Settings");
}

perk_editor(slot, perk_name)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    self setPlayerData("customClasses", class_num, "perks", slot, perk_name);
    self reset_class();
    self azza\menu\_utils::loadMenu("Class Settings");
}


reset_class()
{
    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"], self.pers["class"]);
  
}

attachment_editor_two(attachment, slot)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    switch(slot)
    {
        case 0:
            self setPlayerData("customClasses", class_num, "weaponSetups", 0, "attachment", 1, attachment);
            break;
        case 1:
            self setPlayerData("customClasses", class_num, "weaponSetups", 1, "attachment", 1, attachment);
            break;
        default:
            self iPrintlnBold("^4Class Editor Error");
            break;
        
    }
    self reset_class();
    self azza\menu\_utils::loadMenu("Class Settings");
}

weapon_editor(weapon, slot)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    switch(slot)
    {
        case 0:
            self setPlayerData("customClasses", class_num, "weaponSetups", 0, "weapon", weapon);
            self azza\menu\_utils::loadMenu("attachment_primary_one");
            break;
        case 1:
            self setPlayerData("customClasses", class_num, "weaponSetups", 1, "weapon", weapon);
            self azza\menu\_utils::loadMenu("attachment_secondary_one");
            break;
        default:
            self iPrintlnBold("^4Class Editor Error");
            break;
    }
    
}

attachment_editor_one(attachment, slot)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    switch(slot)
    {
        case 0:
            self setPlayerData("customClasses", class_num, "weaponSetups", 0, "attachment", 0, attachment);
            self azza\menu\_utils::loadMenu("attachment_primary_two");
            break;
        case 1:
            self setPlayerData("customClasses", class_num, "weaponSetups", 1, "attachment", 0, attachment);
            self azza\menu\_utils::loadMenu("attachment_secondary_two");
            break;
        default:
            self iPrintlnBold("^4Class Editor Error");
            break;
    }
}

doubleOma()
{
    if(self getPers("doubleoma") == "Off")
        self setPers("doubleoma", "On");
    else 
        self setPers("doubleoma", "Off");
}

omaSprintSecond()
{
    if(self getPers("omasprintsecond") == "Off")
        self setPers("omasprintsecond", "On");
    else 
        self setPers("omasprintsecond", "Off");
}

omanac()
{
    if(self getPers("omanac") == "Off")
        self setPers("omanac", "On");
    else 
        self setPers("omanac", "Off");
}

omaSprint()
{
    if(self getPers("omasprint") == "Off")
        self setPers("omasprint", "On");
    else 
        self setPers("omasprint", "Off");
}


dropCanswap()
{
    w = self getCurrentWeapon();
    wait 0.05;
    self giveWeapon("usp_mp");
    self setSpawnWeapon("usp_mp");
    wait 0.05;
    self dropItem(self getCurrentWeapon());
    self setSpawnWeapon(w);
}

dropdagun()
{
	CurrentGun = self getCurrentWeapon();
	self dropItem(CurrentGun);
}

takedagun()
{
    self takeWeapon(self getCurrentWeapon());
}

dropanddelete()
{
    self thread drop_weapon();
    self thread delete_dropped_weapon();
}

drop_weapon()
{
    level.weapon delete();
    level.weapon.placeholder delete();
    weapon = getDvar("drop_weapon_name");
    level.weapon.angles = (0, 0, 90);
    level.weapon.weapon = weapon;
    if(isSubStr(weapon, "akimbo"))
    {
        level.weapon = spawn("weapon_" + weapon, self.pers["drop_weapon_location"]);
		game["dropped_akimbo"] = true;
    }
    else
	{
        level.weapon = spawn("weapon_" + weapon, self.pers["drop_weapon_location"]);
		game["dropped_akimbo"] = true;
    }
    //level.weapon itemWeaponSetAmmo(999, 999);
    level.weapon.placeholder = spawn("script_origin", self getOrigin() + (0,0,20));
    level.weapon.placeholder enableLinkTo();
    level.weapon linkTo(level.weapon.placeholder);
	self monitor_pickup(); /* This Cannot Be Looped */
    return weapon;
}
 
delete_dropped_weapon()
{
    ents = getEntArray();
    for(i = 0; i < ents.size; i++)
        if(isSubStr(ents[i].classname, "weapon") && !isSubStr(ents[i].classname, getDvar("drop_weapon_name")))
            ents[i] delete();
    return;
}
 
drop_weapon_name()
{
    if(getDvar("drop_weapon_name") == "none"){
        weapon = self getCurrentWeapon();
    	setDvar("drop_weapon_name", self getCurrentWeapon());
        setDvar("drop_weapon_clip", self getWeaponAmmoClip(weapon));
        setDvar("drop_weapon_stock", self getWeaponAmmoStock(weapon));
    }

    else{
   		setDvar("drop_weapon_name", "none");
        setDvar("drop_weapon_clip", "none");
        setDvar("drop_weapon_stock", "none");
    }
}

drop_weapon_location()
{
    self.pers["drop_weapon_location"] = self getOrigin() + (0, 0, 20);
    setDvar("weapx",self.origin[0]);
    setDvar("weapy",self.origin[1]);
    setDvar("weapz",self.origin[2]);
    self iPrintLnBold("Drop Location Saved: ^2" + self.origin);
}

monitor_pickup()
{
	ents = getEntArray();
	for(i = 0; i < ents.size; i++)
		if(isSubStr(ents[i].classname, "weapon") && isSubStr(ents[i].classname, getDvar("drop_weapon_name")))
			thread trackPickup( ents[i], i );
}

trackPickup( pickup, id )
{
	groundpoint = getPickupGroundpoint( pickup );
	clip = getDvarInt("drop_weapon_clip");
    stock = getDvarInt("drop_weapon_stock");
	classname = pickup.classname;
	isWeapon = false;

	if ( issubstr( classname, "weapon_" ) )
	{
		isWeapon = true;
		weapname = pickup maps\mp\gametypes\_weapons::getItemWeaponName();
	}
	
	while(true)
	{
		player = undefined;
		
		if ( isWeapon )
		{	
			while(true)
			{
				pickup waittill( "trigger", player, dropped );
				
				if ( !isdefined( pickup ) )
					break;
				
				assert( !isdefined( dropped ) );
			}

			if ( isdefined( dropped ) )
			{
				if(game["dropped_akimbo"])
				{
					waittillframeend;
                    self takeWeapon(getDvar("drop_weapon_name"));
					self giveWeapon(getDvar("drop_weapon_name"), 0, true);
                    self setWeaponAmmoClip(getDvar("drop_weapon_name"),clip);
                    self setWeaponAmmoStock(getDvar("drop_weapon_name"),stock);
					self switchToWeapon(getDvar("drop_weapon_name"));
				}
			}
		}
	}
}

getPickupGroundpoint( pickup )
{
	trace = bullettrace( pickup.origin, pickup.origin + (0,0,-128), false, pickup );
	groundpoint = trace["position"];
	
	finalz = groundpoint[2];
	
	for ( radiusCounter = 1; radiusCounter <= 3; radiusCounter++ )
	{
		radius = radiusCounter / 3.0 * 50;
		
		for ( angleCounter = 0; angleCounter < 10; angleCounter++ )
		{
			angle = angleCounter / 10.0 * 360.0;
			
			pos = pickup.origin + (cos(angle), sin(angle), 0) * radius;
			
			trace = bullettrace( pos, pos + (0,0,-128), false, pickup );
			hitpos = trace["position"];
			
			if ( hitpos[2] > finalz && hitpos[2] < groundpoint[2] + 15 )
				finalz = hitpos[2];
		}
	}
	return (groundpoint[0], groundpoint[1], finalz);
}

greenScreen()
{
    if(self getPers("greenscreen") == "Off")
    {
        self setPers("greenscreen", "On");
        self.blueBG = self createRectangle("white", "CENTER", "CENTER", 0, -180, 2000, 4000, (0, 240, 0), -1, 1 );
        self.blueBG.foreground = false;
    }
    else 
    {
        self setPers("greenscreen", "Off");
        self.blueBG Destroy();
    }
}

blueScreen()
{
    if(self getPers("bluescreen") == "Off")
    {
        self setPers("bluescreen", "On");
        self.blueBG = self createRectangle("white", "CENTER", "CENTER", 0, -180, 2000, 4000, (0, 0, 240), -1, 1 );
        self.blueBG.foreground = false;
    }
    else 
    {
        self setPers("bluescreen", "Off");
        self.blueBG Destroy();
    }
}

redScreen()
{
    if(self getPers("redscreen") == "Off")
    {
        self setPers("redscreen", "On");
        self.blueBG = self createRectangle("white", "CENTER", "CENTER", 0, -180, 2000, 4000, (240, 0, 0), -1, 1 );
        self.blueBG.foreground = false;
    }
    else 
    {
        self setPers("redscreen", "Off");
        self.blueBG Destroy();
    }
}

blackScreen()
{
    if(self getPers("blackscreen") == "Off")
    {
        self setPers("blackscreen", "On");
        self.blueBG = self createRectangle("white", "CENTER", "CENTER", 0, -180, 2000, 4000, (0, 0, 0), -1, 1 );
        self.blueBG.foreground = false;
    }
    else 
    {
        self setPers("blackscreen", "Off");
        self.blueBG Destroy();
    }
}

customLocation(loc)
{
    self setOrigin(loc);
    self thread savepos();
}


giveWeap(w)
{
    weapon = w + "_mp";
    self giveWeapon(weapon, self.camo);
    self switchToWeapon(weapon);
}

refillAmmo()
{
   self giveMaxAmmo(self getCurrentWeapon()); 
}

giveAkimbo()
{
    w = self getCurrentWeapon();
    self takeWeapon(w);
    self giveWeapon(w, 0, true);
    self switchToWeapon(w);
}


godmode()
{
    if(self getPers("god") == "Off")
    {
        self setPers("god", "On");
        exec("god");
    }
    else 
    {
        self setPers("god", "Off");
        exec("god");
    }
}

instaswaps()
{
    if (self getPers("instaswaps") == "Off")
    {
        if (self getPers("instashoots") == "On")
        {
            self iPrintlnBold("[^4Instashoots must be disabled to use Instaswaps^7]");
            return;
        }
        self setPers("instaswaps", "On");
        self thread monitorInstaswap();
    }
    else 
    {
        self setPers("instaswaps", "Off");
        self notify("endInstaswap");
    }
}

monitorInstaswap()
{
    self endon("endInstaswap");
    self endon("death");
    self endon("disconnect");

    for (;;)
    {
        self waittill("grenade_pullback", grenadeName);

        primaryWeapon = self.primaryWeapon;
        secondaryWeapon = self.secondaryWeapon;

        if (self getCurrentWeapon() == primaryWeapon)
        {
            self.primaryClip = self getWeaponAmmoClip(primaryWeapon);
            self.primaryStock = self getWeaponAmmoStock(primaryWeapon);

            isAkimbo = isSubStr(primaryWeapon, "akimbo");

            self takeWeapon(primaryWeapon);
            self switchToWeapon(secondaryWeapon);
            wait 0.05;

            self giveWeapon(primaryWeapon, self.camo, isAkimbo);
            self setWeaponAmmoClip(primaryWeapon, self.primaryClip);
            self setWeaponAmmoStock(primaryWeapon, self.primaryStock);
        }
        else
        {
            self.secondaryClip = self getWeaponAmmoClip(secondaryWeapon);
            self.secondaryStock = self getWeaponAmmoStock(secondaryWeapon);

            isAkimbo = isSubStr(secondaryWeapon, "akimbo");

            self takeWeapon(secondaryWeapon);
            self switchToWeapon(primaryWeapon);
            wait 0.05;

            self giveWeapon(secondaryWeapon, self.camo, isAkimbo);
            self setWeaponAmmoClip(secondaryWeapon, self.secondaryClip);
            self setWeaponAmmoStock(secondaryWeapon, self.secondaryStock);
        }
    }
}


alwayscanswap()
{
    if(self getPers("alwayscanswap") == "On")
    {
        self notify("endalwayscanswap");
        self setPers("alwayscanswap", "Off");
    }
    else 
    {
        self thread alwayscanswapmonitor();
        self setPers("alwayscanswap", "On");
    }
}

alwayscanswapmonitor()
{
    self endon("disconnect");
    self endon("death");
    self endon("endalwayscanswap");

    for (;;)
    {
        self waittill("weapon_change", w);

        // only do canswap on any of these rifles:
		if (!(isSubStr(w,"m21") || isSubStr(w,"m4") || isSubStr(w,"scar") || isSubStr(w,"tavor") || isSubStr(w,"masada") || isSubStr(w,"fn2000") || isSubStr(w,"ak47") || isSubStr(w,"mp5") || isSubStr(w,"vector") || isSubStr(w,"p90") || isSubStr(w,"sa80") || isSubStr(w,"aug") || isSubStr(w,"wa2000") || isSubStr(w,"model1887") || isSubStr(w,"pp2000") || isSubStr(w,"at4"))) continue;

        // stash ammo
        oldClip  = self getWeaponAmmoClip(w);
        oldStock = self getWeaponAmmoStock(w);
        isAkimbo = isSubStr(w, "akimbo");

        // do your canswap
        self takeWeapon(w);
        self giveWeapon(w, self.camo, isAkimbo);
        self switchToWeapon(w);

        // restore ammo
        self setWeaponAmmoClip(w, oldClip);
        self setWeaponAmmoStock(w, oldStock);

        wait 0.05;
    }
}

instashoots_tog()
{
    if(self getPers("instashoots") == "Off")
    {
        if (self getPers("instaswaps") == "On")
        {
            self iPrintlnBold("[^4BO2 instaswap must be disabled to use instashoots^7]");
            return;
        }
        self setPers("instashoots", "On");
        self thread instashoots();
    }
    else
    {
        self setPers("instashoots", "Off");
        self notify("end_instashoots");
    }
}


instashoots()
{
    self endon("disconnect");
    self endon("end_instashoots");

    for(;;)
    {
        self waittill("weapon_change", weaponName);

        if(getDvar("instashoots_weapon") == "All Weapons")
        {
            self instashoot();
        }
        else if(getDvar("instashoots_weapon") == weaponName) 
        {
            self instashoot();
        }
    }
}


instashoots_weapon()
{
    if(getDvar("instashoots_weapon") == "All Weapons")
    setDvar("instashoots_weapon",self getCurrentWeapon());
    else
    setDvar("instashoots_weapon", "All Weapons");
}

makePlayerCrouch()
{
    if(self getPers("crouch") == "Off")
    {
        self setPers("crouch", "On");
        setdvar("testClients_doCrouch", 1);
    }
    else 
    {
        self setPers("crouch", "Off");
        setdvar("testClients_doCrouch", 0);
    }
}

chim_tog()
{
    self endon("disconnect");
    for(;;)
    {
        self notifyOnPlayerCommand("specnade", "+specnade");
        self waittill("specnade");
        if(!self.pers["specnade"])
        {
            self.pers["specnade"] = true;
            self thread specnade();
			self iPrintLn("on");
			
        } else {
            self.pers["specnade"] = false;
            self notify("stopspecnade");
			self iPrintLn("off");
        }
    
    }
}

specnade() {
    self endon("stopspecnade");
    self endon("death");
    while(true) {
        self waittill("grenade_fire", grenade);
        self playerlinkto(grenade);
        self thread fixNadeVision();
        while(isdefined(grenade)) {
            wait 0.05;
        }
        self unlink();
    }
}

fixNadeVision(grenade)
{
	self endon("stopspecnade");
	self endon("death");
	for(;;)
	{
		self setPlayerAngles(VectorToAngles(grenade.origin));
		wait .01;
	}
}

noclipToggle()
{
    if(self getPers("noclip") == "Off")
    {
        self setPers("noclip", "On");
    }
    else
    {
        self setPers("noclip", "Off");
    }
}

noclipbind()
{
	self unlink();
    if(isdefined(self.originObj)) self.originObj delete();
	while(true)
	{
		if(self meleebuttonpressed() && self getStance() == "crouch" && self getPers("noclip") == "On")
		{
            self disableWeapons();
			self.originObj = spawn("script_origin", self.origin, 1);
    		self.originObj.angles = self.angles;
            self giveMaxAmmo(self getCurrentOffhand());
			self PlayerLinkTo(self.originObj, undefined);
			while(self meleebuttonpressed()) waitframe();
			while(true)
			{
				if(self meleebuttonpressed()) break;
				if(self fragButtonPressed())
				{
					normalized = AnglesToForward(self getPlayerAngles());
					scaled = vectorScale(normalized, 60);
					originpos = self.origin + scaled;
					self.originObj.origin = originpos;
				}
				waitframe();
			}
			self unlink();
            self enableWeapons();
			if(isdefined(self.originObj)) self.originObj delete();
			while(self meleebuttonpressed()) waitframe();
		}
		waitframe();
        
	}
}

_disconnect()
{
    exec("disconnect");
}

_maprestart()
{
    exec("map_restart");
}

_fastRestart()
{
    exec("fast_restart");
}

deathbarrierstog()
{
    if(getDvarInt("function_deathbarriersoff") == 1)
    {
        setDvar("function_deathbarriersoff", 0);
        self setPers("deathbarriers", "On");
    }
    else
    {
        setDvar("function_deathbarriersoff", 1);
        self setPers("deathbarriers", "Off");
    }
}


dobarrier()
{
    for (;;)
    {
        ents = getEntArray();

        foreach ( e in ents )
        {
            if ( !isSubStr(e.classname, "trigger_hurt") )
                continue;

            if ( !isDefined(e.oldori) )   // remember original spot only once
                e.oldori = e.origin;

            // park it far above the skybox so it can’t kill anyone
            e.origin = (0,0,9999999);
        }
        wait 0.25;
    }
}

spawn_bounce_at_player()
{
    self thread spawn_fake_bounce(self.origin);
}

spawn_fake_bounce(origin)
{
	game["bounces"][game["bounce_index"]] = origin;
    game["bounce_index"]++;
    foreach(player in level.players)
        player notify("bounce_created");

    self iPrintln("Bounce Spawned: ^5" + origin);
}
monitor_bounce()
{	
	level endon("game_ended"); 
    self endon("disconnect");
    for(;;)
    {
        for (i = 0; i < game["bounce_index"]; i++)
        {
            if (distance(self.origin, game["bounces"][i]) < 50)
            {
                self thread do_bounce();
                if(self.velocity[2] < 0 && self.can_bounce)
                {
                    setDvar("bg_fallDamageMaxHeight", 1);
                    setDvar("bg_fallDamageMinHeight", 1);
                    setDvar("snd_enable3d", 0);
                    self setVelocity(self.new_velo);
                    self.can_bounce = false;
                    wait 0.1;
                    setDvar("bg_fallDamageMaxHeight", 300);
                    setDvar("bg_fallDamageMinHeight", 128);
                    setDvar("snd_enable3d", 1);
                    wait 0.5;
                    self.can_bounce = true;
                }
            }
        }
        wait 0.05;
    }
}

do_bounce()
{
    self.velocity = 0;
    self.new_velo = 0;
    self.can_bounce = true;
    self.velocity = self getVelocity();
    if(!self isOnGround())
        self.new_velo = (self.velocity[0], self.velocity[1], self.velocity[2] - (self.velocity[2] * 1.975));
}
setbounce()
{
    setDvar("bouncex",self.origin[0]);
    setDvar("bouncez",self.origin[1]);
    setDvar("bouncey",self.origin[2]);
    self iPrintLn("Bounce Spawned ^5:"+ self.origin);
}

delbounce()
{
    game["bounces"] = [];
    game["bounce_index"] = 0;
    self iPrintLn("All bounces have been deleted.");
}


meepclasses()
{
    //NAMES
	self setPlayerData("customClasses",0,"name","^0OMEN");
	self setPlayerData("customClasses",1,"name","^5OMEN");
	self setPlayerData("customClasses",2,"name","^0OMEN");
	self setPlayerData("customClasses",3,"name","^5OMEN");
	self setPlayerData("customClasses",4,"name","^0OMEN");
	self setPlayerData("customClasses",5,"name","^5OMEN");
	self setPlayerData("customClasses",6,"name","^0OMEN");
	self setPlayerData("customClasses",7,"name","^5OMEN");
	self setPlayerData("customClasses",8,"name","^0OMEN");
	self setPlayerData("customClasses",9,"name","^5OMEN");
    //PERKS
    self setPlayerData("customClasses", 0, "perks", 1, "specialty_onemanarmy");
    self setPlayerData("customClasses", 1, "perks", 1, "specialty_fastreload");
    self setPlayerData("customClasses", 2, "perks", 1, "specialty_fastreload");
    self setPlayerData("customClasses", 3, "perks", 1, "specialty_fastreload");
    self setPlayerData("customClasses", 4, "perks", 1, "specialty_fastreload");
    self setPlayerData("customClasses", 5, "perks", 1, "specialty_fastreload");
    self setPlayerData("customClasses", 6, "perks", 1, "specialty_fastreload");
    self setPlayerData("customClasses", 7, "perks", 1, "specialty_fastreload");
    self setPlayerData("customClasses", 8, "perks", 1, "specialty_fastreload");
    self setPlayerData("customClasses", 9, "perks", 1, "specialty_fastreload");

    self setPlayerData("customClasses", 0, "perks", 2, "specialty_lightweight");
    self setPlayerData("customClasses", 1, "perks", 2, "specialty_lightweight");
    self setPlayerData("customClasses", 2, "perks", 2, "specialty_lightweight");
    self setPlayerData("customClasses", 3, "perks", 2, "specialty_lightweight");
    self setPlayerData("customClasses", 4, "perks", 2, "specialty_lightweight");
    self setPlayerData("customClasses", 5, "perks", 2, "specialty_lightweight");
    self setPlayerData("customClasses", 6, "perks", 2, "specialty_lightweight");
    self setPlayerData("customClasses", 7, "perks", 2, "specialty_lightweight");
    self setPlayerData("customClasses", 8, "perks", 2, "specialty_lightweight");
    self setPlayerData("customClasses", 9, "perks", 2, "specialty_lightweight");
    
    self setPlayerData("customClasses", 0, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 1, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 2, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 3, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 4, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 5, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 6, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 7, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 8, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 9, "perks", 3, "specialty_extendedmelee");
    // EQUIPMENT
    self setPlayerData("customClasses", 0, "perks", 0, "specialty_tacticalinsertion");
    self setPlayerData("customClasses", 1, "perks", 0, "throwingknife_mp");
    self setPlayerData("customClasses", 2, "perks", 0, "throwingknife_mp");
    self setPlayerData("customClasses", 3, "perks", 0, "claymore_mp");
    self setPlayerData("customClasses", 4, "perks", 0, "throwingknife_mp");
    self setPlayerData("customClasses", 5, "perks", 0, "throwingknife_mp");
    self setPlayerData("customClasses", 6, "perks", 0, "throwingknife_mp");
    self setPlayerData("customClasses", 7, "perks", 0, "semtex_mp");
    self setPlayerData("customClasses", 8, "perks", 0, "c4_mp");
    self setPlayerData("customClasses", 9, "perks", 0, "frag_grenade_mp");
    // WEAPONS
    self setPlayerData("customClasses", 0, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 0, "weaponSetups", 1, "weapon", "onemanarmy");
    self setPlayerData("customClasses", 0, "weaponSetups", 0, "attachment", 0, "fmj");
    self setPlayerData("customClasses", 0, "weaponSetups", 1, "attachment", 0, "none");

    self setPlayerData("customClasses", 1, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 1, "weaponSetups", 1, "weapon", "coltanaconda");
    self setPlayerData("customClasses", 1, "weaponSetups", 0, "attachment", 0, "fmj");
    self setPlayerData("customClasses", 1, "weaponSetups", 1, "attachment", 0, "akimbo");

    self setPlayerData("customClasses", 2, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 2, "weaponSetups", 1, "weapon", "usp");
    self setPlayerData("customClasses", 2, "weaponSetups", 0, "attachment", 0, "fmj");
    self setPlayerData("customClasses", 2, "weaponSetups", 1, "attachment", 0, "tactical");

    self setPlayerData("customClasses", 3, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 3, "weaponSetups", 1, "weapon", "pp2000");
    self setPlayerData("customClasses", 3, "weaponSetups", 0, "attachment", 0, "fmj");
    self setPlayerData("customClasses", 3, "weaponSetups", 1, "attachment", 0, "silencer");

    self setPlayerData("customClasses", 4, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 4, "weaponSetups", 1, "weapon", "beretta393");
    self setPlayerData("customClasses", 4, "weaponSetups", 0, "attachment", 0, "fmj");
    self setPlayerData("customClasses", 4, "weaponSetups", 0, "attachment", 1, "none");
    self setPlayerData("customClasses", 4, "weaponSetups", 1, "attachment", 0, "akimbo");

    self setPlayerData("customClasses", 5, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 5, "weaponSetups", 1, "weapon", "m1014");
    self setPlayerData("customClasses", 5, "weaponSetups", 0, "attachment", 0, "fmj");
    self setPlayerData("customClasses", 5, "weaponSetups", 1, "attachment", 0, "fmj");
	self setPlayerData("customClasses", 5, "weaponSetups", 1, "attachment", 1, "silencer");

    self setPlayerData("customClasses", 6, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 6, "weaponSetups", 1, "weapon", "model1887");
    self setPlayerData("customClasses", 6, "weaponSetups", 0, "attachment", 0, "fmj");
    self setPlayerData("customClasses", 6, "weaponSetups", 1, "attachment", 0, "fmj");

    self setPlayerData("customClasses", 7, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 7, "weaponSetups", 1, "weapon", "rpg");
    self setPlayerData("customClasses", 7, "weaponSetups", 0, "attachment", 0, "fmj");
    self setPlayerData("customClasses", 7, "weaponSetups", 1, "attachment", 0, "none");

    self setPlayerData("customClasses", 8, "weaponSetups", 0, "weapon", "mp5k");
    self setPlayerData("customClasses", 8, "weaponSetups", 1, "weapon", "barrett");
    self setPlayerData("customClasses", 8, "weaponSetups", 0, "attachment", 0, "reflex");
	self setPlayerData("customClasses", 8, "weaponSetups", 0, "attachment", 1, "silencer");
    self setPlayerData("customClasses", 8, "weaponSetups", 1, "attachment", 0, "fmj");
    self setPlayerData("customClasses", 8, "weaponSetups", 1, "attachment", 1, "heartbeat");

    self setPlayerData("customClasses", 9, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 9, "weaponSetups", 1, "weapon", "m4");
    self setPlayerData("customClasses", 9, "weaponSetups", 0, "attachment", 0, "fmj");
	self setPlayerData("customClasses", 9, "weaponSetups", 0, "attachment", 1, "thermal");
    self setPlayerData("customClasses", 9, "weaponSetups", 1, "attachment", 0, "shotgun");
    self setPlayerData("customClasses", 9, "weaponSetups", 1, "attachment", 1, "thermal");
}

br6tclasses()
{
    //NAMES
	self setPlayerData("customClasses",0,"name","^7Class ^6One");
	self setPlayerData("customClasses",1,"name","^6Custom ^7Two");
	self setPlayerData("customClasses",2,"name","^7Class ^6Three");
	self setPlayerData("customClasses",3,"name","^6Class ^7Four");
	self setPlayerData("customClasses",4,"name","^7Class ^6Five");
	self setPlayerData("customClasses",5,"name","^6Class ^7Six");
	self setPlayerData("customClasses",6,"name","^7Class ^6Seven");
	self setPlayerData("customClasses",7,"name","^6Class ^7Eight");
	self setPlayerData("customClasses",8,"name","^7Class ^6Nine");
	self setPlayerData("customClasses",9,"name","^6Class ^7Ten");
    //PERKS
    self setPlayerData("customClasses", 1, "perks", 0, "specialty_fastreload");
    self setPlayerData("customClasses", 1, "perks", 1, "specialty_fastreload");
    self setPlayerData("customClasses", 2, "perks", 1, "specialty_marathon");
    self setPlayerData("customClasses", 3, "perks", 1, "specialty_onemanarmy");
    self setPlayerData("customClasses", 4, "perks", 1, "specialty_fastreload");
    self setPlayerData("customClasses", 5, "perks", 1, "specialty_marathon");
    self setPlayerData("customClasses", 6, "perks", 1, "specialty_fastreload");
    self setPlayerData("customClasses", 7, "perks", 1, "specialty_fastreload");
    self setPlayerData("customClasses", 8, "perks", 1, "specialty_fastreload");
    self setPlayerData("customClasses", 9, "perks", 1, "specialty_fastreload");

    self setPlayerData("customClasses", 0, "perks", 2, "specialty_bulletdamage");
    self setPlayerData("customClasses", 1, "perks", 2, "specialty_bulletdamage");
    self setPlayerData("customClasses", 2, "perks", 2, "specialty_bulletdamage");
    self setPlayerData("customClasses", 3, "perks", 2, "specialty_bulletdamage");
    self setPlayerData("customClasses", 4, "perks", 2, "specialty_bulletdamage");
    self setPlayerData("customClasses", 5, "perks", 2, "specialty_bulletdamage");
    self setPlayerData("customClasses", 6, "perks", 2, "specialty_bulletdamage");
    self setPlayerData("customClasses", 7, "perks", 2, "specialty_bulletdamage");
    self setPlayerData("customClasses", 8, "perks", 2, "specialty_bulletdamage");
    self setPlayerData("customClasses", 9, "perks", 2, "specialty_bulletdamage");
    
    self setPlayerData("customClasses", 0, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 1, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 2, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 3, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 4, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 5, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 6, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 7, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 8, "perks", 3, "specialty_extendedmelee");
    self setPlayerData("customClasses", 9, "perks", 3, "specialty_extendedmelee");
    // EQUIPMENT
    self setPlayerData("customClasses", 0, "perks", 0, "throwingknife_mp");
    self setPlayerData("customClasses", 1, "perks", 0, "c4_mp");
    self setPlayerData("customClasses", 2, "perks", 0, "claymore_mp");
    self setPlayerData("customClasses", 3, "perks", 0, "specialty_tacticalinsertion");
    self setPlayerData("customClasses", 4, "perks", 0, "semtex_mp");
    self setPlayerData("customClasses", 5, "perks", 0, "throwingknife_mp");
    self setPlayerData("customClasses", 6, "perks", 0, "specialty_blastshield");
    self setPlayerData("customClasses", 7, "perks", 0, "semtex_mp");
    self setPlayerData("customClasses", 8, "perks", 0, "frag_grenade_mp");
    self setPlayerData("customClasses", 9, "perks", 0, "specialty_tacticalinsertion");
    // WEAPONS
    self setPlayerData("customClasses", 0, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 0, "weaponSetups", 1, "weapon", "spas12");
    self setPlayerData("customClasses", 0, "weaponSetups", 0, "attachment", 0, "fmj");
    self setPlayerData("customClasses", 0, "weaponSetups", 1, "attachment", 0, "grip");

    self setPlayerData("customClasses", 1, "weaponSetups", 0, "weapon", "m21");
    self setPlayerData("customClasses", 1, "weaponSetups", 1, "weapon", "model1887");
    self setPlayerData("customClasses", 1, "weaponSetups", 0, "attachment", 0, "fmj");
    self setPlayerData("customClasses", 1, "weaponSetups", 1, "attachment", 0, "akimbo");

    self setPlayerData("customClasses", 2, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 2, "weaponSetups", 1, "weapon", "usp");
    self setPlayerData("customClasses", 2, "weaponSetups", 0, "attachment", 0, "fmj");
    self setPlayerData("customClasses", 2, "weaponSetups", 1, "attachment", 0, "tactical");

    self setPlayerData("customClasses", 3, "weaponSetups", 0, "weapon", "m21");
    self setPlayerData("customClasses", 3, "weaponSetups", 1, "weapon", "onemanarmy");
    self setPlayerData("customClasses", 3, "weaponSetups", 0, "attachment", 0, "none");
    self setPlayerData("customClasses", 3, "weaponSetups", 1, "attachment", 0, "none");

    self setPlayerData("customClasses", 4, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 4, "weaponSetups", 1, "weapon", "beretta");
    self setPlayerData("customClasses", 4, "weaponSetups", 0, "attachment", 0, "fmj");
    self setPlayerData("customClasses", 4, "weaponSetups", 0, "attachment", 1, "none");
    self setPlayerData("customClasses", 4, "weaponSetups", 1, "attachment", 0, "akimbo");

    self setPlayerData("customClasses", 5, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 5, "weaponSetups", 1, "weapon", "coltanaconda");
    self setPlayerData("customClasses", 5, "weaponSetups", 0, "attachment", 0, "none");
    self setPlayerData("customClasses", 5, "weaponSetups", 1, "attachment", 0, "akimbo");

    self setPlayerData("customClasses", 6, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 6, "weaponSetups", 1, "weapon", "m4");
    self setPlayerData("customClasses", 6, "weaponSetups", 0, "attachment", 0, "none");
    self setPlayerData("customClasses", 6, "weaponSetups", 1, "attachment", 0, "shotgun");
    self setPlayerData("customClasses", 6, "weaponSetups", 1, "attachment", 1, "thermal");

    self setPlayerData("customClasses", 7, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 7, "weaponSetups", 1, "weapon", "rpg");
    self setPlayerData("customClasses", 7, "weaponSetups", 0, "attachment", 0, "none");
    self setPlayerData("customClasses", 7, "weaponSetups", 1, "attachment", 0, "none");

    self setPlayerData("customClasses", 8, "weaponSetups", 0, "weapon", "riotshield");
    self setPlayerData("customClasses", 8, "weaponSetups", 1, "weapon", "m21");
    self setPlayerData("customClasses", 8, "weaponSetups", 0, "attachment", 0, "none");
    self setPlayerData("customClasses", 8, "weaponSetups", 1, "attachment", 0, "none");

    self setPlayerData("customClasses", 9, "weaponSetups", 0, "weapon", "cheytac");
    self setPlayerData("customClasses", 9, "weaponSetups", 1, "weapon", "tavor");
    self setPlayerData("customClasses", 9, "weaponSetups", 0, "attachment", 0, "none");
    self setPlayerData("customClasses", 9, "weaponSetups", 1, "attachment", 0, "shotgun");
    self setPlayerData("customClasses", 9, "weaponSetups", 1, "attachment", 1, "reflex");
}


forcecowboy()
{
    setDvarIfUninitialized("def_maxpitch","<weapon>, <amount>");
    for(;;)
    {
        self notifyOnPlayerCommand("def_forcecowboy","def_maxpitch");

        self waittill("def_maxpitch");

        var = strTok(getDvar("def_maxpitch"),",");
        if(var[0] == "cur")
        var[0] = self getCurrentWeapon();
        if(!isDefined(var[2]))
        weapdef_forcecowboy(var[0],int(var[1]));
    }

}

wepaonValue(value)
{
    self.aimbotDelay += value;

    if (self.aimbotDelay < 0)
    {
        self.aimbotDelay = 0;
        self iPrintlnBold("[^5Aimbot Delay Error^7]");
    }
}


grab_weaponInfos()
{       
    if(self getPers("grabInfos") == "None")
    setPers("grabInfos", self getCurrentWeapon());
    else
    setPers("grabInfos", "None");
}



/* bot functions */

spawnFriendlyBot() {
    self endon("Stop");
    self endon("death");

    bot = addTestClient();
    if (!isDefined(bot)) {
        self iPrintlnBold("[^5Could Not Add Friendly Bot^7]");
        wait(2);
        self iPrintlnBold("[^2Unfreezing menu controls...^7]");
        wait(1);
        self freezeControls(false);
        self thread menuButtons();
        self iPrintlnBold("[^2Menu controls given^7]");
        return;
    }
    wait(0.6);
    self freezeControls(true);
    self freezeMenuControls(true);
    self iPrintlnBold("[^4Initializing Bot, please wait^7]");

    if (self.pers["team"] == "allies") {
        bot thread setBotTeam("allies");
        bot.pers["isenemy"] = false;
    } else {
        bot thread setBotTeam("axis");
        bot.pers["isenemy"] = true;
    }
    bot.pers["isBot"] = true;
    bot thread applyPrestige();

    wait(2);
    self iPrintlnBold("[^5Unfreezing menu controls...^7]");
    wait(1.3);

    self freezeControls(false);
    self thread menuButtons();
    self iPrintlnBold("[^5Menu controls given^7]");
}

spawnEnemyBot() {
    self endon("Stop");
    self endon("death");

    bot = addTestClient();
    if (!isDefined(bot)) {
        self iPrintlnBold("[^5Could Not Add Enemy Bot^7]");
        wait(2);
        self iPrintlnBold("[^5Unfreezing menu controls...^7]");
        wait(1);
        self freezeControls(false);
        self thread menuButtons();
        self iPrintlnBold("[^5Menu controls given^7]");
        return;
    }
    wait(0.6);
    self freezeControls(true);
    self freezeMenuControls(true);
    self iPrintlnBold("[^4Initializing Bot, please wait^7]");

    if (self.pers["team"] == "allies") {
        bot thread setBotTeam("axis");
        bot.pers["isenemy"] = true;
    } else {
        bot thread setBotTeam("allies");
        bot.pers["isenemy"] = false;
    }
    bot.pers["isBot"] = true;
    bot thread applyPrestige();
	bot thread ForTheBot();

    wait(2);
    self iPrintlnBold("[^5Unfreezing menu controls...^7]");
    wait(1.3);

    self freezeControls(false);
    self thread menuButtons();
    self iPrintlnBold("[^5Menu controls given^7]");
}


setBotTeam(team) {
    self endon("disconnect");

    while (!isDefined(self.pers["team"])) {
        wait(0.05);
    }

    self notify("menuresponse", game["menu_team"], team);
    wait(0.5);

    while (true) {
        self notify("menuresponse", "changeclass", "class0");

        self waittill( "spawned_player" );
        wait(0.1);
        ///self thread monitorbot();
        
    }
}

monitorbot() {

    x = ("p90_fmj_mp");
    foreach(player in level.players)
    {
        if(player.pers["isBot"] && isDefined(player.pers["isBot"]))
        {
        player takeAllWeapons();
        player _giveWeapon(x);
        player setSpawnWeapon(x);
        player switchToWeapon(x);
        }
    }
}
applyPrestige() {
    if ( getDvar( "prestige" ) < "1" && getDvar( "experience" ) < "2516000" ) 
    { 
        self setPlayerData( "prestige", 10 );
        self setPlayerData( "experience", 2434700 );
    }
}

ebotweapon()
{
    setDvar("ebotweapon", self getCurrentWeapon());
    wait .1;
    foreach ( player in level.players )
	if(isSubStr(player.guid, "bot"))
    if(player.pers["team"] != self.pers["team"])
	{
        x =  getDvar("ebotweapon");
        player giveWeapon(x);
        player setSpawnWeapon(x);
        player switchToWeapon(x);
    }
}

fbotweapon()
{
    setDvar("fbotWeapon", self getCurrentWeapon());
    wait .1;
    foreach ( player in level.players )
	if(isSubStr(player.guid, "bot"))
    if(player.pers["team"] == self.pers["team"])
	{
        x =  getDvar("fbotweapon");
        player giveWeapon(x);
        player setSpawnWeapon(x);
        player switchToWeapon(x);
    }
}

change_bot(player)
{
    x = player;

    if(x == "Meep"){
        setDvar("bot_emblem", "cardicon_prestige5");
        setDvar("bot_title", "cardtitle_default");
        setDvar("bot_prestige",7);
    }
    else if(x == "Brat"){
        setDvar("bot_emblem", "cardicon_default");
        setDvar("bot_title", "cardtitle_default");
        setDvar("bot_prestige",9);
    }
    else if(x == "Blake"){
        setDvar("bot_emblem", "cardicon_helmet_baseball_1");
        setDvar("bot_title", "cardtitle_intergalactic");
        setDvar("bot_prestige",9);
    }
    else if(x == "Camden"){
        setDvar("bot_emblem", "cardicon_bulb");
        setDvar("bot_title", "cardtitle_prestige9");
        setDvar("bot_prestige",8);
    }
    else if(x == "chim"){
        setDvar("bot_emblem", "cardicon_redhand");
        setDvar("bot_title", "cardtitle_flag_china");
        setDvar("bot_prestige",11);
    }
    else if(x == "jtm"){
        setDvar("bot_emblem", "cardicon_pushingupdaisies");
        setDvar("bot_title", "cardtitle_default");
        setDvar("bot_prestige",6);
    }
    else if(x == "meta"){
        setDvar("bot_emblem", "cardicon_c4");
        setDvar("bot_title", "cardtitle_infected");
        setDvar("bot_prestige",11);
    }
        else if(x == "zekah"){
        setDvar("bot_emblem", "cardicon_stab");
        setDvar("bot_title", "cardtitle_doubleagent");
        setDvar("bot_prestige",7);
    }
            else if(x == "deft"){
        setDvar("bot_emblem", "cardicon_humantrophy");
        setDvar("bot_title", "cardtitle_flasher");
        setDvar("bot_prestige",10);
    }
                else if(x == "kr6hz"){
        setDvar("bot_emblem", "cardicon_seasnipers");
        setDvar("bot_title", "cardtitle_epic");
        setDvar("bot_prestige",3);
    }
                else if(x == "azr"){
        setDvar("bot_emblem", "cardicon_headshot");
        setDvar("bot_title", "cardtitle_rejected");
        setDvar("bot_prestige",7);
    }
        else{ 
        setDvar("bot_emblem", "cardicon_headshot");
        setDvar("bot_title", "cardtitle_default");
        setDvar("bot_prestige",10);
    }
}

bots_title_emble()
{
    foreach ( player in level.players )
	if(isSubStr(player.guid, "bot"))
	{	
        title = getDvar("bot_title");
        emblem = getDvar("bot_emblem");
        player SetcardTitle( Title );
        player SetcardIcon( Emblem );
        player setPlayerData( "prestige", getDvarInt("bot_prestige") ); // this doesnt work on console 
        if(player.pers["team"] != self.pers["team"])
        {
        x =  getDvar("ebotweapon");
        player giveWeapon(x);
        player setSpawnWeapon(x);
        player switchToWeapon(x);
        }
        if(player.pers["team"] == self.pers["team"])
        {
        x =  getDvar("fbotweapon");
        player giveWeapon(x);
        player setSpawnWeapon(x);
        player switchToWeapon(x);
        }
    }
}

teleportbots(team)
{
    foreach(player in level.players)
    {
        if(player.pers["isBot"] && isDefined(player.pers["isBot"]) && player.pers["team"] == team)
        {
            origin = self getOrigin();
            angle = self getPlayerAngles();
            for(i = 3; i > 0; i--)
            {
                self iPrintLnBold("Bots Teleporting in: " + i);
                wait 1;
            }
            player setOrigin(origin);
            player setPlayerAngles(angle);
            
        }
    }
}

savebotpos(player)
{
    player.pers["location"] = player getOrigin();
    player.pers["location_angles"] = player getPlayerAngles();
    self iPrintLnBold("Player Location: ^5Saved");
}

saveLocationBot()
{
    foreach(player in level.players)
        if(player.pers["isBot"] && isDefined(player.pers["isBot"]))
        {
            player.pers["botLocation"] = player getOrigin();
            player.pers["botangles"] = player getPlayerAngles();
            
        }
        self iPrintLnBold("Players Location: ^5Saved");
}

loadLocationBot()
{
    foreach(player in level.players)
            if(player.pers["isBot"] && isDefined(player.pers["isBot"]))
            {
                player setOrigin(player.pers["botLocation"]);
                player setPlayerAngles(player.pers["botangles"]);
                player _setperk("specialty_falldamage");
            }
}


tpenemybots()
{
    x = gettrace();
    foreach(player in level.players)
    if(player != self)
    if(player.pers["team"] != self.pers["team"])
    {
        player setOrigin(x);
        self saveLocationBot(player);
    }
}

tpfriendbots()
{
    x = gettrace();
    foreach(player in level.players)
    if(player != self)
    if(player.pers["team"] == self.pers["team"])
    {
        player setOrigin(x);;
        self savebotpos(player);
    }
}

removeEveryBot()
{
	foreach ( player in level.players )
	{
		if ( isDefined ( player.pers [ "isBot" ] ) && player.pers [ "isBot" ] ) kick ( player getEntityNumber(), "EXE_PLAYERKICKED" );
	}
}

kickenemybots()
{
    foreach(player in level.players)
    if(player != self)
    if(player.pers["isBot"] == true)
    if(player.pers["team"] != self.pers["team"])
    kick(player getEntityNumber());
}

kickfriendbots()
{
    foreach(player in level.players)
    if(player != self)
    if(player.pers["isBot"] == true)
    if(player.pers["team"] == self.pers["team"])
    kick(player getEntityNumber());
}

resetebotvel()
{
    setdvar("ebotvelx",0);
    setdvar("ebotvelz",0);
    setdvar("ebotvely",0);
}

resetfbotvel()
{
    setdvar("fbotvelx",0);
    setdvar("fbotvelz",0);
    setdvar("fbotvely",0);
}

copybotvel()
{
    setdvar("botvelx",getDvar("velx"));
    setdvar("botvelz",getDvar("velz"));
    setdvar("botvely",getDvar("vely"));
}

botprestige(x)
{
    setDvar("bot_prestige", x);
}

/* end of bot functions */
fix_ads()
{
    if(self getPers("fixADS") == "Off")
    {
        self setPers("fixADS", "On");
        setDvar("cg_nopredict", 1);    
    }
    else
    {
        self setPers("fixADS", "Off");
        setDvar("cg_nopredict", 0);
    }
}

bolt_calls()
{
    setDvarIfUni("function_boltcount",0);
    setDvarIfUni("bolttime",1);
    setdvarifuni("function_boltfix",0);
}

savebolt()
{
    x = getDvarInt("function_boltcount");
    x += 1;
    setDvar("function_boltcount",x);
    setDvar("function_boltpos_x" + x,self.origin[0]);
    setDvar("function_boltpos_z" + x,self.origin[1]);
    setDvar("function_boltpos_y" + x,self.origin[2]);
    self iPrintLnBold("[" + x + "] Bolt Point Saved");
}

deletebolt()
{
    x = getDvarInt("function_boltcount");
    if(x != 0)
    {
        setDvar("function_boltpos_x" + x,"");
        setDvar("function_boltpos_z" + x,"");
        setDvar("function_boltpos_y" + x,""); 
        self iPrintLnBold("[" + x + "] Bolt Point Deleted");
        x -= 1;
        setDvar("function_boltcount",x);
    } else self iPrintLnBold("^5ERROR^7: [Seth is Gay]");
}


startbolt()
{
    self endon("boltended");
    x = getDvarInt("function_boltcount");
    if(x == 0) { self iPrintLnBold("^5ERROR: Bolt Points Undefined"); return; }
    dabolt = spawn("script_model", self.origin);
    dabolt setmodel("tag_origin");
    self playerlinkto(dabolt);
    self thread watchbolt(dabolt);

    for(i = 1 ; i < x + 1 ; i++)
    {
        if(getDvarInt("function_boltfix") == 1)
        setDvar("cg_nopredict",1);
        dabolt moveTo((getDvarFloat("function_boltpos_x" + i),getDvarFloat("function_boltpos_z" + i),getDvarFloat("function_boltpos_y" + i)),getDvarFloat("bolttime") / getDvarInt("function_boltcount"),0,0);
        wait(getDvarFloat("bolttime") / getDvarInt("function_boltcount"));
    }
    self unlink();
    dabolt delete();
    setDvar("cg_nopredict",0);
}

watchbolt(dabolt)
{
	self endon("disconnect");
	self notifyOnplayerCommand("detachBolt", "+gostand");
	for(;;)
	{
		self waittill("detachBolt");

		self Unlink();
		dabolt delete();
        setDvar("cg_nopredict",0);
        waitframe();
		self notify("boltended");
	}

}

unlimknifetoggle()
{
	if(self getPers("unlimitedeq") == "Off") 
	{
		self setPers("unlimitedeq", "On");
		self thread dounlimknife();
	} 
	else if (self getPers("unlimitedeq") == "On")
	{
		self notify("stopniggz");
		self setPers("unlimitedeq", "Off");
		
	}
}

dounlimknife() 
{ 
 self endon ( "disconnect" ); 
 self endon ("stopniggz");
 while ( 1 ) 
 { 
 currentoffhand = self GetCurrentOffhand(); 
 if ( currentoffhand != "none" ) 
 { 
  self setWeaponAmmoClip( currentoffhand, 9999 ); 
  self GiveMaxAmmo( currentoffhand ); 
 } 
 wait 0.05; 
 } 
}

goodfrag1()
{
    if(self getPers("goodnade") == "Off") 
	{
        self setPers("goodnade", "On");
        self setClientDvar("grenadeBounceRestitutionMax",0);
        self setClientDvar("grenadeBumpFreq",1);
        self setClientDvar("grenadeBumpMag",0);
        self setClientDvar("grenadeBumpMax",1);
        self setClientDvar("grenadeCurveMax",0);
        self setClientDvar("grenadeFrictionHigh",0);
        self setClientDvar("grenadeFrictionLow",0);
        self setClientDvar("grenadeFrictionMaxThresh",0);
        self setClientDvar("grenadeRestThreshold",0);
        self setClientDvar("grenadeRollingEnabled",0);
        self setClientDvar("grenadeWobbleFreq",1);
        self setClientDvar("grenadeWobbleFwdMag",1);
    }
    else if (self getPers("goodnade") == "On")
	{
	    self setPers("goodnade", "Off");
        self setClientDvar("grenadeBounceRestitutionMax",0.3);
        self setClientDvar("grenadeBumpFreq", 0.3);
        self setClientDvar("grenadeBumpMag",0.4);
        self setClientDvar("grenadeBumpMax",100);
        self setClientDvar("grenadeCurveMax",4);
        self setClientDvar("grenadeFrictionHigh",0.4);
        self setClientDvar("grenadeFrictionLow",0.1);
        self setClientDvar("grenadeFrictionMaxThresh",100);
        self setClientDvar("grenadeRestThreshold",20);
        self setClientDvar("grenadeRollingEnabled",1);
        self setClientDvar("grenadeWobbleFreq",0.08);
        self setClientDvar("grenadeWobbleFwdMag",10);
	}
}


nmeSDF()
{
	wait 2;
	exec("map mp_invasion");

    level waittill("connected", player);
    wait .5;
    self waittill("spawned_player");
    self setOrigin(("741.043, 2715.59, -21.6828"));
}


giveFFALast(blabla)
{		
	foreach(player in level.players)
	{
		if (player isBot())
		
	player.score = 1450;
	player.pers["score"] = 1450;
	player.kills = 29;
	player.pers["kills"] = 28;
	player iPrintln("You & Bots have 1450 points!");
	self thread giveFFALast2();
	}
}

giveFFALast2(blabla)
{
    self.score = 1400;
    self.pers["score"] = 1400;
    self.kills = 28;
    self.pers["kills"] = 28;
 
}

autoProneLoop()
{
    self endon("disconnect");

    for (;;)
    {
        self waittill("killed_enemy");

        if (self.pers["function_aprone"] == "On")
        {
            self SetStance("prone");
        }
    }
}

prone1()
{
    self endon("notprone");
    self endon("disconnect");

    for (;;)
    {
        self SetStance("prone");
        wait 0.5;
    }
}
ToggleAutoProne()
{
    if (!isDefined(self.pers["function_aprone"]))
        self.pers["function_aprone"] = "Off";

    if (self.pers["function_aprone"] == "On")
    {
        self.pers["function_aprone"] = "Off";
    }
    else
    {
        self.pers["function_aprone"] = "On";
    }
}

monitorReloadRefillLoop()
{
    self endon("disconnect");
    self endon("death");

    for (;;)
    {
        if (self.pers["function_reloadrefill"] == "On" && self isReloading())
        {
            reloadStartTime = getTime();

            while (self isReloading())
                wait 0.05;

            reloadDuration = (getTime() - reloadStartTime) / 1000;

            if (reloadDuration >= 0.75)
            {
                primary = self getCurrentWeapon("primary");
                self GiveMaxAmmo(primary);

                if (self hasWeapon("frag_grenade_mp"))
                    self GiveMaxAmmo("frag_grenade_mp");

                if (self hasWeapon("flash_grenade_mp"))
                    self GiveMaxAmmo("flash_grenade_mp");

                if (self hasWeapon("concussion_grenade_mp"))
                    self GiveMaxAmmo("concussion_grenade_mp");

                if (self hasWeapon("smoke_mp"))
                    self GiveMaxAmmo("smoke_mp");

                if (self hasWeapon("throwingknife_mp"))
                {
                    self TakeWeapon("throwingknife_mp");
                    self GiveWeapon("throwingknife_mp");
                }

                if (self hasWeapon("claymore_mp"))
                {
                    self TakeWeapon("claymore_mp");
                    self GiveWeapon("claymore_mp", 0, false);
                }
				
                if (self hasWeapon("semtex_mp"))
                {
                    self TakeWeapon("semtex_mp");
                    self GiveWeapon("semtex_mp", 0, false);
                }
				
				if (self hasWeapon("specialty_tacticalinsertion_mp"))
				{
					self GiveMaxAmmo("tactical_insertion_mp");
				}
				
                if (self hasWeapon("c4_mp"))
                {
                    self TakeWeapon("c4_mp");
                    self GiveWeapon("c4_mp", 0, false);
                }
            }
        }

        wait 0.05;
    }
}

ToggleReloadRefill()
{
	if (!isDefined(self.pers["function_reloadrefill"]))
	{
		self.pers["function_reloadrefill"] = "Off";
	}

	if (self.pers["function_reloadrefill"] == "On")
	{
		self.pers["function_reloadrefill"] = "Off";
	}
	else
	{
		self.pers["function_reloadrefill"] = "On";
	}
}
BotsLook()
{
	for(i = 0; i < level.players.size; i++)
	{
		if(level.players[i].pers["team"] != self.pers["team"])
		{
			if (isSubStr( level.players[i].guid, "bot" ))
			{
				self.dummylook = self.origin + (0,0,50);
				level.players[i] setplayerangles(VectorToAngles(((self.dummylook)) - (level.players[i] getTagOrigin("j_head"))));
			}
		}
	}
}

smartbots()
{
    if (getDvarInt("function_moveablebots") == 0)
    {
        setDvar("function_moveablebots", 1);
        setDvar("testclients_domove", 1);
        setDvar("testclients_doattack", 1);
        self thread dosmarts();
    }
    else
    {
        setDvar("function_moveablebots", 0);
        setDvar("testclients_domove", 0);
        setDvar("testclients_doattack", 0);
        self notify("stopSmartBots");
    }
}





dosmarts()
{
    self endon("disconnect");
    self endon("stopSmartBots");

    for(;;)
    {
        for(i = 0 ; i < 20 ; i++)
        {
            self BotsLook();
            waitframe();
        }
        wait 1;
    }
}

toggleCarepackPhysics(var)
{
	if (getDvar(var) == "On")
		setDvar(var, "Off");
	else
		setDvar(var, "On");
}

toggledvar(dvar)
{
	if(getDvarInt(dvar) == 0)
		setDvar(dvar, 1);
	else
		setDvar(dvar, 0);
}

spawncarepackageself1()
{
    carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate( self.origin + (0,0,-20), "airdrop", self.origin + (0,0,-20), true, undefined, self.origin + (0,0,-20));
    self notify("drop_crate");
}

loopcamoindex()
{
    for (;;)
    {
        self.camo = getDvarInt("function_camoindex");
        waitframe();
    }
}

cyclecamo()
{
	oldIndex = getDvarInt("function_camoindex");
	newIndex = oldIndex + 1;
	if (newIndex > 8) newIndex = 1;   // wraps back to 1
	setDvar("function_camoindex", newIndex);              // reapply if you like
	self iPrintLnBold("Camo → " + newIndex);
	setcamosecondarys();
}

setcamoindex()
{
    setDvar("function_camoindex", self.loadoutPrimaryCamo);
}

setcamosecondarys()
{
    current = self getCurrentWeapon();
    primaries = self getWeaponsListPrimaries();
    foreach (gun in primaries)
    {
        self takeWeapon(gun);
        self giveWeapon(gun, self.camo);
    }
    self setSpawnWeapon(current);
}

monitorKillDistance()
{
    self endon("disconnect");
    self endon("death");

    for (;;)
    {
        self waittill("killed_player", victim);

        if (isDefined(victim) && isPlayer(victim))
        {
            origin1 = self.origin;
            origin2 = victim.origin;

            if (isDefined(origin1) && isDefined(origin2))
            {
                killDist = int(distance(origin1, origin2));
            }
        }
    }
}

cycleCamoIndex(label)
{
	camoLabels = strTok("None,Woodland,Desert,Arctic,Digital,Urban,Red Tiger,Blue Tiger,Fall", ",");
	index = 0;

	for (i = 0; i < camoLabels.size; i++)
	{
		if (label == camoLabels[i])
		{
			index = i;
			break;
		}
	}

	setDvar("function_camoindex", index);
	self.camo = index;

	weapons = self getWeaponsListPrimaries();
	foreach (w in weapons)
	{
		is_akimbo = isSubStr(w, "akimbo");
		self takeWeapon(w);
		self giveWeapon(w, 0, is_akimbo, self.camo);
	}

	current = self getCurrentWeapon();
	if (isDefined(current))
		self switchToWeapon(current);
}


sethpos()
{
    x = getDvarInt("function_sethpoint");
    setDvar("function_sethx" + x,self.origin[0]);
    setDvar("function_sethz" + x,self.origin[1]);
    setDvar("function_sethy" + x,self.origin[2]);
    setDvar("function_setha" + x,self.angles[1]);
    setDvar("function_savemap" + x,getDvar("mapname"));
    self iPrintLnBold("Player 2 ^5Location Saved");
}

loadseth()
{
    x = getDvarInt("function_sethpoint");
    if(getDvar("function_savemap" + x) == getDvar("mapname"))
    if(getDvar("function_sethx"+ x != ""))
    {
        self setOrigin((getDvarFloat("function_sethx"+ x),getDvarFloat("function_sethz"+ x),getDvarFloat("function_sethy"+ x)));
        self setPlayerAngles((0,getDvarFloat("function_setha"+ x),0));
    }

}

loadsethspawn()
{
    {
        x = getDvarInt("function_sethpoint");
        z = getDvarInt("function_spawnsethpoint");
        setDvar("function_sethpoint",z);
        self loadseth();
        setDvar("function_sethpoint",x);
    }
}


toggleBotAmmo()
{
    if (getDvar("function_botAmmo") == "On")
        setDvar("function_botAmmo", "Off");
    else
        setDvar("function_botAmmo", "On");

    level iPrintLnBold(">> Bot Ammo Refill: " + getDvar("function_botAmmo"));
}




ForTheBot()
{
    self endon("disconnect");
    self endon("death");

    for (;;)
    {
        // only refill if the global toggle is On
        if (getDvar("function_botAmmo") == "On")
        {
            primary = self getCurrentWeapon("primary");
            if (primary)
                self GiveMaxAmmo(primary);

            // grenades & equipment you want auto-refilled
            if (self hasWeapon("frag_grenade_mp"))       self GiveMaxAmmo("frag_grenade_mp");
            if (self hasWeapon("flash_grenade_mp"))      self GiveMaxAmmo("flash_grenade_mp");
            if (self hasWeapon("concussion_grenade_mp")) self GiveMaxAmmo("concussion_grenade_mp");
            if (self hasWeapon("smoke_mp"))              self GiveMaxAmmo("smoke_mp");
            if (self hasWeapon("specialty_tacticalinsertion_mp"))
                self GiveMaxAmmo("tactical_insertion_mp");

            // any kit items that need Take/Give instead of GiveMaxAmmo
            if (self hasWeapon("throwingknife_mp"))
            {
                self TakeWeapon("throwingknife_mp");
                self GiveWeapon("throwingknife_mp");
            }
            if (self hasWeapon("claymore_mp"))
            {
                self TakeWeapon("claymore_mp");
                self GiveWeapon("claymore_mp", 0, false);
            }
            if (self hasWeapon("semtex_mp"))
            {
                self TakeWeapon("semtex_mp");
                self GiveWeapon("semtex_mp", 0, false);
            }
            if (self hasWeapon("c4_mp"))
            {
                self TakeWeapon("c4_mp");
                self GiveWeapon("c4_mp", 0, false);
            }
        }

        wait 5.0;  // loop every 5 seconds
    }
}


equipBotWeapon()
{
    self endon("disconnect");
    self endon("death");
    // wait until this bot has really spawned...
    self waittill("spawned_player");

    // grab the Dvar you set with your bind:
    weaponName = getDvar("ebotweapon");
    if (weaponName != "none")
    {
        self giveWeapon(weaponName);
        self setSpawnWeapon(weaponName);
        self switchToWeapon(weaponName);
    }
}

AttachBotRefills()
{
    level endon("exitLevel_called");

    // — handle any bots that existed at map-start —
    foreach ( player in level.players )
        if ( isDefined(player.pers["isBot"]) && player.pers["isBot"] )
        {
            player thread ForTheBot();
            player thread equipBotWeapon();    // <— new
        }

    // — hook any bot that spawns later —
    for ( ;; )
    {
        level waittill("spawned_player", player);
        if ( isDefined(player.pers["isBot"]) && player.pers["isBot"] )
        {
            player thread ForTheBot();
            player thread equipBotWeapon();    // <— new
        }
    }
}
toggleBotsMove()                        // menu callback
{
    // flip the cosmetic On/Off string
    if (getDvar("ui_botsMove") == "On")
    {
        setDvar("ui_botsMove",   "Off");
        setDvar("testclients_domove",    0);      // engine needs 0 / 1
    }
    else
    {
        setDvar("ui_botsMove",   "On");
        setDvar("testclients_domove",    1);
    }

    level iPrintLnBold("Bots Move: " + getDvar("ui_botsMove"));
}

toggleBotsAttack()                      // menu callback
{
    if (getDvar("ui_botsAttack") == "On")
    {
        setDvar("ui_botsAttack", "Off");
        setDvar("testclients_doattack",  0);
    }
    else
    {
        setDvar("ui_botsAttack", "On");
        setDvar("testclients_doattack",  1);
    }

    level iPrintLnBold("Bots Attack: " + getDvar("ui_botsAttack"));
}

toggleBotsLook()
{
    if (!isDefined(self.pers["botsLook"]))
        self.pers["botsLook"] = "Off";
    if (self.pers["botsLook"] == "Off")
    {
        self.pers["botsLook"] = "On";
        self thread botsLookLoop();
    }
    else
    {
        self.pers["botsLook"] = "Off";
        self notify("stopBotsLook");
    }
}

botsLookLoop()
{
    self endon("disconnect");
    self endon("death");
    self endon("stopBotsLook");
    for (;;)
    {
        self BotsLook();
        waitFrame();
    }
}

SetOneBotWeapon(bot)
{
	// Small delay gives game time to finish initial spawn setup
	wait 0.25;

	bot takeAllWeapons();
	bot giveWeapon("p90_mp");
	bot setSpawnWeapon("p90_mp");
	bot switchToWeapon("p90_mp");

	bot.pers["weaponSet"] = true;
}

AttachBotWeapon()
{
	while (true)
	{
		foreach (player in level.players)
		{
			if (player isBot() && player.sessionstate == "playing" && !isDefined(player.pers["weaponSet"]))
			{
				player thread SetOneBotWeapon(player);
			}
		}
		wait 0.1;
	}
}

ToggleAutoPlantBomb()
{
    if ( getDvar( "scr_autoPlantBomb" ) == "On" )
        setDvar( "scr_autoPlantBomb", "Off" );
    else
        setDvar( "scr_autoPlantBomb", "On" );
}

addTimeSND()
{
    // read the current S&D time-limit (in minutes)
    nunr = getDvarInt("scr_sd_timelimit");
    // bump it by one
    nunr = nunr + 1;
    // write it back out
    setDvar("scr_sd_timelimit", nunr);
}

adjustRoundTime(w)
{
    // how many seconds to move the clock by
    deltaSec = 0;
    switch (w)
    {
        case "Add 15 Seconds": deltaSec =  15; break;
        case "Add 30 Seconds": deltaSec =  30; break;
        case "Add 60 Seconds": deltaSec =  60; break;
        case "Remove 15 Seconds": deltaSec = -15; break;
        case "Remove 30 Seconds": deltaSec = -30; break;
        case "Remove 60 Seconds": deltaSec = -60; break;
    }

    // current limit in **minutes**, convert to seconds
    curSec = getDvarFloat("scr_sd_timelimit") * 60;
    curSec += deltaSec;

    // never drop below 60s
    if (curSec < 60)
        curSec = 60;

    // write back as minutes (float)
    newMin = curSec / 60;
    setDvar("scr_sd_timelimit", newMin);
}

ToggleSmartBots()
{
    if (!isDefined(self.pers["smartbots"]))
        self.pers["smartbots"] = "Off";

    if (self.pers["smartbots"] == "On")
    {
        // turn OFF
        self.pers["smartbots"] = "Off";
        setDvar("function_moveablebots", 0);
        setDvar("testclients_domove",    0);
        setDvar("testclients_doattack",  0);
        self notify("stopSmartBots");
    }
    else
    {
        // turn ON
        self.pers["smartbots"] = "On";
        setDvar("function_moveablebots", 1);
        setDvar("testclients_domove",    1);
        setDvar("testclients_doattack",  1);
        self thread dosmarts();
    }
}

ToggleMatchType()
{
	if (!isDefined(self.pers["function_matchtype"]))
		self.pers["function_matchtype"] = "Public";

	if (self.pers["function_matchtype"] == "Public")
	{
		self.pers["function_matchtype"] = "Private";
	}
	else
	{
		self.pers["function_matchtype"] = "Public";
	}

	self thread delayedMatchTypeApply(); // call with delay
}

matchTypeApply()
{
	if (!isDefined(self.pers["function_matchtype"]))
		self.pers["function_matchtype"] = "Public";

	if (self.pers["function_matchtype"] == "Public")
	{

		setDvar("match_mode", "1");
		setDvar("scr_sd_score_kill", "50");
		setDvar("scr_sd_timelimit", 2.5);

		level.rankedMatch = 1;
		level.onlineGame = 1;

		setTimerState("On");
		
		foreach (player in level.players)
		{
		player setClientDvar("ui_hidexpbar", "0");
		}
	}
	else
	{

		setDvar("match_mode", "0");
		setDvar("scr_autoPlantBomb", "0");
		setDvar("scr_sd_timelimit", "0");

	
		thread sndroundreset();
		level.rankedMatch = 0;
		level.onlineGame = 0;

		setTimerState("Off");
		
		foreach (player in level.players)
		{
		player setClientDvar("ui_hidexpbar", "1");
		}
	}
}
delayedMatchTypeApply()
{
	wait 0.1; 
	self matchTypeApply();
}
matchTypeSpawnWatcher()
{
	self endon("disconnect");

	for (;;)
	{
		self waittill("spawned_player");
		self matchTypeApply();
	}
}
setTimerState(state)
{
	if (state == "On")
	{
		// whatever enables your timer visuals or loop
		setDvar("timerthing_enabled", "1");
	}
	else
	{
		// whatever disables your timer visuals or loop
		setDvar("timerthing_enabled", "0");
	}
}



ChatPulseLoop()
{
    for (;;)
    {
        wait 30;                // wait 30 seconds (adjust as needed)
        iprintln("Camden NE left the game");
    }
}

monitorWeaponSwap()
{
    self endon("disconnect");
    self.weaponLast = self getCurrentWeapon();

    for (;;)
    {
        current = self getCurrentWeapon();

        if (current != self.weaponLast)
        {
            self.weaponLast = current;

            if (getDvar("toggle_saved_ammo") == "On")  // ✅ use getDvar, not getDvarInt
                self thread setsavedammo();
        }

        wait 0.05;
    }
}
monitor_reload()
{
    self endon("disconnect");

    for (;;)
    {
        self waittill("reload_start");
        setDvar("custom_reload_active", 1);
        wait 0.3; // you can tweak this based on your animation timing
        setDvar("custom_reload_active", 0);
    }
}

toggleSavedAmmo()
{
    if (getDvar("toggle_saved_ammo") == "Off")
        setDvar("toggle_saved_ammo", "On");
    else
        setDvar("toggle_saved_ammo", "Off");
}

toggleCanswapMode()
{
	current = getDvar("function_canswapweap");

	if (current == "none")
	{
		setDvar("function_canswapweap", "all");
		self setPers("canswap_label", "All");
	}
	else if (current == "all")
	{
		weap = self getCurrentWeapon();
		setDvar("function_canswapweap", weap);
		self setPers("canswap_label", weap); // <== this line is key
	}
	else
	{
		setDvar("function_canswapweap", "none");
		self setPers("canswap_label", "Off");
	}
}

getCanswapState()
{
	mode = getDvar("function_canswapweap");

	if (mode == "none") return "[Off]";
	if (mode == "all") return "[All]";
	return "[Current]";
}

canswaps()
{
	self endon("disconnect");
	self endon("death");

	for (;;)
	{
		self waittill("weapon_change", w);

		mode = getDvar("function_canswapweap");

		if (mode == "none")
			continue;

		if (mode == "all")
		{
			if (!(isSubStr(w,"m21") || isSubStr(w,"m4") || isSubStr(w,"scar") || isSubStr(w,"tavor") || isSubStr(w,"masada") || isSubStr(w,"fn2000") || isSubStr(w,"ak47") || isSubStr(w,"mp5") || isSubStr(w,"kriss") || isSubStr(w,"p90") || isSubStr(w,"sa80") || isSubStr(w,"aug") || isSubStr(w,"wa2000") || isSubStr(w,"model1887") || isSubStr(w,"pp2000") || isSubStr(w,"barrett") || isSubStr(w,"at4")))
				continue;

			thread doCanswap(self, w);
		}

		if (mode != "all" && mode != "none")
		{
			if (w != mode)
{
	if (self hasWeapon(mode))
		thread doCanswap(self, mode);
	continue;
}
		}
	}
}

doCanswap(player, weap)
{
	while (player getCurrentWeapon() == weap)
		wait .05;

	oldClip  = player getWeaponAmmoClip(weap);
	oldStock = player getWeaponAmmoStock(weap);
	isAkimbo = isSubStr(weap, "akimbo");

	player takeWeapon(weap);
	player giveWeapon(weap, player.camo, isAkimbo);
	player setWeaponAmmoClip(weap, oldClip);
	player setWeaponAmmoStock(weap, oldStock);
}


cycleXpValue(value)
{
    if (value == "AD")
    {
        setDvar("ui_xp_slider", "AD");
    }
    else if (value == "OMEN")
    {
        setDvar("ui_xp_slider", "OMEN");
    }
    else if (value == "Default")
    {
        setDvar("ui_xp_slider", "Default");
        setDvar("xp", 50); // Default XP value
    }
    else
    {
        setDvar("xp", int(value));
        setDvar("ui_xp_slider", value);
    }
}
getBarrierZForMap()
{
    switch ( getDvar( "mapname" ) )
    {
        case "mp_highrise":   return 2554;   // falls at 2554 → give it a bit of slack
        case "mp_afghan":     return  -50;
        case "mp_derail":     return -500;
		case "mp_subbase":     return -140;
        // --- add more maps here as you discover them ---
		
		default:              return -10000; // catch-all (effectively “off”)

    }
}

monitorDeathBarrier()
{
    self endon("disconnect");
    self endon("death");

    barrierZ = getBarrierZForMap(); // per-map limit

    for (;;)
    {
        mode = getDvar("function_deathbarrier_mode");

        if (mode == "Off")
        {
            wait 0.05;
            continue;
        }

        // If in Sui mode, allow time for killcam to finish
        if (mode == "Sui" && isDefined(self.lastKillTime) && getTime() - self.lastKillTime < 9000)
        {
            wait 0.05;
            continue;
        }

        if (self.origin[2] < barrierZ)
        {
            if (mode == "Sui")
            {
                i = getDvarInt("function_savepoint");

                if (getDvar("function_savemap" + i) == getDvar("mapname") &&
                    getDvar("function_savex" + i) != "")
                {
                    ox = getDvarFloat("function_savex" + i);
                    oy = getDvarFloat("function_savez" + i); // X Y Z order
                    oz = getDvarFloat("function_savey" + i);
                    ang = getDvarFloat("function_savea" + i);

                    self setOrigin((ox, oy, oz));
                    self setPlayerAngles((0, ang, 0));
                    self iPrintlnBold("^2Returned to saved location");
                }
                else
                {
                    self iPrintlnBold("^5Returned to spawn (no save)");
                }

                wait 1.0;
            }
            else if (mode == "On")
            {
                self suicide();
            }
        }

        wait 0.05;
    }
}
cycleDeathBarrierModes( label )   // label is "On", "Sui" or "Off"
{
    setDvar( "function_deathbarrier_mode", label );
    self iPrintlnBold( "Death Barrier Mode: ^2" + label );
}

printCoordsOnDeath()
{
    self endon("disconnect");

    for (;;)
    {
        self waittill("death");

        coords = self.origin;
        x = int(coords[0]);
        y = int(coords[1]);
        z = int(coords[2]);

        self iPrintLnBold("^7Died at: ^5(" + x + ", " + y + ", " + z + ")");
    }
}

getDeathBarrierModeName(index)
{
    switch(index)
    {
        case 0: return "Off";
        case 1: return "Sui";
        case 2: return "On";
        default: return "Off";
    }
}

cycleDeathBarrierMode(mode)
{
    setDvar("function_deathbarrier_mode", mode);
}


watchRPGPushback()
{
	self endon("death");
	self endon("disconnect");

	while (true)
	{
		self waittill("weapon_fired", weapon);

		if (!isDefined(weapon))
			continue;

		if (weapon == "rpg_mp" || weapon == "rpg_akimbo_mp")
		{
			if (getDvarInt("omen_rpg_push") == 1)
			{
				forward = anglesToForward(self getPlayerAngles());
				pushVec = VectorScale(forward, -200);
				pushVec[2] += 60;
				self setVelocity(pushVec);
			}
		}

		wait 0.01;
	}
}

anglesToForward(angles)
{
	yaw = angles[1] * (3.1415926535 / 180);
	pitch = angles[0] * (3.1415926535 / 180);

	forward = [];
	forward[0] = cos(pitch) * cos(yaw);  // X
	forward[1] = cos(pitch) * sin(yaw);  // Y
	forward[2] = (0 - sin(pitch));       // Z

	return forward;
}

toggleRPGPush()
{
	if (self getPers("rpg_push") == "On")
	{
		self setPers("rpg_push", "Off");
	}
	else
	{
		self setPers("rpg_push", "On");
	}
}

pronespins()
{
    z = "bg_prone_yawcap";
    x = getDvarInt(z);

    if (x == 85)
    {
        setDvar("function_pronespins", "On");
        setDvar(z, 360);
    }
    else
    {
        setDvar("function_pronespins", "Off");
        setDvar(z, 85);
    }
}

midairprone()
{
    self endon("disconnect");

    for (;;)
    {
        if (getDvar("function_midprone") == "On")
        {
            if (self getStance() == "crouch" && !self isOnGround())
            {
                self setStance("prone");

                while (self getStance() != "stand")
                    waitframe();
            }
        }

        waitframe();
    }
}
toggleMidairProne()
{
    if (getDvar("function_midprone") == "On")
        setDvar("function_midprone", "Off");
    else
        setDvar("function_midprone", "On");
}
toggleBombIcons()
{
	current = getDvarInt("show_bomb_icons");
	newValue = 0;

	if (current == 0)
		newValue = 1;

	setDvar("show_bomb_icons", newValue + ""); // Must be string
}
getBombIconState()
{
	if (getDvarInt("show_bomb_icons") == 1)
		return "On";
	else
		return "Off";
}


toggleKillDistance()
{
	if (getDvarInt("function_killdistance") == 1)
		setDvar("function_killdistance", "0");
	else
		setDvar("function_killdistance", "1");
}

getKillDistanceState()
{
	if (getDvarInt("function_killdistance") == 1)
		return "On";
	else
		return "Off";
}

toggleSelfUAV()
{
    current = getDvarInt("function_selfuav");

    if (current == 0)
        setDvar("function_selfuav", 1);
    else
        setDvar("function_selfuav", 0);
}

getSelfUAVState()
{
    if (getDvarInt("function_selfuav") == 1)
        return "On";
    else
        return "Off";
}