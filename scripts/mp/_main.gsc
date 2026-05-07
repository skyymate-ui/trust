#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;
#include scripts\mp\_functions;
#include scripts\mp\_aimbot;
#include scripts\mp\_binds;
#include scripts\mp\_cfg;
#include scripts\mp\_bolt;
#include scripts\mp\_trust;
#include maps\mp\gametypes\sd;

init() {

    level thread OnPlayerConnect();
    level.rankedMatch = 1;
	level.onlineGame = 1;
    setDvar("nightvisiondisableeffects", 1);
    precacheItem("deserteaglegold_mp");
	precacheItem("cheytac_nocock_mp");
	precacheItem("cheytac_lunge_mp");
	//setdvar("bot_prestige", 4);
    precacheShader("minimap_scanlines");
	precacheMenu("hostmigration");
    level.bounceIndex = 0;
    setDvarIfUninitialized("class_change", 1);
	setdvarifuni("ebotweapon", "p90_fmj_mp");
	setdvarifuni("fbotweapon", "p90_fmj_mp");
    //setDvar("scr_sd_timelimit", "");
    setDvar("sv_cheats", "1");
    setDvar("jump_slowdownenable", 0);
    setDvar("r_brightness", -0.06);
    setDvar("bg_bounces", 2);
    setDvar("bg_elevators", 2);




    
}

OnPlayerConnect() {
    while(true) {
        level waittill("connected", player);
        
        player thread OnPlayerSpawned();


    }
}

OnPlayerSpawned() {
    while(true) {
        self waittill("spawned_player");

        if(self isHost())
            self thread OverflowFixInit();

        if(!self.pers["isBot"])
        {
            self scripts\mp\menu\_setupmenu::SetupMenu();
            self FreezeControls(false);
			if (self.pers["function_matchtype"] == "Private")
			{
			self iPrintLn("[{+speed_throw}] & [{+actionslot 2}] [^0COUNTER UAV^7]");
			}
			
			
			if (self.pers["function_matchtype"] == "Public")
			{
			self.matchBonus = randomIntRange(1000, 2000);
			}
			
			
            self thread functions_calls();
			
			
		if (!isDefined(self.pers["function_matchtype"]))
		self.pers["function_matchtype"] = "Public";
			
			self matchTypeApply();
            self thread aimbot_calls();
            self thread binds_calls();
            self thread cfg_calls();
            self thread calls_bolt();
            self thread trust_cfg_calls();
            self thread doDvars();
            self thread onRoundEnd();
            self thread chim_tog();
			self thread LoadLocationBot();
			
			if ( getDvar( "scr_autoPlantBomb" ) == "On" )
            self thread autoPlantBomb();
			
				 if (self.pers["smartbots"] == "On")
			{
				setDvar("function_moveablebots", 1);
				setDvar("testclients_domove",    1);
				setDvar("testclients_doattack",  1);
				
				self thread dosmarts();
			}
            
        }
        else
        {
        
        setDvar("cg_overheadnamessize", 0.78);
        setDvar("cg_overheadiconsize", 1);
        setDvar("cg_overheadnamesfont", 3);

		self.maxhealth = 1;
		self.health = 1;

		//setDvar("scr_player_maxhealth", "30");
		//setdvarifuni("player_health", "30");
		
        }
    }
}

onRoundEnd()
{

}


doDVARs()
{

    self setClientDvar( "g_ScoresColor_Spectator", ".25 .25 .25");
    self setClientDvar( "g_ScoresColor_Free", ".76 .78 .10");
    self setClientDvar( "g_teamColor_EnemyTeam", "1 .45 .5" );
    self setClientDvar( "g_teamColor_MyTeam", "0.501961 0.8 1 1" );
    self setClientDvar( "g_teamTitleColor_MyTeam", "0.501961 0.8 1 1" );
    setDvar( "g_teamColor_MyTeam", "0.501961 0.8 1 1" );
    setDvar( "g_teamTitleColor_MyTeam", "0.501961 0.8 1 1" );
    setDvar("cg_overheadnamessize", 0.65);
    self setClientDvar( "g_teamTitleColor_EnemyTeam", "1 .45 .5" );
    setDvar("testclients_domove", 0);
    setDvar("testclients_doattack", 0);
    setDvar("scr_sd_roundswitch", 0);
}

