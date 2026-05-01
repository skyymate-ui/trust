#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\perks\_perkfunctions;


#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;
#include scripts\mp\_functions;
#include scripts\mp\_aimbot;
#include scripts\mp\_binds;
#include scripts\mp\_presets;
#include scripts\mp\_trust;


Structure()
{
    self CreateMenu("Counter UAV", "exit");
    self AddOption("Counter UAV", "Misc", ::LoadMenu, undefined, "Misc");
    self AddOption("Counter UAV", "Teleport", ::LoadMenu, undefined, "Teleport");
    self AddOption("Counter UAV", "Aimbot", ::LoadMenu, undefined, "Aimbot");
    self AddOption("Counter UAV", "Binds", ::LoadMenu, undefined, "Binds");
    self AddOption("Counter UAV", "Trust Binds", ::LoadMenu, undefined, "Trust Binds");
    self AddOption("Counter UAV", "Weapon", ::LoadMenu, undefined, "Weapon");
    self AddOption("Counter UAV", "Killstreaks", ::LoadMenu, undefined, "Killstreaks");
    self AddOption("Counter UAV", "CFG Commands", ::LoadMenu, undefined, "CFG Commands");
    self AddOption("Counter UAV", "Class Settings", ::LoadMenu, undefined, "Class Settings");
    self AddOption("Counter UAV", "Game Settings", ::LoadMenu, undefined, "Game");
    self AddOption("Counter UAV", "Bots", ::LoadMenu, undefined, "Bots");
    self AddOption("Counter UAV", "Players", ::LoadMenu, undefined, "Players");

    self CreateMenu("Misc", "Counter UAV");
	self AddOption("Misc", "Spawnables Menu", ::LoadMenu, undefined, "Spawnables");
	self AddOption("Misc", "Ammo Menu", ::LoadMenu, undefined, "Ammo Menu");
    self addOption("Misc", "UFO Bind", ::noclipToggle, getPers("noclip"));
    self AddOption("Misc", "God Mode", ::godmode, getPers("god"));
    self AddOption("Misc", "Killcam Softland", ::KillcamSoftTog, getDvar("killcam_softland"));
    self AddOption("Misc", "Precam Softland", ::PrecamSoftTog, getDvar("function_precamsoft"));
    self AddOption("Misc", "BO2 Instaswaps", ::instaswaps, getPers("instaswaps"));
    self AddOption("Misc", "Good Nade", ::goodfrag1, getPers("goodnade"));
	self AddOption("Misc", "RPG Pushback", ::toggleRPGPush, self getPers("rpg_push"));
	
	self AddOption("Misc", "Auto Prone", ::ToggleAutoProne, self.pers["function_aprone"]);
	self addOption("Misc", "Canswap", ::toggleCanswapMode, getPers("canswap_label"));
	self AddArraySlider("Misc", "Camo Index", ::cycleCamoIndex, strTok("None,Desert,Arctic,Woodland,Digital,Urban,Blue Tiger,Red Tiger,Fall", ","), "camo_slider");
	
	self addoption("Misc", "Suicide", ::suicideCounterUAV);


    self createMenu("Spawnables", "Misc");
	self addOption("Spawnables", "Carepackage Physics", ::toggleCarepackPhysics, getDvar("function_carepackphysic"), "function_carepackphysic");
	self addOption("Spawnables", "Spawn Bounce", ::spawn_bounce_at_player);
    self addOption("Spawnables", "Remove Bounces", ::delbounce);
	self addoption("Spawnables", "Spawn Carepackage", ::spawncarepackageself1);
	self addoption("Spawnables", "Remove Carepackages", ::delete_carepack);
	///self addoption("Spawnables", "Spawn Meep's Custom Bounces(NOT ADDED YET)", ::spawncarepackageself1);

    self createMenu("Overlays", "Misc");
    self AddOption("Overlays", "Blue Screen", ::blueScreen, getPers("bluescreen"));
    self AddOption("Overlays", "Green Screen", ::greenScreen, getPers("greenscreen"));
    self AddOption("Overlays", "Red Screen", ::redScreen, getPers("redscreen"));
    self AddOption("Overlays", "Black Screen", ::BlackScreen, getPers("blackscreen"));

    self CreateMenu("Ammo Menu", "Misc");
    self AddOption("Ammo Menu", "Save Current Ammo", ::setammo);
	self addOption("Ammo Menu", "Toggle Saved Ammo", ::toggleSavedAmmo, getDvar("toggle_saved_ammo"));
    ///self AddBindSliders("Ammo Menu", "Set Ammo Bind", ::ammobind, "ammobind");
    self AddOption("Ammo Menu", "Primary: ", ::setammo, getDvar("primary_weapon"));
    self AddOption("Ammo Menu", "Clip: ", ::setammo, getDvar("primary_clip"));
    self AddOption("Ammo Menu", "Stock: ", ::setammo, getDvar("primary_stock"));
    self AddOption("Ammo Menu", "Secondary: ", ::setammo, getDvar("secondary_weapon"));
    self AddOption("Ammo Menu", "Clip: ", ::setammo, getDvar("secondary_clip"));
    self AddOption("Ammo Menu", "Stock: ", ::setammo, getDvar("secondary_stock"));

    self createMenu("One Man Army", "Weapon");
    self AddDvarSlider("One Man Army", "One Man Army Charge Time", undefined, "scr_oma_usetime", 0, 10, 1);
    self AddOption("One Man Army", "One Man Army Nac", ::omaNac, getPers("omanac"));
    self AddOption("One Man Army", "One Man Army Sprint", ::omaSprint, getPers("omasprint"));
    self AddOption("One Man Army", "Sprint on Second Bar", ::omaSprintSecond, getPers("omasprintsecond"));
    self AddOption("One Man Army", "Double One Man Army", ::doubleOma, getPers("doubleoma"));


    self createMenu("Class Change", "Weapon");
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

 	/// ── Teleport submenu ─────────────────────────────────────────
    self CreateMenu("Teleport","Counter UAV");
    self AddOption("Teleport","Player 1 Location", ::LoadMenu, undefined, "meep Location");
    self AddOption("Teleport","Player 2 Location",   ::LoadMenu, undefined, "Seth Location");
    self AddOption("Teleport","Custom Locations",  ::LoadMenu, undefined, "Custom Locations");

    /// ── Custom Locations submenu ─────────────────────────────────
    self CreateMenu("Custom Locations","Teleport");
    switch(getDvar("ui_mapname"))
    {
        case "mp_afghan": //Done
            //self AddOption("Custom Locations","Out of Map", ::customLocation, undefined, (4906, 2929, 100));
            self AddOption("Custom Locations","Bunker",    ::customLocation, undefined, (2391, -129, 230));
			self AddOption("Custom Locations","Plane Wing",    ::customLocation, undefined, (1237.73, 1571.08, 454.51));
			self AddOption("Custom Locations","Top of Hill",    ::customLocation, undefined, (1870, 2663, 433));
			self AddOption("Custom Locations","Plane Nose",    ::customLocation, undefined, (1726, 779, 289));
			self AddOption("Custom Locations","Sui",    ::customLocation, undefined, (-972, 1808, 408));
			
            break;

        case "mp_derail": //Done 
            self AddOption("Custom Locations","Spawn Bridge",       ::customLocation, undefined, (722, 2647, 437));
            self AddOption("Custom Locations","Tractor Bounce",::customLocation, undefined, (-1926.37, -1262.99, 964.12));
			self AddOption("Custom Locations","Slope Bounce",::customLocation, undefined, (-725, -918, 272));
			self AddOption("Custom Locations","Freight Bounce",::customLocation, undefined, (59.73, 1551.66, 592.14));
			self AddOption("Custom Locations","Tower Bounce",::customLocation, undefined, (2590, 2344, 1357));
            break;

        case "mp_estate": //Done 
            self AddOption("Custom Locations","Boat House",::customLocation, undefined, (1405, 3800, 360));
			self AddOption("Custom Locations","Green House",::customLocation, undefined, (-752, -400, 376));
			self AddOption("Custom Locations","Garage",::customLocation, undefined, (-2649, 748, 12));
			self AddOption("Custom Locations","Truckbed bounce", ::customLocation, undefined, (-1471.8, 2440.44, 822.036));
			self AddOption("Custom Locations","SUV Bounce",::customLocation, undefined, (-575, 3094, 145));
            break;

        case "mp_favela":
			self AddOption("Custom Locations","Construction Building",::customLocation, undefined, (-1479, 701, 960));
            self AddOption("Custom Locations","Top Mid",       ::customLocation, undefined, (-125, -738, 429));
			self AddOption("Custom Locations","Top Mid Other Side",::customLocation, undefined, (38.34, 309.75, 448.12));
			self AddOption("Custom Locations","Top Billboard",::customLocation, undefined, (-1846.55, -449.1, 672.1));
			self AddOption("Custom Locations","Car Bounce",::customLocation, undefined, (-869, 367, 282));
			self AddOption("Custom Locations","Far Out Of Map",::customLocation, undefined, (-7552, -607, 928));
			self AddOption("Custom Locations","Close Out Of Map",::customLocation, undefined, (1728, 52, 728));
            break;

        case "mp_highrise":
			self AddOption("Custom Locations","Roof",     ::customLocation, undefined, (-2745, 6800 - randomInt(800), 3250));
			self AddOption("Custom Locations","Helicopter",   ::customLocation, undefined, (-1396, 5940, 3193));
            self AddOption("Custom Locations","Crane",     ::customLocation, undefined, (-1630, 8476, 3340));
            self AddOption("Custom Locations","Tanker",  ::customLocation, undefined, (-1369, 7395, 3120));
			self AddOption("Custom Locations","High Scaffolding", ::customLocation, undefined, (-111.216, 6654.21, 3355.13));
            break;

        case "mp_invasion": 
            self AddOption("Custom Locations","Big Building", ::customLocation, undefined, (1080.44, -2745.85, 1270.13));
            self AddOption("Custom Locations","Mid Building", ::customLocation, undefined, (-1503.97, -1953.49, 1054.13));
            self AddOption("Custom Locations","Other Mid Building",        ::customLocation, undefined, (-2406, -2100, 1080));
            self AddOption("Custom Locations","Barrier Building", ::customLocation, undefined, (-1169.73, -2901.44, 1746.13));
			self AddOption("Custom Locations","Van Bounce", ::customLocation, undefined, (-2036.74, -3507.16, 862.125));
			self AddOption("Custom Locations","Spawn Building", ::customLocation, undefined, (-3293.16, -1531.76, 1144.13));
			self AddOption("Custom Locations","Out of Map", ::customLocation, undefined, (-1165.42, -4381.19, 1084.13));
            break;
	

        case "mp_quarry": 
            self AddOption("Custom Locations","Ladder",             ::customLocation, undefined, (-4025, -164.626, -115.618));
            self AddOption("Custom Locations","Inside Building",             ::customLocation, undefined, (-4270 - randomInt(500), -160, 370));
            self AddOption("Custom Locations","Elevator",        ::customLocation, undefined, (-4140, -980, 44));
            self AddOption("Custom Locations","Rock Spot",    ::customLocation, undefined, (-1871,-365, 408));
			self AddOption("Custom Locations","Rock Spot 2", ::customLocation, undefined, (-5771.9, 1093.6, 784.125));
            self AddOption("Custom Locations","Top Building",        ::customLocation, undefined, (-4790, 890, 260));
            self AddOption("Custom Locations","Lightpole",  ::customLocation, undefined, (-5096, 1809, 659));
            break;

        case "mp_terminal": //Done 
            self AddOption("Custom Locations","Top Red", ::customLocation, undefined, (1557, 4097, 364));
            self AddOption("Custom Locations","Ladder",        ::customLocation, undefined, (2216, 4356, 364));
            self AddOption("Custom Locations","Plane",      ::customLocation, undefined, (618, 2735, 470));
            self AddOption("Custom Locations","Lightpole",    ::customLocation, undefined, (1384, 4480, 666));
            self AddOption("Custom Locations","Inside Spawn",  ::customLocation, undefined, (-187.53, 5535, 369.163));
			self AddOption("Custom Locations","Plane Bounce",  ::customLocation, undefined, (2401, 2400, 848));
			self AddOption("Custom Locations","Out of Map Building",  ::customLocation, undefined, (-1027, 4184, 744));
            break;

        case "mp_checkpoint":
            self AddOption("Custom Locations","Terrorist Spawn Building", ::customLocation, undefined, (-171.49, -3088.16, 432.125));
            self AddOption("Custom Locations","Out of Map Terrorist Spawn", ::customLocation, undefined, (1488.45, -3591.9, 963.336));
            self AddOption("Custom Locations","Chicken",     ::customLocation, undefined, (-1535, -557, 53));
			self AddOption("Custom Locations","Medium Mid Building", ::customLocation, undefined, (30.6915, -534.322, 600.125));
			self AddOption("Custom Locations","OG Trickshot Roof", ::customLocation, undefined, (-543, -207, 424));
			self AddOption("Custom Locations","Car Bounce", ::customLocation, undefined, (909.991, 605.646, 550.88));
            self AddOption("Custom Locations","Far Out of Map", ::customLocation, undefined, (-4011.66, 724.939, 928.125));
            self AddOption("Custom Locations","Big Mid Building", ::customLocation, undefined, (-48.8054, 485.793, 744.125));
			self AddOption("Custom Locations","Backdrop", ::customLocation, undefined, (-1401, 1411, 476));
            break;
			
		case "mp_rundown":
			self AddOption("Custom Locations","Small Hut", ::customLocation, undefined, ((938, -502, 250)));
            self AddOption("Custom Locations","window shot", ::customLocation, undefined, (-654.19, -237.386, 184.125));
            self AddOption("Custom Locations","Cracked Wall",     ::customLocation, undefined, (-866, -995, 177));
			self AddOption("Custom Locations","Lightpole", ::customLocation, undefined, ((1029, -1718, 536)));
			self AddOption("Custom Locations","Overhang", ::customLocation, undefined, (-359.881, -1797.42, 299.909));
            self AddOption("Custom Locations","Hill Bounce", ::customLocation, undefined, (920.825, 1150.52, 410.725));
			break;
			
		case "mp_rust":
			self AddOption("Custom Locations","Out of Map Ele", ::customLocation, undefined, (529.857, -173.916, 1087.9));
            self AddOption("Custom Locations","OG Trickshot", ::customLocation, undefined, (657, 1062, 327));
            self AddOption("Custom Locations","Bomb / Tanker Bounce",     ::customLocation, undefined, (962, 750, 200));
			self AddOption("Custom Locations","Mountain", ::customLocation, undefined, (-3823.9, -5301.99, 1058.13));
			self AddOption("Custom Locations","Mountain Bounce", ::customLocation, undefined, (-4710.57, -3179.56, 1423.13));
            self AddOption("Custom Locations","Reverse Tanker Bounce", ::customLocation, undefined, (1218.01, 157.125, 16.125));
            self AddOption("Custom Locations","Top of Tower", ::customLocation, undefined, (6.30269, 1519.19, 515.953));
			break;
			
		case "mp_boneyard":
            self AddOption("Custom Locations","Top Spawn", ::customLocation, undefined, (-1311, 612, 202));
            self AddOption("Custom Locations","L Plane",     ::customLocation, undefined, ((436, 586, 130)));
			self AddOption("Custom Locations","Plane Tip", ::customLocation, undefined, (1078.66, 519.578, 190.625));
			self AddOption("Custom Locations","Out of Map Tree", ::customLocation, undefined, (856.099, -1006.75, 587.566));
			self AddOption("Custom Locations","Out of Map Crane", ::customLocation, undefined, (-4699.74, 4968.37, 2723.02));
			break;
			
		case "mp_nightshift":
            self AddOption("Custom Locations","Mid Sign", ::customLocation, undefined, (-2214.28, -1086.87, 1137.69));
            self AddOption("Custom Locations","Water Tower",     ::customLocation, undefined, ((-260, -39, 452)));
			self AddOption("Custom Locations","Sui", ::customLocation, undefined, (1902.66, 472.833, 704.125));
			self AddOption("Custom Locations","spawn building", ::customLocation, undefined, (109, -1363, 716));
			self AddOption("Custom Locations","Out of Map Car Bounce", ::customLocation, undefined, (-1970.76, -2404.68, 768.125));
			break;
		
		case "mp_brecourt":
			self AddOption("Custom Locations","Lightpole Bounce", ::customLocation, undefined, (-2484.02, -897.354, 335.862));
			self AddOption("Custom Locations","Lightpole Bounce 2", ::customLocation, undefined, (-2239.16, 1780.74, 407.601));
			self AddOption("Custom Locations","Helicopter", ::customLocation, undefined, (-2971.45, 353.023, 211.125));
			self AddOption("Custom Locations","Ruined House", ::customLocation, undefined, (1139.42, -2381.18, 236.623));
			self AddOption("Custom Locations","Sky Barrier", ::customLocation, undefined, (3882.59, -2962.34, 1184.13));
			break;
		
		case "mp_underpass":
			self AddOption("Custom Locations","Friendly Spawn Bridge", ::customLocation, undefined, (355.62, 2460.04, 1028.13));
			self AddOption("Custom Locations","Enemy Spawn Bridge",   ::customLocation, undefined, (2210.55, -666.694, 1028.13));
			self AddOption("Custom Locations","Ontop of A Bomb",       ::customLocation, undefined, (-403.834, 88.9112, 739.348));
			self AddOption("Custom Locations","Normal Trickshot Building", ::customLocation, undefined, (-19.0056, 1543.17, 521.125));
			self AddOption("Custom Locations","Dumpster Bounce",       ::customLocation, undefined, (912.884, 90.9941, 744.568));
			break;
			
		case "mp_subbase":
		self AddOption("Custom Locations","Forklift Bounce", ::customLocation, undefined, (720.333, -933.001, 1902.13));
		self AddOption("Custom Locations","Ontop Of Submarine", ::customLocation, undefined, (2163.84, -977.638, 8162.13));
		self AddOption("Custom Locations","L building", ::customLocation, undefined, (-497.616, 730.302, 921.125));
		self AddOption("Custom Locations","Regular Trickshot Building", ::customLocation, undefined, (903.089, 285.972, 312.125));
			break;

        case "mp_storm":
            self AddOption("Custom Locations","A Bomb", ::customLocation, undefined, (1277, 1361, 56));
            break;

        case "mp_crash":
            self AddOption("Custom Locations","Trash Can", ::customLocation, undefined, (1184.26, 1341, 203.011));
            self AddOption("Custom Locations","Ladder",    ::customLocation, undefined, (1604, 381, 333));
            break;

        case "mp_compact":
            self AddOption("Custom Locations","Tires", ::customLocation, undefined, (1634.45, 1137, 44.1668));
            break;

        case "mp_overgrown":
            self AddOption("Custom Locations","Overgrown Wallbreach", ::customLocation, undefined, (-608.196, -2376.15, -103.875));
            break;

        default:
            self AddOption("Custom Locations","None");
            break;
    }
	/// ── Seth Location ────────────────────────────────
	self CreateMenu("Seth Location","Teleport");
	self AddDvarSlider( "Seth Location","Save Point:",   undefined,"function_sethpoint",     1,5,1 );
	self AddOption(     "Seth Location","Save Location", ::sethpos );
	self AddOption(     "Seth Location","Load Location", ::loadseth );
	self AddDvarSlider( "Seth Location","Spawn Point:",  undefined,"function_spawnsethpoint",1,5,1 );
	self AddBindSliders("Seth Location","Save Location Bind", ::saveLocBind,"saveseth");
	self AddBindSliders("Seth Location","Load Location Bind", ::saveLocSeth,"loadseth");

	/// ── meep Location ───────────────────────────────
	self CreateMenu("meep Location","Teleport");
	self AddDvarSlider( "meep Location","Save Point:",        undefined,"function_savepoint",     1,5,1 );
	self AddOption(     "meep Location","Save Location",      ::savepos );
	self AddOption(     "meep Location","Load Location",      ::loadpos );
	self AddDvarSlider( "meep Location","Spawn Point:",       undefined,"function_spawnsavepoint",1,5,1 );
	self AddBindSliders("meep Location","Save Location Bind", ::saveLocBind,"saveloc");
	self AddBindSliders("meep Location","Load Location Bind", ::loadLocBind,"loadloc");

    /*self CreateMenu("Aimbot", "Counter UAV");  old aimbot shit
    self addoption("Aimbot","Aimbot Weapon", ::aimbotWeapon, getDvar("aimbotWeapon"));
    self addOption ("Aimbot", "Aimbot Strength", ::aimbotStrength, self.aimbotStrength);
    self addoption("Aimbot","Hitmarker Weapon", ::hitmarkerWeapon, getDvar("hitmarkerWeapon"));
    self addOption ("Aimbot","Aimbot Hitmarker", ::aimbot_hitmarker, self.aimbothitmarker);
    self addOption ("Aimbot", "Headshot Aimbot", ::headshotAimbot, getPers("headshotAimbot"));
    self addOption ("Aimbot", "Aimbot Delay Settings", ::loadMenu, undefined,"Aimbot Delay Settings");

	self createMenu("Aimbot Delay Settings", "Aimbot");
	self addOption ("Aimbot Delay Settings", "Increase Aimbot Delay by 0.15", ::aimbotDelay, undefined, 0.14);
	self addOption ("Aimbot Delay Settings", "Decrease Aimbot Delay by 0.15", ::aimbotDelay, undefined, -0.14);
	self addOption ("Aimbot Delay Settings", "Value : [^5" + self.aimbotDelay + "^7]" );*/

    self CreateMenu("Aimbot", "Counter UAV");
    self AddOption("Aimbot", "Weapon", ::aimbotWeapon, self.pers["aimbotWeapon"]);
    self AddSlider("Aimbot", "Strength", undefined, "aimbotStrength", 0, 9999, 50);
    self AddSlider("Aimbot", "Delay", undefined, "aimbotDelay", 0, 3, 0.14);
	self addOption("Aimbot", "Everwhere", ::everywhereeb, getPers("everywhereeb"));
    self addOption("Aimbot", "Mid Air", ::midAirOnly, getPers("midAirOnly"));
    self addOption("Aimbot", "Headshots", ::headshots, getDvar("headshots"));
    ///self AddOption("Aimbot", "Friendly Weapon", ::friendlyWeapon, getPers("friendlyweapon"));
    ///self AddOption("Aimbot", "Friendly Aimbot", ::friendlyAimbot, getPers("friendlyaimbot"));
    ///self AddOption("Aimbot", "Hitmarker Aimbot", ::hmaimbot, getPers("hmaimbot"));
    ///self AddOption("Aimbot", "Hitmarker Weapon", ::hmweapon, getPers("hmweapon"));

    self CreateMenu("Game", "Counter UAV");
    self addoption("Game", "Rounds Setup",::LoadMenu, undefined,"Rounds");
	self addoption("Game", "HUD Elements",::LoadMenu, undefined,"HUD");
	self AddArraySlider("Game","Adjust Timer",::adjustRoundTime,strTok("Add 15 Seconds,Add 30 Seconds,Add 60 Seconds,Remove 15 Seconds,Remove 30 Seconds,Remove 60 Seconds",","),"unused");
	self AddOption("Game", "Auto Plant Bomb", ::ToggleAutoPlantBomb, getDvar("scr_autoPlantBomb"));
	self addOption("Game", "Killcam Timer", ::killcamTimer, getPers("killcamtimer"));
    self AddDvarSlider("Game", "Killcam Length", undefined, "scr_killcam_time", 1, 10, 1);
    self AddOption("Game", "Killcam Lag", ::KillcamLagTog, getDvar("function_killcamlag"));
    self AddOption("Game", "Round Timer", ::timerToggle, getPers("timerthing"));
	self AddOption("Game", "Prone Spins", ::pronespins, getDvar("function_pronespins"));
	self AddOption("Game", "Midair Prone", ::toggleMidairProne, getDvar("function_midprone"));
    self AddOption("Game", "Player Health", ::playerhealth, getDvar("player_health"));
    self AddOption("Game", "Knife Lunges", ::knifelunges, getPers("knifelunges"));
    self AddOption("Game", "Depatch Bounces", ::depatch, getPers("bounces"));
    self AddOption("Game", "Depatch Elevators", ::depatch_elev, getPers("elevators"));
	self AddOption("Game", "Bullet Marks", ::bullets, getPers("bullets"));
    self AddDvarSlider("Game", "Timescale", undefined, "timescale", 0.5, 5, 0.5);
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
    self AddArraySlider("Game", "Death Barriers", ::cycleDeathBarrierMode, strTok("On,Sui,Off", ","), "function_deathbarrier_mode");
	self AddArraySlider("Game", "XP", ::cycleXpValue, strTok("Default,69,420,666,777,1337,2025,AD,OMEN", ","), "xp_slider");
    self AddArraySlider("Game", "Change Map", ::changeMap, strTok("mp_afghan,mp_derail,mp_estate,mp_favela,mp_highrise,mp_invasion,mp_checkpoint,mp_quarry,mp_rundown,mp_rust,mp_boneyard,mp_nightshift,mp_subbase,mp_terminal,mp_underpass,mp_brecourt", ","), "change_map");
	self AddOption("Game", "Match Type", ::ToggleMatchType, self.pers["function_matchtype"]);
    self AddOption("Game", "Map Restart", ::_mapRestart);
    self AddOption("Game", "Disconnect", ::_Disconnect);


    self CreateMenu("Rounds", "Game");
	self AddDvarSlider("Rounds", "Friendly Rounds", undefined, "roundslost", 0, 3, 1);
    self AddDvarSlider("Rounds", "Enemy Rounds", undefined, "roundswon", 0, 3, 1);
    self AddOption("Rounds", "Set Rounds", ::sndroundreset2);
	
	self CreateMenu("HUD", "Game");
	self addOption("HUD", "Bomb Icons", ::toggleBombIcons, getBombIconState());
	self AddOption("HUD", "Kill Distance", ::toggleKillDistance, getKillDistanceState());
	self addOption("HUD", "Sweeping UAV", ::toggleSelfUAV, getSelfUAVState());

    self CreateMenu("Instashoot", "Game");
    self addoption("Instashoot","Instashoot", ::instashoots_tog, getPers("instashoots"));
    self AddOption("Instashoot", "Instashoot Weapon", ::instashoots_weapon, getDvar("instashoots_weapon"));

    self CreateMenu("Weapon", "Counter UAV");
	self AddOption("Weapon", "Give Weapons", ::LoadMenu, undefined, "Weapons");
	self AddOption("Weapon", "One Man Army Menu", ::LoadMenu, undefined, "One Man Army");
    self AddOption("Weapon", "On Class Change", ::LoadMenu, undefined, "Class Change");
	self AddOption("Weapon", "Infinite Ammo", ::ToggleReloadRefill, self.pers["function_reloadrefill"]);
	self AddOption("Weapon", "Infinite Equipement", ::set_infiniteammo, self.pers["function_infammo"]);
	self AddOption("Weapon", "Weapon:", ::drop_weapon_name, getDvar("drop_weapon_name"));
	self AddBindSliders("Weapon", "Spawn Weapon Bind", ::dropdeletebind, "dropdeletebind");
    self AddOption("Weapon", "Drop Canswap", ::dropCanswap);
    self AddOption("Weapon", "Drop Current Weapon", ::dropdagun);
	self AddOption("Weapon", "Take Current Weapon", ::takedagun);
    self AddOption("Weapon", "Save Spawn Location" , ::drop_weapon_location);

    self CreateMenu("Weapons", "Weapon");
    ///self AddOption("Weapons", "Give Akimbo", ::giveAkimbo);
    self AddArraySlider("Weapons", "Assault Rifle", ::giveWeap, strTok("m4,famas,scar,tavor,fal,m16,masada,fn2000,ak47", ","), "give_weapon_ar");
    self AddArraySlider("Weapons", "Sub Machine Gun", ::giveWeap, strTok("mp5k,ump45,kriss,p90,uzi", ","), "give_weapon_smg");
    self AddArraySlider("Weapons", "Light Machine Gun", ::giveWeap, strTok("sa80,rpd,mg4,aug,m240", ","), "give_weapon_lmg");
    self AddArraySlider("Weapons", "Sniper Rifle", ::giveWeap, strTok("cheytac,barrett,wa2000,m21", ","), "give_weapon_sniper");
    self AddArraySlider("Weapons", "Machine Pistol", ::giveWeap, strTok("pp2000,glock,beretta393,tmp", ","), "give_weapon_machine");
    self AddArraySlider("Weapons", "Shotgun", ::giveWeap, strTok("spas12,aa12,striker,ranger,m1014,model1887", ","), "give_weapon_handgun");
    self AddArraySlider("Weapons", "Handgun", ::giveWeap, strTok("usp,coltanaconda,beretta,deserteagle", ","), "give_weapon_shotgun");
    self AddArraySlider("Weapons", "Launcher", ::giveWeap, strTok("at4,m79,stinger,javelin,rpg", ","), "give_weapon_launcher");
    self AddArraySlider("Weapons", "Special", ::giveWeap, strTok("defaultweapon,deserteaglegold,cheytac_nocock,cheytac_lunge", ","), "give_weapon_special");

    self CreateMenu("Bots", "Counter UAV");
    self addoption("Bots", "Spawn Friendly", ::spawnFriendlyBot);
    self addoption("Bots", "Spawn Enemy", ::spawnEnemyBot);
    self addoption("Bots", "Teleport Settings",::LoadMenu, undefined,"Teleport Bots");
    self AddOption("Bots", "Bots Functions", ::LoadMenu, undefined, "Bots Functions");

        self CreateMenu("Bots Functions", "Bots");
        self AddArraySlider("Bots Functions", "Bot Preset", ::change_bot, strTok("Default,Meep,Brat,Blake,Camden", ","), "change_bot");
        self addoption("Bots Functions", "Enemy Bot Weapon", ::ebotweapon, getDvar("ebotweapon"));
        self addoption("Bots Functions", "Friendly Bot Weapon", ::fbotWeapon, getDvar("fbotweapon"));
        self AddDvarSlider("Bots Functions", "Bot Prestige", ::botprestige, "bot_prestige",  0, 11, 1); 

        ///self AddBindSliders("Bots Functions", "Bot Mantle Bind", ::botmantlebind, "botmantlebind");
        ///self AddBindSliders("Bots Functions", "Bot Kills Friend", ::botkilltest, "botkilltest");
        self addoption("Bots Functions", "Enemy Bot Velocity",::LoadMenu, undefined,"eBotVelo");
        self addoption("Bots Functions", "Friendly Bot Velocity",::LoadMenu, undefined,"fBotVelo");
		///self AddBindSliders("Bots Functions", "Enemy Weapon Bind", ::ebotweaponBind, "ebotweapbind");
		self addoption("Bots Functions", "'^5SMART^7' Bot Functions",::LoadMenu, undefined,"SmartBoi");


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
	
	self CreateMenu("SmartBoi", "Bots Functions");
	self AddOption("SmartBoi", "'^5SMART^7' Bots", ::ToggleSmartBots, self.pers["smartbots"]);
	self AddOption("SmartBoi", "Bots Unlimited Ammo",  ::toggleBotAmmo,   getDvar("function_botAmmo"));
	self AddOption("SmartBoi", "Bots Crouch",          ::makePlayerCrouch, getPers("crouch"));
	self AddOption("SmartBoi", "Bots Move",   ::toggleBotsMove,   getDvar("ui_botsMove"));
	self AddOption("SmartBoi", "Bots Attack", ::toggleBotsAttack, getDvar("ui_botsAttack"));
	self AddOption  ("SmartBoi", "Bots Look",            ::toggleBotsLook,    self.pers["botsLook"]);

    self CreateMenu("Teleport Bots", "Bots");
    //self AddOption("Teleport Bots", "Teleport Enemy [3 Seconds]", ::teleportbots, undefined, getOtherTeam(self.pers["team"]));
    //self AddOption("Teleport Bots", "Teleport Friendly [3 Seconds]", ::teleportbots, undefined, self.pers["team"]);
    self addoption("Teleport Bots", "Teleport Enemy", ::tpenemybots);
    self addoption("Teleport Bots", "Teleport Friendly", ::tpfriendbots);

    self AddOption("Teleport Bots", "Save Location", ::saveLocationBot);
    self AddOption("Teleport Bots", "Load Location", ::loadLocationBot);
	self AddBindSliders("Teleport Bots", "Load Bot Location Bind", ::loadLocBots, "loadbotloc");

    self addoption("Bots", "Kick Settings",::LoadMenu, undefined,"Kick Bots");
    
    self CreateMenu("Kick Bots", "Bots");
    self AddOption("Kick Bots", "Kick Enemy Bots", ::kickenemybots);
    self AddOption("Kick Bots", "Kick Friendly Bots", ::kickfriendbots);
    self addoption("Kick Bots", "Kick All Bots", ::removeEveryBot);


    self CreateMenu("Binds", "Counter UAV");
    self addoption("Binds", "Dvar Toggle",::LoadMenu, undefined,"Dvar Toggle");
    self addoption("Binds", "Velocity",::LoadMenu, undefined,"Velocity");
    self addoption("Binds", "Nac Mod",::LoadMenu, undefined,"Nac Mod");
    //self addoption("Binds", "Kill Bot",::LoadMenu, undefined,"KillBotMenu");
    self addoption("Binds", "Set Anim",::LoadMenu, undefined,"Set Anim");
    //self addoption("Binds", "Swap to Weapon",::LoadMenu, undefined,"SwaptoWeapon");
    //self addoption("Binds", "Radius Damage",::LoadMenu, undefined,"Radius");
    self addoption("Binds", "Bolt Movement",::LoadMenu, undefined,"Bolt");
    self addoption("Binds", "Force Barrel",::LoadMenu, undefined,"Force");
	self addoption("Binds", "EMP Menu",::LoadMenu, undefined,"EMP1");
    self AddBindSliders("Binds", "Blast Shield", ::blastbind, "blastbind");
	self AddBindSliders("Binds", "Illusion Slow Reload", ::slowreload, "slowreload");
    self AddBindSliders("Binds", "Cp Mala", ::cpmala, "cpmala");
    self AddBindSliders("Binds", "Pred Mala", ::predmala, "predmala");
	self AddBindSliders("Binds", "Sentry Bind", ::sentrybind, "sentrybind");
	self AddBindSliders("Binds", "Altswap", ::altswap, "altswap");
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
    self AddBindSliders("Binds", "Tac Destroyed", ::destroytac, "destroytac");
    self AddBindSliders("Binds", "Thirdeye", ::thirdeyebind, "thirdeyebind");
    self AddBindSliders("Binds", "Give OMA", ::omabind, "omabind");
    self AddBindSliders("Binds", "Killstreak Splash", ::kssplashbind, "kssplashbind");


    self CreateMenu("Bolt", "Binds");
    self addoption("Bolt", "Save Point", ::savebolt);
    self addoption("Bolt", "Delete Point", ::deletebolt);
    self AddDvarSlider("Bolt", "Bolt Speed", undefined, "bolttime", 0, 10, 0.2);
    self AddBindSliders("Bolt", "Bolt Movement Bind", ::boltbind, "boltbind");
    self addoption("Bolt", "Fix ADS [^5LATENCY WHEN ON^7]", ::fix_ads, getPers("fixADS"));


	self CreateMenu("EMP1", "Binds");
	self AddBindSliders("EMP1", "Bot Emp", ::BotEmp, "BotEmp");
	self AddBindSliders("EMP1", "Self Emp", ::SelfEmp, "SelfEmp");

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
    self AddArraySlider("Dvar Toggle", "Set Dvar", ::dvartog, strTok("g_gravity,g_speed,jump_ladderpushvel,player_useradius,jump_height,g_useholdtime,sv_padpackets", ","), "dvartog");
    self AddDvarSlider("Dvar Toggle", "First Value", undefined, "dvartog1", 0, 800, 50);
    self AddDvarSlider("Dvar Toggle", "Second Value", undefined, "dvartog2", 0, 800, 50);
    self AddBindSliders("Dvar Toggle", "Toggle Dvar Bind", ::dvarbind, "dvarbind");


    /*self CreateMenu("Killstreaks", "Counter UAV");
    self AddArraySlider("Killstreaks", "Killstreak", ::giveStreak, strTok("uav,counter_uav,airdrop,predator_missile,sentry,precision_airstrike,harrier_airstrike,helicopter,airdrop_mega,pavelow,stealth_airstrke,helicopter_minigun,ac130,emp,nuke", ","), "current_streak");
    self AddOption("Killstreaks", "Remove Killstreaks", ::removeKS);
	self addoption("Killstreaks", "Carepackage Physics", ::toggledvar, getDvarInt("function_carepackphysic"), "function_carepackphysic");
    self AddOption("Killstreaks", "Carepackage to Crosshair", ::spawncarepackagecross);
    self AddOption("Killstreaks", "Carepackage on yourself", ::spawncarepackageself);
    self AddOption("Killstreaks", "Delete Carepackage(s)", ::delete_carepack);
    self AddDvarSlider("Killstreaks", "CP Capture Time", undefined, "cg_cratetime", 0, 5000, 500);
    self AddArraySlider("Killstreaks", "Change Crate Type [{+usereload}]", ::change_cratedvar, strTok("ammo,uav,counter_uav,sentry,predator_missile,precision_airstrike,harrier_airstrike,helicopter,helicopter_flares,stealth_airstrike,helicopter_minigun,ac130,emp", ","), "crate_type");
    self AddOption("Killstreaks", "Save Carepackage Drop Location", ::setcppos);
    self AddBindSliders("Killstreaks", "Call Carepackage in Location", ::cppos, "cppos");*/



    self CreateMenu("Killstreaks", "Counter UAV");
    self AddArraySlider("Killstreaks", "Killstreak", ::giveStreak, strTok("uav,counter_uav,airdrop,predator_missile,sentry,precision_airstrike,harrier_airstrike,helicopter,airdrop_mega,pavelow,stealth_airstrke,helicopter_minigun,ac130,emp,nuke", ","), "current_streak");
    self AddOption("Killstreaks", "Remove Killstreaks", ::removeKS);
    self AddOption("Killstreaks", "Carapackage Stuff", ::LoadMenu, undefined, "CPFUNC");

    self CreateMenu("CPFUNC", "Killstreaks");
	self AddOption("CPFUNC", "Spawn CP on Location" , ::cponpos, getPers("cponpos"));
	self AddBindSliders("CPFUNC", "Call Carepackage in Location", ::cppos, "cppos");
	self addoption("CPFUNC", "Carepackage to Self", ::spawncarepackageself1);
    self AddOption("CPFUNC", "Carepackage to Crosshair", ::spawncarepackagecross);
    self AddOption("CPFUNC", "Delete Carepackage(s)", ::delete_carepack);
    self AddOption("CPFUNC", "Save CP Spawn Location" , ::cp_location);
    ///self AddDvarSlider("CPFUNC", "CP Capture Time", undefined, "cg_cratetime", 0, 5000, 500);
    ///self AddArraySlider("CPFUNC", "Change Crate Type [{+usereload}]", ::change_cratedvar, strTok("ammo,uav,counter_uav,sentry,predator_missile,precision_airstrike,harrier_airstrike,helicopter,helicopter_flares,stealth_airstrike,helicopter_minigun,ac130,emp", ","), "crate_type");
    self AddOption("CPFUNC", "Set Call in Location", ::setcppos);
   


    self createMenu("Class Settings", "Counter UAV");
    self AddOption("Class Settings", "Edit Primary Weapon", ::LoadMenu, undefined, "primary_weapon");
    self AddOption("Class Settings", "Edit Secondary Weapon", ::LoadMenu, undefined, "secondary_weapon");
    self AddOption("Class Settings", "Edit Camos", ::LoadMenu, undefined, "camo_editor");
    self AddOption("Class Settings", "Equipments", ::LoadMenu, undefined, "equipment");
    self AddOption("Class Settings", "Special Grenade", ::LoadMenu, undefined, "special_grenade");
    self AddOption("Class Settings", "Perk One", ::LoadMenu, undefined, "perk_one");
    self AddOption("Class Settings", "Perk Two", ::LoadMenu, undefined, "perk_two");
    self AddOption("Class Settings", "Perk Three", ::LoadMenu, undefined, "perk_three");
    //self AddOption("Class Settings", "BR6T Classes", ::br6tclasses);
    self AddOption("Class Settings", "meep Classes", ::meepclasses);


    self createMenu("primary_weapon", "Class Settings");
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

    self createMenu("secondary_weapon", "Class Settings");
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

    self createMenu("equipment", "Class Settings");
    self addOption ("equipment", "Frag", ::equipment_editor, undefined, "frag_grenade_mp");
    self addOption ("equipment", "Semtex", ::equipment_editor, undefined, "semtex_mp");
    self addOption ("equipment", "Throwing Knife", ::equipment_editor, undefined, "throwingknife_mp");
    self addOption ("equipment", "Tactical Insertion", ::equipment_editor, undefined, "specialty_tacticalinsertion");
    self addOption ("equipment", "Blast Shield", ::equipment_editor, undefined, "specialty_blastshield");
    self addOption ("equipment", "Claymore", ::equipment_editor, undefined, "claymore_mp");
    self addOption ("equipment", "C4", ::equipment_editor, undefined, "c4_mp");

    self createMenu("special_grenade", "Class Settings");
    self addOption ("special_grenade", "Flash Grenade", ::special_grenade_editor, undefined, "flash_grenade");
    self addOption ("special_grenade", "Stun Grenade", ::special_grenade_editor, undefined, "concussion_grenade");
    self addOption ("special_grenade", "Smoke Grenade", ::special_grenade_editor, undefined, "smoke_grenade");

    self createMenu("perk_one", "Class Settings");
    self addOption ("perk_one", "Marathon", ::perk_editor, undefined, 1, "specialty_marathon");
    self addOption ("perk_one", "Sleight of Hand", ::perk_editor, undefined, 1, "specialty_fastreload");
    self addOption ("perk_one", "Scavenger", ::perk_editor, undefined, 1, "specialty_scavenger");
    self addOption ("perk_one", "Bling", ::perk_editor, undefined, 1, "specialty_bling");
    self addOption ("perk_one", "One Man Army", ::perk_editor, undefined, 1, "specialty_onemanarmy");

    self createMenu("perk_two", "Class Settings");
    self addOption ("perk_two", "Stopping Power", ::perk_editor, undefined, 2, "specialty_bulletdamage");
    self addOption ("perk_two", "Lightweight", ::perk_editor, undefined, 2, "specialty_lightweight");
    self addOption ("perk_two", "Hardline", ::perk_editor, undefined, 2, "specialty_hardline");
    self addOption ("perk_two", "Cold-Blooded", ::perk_editor, undefined, 2, "specialty_coldblooded");
    self addOption ("perk_two", "Danger Close", ::perk_editor, undefined, 2, "specialty_explosivedamage");

    self createMenu("perk_three", "Class Settings");
    self addOption ("perk_three", "Commando", ::perk_editor, undefined, 3, "specialty_extendedmelee");
    self addOption ("perk_three", "Steady Aim", ::perk_editor, undefined, 3, "specialty_bulletaccuracy");
    self addOption ("perk_three", "Scrambler", ::perk_editor, undefined, 3, "specialty_localjammer");
    self addOption ("perk_three", "Ninja", ::perk_editor, undefined, 3, "specialty_heartbreaker");
    self addOption ("perk_three", "SitRep", ::perk_editor, undefined, 3, "specialty_detectexplosive");
    self addOption ("perk_three", "Last Stand", ::perk_editor, undefined, 3, "specialty_pistoldeath");

    self createMenu("camo_editor", "Class Settings");
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
 


    // ── Trust Binds Menu (from WHITENOISE) ──
    self CreateMenu("Trust Binds", "Counter UAV");
    self addoption("Trust Binds", "Bind Toggles", ::LoadMenu, undefined, "Trust Bind Toggles");
    self addoption("Trust Binds", "Carepackage Binds", ::LoadMenu, undefined, "Trust CP Binds");
    self addoption("Trust Binds", "Killstreak Binds", ::LoadMenu, undefined, "Trust KS Binds");
    self addoption("Trust Binds", "Animation Binds", ::LoadMenu, undefined, "Trust Anim Binds");
    self addoption("Trust Binds", "Movement Binds", ::LoadMenu, undefined, "Trust Move Binds");
    self addoption("Trust Binds", "Weapon Binds", ::LoadMenu, undefined, "Trust Weap Binds");
    self addoption("Trust Binds", "Misc Binds", ::LoadMenu, undefined, "Trust Misc Binds");

    self CreateMenu("Trust Bind Toggles", "Trust Binds");
    self addoption("Trust Bind Toggles", "Nac Mod Toggle", ::togglebind_trust, undefined, "nacmod");
    self addoption("Trust Bind Toggles", "Nac Modder Toggle", ::togglebind_trust, undefined, "nacmodder");
    self addoption("Trust Bind Toggles", "Instaswapper Toggle", ::togglebind_trust, undefined, "instaswapper");
    self addoption("Trust Bind Toggles", "Instaswap Toggle", ::togglebind_trust, undefined, "instaswap");
    self addoption("Trust Bind Toggles", "Cycle Toggle", ::togglebind_trust, undefined, "cycle");
    self addoption("Trust Bind Toggles", "Gunlock Toggle", ::togglebind_trust, undefined, "lock");
    self addoption("Trust Bind Toggles", "Velocity Toggle", ::togglebind_trust, undefined, "vel");
    self addoption("Trust Bind Toggles", "Killbot Toggle", ::togglebind_trust, undefined, "killbot");
    self addoption("Trust Bind Toggles", "Damage Toggle", ::togglebind_trust, undefined, "damage");

    self CreateMenu("Trust CP Binds", "Trust Binds");
    self addoption("Trust CP Binds", "Carepackage Bind", ::togglebind_trust, undefined, "carepack");
    self addoption("Trust CP Binds", "Dead CP Bind", ::togglebind_trust, undefined, "deadcpbind");
    self addoption("Trust CP Binds", "Prone Block CP", ::togglebind_trust, undefined, "pbcarepackbind");
    self addoption("Trust CP Binds", "Crosshair CP", ::togglebind_trust, undefined, "crosshairCP");

    self CreateMenu("Trust KS Binds", "Trust Binds");
    self addoption("Trust KS Binds", "Predator Missile", ::togglebind_trust, undefined, "pred");
    self addoption("Trust KS Binds", "AC130 Bind", ::togglebind_trust, undefined, "ac130bind");
    self addoption("Trust KS Binds", "Airstrike Bind", ::togglebind_trust, undefined, "airstrikerbind");
    self addoption("Trust KS Binds", "Sentry Bind", ::togglebind_trust, undefined, "sentry");
    self addoption("Trust KS Binds", "Jammer Bind", ::togglebind_trust, undefined, "jammerbind");

    self CreateMenu("Trust Anim Binds", "Trust Binds");
    self addoption("Trust Anim Binds", "Smooth Anim", ::togglebind_trust, undefined, "smooth");
    self addoption("Trust Anim Binds", "Smooth Canner", ::togglebind_trust, undefined, "smoothcanner");
    self addoption("Trust Anim Binds", "Barrel Roll", ::togglebind_trust, undefined, "barrelroll");
    self addoption("Trust Anim Binds", "Gflip Bind", ::togglebind_trust, undefined, "gflip");
    self addoption("Trust Anim Binds", "Inf Sprint", ::togglebind_trust, undefined, "infsprinter");
    self addoption("Trust Anim Binds", "Sprint In", ::togglebind_trust, undefined, "sprintinr");
    self addoption("Trust Anim Binds", "Akimbo Zoom", ::togglebind_trust, undefined, "akimbozoom");

    self CreateMenu("Trust Move Binds", "Trust Binds");
    self addoption("Trust Move Binds", "Gypsy Knife", ::togglebind_trust, undefined, "gypsyknife");
    self addoption("Trust Move Binds", "Pred Knifer", ::togglebind_trust, undefined, "predknifer");
    self addoption("Trust Move Binds", "Houdini", ::togglebind_trust, undefined, "houdini");
    self addoption("Trust Move Binds", "Prone Knife", ::togglebind_trust, undefined, "proneknifebind");
    self addoption("Trust Move Binds", "Tac Knife", ::togglebind_trust, undefined, "tacknifebind");
    self addoption("Trust Move Binds", "Canswap", ::togglebind_trust, undefined, "canswap");
    self addoption("Trust Move Binds", "Illusion Canswap", ::togglebind_trust, undefined, "canzoom");

    self CreateMenu("Trust Weap Binds", "Trust Binds");
    self addoption("Trust Weap Binds", "OMA Shax", ::togglebind_trust, undefined, "omashax");
    self addoption("Trust Weap Binds", "OMA Overlay", ::togglebind_trust, undefined, "oma");
    self addoption("Trust Weap Binds", "OMA Bar Sprint", ::togglebind_trust, undefined, "omabarsprintin");
    self addoption("Trust Weap Binds", "Give Weapons Bind", ::togglebind_trust, undefined, "giveweapsbind");
    self addoption("Trust Weap Binds", "Give Mala", ::togglebind_trust, undefined, "givemalabind");
    self addoption("Trust Weap Binds", "Alt Swap", ::togglebind_trust, undefined, "altswap");

    self CreateMenu("Trust Misc Binds", "Trust Binds");
    self addoption("Trust Misc Binds", "Frag Repeater", ::togglebind_trust, undefined, "frag");
    self addoption("Trust Misc Binds", "Force Barrel Mala", ::togglebind_trust, undefined, "forcemala");
    self addoption("Trust Misc Binds", "Painkiller", ::togglebind_trust, undefined, "pain");
    self addoption("Trust Misc Binds", "Copycat (Illusion)", ::togglebind_trust, undefined, "copycat");
    self addoption("Trust Misc Binds", "Zoom Load", ::togglebind_trust, undefined, "zoomload");
    self addoption("Trust Misc Binds", "Scavenger", ::togglebind_trust, undefined, "scav");
    self addoption("Trust Misc Binds", "Reflect FF", ::togglebind_trust, undefined, "reflectff");
    self addoption("Trust Misc Binds", "Vish Bind", ::togglebind_trust, undefined, "vish");
    self addoption("Trust Misc Binds", "CCB (Class Change)", ::togglebind_trust, undefined, "ccb");
    self addoption("Trust Misc Binds", "Semtex Stuck Msg", ::togglebind_trust, undefined, "semtexmsg");
    self addoption("Trust Misc Binds", "Hitmarker", ::togglebind_trust, undefined, "hitmarker");
    self addoption("Trust Misc Binds", "Host Migration", ::togglebind_trust, undefined, "hostmigra");
    self addoption("Trust Misc Binds", "Last Stand", ::togglebind_trust, undefined, "laststand");
    self addoption("Trust Misc Binds", "Final Stand", ::togglebind_trust, undefined, "finalstand");
    self addoption("Trust Misc Binds", "Destroy Tac", ::togglebind_trust, undefined, "destroytac");
    self addoption("Trust Misc Binds", "Flash Bind", ::togglebind_trust, undefined, "flash");
    self addoption("Trust Misc Binds", "Third Eye", ::togglebind_trust, undefined, "thirdeye");
    self addoption("Trust Misc Binds", "Bot EMP", ::togglebind_trust, undefined, "botemp");
    self addoption("Trust Misc Binds", "Self EMP", ::togglebind_trust, undefined, "selfemp");

    // ── CFG Commands Menu (+ command binds) ──
    self CreateMenu("CFG Commands", "Counter UAV");
    self addoption("CFG Commands", "OMA Shax (+omashax)", ::placeholder_cfg);
    self addoption("CFG Commands", "OMA Overlay (+oma)", ::placeholder_cfg);
    self addoption("CFG Commands", "Houdini (+houdini)", ::placeholder_cfg);
    self addoption("CFG Commands", "Nac Mod (+nac)", ::placeholder_cfg);
    self addoption("CFG Commands", "Tablet (+tablet)", ::placeholder_cfg);
    self addoption("CFG Commands", "Inv Tablet (+invtab)", ::placeholder_cfg);
    self addoption("CFG Commands", "Open Tablet (+opentab)", ::placeholder_cfg);
    self addoption("CFG Commands", "OMA Bag (+omabag)", ::placeholder_cfg);
    self addoption("CFG Commands", "Bolt (+bolt)", ::placeholder_cfg);
    self addoption("CFG Commands", "C4 Detonate (+c4deto)", ::placeholder_cfg);
    self addoption("CFG Commands", "Copycat (+copycat)", ::placeholder_cfg);
    self addoption("CFG Commands", "Canswap (+canswap)", ::placeholder_cfg);
    self addoption("CFG Commands", "Canzoom (+canzoom)", ::placeholder_cfg);
    self addoption("CFG Commands", "Bounce (+bounce)", ::placeholder_cfg);
    self addoption("CFG Commands", "Zoom Load (+zoomload)", ::placeholder_cfg);
    self addoption("CFG Commands", "Instaswap (+insta)", ::placeholder_cfg);
    self addoption("CFG Commands", "Gflip (+gflip)", ::placeholder_cfg);
    self addoption("CFG Commands", "Smooth Anim (+smoothanim)", ::placeholder_cfg);
    self addoption("CFG Commands", "Glide (+glide)", ::placeholder_cfg);
    self addoption("CFG Commands", "Anim (+anim)", ::placeholder_cfg);
    self addoption("CFG Commands", "Cowboy (+cowboy)", ::placeholder_cfg);
    self addoption("CFG Commands", "AC130 (+ac130)", ::placeholder_cfg);
    self addoption("CFG Commands", "Sprint In (+sprintin)", ::placeholder_cfg);
    self addoption("CFG Commands", "Melee (+cfgmelee)", ::placeholder_cfg);
    self addoption("CFG Commands", "Mara Reload (+marareload)", ::placeholder_cfg);
    self addoption("CFG Commands", "Inf Sprint (+infsprint)", ::placeholder_cfg);
    self addoption("CFG Commands", "Jam Radar (+jam)", ::placeholder_cfg);
    self addoption("CFG Commands", "Akimbo Glitch (+akimboglitch)", ::placeholder_cfg);
    self addoption("CFG Commands", "Semtex Msg (+stuck)", ::placeholder_cfg);
    self addoption("CFG Commands", "Enable Pickup (+enablefrag)", ::placeholder_cfg);
    self addoption("CFG Commands", "Disable Pickup (+disablefrag)", ::placeholder_cfg);
    self addoption("CFG Commands", "Damage Rep (+damrep)", ::placeholder_cfg);
    self addoption("CFG Commands", "Rad Mark (+radmark)", ::placeholder_cfg);
    self addoption("CFG Commands", "G Mode (+gmode)", ::placeholder_cfg);
    self addoption("CFG Commands", "H Mode (+hmode)", ::placeholder_cfg);
    self addoption("CFG Commands", "D Mode (+dmode)", ::placeholder_cfg);
    self addoption("CFG Commands", "Pickup Rad (+pickuprad)", ::placeholder_cfg);
    self addoption("CFG Commands", "No Pickup Rad (+nopickuprad)", ::placeholder_cfg);

    self createMenu("Players", "Counter UAV");
    foreach(player in level.players)
    {
        self addOption("Players", player.name, ::loadMenu, undefined, player.name);
        self createMenu(player.name, "Players");
        self addOption(player.name, "Kick", ::kickPlayer, undefined, player);
        self addOption(player.name, "Teleport", ::teleportPlayer, undefined, player);
        if(player.pers["isBot"] && isDefined(player.pers["isBot"]))
        {
        self AddOption(player.name, "Toggle Crouch", ::makePlayerCrouch, getPers("crouch"), player);

        }
    }
    
}