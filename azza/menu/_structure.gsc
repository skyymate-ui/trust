#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\perks\_perkfunctions;


#include azza\_util;
#include azza\menu\_utils;
#include azza\_functions;
#include azza\_aimbot;
#include azza\_binds;
#include azza\_presets;


Structure()
{
    self CreateMenu("AZZA", "exit");
    self AddOption("AZZA", "Misc", ::LoadMenu, undefined, "Misc");
    self AddOption("AZZA", "Teleport", ::LoadMenu, undefined, "Teleport");
    self AddOption("AZZA", "Aimbot", ::LoadMenu, undefined, "Aimbot");
    self AddOption("AZZA", "Binds", ::LoadMenu, undefined, "Binds");
    self AddOption("AZZA", "Weapon", ::LoadMenu, undefined, "Weapon");
    self AddOption("AZZA", "Killstreaks", ::LoadMenu, undefined, "Killstreaks");
    self AddOption("AZZA", "Game Profile", ::LoadMenu, undefined, "Game Profile");
    self AddOption("AZZA", "Game Settings", ::LoadMenu, undefined, "Game");
    self AddOption("AZZA", "Bots", ::LoadMenu, undefined, "Bots");
    self AddOption("AZZA", "Players", ::LoadMenu, undefined, "Players");
    self AddOption("AZZA", "CFG Commands", ::LoadMenu, undefined, "CFG List");

    self CreateMenu("Misc", "AZZA");
    self addOption("Misc", "UFO", ::noclipToggle, getPers("noclip"));
    self AddOption("Misc", "God Mode", ::godmode, getPers("god"));
    self addOption("Misc", "Killcam Timer", ::killcamTimer, getPers("killcamtimer"));
    self AddDvarSlider("Misc", "Killcam Length", undefined, "scr_killcam_time", 1, 10, 1);
    self AddOption("Misc", "Killcam Lag", ::KillcamLagTog, getDvar("function_killcamlag"));
    self AddOption("Misc", "Killcam Softland", ::KillcamSoftTog, getDvar("killcam_softland"));
    self AddOption("Misc", "Precam Softland", ::PrecamSoftTog, getDvar("function_precamsoft"));
    self AddOption("Misc", "Ammo Menu", ::LoadMenu, undefined, "Ammo Menu");
    self AddOption("Misc", "One Man Army Menu", ::LoadMenu, undefined, "One Man Army");
    self AddOption("Misc", "On Class Change", ::LoadMenu, undefined, "Class Change");
    self AddOption("Misc", "Overlays", ::LoadMenu, undefined, "Overlays");
    self AddOption("Misc", "Easy Ele", ::quickElev4, getPers("quickElev4"));
    self AddOption("Misc", "BO2 Instaswaps", ::instaswaps, getPers("instaswaps"));
    self addOption("Misc", "Unlimited Equipment", ::unlimknifetoggle, getPers("unlimitedeq"));
    self AddOption("Misc", "Good Nade", ::goodfrag1, getPers("goodnade"));
    self addOption("Misc", "Load Saved Game for: [^1" + getDvar("ui_mapname") + "^7]", ::presetload);

    self addoption("Misc", "Suicide", ::suicideTU6);


    self createMenu("Overlays", "Misc");
    self AddOption("Overlays", "Blue Screen", ::blueScreen, getPers("bluescreen"));
    self AddOption("Overlays", "Green Screen", ::greenScreen, getPers("greenscreen"));
    self AddOption("Overlays", "Red Screen", ::redScreen, getPers("redscreen"));
    self AddOption("Overlays", "Black Screen", ::BlackScreen, getPers("blackscreen"));

    self CreateMenu("Ammo Menu", "Misc");
    self AddOption("Ammo Menu", "Save Current Ammo", ::setammo);
    self AddOption("Ammo Menu", "Set Saved Ammo", ::setsavedammo);
    self AddBindSliders("Ammo Menu", "Set Ammo Bind", ::ammobind, "ammobind");
    self AddOption("Ammo Menu", "Primary: ", ::setammo, getDvar("primary_weapon"));
    self AddOption("Ammo Menu", "Clip: ", ::setammo, getDvar("primary_clip"));
    self AddOption("Ammo Menu", "Stock: ", ::setammo, getDvar("primary_stock"));
    self AddOption("Ammo Menu", "Secondary: ", ::setammo, getDvar("secondary_weapon"));
    self AddOption("Ammo Menu", "Clip: ", ::setammo, getDvar("secondary_clip"));
    self AddOption("Ammo Menu", "Stock: ", ::setammo, getDvar("secondary_stock"));

    self createMenu("One Man Army", "Misc");
    self AddDvarSlider("One Man Army", "One Man Army Charge Time", undefined, "scr_oma_usetime", 0, 10, 1);
    self AddOption("One Man Army", "One Man Army Nac", ::omaNac, getPers("omanac"));
    self AddOption("One Man Army", "One Man Army Sprint", ::omaSprint, getPers("omasprint"));
    self AddOption("One Man Army", "Sprint on Second Bar", ::omaSprintSecond, getPers("omasprintsecond"));
    self AddOption("One Man Army", "Double One Man Army", ::doubleOma, getPers("doubleoma"));


    self createMenu("Class Change", "Misc");
    self AddOption("Class Change", "Class Change Adelia", ::classchangeadelia, getPers("classchangeadelia"));
    self AddOption("Class Change", "Infinite Sprint", ::classinfsprint, getPers("classinfsprint"));
    self AddOption("Class Change", "Knife", ::classmelee, getPers("classmelee"));
    self AddOption("Class Change", "Lunge", ::classlunge, getPers("classlunge"));
    self AddOption("Class Change", "Drop Anim", ::classdrop, getPers("classdrop"));
    self AddOption("Class Change", "Canswap", ::classcanswap, getPers("classcanswap"));
    self AddOption("Class Change", "Max Ammo on Class Change", ::maxammotog, getPers("maxammo"));

    self createMenu("Fake Bounces", "Misc");
    self addOption("Fake Bounces", "Spawn Bounce", ::spawn_fake_bounce);
    self addOption("Fake Bounces", "Remove Bounces", ::delbounce);

    self CreateMenu("Teleport", "AZZA");
    self AddDvarSlider("Teleport", "Save Point:", undefined, "function_savepoint", 1, 5, 1);
    self AddOption("Teleport", "Save Location", ::savepos);
    self AddOption("Teleport", "Load Location", ::loadpos);
    self AddDvarSlider("Teleport", "Spawn Point:", undefined, "function_spawnsavepoint", 1, 5, 1);
    self AddBindSliders("Teleport", "Save Location Bind", ::saveLocBind, "saveloc");
    self AddBindSliders("Teleport", "Load Location Bind", ::loadLocBind, "loadloc"); 
    self AddOption("Teleport", "Custom Locations", ::LoadMenu, undefined, "Custom Locations");
    self createMenu("Custom Locations", "Teleport");
    switch(getDvar("ui_mapname"))
    {
        case "mp_afghan":
        self AddOption("Custom Locations", "Out of Map", ::customLocation, undefined, (4906, 2929, 100 ));
        self AddOption("Custom Locations", "Bunker", ::customLocation, undefined, (2391, -129, 230));
        self AddOption("Custom Locations", "need dis rn", ::customLocation, undefined, (1238.1, 1599.6, 507.1));
        self AddOption("Custom Locations", "Bunker Rock", ::customLocation, undefined, (1980.6, 184.7, 290));
        break;

        case "mp_favela":
        self AddOption("Custom Locations", "Spawn Building", ::customLocation, undefined, (920, 1359, 440));
        self AddOption("Custom Locations", "Construction Building", ::customLocation, undefined, (-1700, 727, 150));
        self AddOption("Custom Locations", "Wallbreach", ::customLocation, undefined, (624.061, 57.9295, 252.045));
        break;

        case "mp_highrise":
        self AddOption("Custom Locations", "Spawn Building", ::customLocation, undefined, (17, 6903, 3048));
        self AddOption("Custom Locations", "Under Helipad", ::customLocation, undefined, (-1482, 6015, 2650));
        self AddOption("Custom Locations", "Top of Roof", ::customLocation, undefined, (-2818, 5919, 3614));
        self AddOption("Custom Locations", "big bonz", ::customLocation, undefined, (-1469.6, 6068.1, 3160.3));
        break;

        case "mp_quarry":
        self AddOption("Custom Locations", "Ladder", ::customLocation, undefined, (-4025, -164.626, -115.618));
        self AddOption("Custom Locations", "Inside Building 1", ::customLocation, undefined, (-4186.42, -97, 289.225));
        self AddOption("Custom Locations", "Inside Building 2", ::customLocation, undefined, (-4966.2, -97, 289.225));
        self AddOption("Custom Locations", "Cp Elevator", ::customLocation, undefined, (-4129, -960, 80.5));
        self AddOption("Custom Locations", "Sideways Elevator", ::customLocation, undefined, (-2956, 1458, 100));
        self AddOption("Custom Locations", "Catwalk Headbounce Spot", ::customLocation, undefined, (-3940.2, 184.0, 97.9));
        break;

        case "mp_terminal":
        self AddOption("Custom Locations", "Front of plane", ::customLocation, undefined, (550, 4625, 250));
        self AddOption("Custom Locations", "Ladder", ::customLocation, undefined, (2223, 4233, 48));
        self AddOption("Custom Locations", "Sideways", ::customLocation, undefined, (1285, 4753, 300));
        self AddOption("Custom Locations", "Book Store", ::customLocation, undefined, (1195.26, 4799, 233.167));
        self AddOption("Custom Locations", "Inside Spawn", ::customLocation, undefined, (-187.53, 5535, 369.163));
        break;

        case "mp_checkpoint":
        self AddOption("Custom Locations", "Clock Tower", ::customLocation, undefined, (-1487, 587, 178));
        self AddOption("Custom Locations", "Spawn", ::customLocation, undefined, (242, 1871, 118));
        self AddOption("Custom Locations", "Chicken", ::customLocation, undefined, (-1535, -557, 53));
        break;

        case "mp_storm":
        self AddOption("Custom Locations", "A Bomb", ::customLocation, undefined, (1277, 1361, 56));
        break;

        case "mp_crash":
        self AddOption("Custom Locations", "Trash Can", ::customLocation, undefined, (1184.26, 1341, 203.011));
        self AddOption("Custom Locations", "Ladder", ::customLocation, undefined, (1604, 381, 333));
        break;

        case "mp_compact":
        self AddOption("Custom Locations", "Tires", ::customLocation, undefined, (1634.45, 1137, 44.1668));
        self AddOption("Custom Locations", "Tires", ::customLocation, undefined, (2907.4, 1203.4, 289.0));
        break;

        case "mp_overgrown":
        self AddOption("Custom Locations", "Overgrown Wallbreach", ::customLocation, undefined, (-608.196, -2376.15, -103.875));
        break; 

        case "mp_underpass":
        self AddOption("Custom Locations", "Walbreach", ::customLocation, undefined, (1058.52, -414.478, 548.038));
        break;

         case "mp_strike":
        self AddOption("Custom Locations", "Spot 1", ::customLocation, undefined, (-398.2, -1407.1, 532.1));
        break;

        case "mp_boneyard":
        self AddOption("Custom Locations", "Spot 1", ::customLocation, undefined, (410.3, -461.0, 26.1));
        break;

         case "mp_rundown":
        self AddOption("Custom Locations", "oc tree lunge", ::customLocation, undefined, (1482.8, -765.0, 260.0));
        break;

        case "mp_derail":
        self AddOption("Custom Locations", "oc weird spot", ::customLocation, undefined, (2241.6, 2835.1, 460));
        break;

        default:
        self AddOption("Custom Locations", "None");
        break;
    }

    /*self CreateMenu("Aimbot", "AZZA");  old aimbot shit
    self addoption("Aimbot","Aimbot Weapon", ::aimbotWeapon, getDvar("aimbotWeapon"));
    self addOption ("Aimbot", "Aimbot Strength", ::aimbotStrength, self.aimbotStrength);
    self addoption("Aimbot","Hitmarker Weapon", ::hitmarkerWeapon, getDvar("hitmarkerWeapon"));
    self addOption ("Aimbot","Aimbot Hitmarker", ::aimbot_hitmarker, self.aimbothitmarker);
    self addOption ("Aimbot", "Headshot Aimbot", ::headshotAimbot, getPers("headshotAimbot"));
    self addOption ("Aimbot", "Aimbot Delay Settings", ::loadMenu, undefined,"Aimbot Delay Settings");

	self createMenu("Aimbot Delay Settings", "Aimbot");
	self addOption ("Aimbot Delay Settings", "Increase Aimbot Delay by 0.1", ::aimbotDelay, undefined, 0.1);
	self addOption ("Aimbot Delay Settings", "Decrease Aimbot Delay by 0.1", ::aimbotDelay, undefined, -0.1);
	self addOption ("Aimbot Delay Settings", "Value : [^1" + self.aimbotDelay + "^7]" );*/


    self CreateMenu("Aimbot", "AZZA");
    self AddOption("Aimbot", "Weapon", ::aimbotWeapon, self.pers["aimbotWeapon"]);
    self AddSlider("Aimbot", "Strength", undefined, "aimbotStrength", 0, 10000, 250);
    self addOption("Aimbot", "Everwhere", ::everywhereeb, getPers("everywhereeb"));
    self AddSlider("Aimbot", "Delay", undefined, "aimbotDelay", 0, 3, 0.1);
    self addOption("Aimbot", "Mid Air", ::midAirOnly, getPers("midAirOnly"));
    self addOption("Aimbot", "Headshots", ::headshots, getDvar("headshots"));
    self AddOption("Aimbot", "Friendly Weapon", ::friendlyWeapon, getPers("friendlyweapon"));
    self AddOption("Aimbot", "Friendly Aimbot", ::friendlyAimbot, getPers("friendlyaimbot"));
    self AddOption("Aimbot", "Hitmarker Aimbot", ::hmaimbot, getPers("hmaimbot"));
    self AddOption("Aimbot", "Hitmarker Weapon", ::hmweapon, getPers("hmweapon"));

    
    self CreateMenu("Game", "AZZA");
    self addoption("Game", "Rounds Setup",::LoadMenu, undefined,"Rounds");
    self AddOption("Game", "Instashoot", ::LoadMenu, undefined, "Instashoot");
    self AddOption("Game", "Round Timer", ::timerToggle, getPers("timerthing"));
    self AddOption("Game", "Player Health", ::playerhealth, getDvar("player_health"));
    self AddOption("Game", "Knife Lunges", ::knifelunges, getPers("knifelunges"));
    self AddOption("Game", "Depatch Bounces", ::depatch, getPers("bounces"));
    self AddOption("Game", "Depatch Elevators", ::depatch_elev, getPers("elevators"));
    self AddDvarSlider("Game", "Timescale", undefined, "timescale", 0.5, 2, 0.5);
    self AddDvarSlider("Game", "Gravity", undefined, "g_gravity", 50, 1500, 50);
    self AddDvarSlider("Game", "Lag", undefined, "sv_padpackets", 0, 20000, 500);
    self AddDvarSlider("Game", "Pickup Radius", undefined, "player_useRadius", 0, 20000, 250);
    self AddDvarSlider("Game", "Ladder Velocity", undefined, "jump_ladderpushvel", 28, 528, 10);
    self AddDvarSlider("Game", "Speed", undefined, "g_speed", 0, 1210, 10);
    self AddDvarSlider("Game", "Jump Height", undefined, "jump_height", 19, 99, 5);
    self AddDvarSlider("Game", "Knockback", undefined, "g_knockback", 0, 29999, 500);
    self AddDvarSlider("Game", "Use Time", undefined, "g_useholdtime", 0, 300, 20);
    self AddDvarSlider("Game", "Ladder Cap", undefined, "bg_ladder_yawcap", 0, 360, 20);
    self AddDvarSlider("Game", "Prone Cap", undefined, "bg_prone_yawcap", 0, 360, 20);
    self AddDvarSlider("Game", "Mantle Cap", undefined, "mantle_view_yawcap", 60, 180, 20);
    self AddOption("Game", "Bullet Marks", ::bullets, getPers("bullets"));
    self AddOption("Game", "Death Barriers", ::deathbarrierstog, getPers("deathbarriers"));
    self AddArraySlider("Game", "Change Map", ::changeMap, strTok("mp_afghan,mp_derail,mp_estate,mp_favela,mp_highrise,mp_invasion,mp_checkpoint,mp_quarry,mp_rundown,mp_rust,mp_boneyard,mp_nightshift,mp_subbase,mp_terminal,mp_underpass,mp_brecourt", ","), "change_map");
    self AddOption("Game", "Map Restart", ::_mapRestart);
    self AddOption("Game", "Disconnect", ::_Disconnect);


    self CreateMenu("Rounds", "Game");
    self AddDvarSlider("Rounds", "Rounds Team 1", undefined, "roundswon", 0, 3, 1);
    self AddDvarSlider("Rounds", "Rounds Team 2", undefined, "roundslost", 0, 3, 1);
    self AddOption("Rounds", "Set Rounds", ::sndroundreset2);

    self CreateMenu("Instashoot", "Game");
    self addoption("Instashoot","Instashoot", ::instashoots_tog, getPers("instashoots"));
    self AddOption("Instashoot", "Instashoot Weapon", ::instashoots_weapon, getDvar("instashoots_weapon"));

    self CreateMenu("Weapon", "AZZA");
    self AddOption("Weapon", "Drop Canswap", ::dropCanswap);
    self AddOption("Weapon", "Drop Current Weapon", ::dropdagun);
    self AddOption("Weapon", "Weapon:", ::drop_weapon_name, getDvar("drop_weapon_name"));
    self AddOption("Weapon", "Save Spawn Location" , ::drop_weapon_location);
    self AddBindSliders("Weapon", "Spawn Weapon Bind", ::dropdeletebind, "dropdeletebind");
    self AddOption("Weapon", "Give Weapons", ::LoadMenu, undefined, "Weapons");

    self CreateMenu("Weapons", "Weapon");
    self AddOption("Weapons", "Infinite Equipement", ::set_infiniteammo, self.pers["function_infammo"]);
    self AddOption("Weapons", "Refill Ammo", ::refillAmmo);
    self AddOption("Weapons", "Give Akimbo", ::giveAkimbo);
    self AddArraySlider("Weapons", "Assault Rifle", ::giveWeap, strTok("m4,famas,scar,tavor,fal,m16,masada,fn2000,ak47", ","), "give_weapon_ar");
    self AddArraySlider("Weapons", "Sub Machine Gun", ::giveWeap, strTok("mp5k,ump45,kriss,p90,uzi", ","), "give_weapon_smg");
    self AddArraySlider("Weapons", "Light Machine Gun", ::giveWeap, strTok("sa80,rpd,mg4,aug,m240", ","), "give_weapon_lmg");
    self AddArraySlider("Weapons", "Sniper Rifle", ::giveWeap, strTok("cheytac,barrett,wa2000,m21", ","), "give_weapon_sniper");
    self AddArraySlider("Weapons", "Machine Pistol", ::giveWeap, strTok("pp2000,glock,beretta393,tmp", ","), "give_weapon_machine");
    self AddArraySlider("Weapons", "Shotgun", ::giveWeap, strTok("spas12,aa12,striker,ranger,m1014,model1887", ","), "give_weapon_handgun");
    self AddArraySlider("Weapons", "Handgun", ::giveWeap, strTok("usp,coltanaconda,beretta,deserteagle", ","), "give_weapon_shotgun");
    self AddArraySlider("Weapons", "Launcher", ::giveWeap, strTok("at4,m79,stinger,javelin,rpg", ","), "give_weapon_launcher");
    self AddArraySlider("Weapons", "Special", ::giveWeap, strTok("defaultweapon,deserteaglegold", ","), "give_weapon_special");

    self CreateMenu("Bots", "AZZA");
    self addoption("Bots", "Spawn Friendly", ::spawnFriendlyBot);
    self addoption("Bots", "Spawn Enemy", ::spawnEnemyBot);
    self addoption("Bots", "Teleport Settings",::LoadMenu, undefined,"Teleport Bots");
    self AddOption("Bots", "Bots Functions", ::LoadMenu, undefined, "Bots Functions");

        self CreateMenu("Bots Functions", "Bots");
        self AddArraySlider("Bots Functions", "Bot Preset", ::change_bot, strTok("default,mishy,syncroh,areal,brx,chim,jtm,meta,zekah,deft,azr,qurve", ","), "change_bot");
        self addoption("Bots Functions", "Enemy Bot Weapon", ::ebotweapon, getDvar("ebotweapon"));
        self addoption("Bots Functions", "Friendly Bot Weapon", ::fbotWeapon, getDvar("fbotweapon"));
        self AddDvarSlider("Bots Functions", "Bot Prestige", ::botprestige, "bot_prestige",  0, 11, 1); 

        self AddBindSliders("Bots Functions", "Bot Mantle Bind", ::botmantlebind, "botmantlebind");
        self AddBindSliders("Bots Functions", "Bot Kills Friend", ::botkilltest, "botkilltest");
        self addoption("Bots Functions", "Enemy Bot Velocity",::LoadMenu, undefined,"eBotVelo");
        self addoption("Bots Functions", "Friendly Bot Velocity",::LoadMenu, undefined,"fBotVelo");


    self CreateMenu("eBotVelo", "Bots Functions");
    self AddDvarSlider("eBotVelo", "Bot Velocity X", undefined, "ebotvelx", -500, 500, 20);
    self AddDvarSlider("eBotVelo", "Bot Velocity Z", undefined, "ebotvelz", -500, 500, 20);
    self AddDvarSlider("eBotVelo", "Bot Velocity Y", undefined, "ebotvely", -500, 500, 20);
    self addoption("eBotVelo","Reset Bot Vel", ::resetebotvel);
    self AddBindSliders("eBotVelo", "Bot Velocity Bind", ::ebotvelbind, "ebotvelbind");
    //
    self CreateMenu("fBotVelo", "Bots Functions");
    self AddDvarSlider("fBotVelo", "Bot Velocity X", undefined, "fbotvelx", -500, 500, 20);
    self AddDvarSlider("fBotVelo", "Bot Velocity Z", undefined, "fbotvelz", -500, 500, 20);
    self AddDvarSlider("fBotVelo", "Bot Velocity Y", undefined, "fbotvely", -500, 500, 20);
    self AddOption("fBotVelo","Reset Bot Vel", ::resetfbotvel);
    self AddBindSliders("fBotVelo", "Bot Velocity Bind", ::fbotvelbind, "fbotvelbind");

    self CreateMenu("Teleport Bots", "Bots");
    self AddOption("Teleport Bots", "Teleport Enemy [3 Seconds]", ::teleportbots, undefined, getOtherTeam(self.pers["team"]));
    self AddOption("Teleport Bots", "Teleport Friendly [3 Seconds]", ::teleportbots, undefined, self.pers["team"]);
    self addoption("Teleport Bots", "Teleport Enemy", ::tpenemybots);
    self addoption("Teleport Bots", "Teleport Friendly", ::tpfriendbots);

    self AddOption("Teleport Bots", "Save Location", ::saveLocationBot);
    self AddOption("Teleport Bots", "Load Location", ::loadLocationBot);

    self addoption("Bots", "Kick Settings",::LoadMenu, undefined,"Kick Bots");
    
    self CreateMenu("Kick Bots", "Bots");
    self AddOption("Kick Bots", "Kick Enemy Bots", ::kickenemybots);
    self AddOption("Kick Bots", "Kick Friendly Bots", ::kickfriendbots);
    self addoption("Kick Bots", "Kick All Bots", ::removeEveryBot);


    self CreateMenu("Binds", "AZZA");
    self addoption("Binds", "Dvar Toggle",::LoadMenu, undefined,"Dvar Toggle");
    //self addoption("Binds", "Weapon Def",::LoadMenu, undefined, "Weapon Def");
    self addoption("Binds", "Velocity",::LoadMenu, undefined,"Velocity");
    self addoption("Binds", "Nac Mod",::LoadMenu, undefined,"Nac Mod");
    self addoption("Binds", "Kill Bot",::LoadMenu, undefined,"KillBotMenu");
    self addoption("Binds", "Set Anim",::LoadMenu, undefined,"Set Anim");
    self addoption("Binds", "Swap to Weapon",::LoadMenu, undefined,"SwaptoWeapon");
    self addoption("Binds", "Radius Damage",::LoadMenu, undefined,"Radius");
    self addoption("Binds", "Bolt Movement",::LoadMenu, undefined,"Bolt");
    self addoption("Binds", "Force Barrel",::LoadMenu, undefined,"Force");
    self AddBindSliders("Binds", "Blast Shield", ::blastbind, "blastbind");
    self AddBindSliders("Binds", "Cp Mala", ::cpmala, "cpmala");
    self AddBindSliders("Binds", "Pred Mala", ::predmala, "predmala");
    self AddBindSliders("Binds", "Illusion", ::illusion, "illusion");
    self AddBindSliders("Binds", "Smooth", ::smooth2, "smooth2");
    self AddBindSliders("Binds", "Instaswap", ::instaswap, "instaswap");
    self AddBindSliders("Binds", "Gunlock", ::gunlockbind, "gunlockbind");
    self AddBindSliders("Binds", "Damage", ::damagenobind, "damagenobind");
    self AddBindSliders("Binds", "Damage With Sound", ::damagebind, "damagebind");
    self AddBindSliders("Binds", "Hitmarker", ::hitmarker1, "hitmarker1");
    self AddBindSliders("Binds", "Flash", ::flashbind, "flashbind");
    self AddBindSliders("Binds", "Stun", ::stunsbind, "stunsbind");
    self AddBindSliders("Binds", "Friendly Fire", ::FriendlyKnock, "FriendlyKnock");
    self AddBindSliders("Binds", "Final Stand", ::finalstandbind, "finalstandbind");
    self AddBindSliders("Binds", "Last Stand", ::laststandbind, "laststandbind");
    self AddBindSliders("Binds", "Host Migration", ::hostmigrabind, "hostmigrabind");
    self AddBindSliders("Binds", "EMP Bind", ::fakeempbind, "fakeempbind");
    self AddBindSliders("Binds", "Thirdeye", ::thirdeyebind, "thirdeyebind");
    self AddBindSliders("Binds", "Give OMA", ::omabind, "omabind");
    self AddBindSliders("Binds", "Killstreak Splash", ::kssplashbind, "kssplashbind");
    self AddBindSliders("Binds", "Canswap & Reload Repeater", ::mishycanswapreloadrepeaterbind, "mishycanswapreloadrepeaterbind");


    self CreateMenu("Bolt", "Binds");
    self addoption("Bolt", "Save Point", ::savebolt);
    self addoption("Bolt", "Delete Point", ::deletebolt);
    self AddDvarSlider("Bolt", "Bolt Speed", undefined, "bolttime", 0, 10, 0.2);
    self AddBindSliders("Bolt", "Bolt Movement Bind", ::boltbind, "boltbind");
    self addoption("Bolt", "Fix ADS [^1LATENCY WHEN ON^7]", ::fix_ads, getPers("fixADS"));


    self CreateMenu("Force", "Binds");
    self AddBindSliders("Force", "Force Barrel Bind", ::forcebind, "forcebind");
    self AddBindSliders("Force", "Force Barrel Bind Hold", ::forcebindHold, "forcebindHold");

    self CreateMenu("Velocity", "Binds");
    self addoption("Velocity", "Velocity 1",::LoadMenu, undefined,"Velocity1");
    self addoption("Velocity", "Velocity 2",::LoadMenu, undefined,"Velocity2");

    self CreateMenu("Velocity1", "Velocity");
    self AddDvarSlider("Velocity1", "Velocity 1 X", undefined, "velx", -500, 500, 10);
    self AddDvarSlider("Velocity1", "Velocity 1 Z", undefined, "velz", -500, 500, 10);
    self AddDvarSlider("Velocity1", "Velocity 1 Y", undefined, "vely", -500, 500, 10);
    self addoption("Velocity1","Reset Velocity 1",::resetvel);
    self AddBindSliders("Velocity1", "Velocity 1 Bind", ::velbind, "velbind");
    //
    self CreateMenu("Velocity2", "Velocity");
    self AddDvarSlider("Velocity2", "Velocity 2 X", undefined, "velx2", -500, 500, 10);
    self AddDvarSlider("Velocity2", "Velocity 2 Z", undefined, "velz2", -500, 500, 10);
    self AddDvarSlider("Velocity2", "Velocity 2 Y", undefined, "vely2", -500, 500, 10);
    self addoption("Velocity2","Reset Velocity 2",::resetvel2);
    self AddBindSliders("Velocity2", "Velocity 2 Bind", ::vel2bind, "vel2bind");

    self CreateMenu("Nac Mod", "Binds");
    self addoption("Nac Mod","Nac Weapon 1",::nacmod1, getDvar("nacmod1"));
    self addoption("Nac Mod","Nac Weapon 2",::nacmod2, getDvar("nacmod2"));
    self AddBindSliders("Nac Mod", "Nac Mod Bind", ::nacmodbind, "nacmodbind");

    self CreateMenu("KillBotMenu", "Binds");
    self addoption("KillBotMenu", "Weapon:",::killbot_weapon, getDvar("killbot_weapon"));
    self AddBindSliders("KillBotMenu", "KillBot Bind", ::killbotbind, "killbotbind");

    self CreateMenu("Set Anim", "Binds");
    self AddDvarSlider("Set Anim", "Anim 1", undefined, "Anim", 0, 34, 1);
    self AddBindSliders("Set Anim", "Set Anim Bind 1", ::animbind, "animbind");
    self AddDvarSlider("Set Anim", "Anim 2", undefined, "Anim2", 0, 34, 1);
    self AddBindSliders("Set Anim", "Set Anim Bind 2", ::anim2bind, "anim2bind");

    self CreateMenu("SwaptoWeapon", "Binds");
    self addoption("SwaptoWeapon","Swap Weapon",::swap_weapon, getDvar("swap_weapon"));
    self AddBindSliders("SwaptoWeapon", "Swap Bind", ::swapbind, "swapbind");

    self CreateMenu("Radius", "Binds");
    self AddOption("Radius", "Save Damage Location", ::radiusdmglocation);
    self AddBindSliders("Radius", "Radius Damage Bind", ::radiusdmgbind, "radiusdmgbind");

    self CreateMenu("Dvar Toggle", "Binds");
    self AddArraySlider("Dvar Toggle", "Set Dvar [{+usereload}]", ::dvartog, strTok("g_gravity,g_speed,jump_ladderpushvel,player_useradius,jump_height,g_useholdtime,sv_padpackets", ","), "dvartog");
    self AddDvarSlider("Dvar Toggle", "First Value", undefined, "dvartog1", 0, 800, 50);
    self AddDvarSlider("Dvar Toggle", "Second Value", undefined, "dvartog2", 0, 800, 50);
    self AddBindSliders("Dvar Toggle", "Toggle Dvar Bind", ::dvarbind, "dvarbind");


    /*self CreateMenu("Killstreaks", "AZZA");
    self AddArraySlider("Killstreaks", "Killstreak", ::giveStreak, strTok("uav,counter_uav,airdrop,predator_missile,sentry,precision_airstrike,harrier_airstrike,helicopter,airdrop_mega,pavelow,stealth_airstrke,helicopter_minigun,ac130,emp,nuke", ","), "current_streak");
    self AddOption("Killstreaks", "Remove Killstreaks", ::removeKS);
    self AddOption("Killstreaks", "Carepackage to Crosshair", ::spawncarepackagecross);
    self AddOption("Killstreaks", "Carepackage on yourself", ::spawncarepackageself);
    self AddOption("Killstreaks", "Delete Carepackage(s)", ::delete_carepack);
    self AddDvarSlider("Killstreaks", "CP Capture Time", undefined, "cg_cratetime", 0, 5000, 500);
    self AddArraySlider("Killstreaks", "Change Crate Type [{+usereload}]", ::change_cratedvar, strTok("ammo,uav,counter_uav,sentry,predator_missile,precision_airstrike,harrier_airstrike,helicopter,helicopter_flares,stealth_airstrike,helicopter_minigun,ac130,emp", ","), "crate_type");
    self AddOption("Killstreaks", "Save Carepackage Drop Location", ::setcppos);
    self AddBindSliders("Killstreaks", "Call Carepackage in Location", ::cppos, "cppos");*/



    self CreateMenu("Killstreaks", "AZZA");
    self AddArraySlider("Killstreaks", "Killstreak", ::giveStreak, strTok("uav,counter_uav,airdrop,predator_missile,sentry,precision_airstrike,harrier_airstrike,helicopter,airdrop_mega,pavelow,stealth_airstrke,helicopter_minigun,ac130,emp,nuke", ","), "current_streak");
    self AddOption("Killstreaks", "Remove Killstreaks", ::removeKS);
    self AddOption("Killstreaks", "Carapackage Stuff", ::LoadMenu, undefined, "CPFUNC");

    self CreateMenu("CPFUNC", "Killstreaks");
    self AddOption("CPFUNC", "Carepackage to Crosshair", ::spawncarepackagecross);
    self AddOption("CPFUNC", "Delete Carepackage(s)", ::delete_carepack);
    self AddOption("CPFUNC", "Save CP Spawn Location" , ::cp_location);
    self AddOption("CPFUNC", "Spawn CP on Location" , ::cponpos, getPers("cponpos"));
    self AddDvarSlider("CPFUNC", "CP Capture Time", undefined, "cg_cratetime", 0, 5000, 500);
    self AddArraySlider("CPFUNC", "Change Crate Type [{+usereload}]", ::change_cratedvar, strTok("ammo,uav,counter_uav,sentry,predator_missile,precision_airstrike,harrier_airstrike,helicopter,helicopter_flares,stealth_airstrike,helicopter_minigun,ac130,emp", ","), "crate_type");
    self AddOption("CPFUNC", "Set Call in Location", ::setcppos);
    self AddBindSliders("CPFUNC", "Call Carepackage in Location", ::cppos, "cppos");


    self createMenu("Game Profile", "AZZA");
    self AddOption("Game Profile", "Edit Primary Weapon", ::LoadMenu, undefined, "primary_weapon");
    self AddOption("Game Profile", "Edit Secondary Weapon", ::LoadMenu, undefined, "secondary_weapon");
    self AddOption("Game Profile", "Edit Camos", ::LoadMenu, undefined, "camo_editor");
    self AddOption("Game Profile", "Equipments", ::LoadMenu, undefined, "equipment");
    self AddOption("Game Profile", "Special Grenade", ::LoadMenu, undefined, "special_grenade");
    self AddOption("Game Profile", "Perk One", ::LoadMenu, undefined, "perk_one");
    self AddOption("Game Profile", "Perk Two", ::LoadMenu, undefined, "perk_two");
    self AddOption("Game Profile", "Perk Three", ::LoadMenu, undefined, "perk_three");
    self AddOption("Game Profile", "Coloured Classes", ::colouredClasses);
    self AddOption("Game Profile", "REVE Classes", ::classbuttons3);


    self createMenu("primary_weapon", "Game Profile");
    self AddOption("primary_weapon", "Assault Rifles", ::LoadMenu, undefined, "primary_ars");
    self AddOption("primary_weapon", "Sub Machine Guns", ::LoadMenu, undefined, "primary_smg");
    self AddOption("primary_weapon", "Light Machine Guns", ::LoadMenu, undefined, "primary_lmg");
    self AddOption("primary_weapon", "Sniper Rifles", ::LoadMenu, undefined, "primary_snipers");
    self AddOption("primary_weapon", "Machine Pistols", ::LoadMenu, undefined, "primary_machine_pistols");
    self AddOption("primary_weapon", "Shotguns", ::LoadMenu, undefined, "primary_shotguns");
    self AddOption("primary_weapon", "Handguns", ::LoadMenu, undefined, "primary_handguns");
    self AddOption("primary_weapon", "Launchers", ::LoadMenu, undefined, "primary_launchers");
    self addOption ("primary_weapon", "OMA Bag", ::weapon_editor, undefined, "onemanarmy", 0);
    self addOption ("primary_weapon", "Riot Shield", ::weapon_editor, undefined, "riotshield", 0);

    self createMenu("primary_ars", "primary_weapon");
    self AddOption("primary_ars", "M4A1", ::weapon_editor, undefined, "m4", 0);
    self AddOption("primary_ars", "FAMAS", ::weapon_editor, undefined, "famas", 0);
    self AddOption("primary_ars", "SCAR-H", ::weapon_editor, undefined, "scar", 0);
    self AddOption("primary_ars", "TAR-21", ::weapon_editor, undefined, "tavor", 0);
    self AddOption("primary_ars", "FN FAL", ::weapon_editor, undefined, "fal", 0);
    self AddOption("primary_ars", "M16A4", ::weapon_editor, undefined, "m16", 0);
    self AddOption("primary_ars", "ACR", ::weapon_editor, undefined, "masada", 0);
    self AddOption("primary_ars", "F2000", ::weapon_editor, undefined, "fn2000", 0);
    self AddOption("primary_ars", "AK-47", ::weapon_editor, undefined, "ak47", 0);

    self createMenu("primary_smg", "primary_weapon");
    self AddOption("primary_smg", "MP5K", ::weapon_editor, undefined, "mp5k", 0);
    self AddOption("primary_smg", "UMP45", ::weapon_editor, undefined, "ump45", 0);
    self AddOption("primary_smg", "Vector", ::weapon_editor, undefined, "kriss", 0);
    self AddOption("primary_smg", "P90", ::weapon_editor, undefined, "p90", 0);
    self AddOption("primary_smg", "Mini-Uzi", ::weapon_editor, undefined, "uzi", 0);

    self createMenu("primary_lmg", "primary_weapon");
    self AddOption("primary_lmg", "L86 LSW", ::weapon_editor, undefined, "sa80", 0);
    self AddOption("primary_lmg", "RPD", ::weapon_editor, undefined, "rpd", 0);
    self AddOption("primary_lmg", "MG4", ::weapon_editor, undefined, "mg4", 0);
    self AddOption("primary_lmg", "AUG HBAR", ::weapon_editor, undefined, "aug", 0);
    self AddOption("primary_lmg", "M240", ::weapon_editor, undefined, "m240", 0);

    self createMenu("primary_snipers", "primary_weapon");
    self AddOption("primary_snipers", "Intervention", ::weapon_editor, undefined, "cheytac", 0);
    self AddOption("primary_snipers", "Barrett .50Cal", ::weapon_editor, undefined, "barrett", 0);
    self AddOption("primary_snipers", "WA2000", ::weapon_editor, undefined, "wa2000", 0);
    self AddOption("primary_snipers", "M21 EBR", ::weapon_editor, undefined, "m21", 0);

    self createMenu("primary_machine_pistols", "primary_weapon");
    self AddOption("primary_machine_pistols", "PP-2000", ::weapon_editor, undefined, "pp2000", 0);
    self AddOption("primary_machine_pistols", "Glock 18", ::weapon_editor, undefined, "glock", 0);
    self AddOption("primary_machine_pistols", "Raffica", ::weapon_editor, undefined, "beretta393", 0);
    self AddOption("primary_machine_pistols", "TMP", ::weapon_editor, undefined, "tmp", 0);

    self createMenu("primary_shotguns", "primary_weapon");
    self AddOption("primary_shotguns", "SPAS-12", ::weapon_editor, undefined, "spas12", 0);
    self AddOption("primary_shotguns", "AA-12", ::weapon_editor, undefined, "aa12", 0);
    self AddOption("primary_shotguns", "Striker", ::weapon_editor, undefined, "striker", 0);
    self AddOption("primary_shotguns", "Ranger", ::weapon_editor, undefined, "ranger", 0);
    self AddOption("primary_shotguns", "M1014", ::weapon_editor, undefined, "m1014", 0);
    self AddOption("primary_shotguns", "Model 1887", ::weapon_editor, undefined, "model1887", 0);

    self createMenu("primary_handguns", "primary_weapon");
    self AddOption("primary_handguns", "USP .45", ::weapon_editor, undefined, "usp", 0);
    self AddOption("primary_handguns", "Magnum", ::weapon_editor, undefined, "coltanaconda", 0);
    self AddOption("primary_handguns", "M9", ::weapon_editor, undefined, "beretta", 0);
    self AddOption("primary_handguns", "Desert Eagle", ::weapon_editor, undefined, "deserteagle", 0);

    self createMenu("primary_launchers", "primary_weapon");
    self AddOption("primary_launchers", "AT4-HS", ::weapon_editor, undefined, "at4", 0);
    self AddOption("primary_launchers", "Thumper", ::weapon_editor, undefined, "m79", 0);
    self AddOption("primary_launchers", "Stinger", ::weapon_editor, undefined, "stinger", 0);
    self AddOption("primary_launchers", "Javelin", ::weapon_editor, undefined, "javelin", 0);
    self AddOption("primary_launchers", "RPG-7", ::weapon_editor, undefined, "rpg", 0);

    self createMenu("attachment_primary_one", "primary_weapon");
    self AddOption("attachment_primary_one", "None", ::attachment_editor_one, undefined, "none", 0);
    self AddOption("attachment_primary_one", "Acog", ::attachment_editor_one, undefined, "acog", 0);
    self AddOption("attachment_primary_one", "Grip", ::attachment_editor_one, undefined, "grip", 0);
    self AddOption("attachment_primary_one", "Grenade Launcher", ::attachment_editor_one, undefined, "gl", 0);
    self AddOption("attachment_primary_one", "Tactical", ::attachment_editor_one, undefined, "tactical", 0);
    self AddOption("attachment_primary_one", "Red Dog Sight", ::attachment_editor_one, undefined, "reflex", 0);
    self AddOption("attachment_primary_one", "Silencer", ::attachment_editor_one, undefined, "silencer", 0);
    self AddOption("attachment_primary_one", "Akimbo", ::attachment_editor_one, undefined, "akimbo", 0);
    self AddOption("attachment_primary_one", "Thermal", ::attachment_editor_one, undefined, "thermal", 0);
    self AddOption("attachment_primary_one", "Shotgun", ::attachment_editor_one, undefined, "shotgun", 0);
    self AddOption("attachment_primary_one", "Heartbeat", ::attachment_editor_one, undefined, "heartbeat", 0);
    self AddOption("attachment_primary_one", "FMJ", ::attachment_editor_one, undefined, "fmj", 0);
    self AddOption("attachment_primary_one", "Rapid Fire", ::attachment_editor_one, undefined, "rof", 0);
    self AddOption("attachment_primary_one", "Extended Mags", ::attachment_editor_one, undefined, "xmags", 0);
    self AddOption("attachment_primary_one", "Holographic", ::attachment_editor_one, undefined, "eotech", 0);

    self createMenu("attachment_primary_two", "primary_weapon");
    self AddOption("attachment_primary_two", "None", ::attachment_editor_two, undefined, "none", 0);
    self AddOption("attachment_primary_two", "Acog", ::attachment_editor_two, undefined, "acog", 0);
    self AddOption("attachment_primary_two", "Grip", ::attachment_editor_two, undefined, "grip", 0);
    self AddOption("attachment_primary_two", "Grenade Launcher", ::attachment_editor_two, undefined, "gl", 0);
    self AddOption("attachment_primary_two", "Tactical", ::attachment_editor_two, undefined, "tactical", 0);
    self AddOption("attachment_primary_two", "Red Dog Sight", ::attachment_editor_two, undefined, "reflex", 0);
    self AddOption("attachment_primary_two", "Silencer", ::attachment_editor_two, undefined, "silencer", 0);
    self AddOption("attachment_primary_two", "Akimbo", ::attachment_editor_two, undefined, "akimbo", 0);
    self AddOption("attachment_primary_two", "Thermal", ::attachment_editor_two, undefined, "thermal", 0);
    self AddOption("attachment_primary_two", "Shotgun", ::attachment_editor_two, undefined, "shotgun", 0);
    self AddOption("attachment_primary_two", "Heartbeat", ::attachment_editor_two, undefined, "heartbeat", 0);
    self AddOption("attachment_primary_two", "FMJ", ::attachment_editor_two, undefined, "fmj", 0);
    self AddOption("attachment_primary_two", "Rapid Fire", ::attachment_editor_two, undefined, "rof", 0);
    self AddOption("attachment_primary_two", "Extended Mags", ::attachment_editor_two, undefined, "xmags", 0);
    self AddOption("attachment_primary_two", "Holographic", ::attachment_editor_two, undefined, "eotech", 0);

    self createMenu("secondary_weapon", "Game Profile");
    self AddOption("secondary_weapon", "Assault Rifles", ::loadmenu, undefined, "secondary_ars");
    self AddOption("secondary_weapon", "Sub Machine Guns", ::loadmenu, undefined, "secondary_smg");
    self AddOption("secondary_weapon", "Light Machine Guns", ::loadmenu, undefined, "secondary_lmg");
    self AddOption("secondary_weapon", "Sniper Rifles", ::loadmenu, undefined, "secondary_snipers");
    self AddOption("secondary_weapon", "Machine Pistols", ::loadmenu, undefined, "secondary_machine_pistols");
    self AddOption("secondary_weapon", "Shotguns", ::loadmenu, undefined, "secondary_shotguns");
    self AddOption("secondary_weapon", "Handguns", ::loadmenu, undefined, "secondary_handguns");
    self AddOption("secondary_weapon", "Launchers", ::loadmenu, undefined, "secondary_launchers");
    self AddOption("secondary_weapon", "OMA Bag", ::weapon_editor, undefined, "onemanarmy", 1);
    self AddOption("secondary_weapon", "Riot Shield", ::weapon_editor, undefined, "riotshield", 1);

    self createMenu("secondary_ars", "secondary_weapon");
    self AddOption("secondary_ars", "M4A1", ::weapon_editor, undefined, "m4", 1);
    self AddOption("secondary_ars", "FAMAS", ::weapon_editor, undefined, "famas", 1);
    self AddOption("secondary_ars", "SCAR-H", ::weapon_editor, undefined, "scar", 1);
    self AddOption("secondary_ars", "TAR-21", ::weapon_editor, undefined, "tavor", 1);
    self AddOption("secondary_ars", "FN FAL", ::weapon_editor, undefined, "fal", 1);
    self AddOption("secondary_ars", "M16A4", ::weapon_editor, undefined, "m16", 1);
    self AddOption("secondary_ars", "ACR", ::weapon_editor, undefined, "masada", 1);
    self AddOption("secondary_ars", "F2000", ::weapon_editor, undefined, "fn2000", 1);
    self AddOption("secondary_ars", "AK-47", ::weapon_editor, undefined, "ak47", 1);

    self createMenu("secondary_smg", "secondary_weapon");
    self AddOption("secondary_smg", "MP5K", ::weapon_editor, undefined, "mp5k", 1);
    self AddOption("secondary_smg", "UMP45", ::weapon_editor, undefined, "ump45", 1);
    self AddOption("secondary_smg", "Vector", ::weapon_editor, undefined, "kriss", 1);
    self AddOption("secondary_smg", "P90", ::weapon_editor, undefined, "p90", 1);
    self AddOption("secondary_smg", "Mini-Uzi", ::weapon_editor, undefined, "uzi", 1);

    self createMenu("secondary_lmg", "secondary_weapon");
    self AddOption("secondary_lmg", "L86 LSW", ::weapon_editor, undefined, "sa80", 1);
    self AddOption("secondary_lmg", "RPD", ::weapon_editor, undefined, "rpd", 1);
    self AddOption("secondary_lmg", "MG4", ::weapon_editor, undefined, "mg4", 1);
    self AddOption("secondary_lmg", "AUG HBAR", ::weapon_editor, undefined, "aug", 1);
    self AddOption("secondary_lmg", "M240", ::weapon_editor, undefined, "m240", 1);

    self createMenu("secondary_snipers", "secondary_weapon");
    self AddOption("secondary_snipers", "Intervention", ::weapon_editor, undefined, "cheytac", 1);
    self AddOption("secondary_snipers", "Barrett .50Cal", ::weapon_editor, undefined, "barrett", 1);
    self AddOption("secondary_snipers", "WA2000", ::weapon_editor, undefined, "wa2000", 1);
    self AddOption("secondary_snipers", "M21 EBR", ::weapon_editor, undefined, "m21", 1);

    self createMenu("secondary_machine_pistols", "secondary_weapon");
    self AddOption("secondary_machine_pistols", "PP-2000", ::weapon_editor, undefined, "pp2000", 1);
    self AddOption("secondary_machine_pistols", "Glock 18", ::weapon_editor, undefined, "glock", 1);
    self AddOption("secondary_machine_pistols", "Raffica", ::weapon_editor, undefined, "beretta393", 1);
    self AddOption("secondary_machine_pistols", "TMP", ::weapon_editor, undefined, "tmp", 1);

    self createMenu("secondary_shotguns", "secondary_weapon");
    self AddOption("secondary_shotguns", "SPAS-12", ::weapon_editor, undefined, "spas12", 1);
    self AddOption("secondary_shotguns", "AA-12", ::weapon_editor, undefined, "aa12", 1);
    self AddOption("secondary_shotguns", "Striker", ::weapon_editor, undefined, "striker", 1);
    self AddOption("secondary_shotguns", "Ranger", ::weapon_editor, undefined, "ranger", 1);
    self AddOption("secondary_shotguns", "M1014", ::weapon_editor, undefined, "m1014", 1);
    self AddOption("secondary_shotguns", "Model 1887", ::weapon_editor, undefined, "model1887", 1);

    self createMenu("secondary_handguns", "secondary_weapon");
    self AddOption("secondary_handguns", "USP .45", ::weapon_editor, undefined, "usp", 1);
    self AddOption("secondary_handguns", "Magnum", ::weapon_editor, undefined, "coltanaconda", 1);
    self AddOption("secondary_handguns", "M9", ::weapon_editor, undefined, "beretta", 1);
    self AddOption("secondary_handguns", "Desert Eagle", ::weapon_editor, undefined, "deserteagle", 1);

    self createMenu("secondary_launchers", "secondary_weapon");
    self AddOption("secondary_launchers", "AT4-HS", ::weapon_editor, undefined, "at4", 1);
    self AddOption("secondary_launchers", "Thumper", ::weapon_editor, undefined, "m79", 1);
    self AddOption("secondary_launchers", "Stinger", ::weapon_editor, undefined, "stinger", 1);
    self AddOption("secondary_launchers", "Javelin", ::weapon_editor, undefined, "javelin", 1);
    self AddOption("secondary_launchers", "RPG-7", ::weapon_editor, undefined, "rpg", 1);

    self createMenu("attachment_secondary_one", "secondary_weapon");
    self AddOption("attachment_secondary_one", "None", ::attachment_editor_one, undefined, "none", 1);
    self AddOption("attachment_secondary_one", "Acog", ::attachment_editor_one, undefined, "acog", 1);
    self AddOption("attachment_secondary_one", "Grip", ::attachment_editor_one, undefined, "grip", 1);
    self AddOption("attachment_secondary_one", "Grenade Launcher", ::attachment_editor_one, undefined, "gl", 1);
    self AddOption("attachment_secondary_one", "Tactical", ::attachment_editor_one, undefined, "tactical", 1);
    self AddOption("attachment_secondary_one", "Red Dog Sight", ::attachment_editor_one, undefined, "reflex", 1);
    self AddOption("attachment_secondary_one", "Silencer", ::attachment_editor_one, undefined, "silencer", 1);
    self AddOption("attachment_secondary_one", "Akimbo", ::attachment_editor_one, undefined, "akimbo", 1);
    self AddOption("attachment_secondary_one", "Thermal", ::attachment_editor_one, undefined, "thermal", 1);
    self AddOption("attachment_secondary_one", "Shotgun", ::attachment_editor_one, undefined, "shotgun", 1);
    self AddOption("attachment_secondary_one", "Heartbeat", ::attachment_editor_one, undefined, "heartbeat", 1);
    self AddOption("attachment_secondary_one", "FMJ", ::attachment_editor_one, undefined, "fmj", 1);
    self AddOption("attachment_secondary_one", "Rapid Fire", ::attachment_editor_one, undefined, "rof", 1);
    self AddOption("attachment_secondary_one", "Extended Mags", ::attachment_editor_one, undefined, "xmags", 1);
    self AddOption("attachment_secondary_one", "Holographic", ::attachment_editor_one, undefined, "eotech", 1);

    self createMenu("attachment_secondary_two", "secondary_weapon");
    self AddOption("attachment_secondary_two", "None", ::attachment_editor_two, undefined, "none", 1);
    self AddOption("attachment_secondary_two", "Acog", ::attachment_editor_two, undefined, "acog", 1);
    self AddOption("attachment_secondary_two", "Grip", ::attachment_editor_two, undefined, "grip", 1);
    self AddOption("attachment_secondary_two", "Grenade Launcher", ::attachment_editor_two, undefined, "gl", 1);
    self AddOption("attachment_secondary_two", "Tactical", ::attachment_editor_two, undefined, "tactical", 1);
    self AddOption("attachment_secondary_two", "Red Dog Sight", ::attachment_editor_two, undefined, "reflex", 1);
    self AddOption("attachment_secondary_two", "Silencer", ::attachment_editor_two, undefined, "silencer", 1);
    self AddOption("attachment_secondary_two", "Akimbo", ::attachment_editor_two, undefined, "akimbo", 1);
    self AddOption("attachment_secondary_two", "Thermal", ::attachment_editor_two, undefined, "thermal", 1);
    self AddOption("attachment_secondary_two", "Shotgun", ::attachment_editor_two, undefined, "shotgun", 1);
    self AddOption("attachment_secondary_two", "Heartbeat", ::attachment_editor_two, undefined, "heartbeat", 1);
    self AddOption("attachment_secondary_two", "FMJ", ::attachment_editor_two, undefined, "fmj", 1);
    self AddOption("attachment_secondary_two", "Rapid Fire", ::attachment_editor_two, undefined, "rof", 1);
    self AddOption("attachment_secondary_two", "Extended Mags", ::attachment_editor_two, undefined, "xmags", 1);
    self AddOption("attachment_secondary_two", "Holographic", ::attachment_editor_two, undefined, "eotech", 1);

    self createMenu("equipment", "Game Profile");
    self addOption ("equipment", "Frag", ::equipment_editor, undefined, "frag_grenade_mp");
    self addOption ("equipment", "Semtex", ::equipment_editor, undefined, "semtex_mp");
    self addOption ("equipment", "Throwing Knife", ::equipment_editor, undefined, "throwingknife_mp");
    self addOption ("equipment", "Tactical Insertion", ::equipment_editor, undefined, "specialty_tacticalinsertion");
    self addOption ("equipment", "Blast Shield", ::equipment_editor, undefined, "specialty_blastshield");
    self addOption ("equipment", "Claymore", ::equipment_editor, undefined, "claymore_mp");
    self addOption ("equipment", "C4", ::equipment_editor, undefined, "c4_mp");

    self createMenu("special_grenade", "Game Profile");
    self addOption ("special_grenade", "Flash Grenade", ::special_grenade_editor, undefined, "flash_grenade");
    self addOption ("special_grenade", "Stun Grenade", ::special_grenade_editor, undefined, "concussion_grenade");
    self addOption ("special_grenade", "Smoke Grenade", ::special_grenade_editor, undefined, "smoke_grenade");

    self createMenu("perk_one", "Game Profile");
    self addOption ("perk_one", "Marathon", ::perk_editor, undefined, 1, "specialty_marathon");
    self addOption ("perk_one", "Sleight of Hand", ::perk_editor, undefined, 1, "specialty_fastreload");
    self addOption ("perk_one", "Scavenger", ::perk_editor, undefined, 1, "specialty_scavenger");
    self addOption ("perk_one", "Bling", ::perk_editor, undefined, 1, "specialty_bling");
    self addOption ("perk_one", "One Man Army", ::perk_editor, undefined, 1, "specialty_onemanarmy");

    self createMenu("perk_two", "Game Profile");
    self addOption ("perk_two", "Stopping Power", ::perk_editor, undefined, 2, "specialty_bulletdamage");
    self addOption ("perk_two", "Lightweight", ::perk_editor, undefined, 2, "specialty_lightweight");
    self addOption ("perk_two", "Hardline", ::perk_editor, undefined, 2, "specialty_hardline");
    self addOption ("perk_two", "Cold-Blooded", ::perk_editor, undefined, 2, "specialty_coldblooded");
    self addOption ("perk_two", "Danger Close", ::perk_editor, undefined, 2, "specialty_explosivedamage");

    self createMenu("perk_three", "Game Profile");
    self addOption ("perk_three", "Commando", ::perk_editor, undefined, 3, "specialty_extendedmelee");
    self addOption ("perk_three", "Steady Aim", ::perk_editor, undefined, 3, "specialty_bulletaccuracy");
    self addOption ("perk_three", "Scrambler", ::perk_editor, undefined, 3, "specialty_localjammer");
    self addOption ("perk_three", "Ninja", ::perk_editor, undefined, 3, "specialty_heartbreaker");
    self addOption ("perk_three", "SitRep", ::perk_editor, undefined, 3, "specialty_detectexplosive");
    self addOption ("perk_three", "Last Stand", ::perk_editor, undefined, 3, "specialty_pistoldeath");

    self createMenu("camo_editor", "Game Profile");
    self addOption ("camo_editor", "Primary Camo", ::loadmenu, undefined, "camo_primary");
	self addOption ("camo_editor", "Secondary Camo", ::loadmenu, undefined, "camo_secondary");

    self createMenu("camo_primary", "camo_editor");
    self addOption ("camo_primary", "None", ::camo_editor_primary, undefined, "none");
    self addOption ("camo_primary", "Arctic", ::camo_editor_primary, undefined, "arctic");
    self addOption ("camo_primary", "Desert", ::camo_editor_primary, undefined, "desert");
    self addOption ("camo_primary", "Woodland", ::camo_editor_primary, undefined, "woodland");
    self addOption ("camo_primary", "Digital", ::camo_editor_primary, undefined, "digital");
    self addOption ("camo_primary", "Urban", ::camo_editor_primary, undefined, "red_urban");
    self addOption ("camo_primary", "Blue Tiger", ::camo_editor_primary, undefined, "blue_tiger");
    self addOption ("camo_primary", "Red Tiger", ::camo_editor_primary, undefined, "red_tiger");
    self addOption ("camo_primary", "Fall", ::camo_editor_primary, undefined, "orange_fall");

    self createMenu("camo_secondary", "camo_editor");
    self addOption ("camo_secondary", "None", ::camo_editor_secondary, undefined, "none");
    self addOption ("camo_secondary", "Arctic", ::camo_editor_secondary, undefined, "arctic");
    self addOption ("camo_secondary", "Desert", ::camo_editor_secondary, undefined, "desert");
    self addOption ("camo_secondary", "Woodland", ::camo_editor_secondary, undefined, "woodland");
    self addOption ("camo_secondary", "Digital", ::camo_editor_secondary, undefined, "digital");
    self addOption ("camo_secondary", "Urban", ::camo_editor_secondary, undefined, "red_urban");
    self addOption ("camo_secondary", "Blue Tiger", ::camo_editor_secondary, undefined, "blue_tiger");
    self addOption ("camo_secondary", "Red Tiger", ::camo_editor_secondary, undefined, "red_tiger");
    self addOption ("camo_secondary", "Fall", ::camo_editor_secondary, undefined, "orange_fall");
 


    self createMenu("Players", "AZZA");
    foreach(player in level.players)
    {
        self addOption("Players", player.name, ::loadMenu, undefined, player.name);
        self createMenu(player.name, "Players");
        self addOption(player.name, "Kick", ::kickPlayer, undefined, player);
        self addOption(player.name, "Teleport", ::teleportPlayer, undefined, player);
        self addOption(player.name, "Save", ::saveLocationBot, undefined, player);
        self AddOption(player.name, "Give Unlocks", ::giveUnlocks, undefined, player);
        if(player.pers["isBot"] && isDefined(player.pers["isBot"]))
        {
        self AddOption(player.name, "Toggle Crouch", ::makePlayerCrouch, getPers("crouch"), player);

        }
    }

    // ============================================================
    // CFG Commands Reference — informational list of +commands
    // ============================================================
    self CreateMenu("CFG List", "AZZA");
    self addoption("CFG List", "--- MOVEMENT ---");
    self addoption("CFG List", "+nac");
    self addoption("CFG List", "+nacmod");
    self addoption("CFG List", "+goodinsta");
    self addoption("CFG List", "+houdini");
    self addoption("CFG List", "+infsprint");
    self addoption("CFG List", "+sprintin");
    self addoption("CFG List", "+broll");
    self addoption("CFG List", "+fastglide");
    self addoption("CFG List", "+glide");
    self addoption("CFG List", "+bolt");
    self addoption("CFG List", "--- OMA / SHAX ---");
    self addoption("CFG List", "+oma");
    self addoption("CFG List", "+omashax");
    self addoption("CFG List", "+omabag");
    self addoption("CFG List", "+omabagsprint");
    self addoption("CFG List", "--- OVERLAYS ---");
    self addoption("CFG List", "+illusion");
    self addoption("CFG List", "+copycat");
    self addoption("CFG List", "+startcopy");
    self addoption("CFG List", "+black");
    self addoption("CFG List", "--- BINDS ---");
    self addoption("CFG List", "+damage");
    self addoption("CFG List", "+reflect");
    self addoption("CFG List", "+scav");
    self addoption("CFG List", "+altswap");
    self addoption("CFG List", "+gunlock");
    self addoption("CFG List", "+host");
    self addoption("CFG List", "+flash");
    self addoption("CFG List", "+thirdeye");
    self addoption("CFG List", "--- KILLSTREAKS ---");
    self addoption("CFG List", "+pred");
    self addoption("CFG List", "+airstrike");
    self addoption("CFG List", "+sentry");
    self addoption("CFG List", "+ac130");
    self addoption("CFG List", "+carepack");
    self addoption("CFG List", "+airspace");
    self addoption("CFG List", "--- POSITIONS ---");
    self addoption("CFG List", "+loadpos");
    self addoption("CFG List", "+pos / +vel / +view");
    self addoption("CFG List", "+force");
    self addoption("CFG List", "+forcemala");
    self addoption("CFG List", "--- WEAPONS ---");
    self addoption("CFG List", "+inter / +barr / +wa2k / +m21");
    self addoption("CFG List", "+spas / +model / +rpg");
    self addoption("CFG List", "+givemala / +takemala");
    self addoption("CFG List", "--- MISC ---");
    self addoption("CFG List", "+finalstand / +laststand");
    self addoption("CFG List", "+destroytac");
    self addoption("CFG List", "+stuck");
    self addoption("CFG List", "+joingame");
    self addoption("CFG List", "+gmode / +hmode / +dmode");
    
}