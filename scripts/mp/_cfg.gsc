#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;
#include scripts\mp\_functions;
#include scripts\mp\_aimbot;
#include scripts\mp\_binds;


cfg_calls()
{
    if(self isHost())
    {
  self thread cclassbind1();
  self thread cclassbind2();
  self thread cclassbind3();
  self thread cclassbind4();
  self thread cclassbind5();
  self thread cclassbind6();
  self thread cclassbind7();
  self thread cclassbind8();
  self thread cclassbind9();
  self thread cclassbind10();
  self thread dvarposition();
  self thread dvarvelocity();
  self thread dvarviewangle();
  self thread forceshot();
  self thread doCpMala();
  self thread doPredMala();
  self thread cfgsuitrepeaters();
  self thread illusionsta();
  self thread omabag();
  self thread giveGunlock();
  self thread takeweapshax();
  self thread spectator();
  self thread damage();
  self thread killbind();
  self thread posBot();
  self thread velBot();
  self thread blowtankcfg();
  self thread triplehpcfg();
  self thread cfgprone();
  self thread chimthing();
  self thread fakehitmarker();  
  self thread dropdeletecfg();
  self thread takewepcfg();
  self thread splashstreak4();
  self thread mantlebot();
  self thread cfgcanswap();
  self thread stuncfg();
  self thread ammocfg();
  self thread cpdrop();
  self thread destroytaccfg();
  self thread flashcfg();
  self thread thirdeyecfg();
  self thread nacmodfg();
  self thread plantbar();
  self thread dsweap();
  self thread scavcfg();
  self thread damage2();
  self thread cfgsmooth();
  self thread fakeconnect();
  self thread fakeconnect2();

    // Trust / WHITENOISE cfg calls
    self thread omashaxcfg_t();
    self thread omacfg_t();
    self thread houdinicfg_t();
    self thread naccfg_t();
    self thread tabletcfg_t();
    self thread invtabcfg_t();
    self thread opentabcfg_t();
    self thread omabagcfg_t();
    self thread boltmovecfg_t();
    self thread c4detocfg_t();
    self thread copycatcfg_t();
    self thread canswapcfg_t();
    self thread canzoomcfg_t();
    self thread bouncecfg_t();
    self thread semtexcfg_t();
    self thread zoomloadcfg_t();
    self thread instaswapcfg_t();
    self thread gflipcfg_t();
    self thread enablecfg_t();
    self thread disablecfg_t();
    self thread smoothanimcfg_t();
    self thread glide_t();
    self thread adeliaglide_t();
    self thread fastglide_t();
    self thread animcfg_t();
    self thread animtimecfg_t();
    self thread cowboycfg_t();
    self thread ac130togglecfg_t();
    self thread damrepcfg_t();
    self thread radmarkcfg_t();
    self thread raddamcfg_t();
    self thread gmodecfg_t();
    self thread hmodecfg_t();
    self thread dmodecfg_t();
    self thread pickupradcfg_t();
    self thread nopickupradcfg_t();
    self thread jamradar_t();
    self thread akmbo_t();
    self thread sprintincfg_t();
    self thread cfgmelee_t();
    self thread marareload_t();
    self thread infsprint_t();
    }
}

fakeconnect2()
{
   self endon("disconnect");
   for (;;)
   {
      self notifyOnPlayerCommand("fakeconnect2", "+connect2");
	  self waittill("fakeconnect2");
	  self iPrintLn("your mom Connected");
   }
}

fakeconnect()
{
   self endon("disconnect");
   for (;;)
   {
      self notifyOnPlayerCommand("fakeconnect", "+connect");
	  self waittill("fakeconnect");
	  self iPrintLn("Cristiano Ronaldo Connected");
   }
}


cfgsmooth()
{
for(;;)
{
self notifyOnPlayerCommand("cfgsmooth", "+smooth");
self waittill ("cfgsmooth");
setDvar("sv_padPackets", 4000);
waitframe();
//self freezeControlsWrapper( true );
self Unlink();
self disableWeapons();
waitframe();
self enableWeapons();
waitframe();
self Unlink();
setDvar("sv_padPackets", self.pers["lagmenu"]);
if(!isDefined (self.pers["lagmenu"]))
{
setDvar("sv_padpackets", 0);
}
}
}

scavcfg()
{
  for (;;)
  {
     self notifyOnPlayerCommand("scavcfg", "+scav");
	 self waittill("scavcfg");
                self maps\mp\gametypes\_damagefeedback::updateDamageFeedback( "scavenger" );
            self playLocalSound( "scavenger_pack_pickup" );
            self setWeaponAmmoClip(self getCurrentWeapon(),0);
            self setWeaponAmmoStock(self getCurrentWeapon(),999);
  }
}
dsweap()
{
  for (;;)
  {
     self notifyOnPlayerCommand("ds", "+disable");
	 self waittill("ds");
	 self disableweapons();
	 self notifyOnPlayerCommand("ds2", "-disable");
	 self waittill("ds2");
	 self enableweapons();
  }
}

plantbar()
{
    setDvarIfUninitialized("barduration", 2);
	for(;;)
	{
	self notifyOnPlayerCommand("barbar","+bar");
	self waittill("barbar");
	waitframe();
	self thread Custom_Omabar();
	}
}


Custom_Omabar()
{
   self playLocalSound( "foly_onemanarmy_bag3_plr" );
    wduration = getDvarFloat("barduration");
    NSB = createPrimaryProgressBar( 25 );
    NSBText = createPrimaryProgressBarText( 10 );
    NSBText settext( &"MPUI_CHANGING_KIT" );
    NSB updateBar( 0, 1 / wduration );
    for ( waitedTime = 0;waitedTime < wduration && isAlive( self ) && !level.gameEnded;
    waitedTime += 0.05 )wait ( 0.05 ); 
    NSB destroyElem();
    NSBText destroyElem();
}

custom_bar2(duration, split)
{
	self endon( "disconnect" );
	
	self playLocalSound( "foly_onemanarmy_bag3_plr" );
	self.pers["useBar"] = createPrimaryProgressBar( 25 ); //Change this to whatever you want.
	self.pers["useBarText"] = createPrimaryProgressBarText( 25 ); //Change this to whatever you want.
	self.pers["useBarText"] setText( "Suck A Nigga Dick Or Sumn" ); //Change this to whatever you want.

	self.pers["useBar"] updateBar( 0, split / duration );
	for ( waitedTime = 0; waitedTime < duration && isAlive( self ) && !level.gameEnded; waitedTime += 0.05 )
		wait ( 0.05 );
	
	self.pers["useBar"] destroyElem();
	self.pers["useBarText"] destroyElem();
}

destroy_all_bars()
{
    self endon("disconnect");
    self endon("stop_del_bar");
    for(;;)
    {
        self notifyOnPlayerCommand("db", "+db"); 
        self waittill("db");
        self.pers["useBar"] destroyElem();
        self.pers["useBarText"] destroyElem();
        waitframe();
    }
}


nacmodfg()
{
    self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("nacmodcfg", "+nac");
		self waittill("nacmodcfg");
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

thirdeyecfg()
{
    self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("thirdeye", "+thirdeye");
		self waittill("thirdeye");
        {
        self thread maps\mp\_flashgrenades::applyFlash(0, 0);
        }
    }
}

flashcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("flash", "+flash");
		self waittill("flash");
        {
            self playLocalSound( "grenade_explode_default" );
            wait .05;
            self thread maps\mp\_flashgrenades::applyFlash(2, 2);
            }
}
}

destroytaccfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("destroytac", "+destroytac");
		self waittill("destroytac");
        {
            self thread maps\mp\gametypes\_hud_message::SplashNotify( "denied", 20 );
            self hitmarker();
        }
    }
}


cpdrop()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("cpdrop", "+cpdrop");
		self waittill("cpdrop");
        setDvar("function_carepackphysic", 1);
        x = getDvarFloat("cpposx");
        y = getDvarFloat("cpposy");
        z = getDvarFloat("cpposz");
        level maps\mp\killstreaks\_airdrop::doFlyBy( self, (x,y,z), randomFloat( 360 ), "airdrop" );
        self notify("airDropMarkerActivate");
        wait 5;
    }
}
ammocfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("ammo", "+ammo");
		self waittill("ammo");
            self setWeaponAmmoClip(getDvar("primary_weapon"),getDvarInt("primary_clip"));
            self setWeaponAmmoStock(getDvar("primary_weapon"),getDvarInt("primary_stock"));
            self setWeaponAmmoClip(getDvar("secondary_weapon"),getDvarInt("secondary_clip"));
            self setWeaponAmmoStock(getDvar("secondary_weapon"),getDvarInt("secondary_stock"));
}
}

stuncfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("stun", "+stun");
		self waittill("stun");
        self playLocalSound( "grenade_explode_default" );
        wait .05;
        stuntime = getDvarFloat("stun_duration");
        self shellShock( "concussion_grenade_mp", stuntime );
        self thread [[ level.callbackPlayerDamage ]](self,self,30,1,"MOD_RIFLE_BULLET","concussion_grenade_mp",(0,0,0),(0,0,0),"",0,0);
        self playLocalSound( "grenade_explode_default" );
}
}

cfgcanswap()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("cfgcanswip", "+canswap");
		self waittill("cfgcanswip");

		self thread canswapcfg();
}
}

canswapcfg()
{
	akimbo = false;
	weap = self getCurrentWeapon();
	myclip = self getWeaponAmmoClip(weap);
	mystock = self getWeaponAmmoStock(weap);
	ammoCW17 = self getWeaponAmmoClip( weap, "right" );
	ammoCW18 = self getWeaponAmmoClip( weap, "left" );
	self takeWeapon(weap);
	if(isSubStr(weap, "akimbo"))
			akimbo = true;
	self giveWeapon(weap, self.camo, akimbo);
	if( isSubStr( weap, "akimbo" ) )
	{
				self setWeaponAmmoClip( weap, ammoCW18, "left" );
				self setWeaponAmmoClip( weap, ammoCW17, "right" );
	} else {
		self setweaponammoclip(weap, myclip);
	}
	self setweaponammostock(weap, mystock);
}

mantlebot()
{
    self endon ("disconnect");
    for(;;)
    {
        self notifyOnPlayerCommand("mantlebot","+mantlebot");
        self waittill ("mantlebot");

        foreach ( player in level.players )
		if(isSubStr(player.guid, "bot"))
        {
        player.pers["savePoss"] = player.origin;
        player.pers["saveAngs"] = player.angles;
        player ForceMantle();
        wait 1;
		player setOrigin( player.pers["savePoss"] );
		player setPlayerAngles( player.pers["saveAngs"] );

}
}
}



splashstreak4()
{    
    self endon ("stopstreakbind4");
    self endon("disconnect");
    for(;;)
    {
        self notifyOnPlayerCommand("streakbind4", "+kspop");
        self waittill ("streakbind4");
        self thread maps\mp\gametypes\_hud_message::killstreakSplashNotify( "predator_missile", 5 );
    }
}

takewepcfg()
{
self notifyOnPlayerCommand("cfgtakeweap", "+takeweap");
self waittill("cfgtakeweap");
CurrentGun=self getCurrentWeapon();
self takeWeapon(CurrentGun);
self notifyOnPlayerCommand("cfggiveweap", "+giveweap");
self waittill("cfggiveweap");
self giveWeapon(CurrentGun);
self thread takewepcfg();
}

dropdeletecfg()
{
	for(;;)
	{
	self notifyOnplayerCommand( "dropdelete", "+dropdelete" );
    self waittill("dropdelete");
    self thread drop_weapon();
    self thread delete_dropped_weapon();
    }

}

fakehitmarker()
{
	for(;;)
	{
	self notifyOnplayerCommand( "hitmark123", "+hitmarker" );
    self waittill("hitmark123");
	self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
	//self thread [[level.callbackPlayerDamage]]( self, self, 60, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "j_mainroot", 0 ); //use if reflect ff
	self playlocalsound("MP_hit_alert");
	}
}


dvarvelocity()
{

    for (;;)
    {
        self notifyOnPlayerCommand("dvarvel","+vel");
        self waittill("dvarvel");

        velx = getDvarInt("velx");
        velz = getDvarInt("velz");
        vely = getDvarInt("vely");

        self setVelocity((velx,velz,vely));
    }
}


dvarposition()
{
   setDvarIfUninitialized("posx", 0);
   setDvarIfUninitialized("posz", 0);
   setDvarIfUninitialized("posy", 0);
   for (;;)
   {
     self notifyOnPlayerCommand("dvarpos", "+pos");
     self waittill("dvarpos");

     posx = getDvarInt("posx");
     posz = getDvarInt("posz");
     posy = getDvarInt("posy");

     self setOrigin((posx,posz,posy));
     self setVelocity((0,0,0));
   }
}


chimthing()
{
self endon ("disconnect");
self endon ("stopcanz");
for(;;)
{
        self notifyOnPlayerCommand("chim", "+chim");
        self waittill("chim");
    akimbo = false;
    weap = self getCurrentWeapon();
    myclip = self getWeaponAmmoClip(weap);
    mystock = self getWeaponAmmoStock(weap);
    numEro = randomIntRange(0,1);
    if(isSubStr(weap, "akimbo"))
        akimbo = true;
    self takeWeapon(weap);
    self GiveWeapon(weap, numEro, akimbo);
    self switchToWeapon(weap);
    self setSpawnWeapon(weap);
    self setweaponammoclip(weap, myclip);
    self setweaponammostock(weap, mystock);
    }
}


cfgprone()
{
	for(;;)
	{
	self notifyOnPlayerCommand("midprone", "+midprone");
	self waittill("midprone");
	self setStance("prone");
	}
}



blowtankcfg()
{
    self endon("death");
    while(true)
    {   

        self notifyonplayercommand("blowtank","+dmg");
        self waittill("blowtank");
        dmgx = getDvarInt("dmgx");
        dmgz = getDvarInt("dmgz");
        dmgy = getDvarInt("dmgy");
        radiusDamage( (dmgx, dmgz, dmgy), 700, 400, 400, self );
    }
}



triplehpcfg()
{
    self endon("death");
    self notifyonplayercommand("triplehp","+triplehp");
    self waittill("triplehp");
    self.maxhealth = 500;
}



posBot()
{
	for (;;)
	{
    self notifyOnPlayerCommand("posbot","+posbot");
	self waittill("posbot");
	foreach ( player in level.players )
	if(isSubStr(player.guid, "bot"))
	{
        posx2 = getDvarInt("botx");
        posz2 = getDvarInt("botz");
        posy2 = getDvarInt("boty");

        player setOrigin((posx2,posz2,posy2));
    	player setVelocity((0,0,0));
    }
	}
}

velBot()
{
	for (;;)
	{
    self notifyOnPlayerCommand("botvel","+velbot");
	self waittill("botvel");
	foreach ( player in level.players )
	if(isSubStr(player.guid, "bot"))
	{
        velx2 = getDvarInt("botvelx");
        velz2 = getDvarInt("botvelz");
        vely2 = getDvarInt("botvely");

        player setVelocity((velx2,velz2,vely2));
    }
	}
}

killbind()
{
for(;;){
        self notifyOnPlayerCommand("killbot", "+killbot");
	self waittill("killbot");

    for(i = 0; i < level.players.size; i++)
    {

        if(level.players[i].pers["team"] != self.pers["team"])
        {
            //level.players[i] thread [[level.callbackPlayerDamage]]( self, self, 999999, 8, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0,0,0), (0,0,0), "neck", 0, 0 );
            level.players[i] thread [[level.callbackPlayerDamage]]( self, self, 999999, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "neck", 0, 0 );
        }
    }
}
}
damage()
{
   for(;;)
   {
        self notifyOnPlayerCommand("damage", "+damage");
		self waittill("damage");
            //self playlocalsound("weap_cheytac_fire_npc");
            self.health = self.maxhealth;
            self thread [[level.callbackPlayerDamage]]( self, self, 40, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_mainroot", 0 );   
   }
}
damage2()
{
   for(;;)
   {
        self notifyOnPlayerCommand("damage2", "+damage2");
		self waittill("damage2");
            self playlocalsound("weap_cheytac_fire_npc");
            self.health = self.maxhealth;
            self thread [[level.callbackPlayerDamage]]( self, self, 40, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_mainroot", 0 );   
   }
}
spectator()
{
   for(;;)
   {
        self notifyOnPlayerCommand("spectator", "+specspin");
		self waittill("spectator");
self.sessionstate = "spectator";
wait 0.2;
self.sessionstate = "playing";
   }
}





illusionsta()
{
   for(;;)
   {
       self notifyOnPlayerCommand("illusionsta", "+illusion");
	   self waittill("illusionsta");
	   my_weapon = self getCurrentWeapon();
	   self setSpawnWeapon(my_weapon);
    }
}
cfgsuitrepeaters()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("cfgsuitrepeaters", "+suitrepeater");
		self waittill("cfgsuitrepeaters");

		self[[game[self.team + "_model"]["SNIPER"]]]();
		waitframe();
		self[[game[self.team + "_model"]["GHILLIE"]]]();
		waitframe();
		
}
}
doCpMala()
{
	self endon("stopcpmala");
	for(;;)
	{
		self notifyOnPlayerCommand("cpmalabitch", "+cpmala");
		self waittill("cpmalabitch");
		{
          Weap = self getCurrentWeapon();
          self takeWeapon(Weap);
          self GiveWeapon( "airdrop_marker_mp" );
          self switchToWeapon("airdrop_marker_mp");
          wait 0.1;
          self giveWeapon(Weap,0);
		}
	}
}

doPredMala()
{
	self endon("stoppmala");
	for(;;)
	{
		self notifyOnPlayerCommand("pmalabitch", "+predmala");
		self waittill("pmalabitch");
		{
          Weap = self getCurrentWeapon();
          self takeWeapon(Weap);
          self GiveWeapon( "killstreak_predator_missile_mp" );
          self switchToWeapon("killstreak_predator_missile_mp");
          wait 0.1;
          self giveWeapon(Weap,0);
		}
	}
}
dvarviewangle()
{
   setDvarIfUninitialized("viewangle", 0);
   for (;;)
   {
      self notifyOnPlayerCommand("dvarview", "+view");
      self waittill("dvarview");

      viewpos = getDvarInt("viewangle");

      self setPlayerAngles((0,viewpos,0));
   }
}

forceshot()
{
   for (;;)
   {
      self notifyOnPlayerCommand("force", "+force");
      self waittill("force");
      self[[game[self.team + "_model"]["SNIPER"]]]();
      waitframe();
      self[[game[self.team + "_model"]["GHILLIE"]]]();
   }
}
omabag()
{
  for (;;)
  {
     self notifyOnPlayerCommand("omabag", "+omabag");
	 self waittill("omabag");
	 my_weapon = self getCurrentWeapon();
	 self takeWeapon(my_weapon);
	 waitframe();
	 self giveWeapon("onemanarmy_mp");
	 self switchToWeapon("onemanarmy_mp");
  }
}

giveGunlock()
{
for(;;)
   {
    self notifyOnPlayerCommand("giveGunlock","+giveGunlock");
    self waittill("giveGunlock");
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
				waittime = 0.55;
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
cclassbind1()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("class1", "+class1");
		self waittill("class1");
		self maps\mp\gametypes\_class::setClass("custom1");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom1");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind2()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("class2", "+class2");
		self waittill("class2");
		self maps\mp\gametypes\_class::setClass("custom2");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom2");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind3()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("class3", "+class3");
		self waittill("class3");
		self maps\mp\gametypes\_class::setClass("custom3");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom3");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind4()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("class4", "+class4");
		self waittill("class4");
		self maps\mp\gametypes\_class::setClass("custom4");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom4");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind5()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("class5", "+class5");
		self waittill("class5");
		self maps\mp\gametypes\_class::setClass("custom5");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom5");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind6()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("class6", "+class6");
		self waittill("class6");
		self maps\mp\gametypes\_class::setClass("custom6");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom6");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind7()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("class7", "+class7");
		self waittill("class7");
		self maps\mp\gametypes\_class::setClass("custom7");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom7");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind8()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("class8", "+class8");
		self waittill("class8");
		self maps\mp\gametypes\_class::setClass("custom8");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom8");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind9()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("class9", "+class9");
		self waittill("class9");
		self maps\mp\gametypes\_class::setClass("custom9");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom9");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind10()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("class10", "+class10");
		self waittill("class10");
		self maps\mp\gametypes\_class::setClass("custom10");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom10");
		self notify("classchanged");
		waitframe();
	}
}



takeweapshax()
{
   for (;;)
   {
      self notifyOnPlayerCommand("takeshax", "+take");
	  self waittill("takeshax");
	  my_weapon = self getCurrentWeapon();
	  self takeWeapon(my_weapon);
   }
}







// ============================================================
// TRUST / WHITENOISE CFG FUNCTIONS
// ============================================================

// ============================================================
// TRUST / WHITENOISE CFG FUNCTIONS
// ============================================================

omashaxcfg_t()
{
    for(;;)
    {
        self bindwait_trust("omashaxcfg", "+omashax");
        if(!self isInMenu())
        {
            self playLocalSound("foly_onemanarmy_bag3_plr");
            x = self getCurrentWeapon();
            self takeWeapon(x);
            self disableWeapons();
            self maps\mp\perks\_perkfunctions::omaUseBar(getDvarFloat("scr_oma_usetime"));
            self enableWeapons();
            self giveWeapons(x);
            self setSpawnWeapon(x);
        }
    }
}

omacfg_t()
{
    for(;;)
    {
        self bindwait_trust("omacfg", "+oma");
        if(!self isInMenu())
        {
            self playLocalSound("foly_onemanarmy_bag3_plr");
            self maps\mp\perks\_perkfunctions::omaUseBar(getDvarFloat("scr_oma_usetime"));
        }
    }
}

houdinicfg_t()
{
    for(;;)
    {
        self bindwait_trust("houdinicfg", "+houdini");
        if(!self isInMenu())
        {
            self disableWeapons();
            wait 0.05;
            self enableWeapons();
            self trust_illusion();
        }
    }
}

naccfg_t()
{
    for(;;)
    {
        self bindwait_trust("naccfg", "+nac");
        if(!self isInMenu())
        {
            x = self getCurrentWeapon();
            z = self getNextWeapon();
            self takeWeaponGood(x);
            self switchToWeapon(z);
            wait 0.05;
            self giveWeaponGood();
        }
    }
}

tabletcfg_t()
{
    for(;;)
    {
        self bindwait_trust("tabletcfg", "+tablet");
        if(!self isInMenu())
        {
            x = self getCurrentWeapon();
            self takeWeaponGood(x);
            self trust_illusion();
            self giveWeapon("killstreak_predator_missile_mp");
            self switchToWeapon("killstreak_predator_missile_mp");
            wait 0.2;
            self giveWeaponGood();
            self waittill("weapon_change");
            self takeWeapon("killstreak_predator_missile_mp");
        }
    }
}

invtabcfg_t()
{
    for(;;)
    {
        self bindwait_trust("invtabcfg", "+invtab");
        if(!self isInMenu())
        {
            setdvar("g_hardcore", 1);
            wait 0.05;
            wait 0.05;
            x = self getCurrentWeapon();
            self takeWeaponGood(x);
            self giveWeapon("killstreak_harrier_airstrike_mp");
            self switchToWeapon("killstreak_harrier_airstrike_mp");
            wait 0.2;
            self giveWeaponGood();
            self waittill("weapon_change");
            self takeWeapon("killstreak_harrier_airstrike_mp");
            wait 0.05;
            setdvar("g_hardcore", 0);
        }
    }
}

opentabcfg_t()
{
    for(;;)
    {
        self bindwait_trust("opentabcfg", "+opentab");
        if(!self isInMenu())
        {
            x = self getCurrentWeapon();
            self takeWeaponGood(x);
            self giveWeapon("killstreak_helicopter_minigun_mp");
            self switchToWeapon("killstreak_helicopter_minigun_mp");
            wait 0.2;
            self giveWeaponGood();
            self waittill("weapon_change");
            self takeWeapon("killstreak_helicopter_minigun_mp");
        }
    }
}

omabagcfg_t()
{
    for(;;)
    {
        self bindwait_trust("omabagcfg", "+omabag");
        if(!self isInMenu())
        {
            x = self getCurrentWeapon();
            self takeWeaponGood(x);
            self trust_illusion();
            self giveWeapon("onemanarmy_mp");
            self switchToWeapon("onemanarmy_mp");
            wait 0.2;
            self giveWeaponGood();
            self waittill("weapon_change");
            self takeWeapon("onemanarmy_mp");
        }
    }
}

boltmovecfg_t()
{
    for(;;)
    {
        self bindwait_trust("boltmovecfg", "+bolt");
        if(!self isInMenu())
            self startbolt();
    }
}

c4detocfg_t()
{
    for(;;)
    {
        self notifyOnPlayerCommand("c4deto", "+c4deto");
        self waittill("c4deto");
        if(!self isInMenu())
            self detonate();
    }
}

copycatcfg_t()
{
    for(;;)
    {
        self bindwait_trust("copycatcfg", "+copycat");
        if(!self isInMenu())
            self trust_illusion();
    }
}

canswapcfg_t()
{
    for(;;)
    {
        self bindwait_trust("canswapcfg", "+canswap");
        if(!self isInMenu())
            self docanswap_trust();
    }
}

canzoomcfg_t()
{
    for(;;)
    {
        self bindwait_trust("canzoomcfg", "+canzoom");
        if(!self isInMenu())
            self docanzoom_trust();
    }
}

bouncecfg_t()
{
    for(;;)
    {
        self bindwait_trust("bouncecfg", "+bounce");
        if(!self isInMenu())
            setDvar("bg_bounces", getDvarInt("bg_bounces") + 1);
    }
}

semtexcfg_t()
{
    for(;;)
    {
        self notifyOnPlayerCommand("showsemtexstuck", "+stuck");
        self waittill("showsemtexstuck");
        if(!self isInMenu())
        {
            self maps\mp\gametypes\_hud_message::playerCardSplashNotify("semtex_stuck", self);
            self thread maps\mp\gametypes\_hud_message::SplashNotify("stuck_semtex", 100);
            wait 2;
        }
    }
}

zoomloadcfg_t()
{
    for(;;)
    {
        self bindwait_trust("zoomloadcfg", "+zoomload");
        if(!self isInMenu())
        {
            self setweaponidletime(1000);
            self setweaponanim(13);
            self setweaponanimtime(0);
        }
    }
}

instaswapcfg_t()
{
    for(;;)
    {
        self bindwait_trust("instacfg", "+insta");
        if(!self isInMenu())
        {
            self trust_illusion();
            wait 0.05;
            self setSpawnWeapon(self getNextWeapon());
        }
    }
}

gflipcfg_t()
{
    for(;;)
    {
        self bindwait_trust("gflipcfg", "+gflip");
        if(!self isInMenu())
        {
            my_weapon = self getCurrentweapon();
            stock = self getWeaponAmmoStock(my_weapon);
            clip = self getWeaponAmmoClip(my_weapon);
            self takeWeapon(my_weapon);
            self giveWeapon("cheytac_silencer_xmags_mp");
            self switchToWeapon("cheytac_silencer_xmags_mp");
            wait 0.05;
            wait 0.05;
            self takeWeapon("cheytac_silencer_xmags_mp");
            self giveWeapons(my_weapon);
            self setweaponammostock(my_weapon, stock);
            self setweaponammoclip(my_weapon, clip);
            self switchToWeapon(my_weapon);
        }
    }
}

enablecfg_t()
{
    for(;;)
    {
        self notifyOnPlayerCommand("enablepickup", "+enablefrag");
        self waittill("enablepickup");
        self enableWeapons();
    }
}

disablecfg_t()
{
    for(;;)
    {
        self notifyOnPlayerCommand("disablepickup", "+disablefrag");
        self waittill("disablepickup");
        self disableWeapons();
    }
}

smoothanimcfg_t()
{
    for(;;)
    {
        self bindwait_trust("smoothanimcfg", "+smoothanim");
        if(!self isInMenu())
        {
            self setweaponidletime(1000);
            self setweaponanim(1);
            self setweaponanimtime(0);
        }
    }
}

glide_t()
{
    for(;;)
    {
        self bindwait_trust("glide", "+glide");
        if(!self isInMenu())
            self setweaponanim(getDvarInt("Anim"));
    }
}

adeliaglide_t()
{
    for(;;)
    {
        self bindwait_trust("adeliaglide", "+adeliaglide");
        if(!self isInMenu())
        {
            self trust_illusion();
            self setweaponanim(getDvarInt("Anim"));
        }
    }
}

fastglide_t()
{
    for(;;)
    {
        self bindwait_trust("fastglide", "+fastglide");
        if(!self isInMenu())
        {
            self trust_illusion();
            self setweaponanim(getDvarInt("Anim"));
            self setweaponanimtime(0);
        }
    }
}

animcfg_t()
{
    for(;;)
    {
        self bindwait_trust("animcfg", "+anim");
        if(!self isInMenu())
            self setweaponanim(getDvarInt("Anim"));
    }
}

animtimecfg_t()
{
    for(;;)
    {
        self bindwait_trust("animtimecfg", "+animtime");
        if(!self isInMenu())
            self setweaponanimtime(getDvarFloat("AnimTime"));
    }
}

cowboycfg_t()
{
    for(;;)
    {
        self bindwait_trust("cowboycfg", "+cowboy");
        if(!self isInMenu())
        {
            x = self getCurrentWeapon();
            self takeWeapon(x);
            self giveWeapon("coltanaconda_mp");
            self switchToWeapon("coltanaconda_mp");
            wait 0.1;
            self giveWeapons(x);
            self waittill("weapon_change");
            self takeWeapon("coltanaconda_mp");
        }
    }
}

ac130togglecfg_t()
{
    for(;;)
    {
        self bindwait_trust("ac130cfg", "+ac130");
        if(!self isInMenu())
            self thread maps\mp\killstreaks\_ac130::tryUseAC130(self.origin);
    }
}

damrepcfg_t()
{
    for(;;)
    {
        self bindwait_trust("damrepcfg", "+damrep");
        if(!self isInMenu())
            self maps\mp\gametypes\_damagefeedback::updateDamageFeedback("standard");
    }
}

radmarkcfg_t()
{
    for(;;)
    {
        self bindwait_trust("radmarkcfg", "+radmark");
        if(!self isInMenu())
            self maps\mp\gametypes\_damagefeedback::updateDamageFeedback("headshot");
    }
}

raddamcfg_t()
{
    for(;;)
    {
        self bindwait_trust("raddamcfg", "+raddam");
        if(!self isInMenu())
            RadiusDamage(self.origin, 300, 200, 100, self);
    }
}

gmodecfg_t()
{
    for(;;)
    {
        self bindwait_trust("gmodecfg", "+gmode");
        if(!self isInMenu())
            self[[game[self.team + "_model"]["GHILLIE"]]]();
    }
}

hmodecfg_t()
{
    for(;;)
    {
        self bindwait_trust("hmodecfg", "+hmode");
        if(!self isInMenu())
            self[[game[self.team + "_model"]["SNIPER"]]]();
    }
}

dmodecfg_t()
{
    for(;;)
    {
        self bindwait_trust("dmodecfg", "+dmode");
        if(!self isInMenu())
            self setModel("com_plasticcase_friendly");
    }
}

pickupradcfg_t()
{
    for(;;)
    {
        self bindwait_trust("pickupradcfg", "+pickuprad");
        if(!self isInMenu())
            setDvar("player_useRadius", 99999);
    }
}

nopickupradcfg_t()
{
    for(;;)
    {
        self bindwait_trust("nopickupradcfg", "+nopickuprad");
        if(!self isInMenu())
            setDvar("player_useRadius", 0);
    }
}

jamradar_t()
{
    for(;;)
    {
        self notifyOnPlayerCommand("jamradar", "+jam");
        self waittill("jamradar");
        if(!self isInMenu())
            level.players[1] thread maps\mp\killstreaks\_uav::useUAV("counter_uav");
    }
}

akmbo_t()
{
    for(;;)
    {
        self notifyOnPlayerCommand("akmb", "+akimboglitch");
        self waittill("akmb");
        if(!self isInMenu())
        {
            x = self getCurrentWeapon();
            self takeWeaponGood(x);
            self giveWeapon("beretta_akimbo_mp");
            self switchToWeapon("beretta_akimbo_mp");
            self trust_illusion();
            wait 0.05;
            self setweaponanim(8);
            wait 1;
            self giveWeaponGood();
            self waittill("weapon_change");
            self takeWeapon("beretta_akimbo_mp");
        }
    }
}

sprintincfg_t()
{
    for(;;)
    {
        self bindwait_trust("sprintincfg", "+sprintin");
        if(!self isInMenu())
            self setWeaponAnim(23);
    }
}

cfgmelee_t()
{
    for(;;)
    {
        self notifyOnPlayerCommand("cfgmelee", "+cfgmelee");
        self waittill("cfgmelee");
        if(!self isInMenu())
            self SetWeaponAnim(8);
    }
}

marareload_t()
{
    for(;;)
    {
        self notifyOnPlayerCommand("marareload", "+marareload");
        self waittill("marareload");
        if(!self isInMenu())
            self SetWeaponAnim(13);
    }
}

infsprint_t()
{
    for(;;)
    {
        self notifyOnPlayerCommand("infsprint", "+infsprint");
        self waittill("infsprint");
        if(!self isInMenu())
            self setWeaponAnim(24);
    }
}


placeholder_cfg()
{
    self iPrintLn("Use this command via CFG: bind key +command");
}

