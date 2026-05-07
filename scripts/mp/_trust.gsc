#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\perks\_perkfunctions;
#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;
#include scripts\mp\_functions;

// ============================================================
// MP BIND FUNCTIONS (merged from WHITENOISE V2)
// Converted to Lab Eng setupBind framework (bind, endonon)
// ============================================================

// ── Weapon Swap / Animation Binds ──

nacmodder(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            x = self getCurrentWeapon();
            z = self getNextWeapon();
            self takeWeaponGood(x);
            self switchToWeapon(z);
            waitframe();
            self giveWeaponGood();
        }
    }
}

instaswapper(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            nacmod = self getCurrentWeapon();
            if(nacmod == self.PrimaryWeapon)
            {
                Secondary = self.SecondaryWeapon;
                wait .05;
                self SetSpawnWeapon(secondary);
            }
            else if(nacmod == self.SecondaryWeapon)
            {
                Primary = self.PrimaryWeapon;
                wait .05;
                self SetSpawnWeapon(primary);
            }
        }
    }
}

smoothbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self setweaponidletime(1000);
            self setSpawnWeapon(self getCurrentWeapon());
            self illusion();
            self setweaponanim(1);
            self setweaponanimtime(0);
        }
    }
}

smoothcanner(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self docanswap();
            wait .25;
            self setweaponidletime(1000);
            self setSpawnWeapon(self getCurrentWeapon());
            self illusion();
            self setweaponanim(1);
            self setweaponanimtime(0);
        }
    }
}

barrelroll(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self docanswap();
            wait .15;
            self setweaponidletime(1000);
            self setSpawnWeapon(self getCurrentWeapon());
            self illusion();
            self setweaponanim(1);
            self setweaponanimtime(0);
        }
    }
}

gflipbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            my_weapon = self getCurrentweapon();
            stock = self getWeaponAmmoStock(my_weapon);
            clip = self getWeaponAmmoClip(my_weapon);
            self takeWeapon(my_weapon);
            self giveWeapon("cheytac_silencer_xmags_mp");
            self switchToWeapon("cheytac_silencer_xmags_mp");
            waitframe();
            waitframe();
            self takeWeapon("cheytac_silencer_xmags_mp");
            self giveWeapons(my_weapon);
            self setweaponammostock(my_weapon, stock);
            self setweaponammoclip(my_weapon, clip);
            self switchToWeapon(my_weapon);
        }
    }
}

canswapbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
            self docanswap();
    }
}

canzoombind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
            self docanzoom();
    }
}

vishbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self setweaponidletime(1000);
            self setweaponanim(1);
            self setweaponanimtime(0);
        }
    }
}

copycat(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
            self illusion();
    }
}

zoomloadbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self setweaponidletime(1000);
            self setweaponanim(13);
            self setweaponanimtime(0);
        }
    }
}

houdini(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self disableWeapons();
            waitframe();
            self enableWeapons();
            self illusion();
        }
    }
}

// ── Knife / Melee Animation Binds ──

gypsyknife(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            my_weapon = self getCurrentweapon();
            self takeWeaponGood(my_weapon);
            self giveWeapon("usp_silencer_mp");
            self switchToWeapon("usp_silencer_mp");
            self illusion();
            exec("g_speed 60;+forward;wait 20;+melee;-melee;wait 25;-forward;g_speed 190;");
            wait .5;
            wait .75;
            exec("cg_gun_x 0");
            exec("cg_gun_y 0");
            exec("cg_gun_z 0");
            self giveWeapons(my_weapon);
            self waittill("weapon_change");
            self takeWeapon("usp_silencer_mp");
        }
    }
}

predknifer(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            my_weapon = self getCurrentWeapon();
            self takeWeaponGood(my_weapon);
            self illusion();
            wait 0.1;
            setDvar("g_hardcore", 1);
            self giveWeapon("killstreak_precision_airstrike_mp");
            self switchToWeapon("killstreak_precision_airstrike_mp");
            waitframe();
            self SetWeaponAnim(8);
            wait 0.2;
            self giveWeaponGood();
            self waittill("weapon_change");
            setDvar("g_hardcore", 0);
            self takeWeapon("killstreak_precision_airstrike_mp");
        }
    }
}

proneknifebind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self setClientDvar("cg_gun_z", -3);
            self setClientDvar("cg_gun_y", 5);
            self setClientDvar("cg_gun_x", -1);
            self SetWeaponAnim(8);
            wait .5;
            self setClientDvar("cg_gun_z", 0);
            self setClientDvar("cg_gun_y", 0);
            self setClientDvar("cg_gun_x", 0);
        }
    }
}

tacknifebind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self setClientDvar("cg_gun_z", -4);
            self setClientDvar("cg_gun_y", 9);
            self setClientDvar("cg_gun_x", -3);
            self SetWeaponAnim(8);
            wait .5;
            self setClientDvar("cg_gun_z", 0);
            self setClientDvar("cg_gun_y", 0);
            self setClientDvar("cg_gun_x", 0);
        }
    }
}

akimbozoom(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            x = self getCurrentWeapon();
            self takeWeaponGood(x);
            self giveWeapon("beretta_akimbo_mp");
            self switchToWeapon("beretta_akimbo_mp");
            self illusion();
            waitframe();
            self setweaponanim(8);
            self setClientDvar("cg_gun_z", 2);
            self setClientDvar("cg_gun_y", 5);
            self setClientDvar("cg_gun_x", 0);
            waitframe();
            self SetWeaponAnim(13);
            wait 1;
            self giveWeaponGood();
            self waittill("weapon_change");
            self takeWeapon("beretta_akimbo_mp");
            self setClientDvar("cg_gun_z", 0);
            self setClientDvar("cg_gun_y", 0);
            self setClientDvar("cg_gun_x", 0);
        }
    }
}

// ── Movement Binds ──

infsprinter(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
            self setWeaponAnim(24);
    }
}

sprintinr(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
            self setWeaponAnim(23);
    }
}

// ── OMA / Class Binds ──

omabarsprintin(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            x = self getCurrentWeapon();
            setdvar("scr_oma_usetime", 2);
            self takeWeaponGood(x);
            self giveWeapon("onemanarmy_mp");
            self switchToWeapon("onemanarmy_mp");
            wait 0.1;
            self illusion();
            self setweaponanim(23);
            self playLocalSound("foly_onemanarmy_bag3_plr");
            self maps\mp\perks\_perkfunctions::omaUseBar(getDvarFloat("scr_oma_usetime"));
            self giveWeaponGood();
            wait .10;
            self takeWeapon("onemanarmy_mp");
            setdvar("scr_oma_usetime", 3);
        }
    }
}

omashax(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
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

ccb(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            x = self getCurrentWeapon();
            self takeWeaponGood(x);
            self giveWeapon("onemanarmy_mp");
            self switchToWeapon("onemanarmy_mp");
            wait 0.2;
            self giveWeaponGood();
            self waittill("weapon_change");
            self takeWeapon("onemanarmy_mp");
        }
    }
}

painkiller(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
            self thread maps\mp\perks\_perkfunctions::setCombatHigh();
    }
}

// ── Killstreak Binds ──

kiwizbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            x = self getCurrentWeapon();
            self takeWeaponGood(x);
            self illusion();
            self giveWeapon("killstreak_predator_missile_mp");
            self switchToWeapon("killstreak_predator_missile_mp");
            wait 0.2;
            self giveWeaponGood();
            self waittill("weapon_change");
            self takeWeapon("killstreak_predator_missile_mp");
        }
    }
}

ac130bind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
            self thread maps\mp\killstreaks\_ac130::tryUseAC130(self.origin);
    }
}

airstrikerbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self thread maps\mp\killstreaks\_airstrike::tryUseAirstrike(self.origin);
            self thread maps\mp\killstreaks\_airstrike::doAirstrike(self.origin);
            self waittill("weapon_change");
        }
    }
}

jammerbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
            level.players[1] thread maps\mp\killstreaks\_uav::useUAV("counter_uav");
    }
}

// ── Carepackage Binds ──

carepack(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate(self.origin + (0,0,60), "airdrop", self.origin + (0,0,60), true, undefined, self.origin + (0,0,60));
            self notify("drop_crate");
        }
    }
}

crosshairCP(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate(self gettrace(), "airdrop", self gettrace(), true, undefined, self gettrace());
            self notify("drop_crate");
        }
    }
}

pbcarepackbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            setdvar("function_carepackphysic", 1);
            setDvar("function_midprone", 1);
            carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate(self.origin + (0,0,80), "airdrop", self.origin + (0,0,80), true, undefined, self.origin + (0,0,80));
            self setStance("prone");
            self notify("drop_crate");
            wait 1;
            setDvar("function_midprone", 0);
            setdvar("function_carepackphysic", 0);
        }
    }
}

deadcpbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate(self.origin + (0,0,60), "airdrop", self.origin + (0,0,60), true, undefined, self.origin + (0,0,60));
            self notify("drop_crate");
        }
    }
}

// ── Weapon Give / Equipment Binds ──

giveweapsbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            if(getDvarInt("function_weaplist_defined") == 1)
            {
                x = self getWeaponsListPrimaries();
                foreach(gun in x)
                    self takeWeapon(gun);
                z = getDvarInt("function_weaplist_size");
                for(i = 0; i < z; i++)
                {
                    y = getDvar("function_weaplist" + i);
                    self giveWeapons(y, 0);
                }
                self switchToWeapon(getDvar("function_weaplist0"));
                self setSpawnWeapon(getDvar("function_weaplist0"));
            }
        }
    }
}

givemalabind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
            self givemala();
    }
}

// ── Misc Binds ──

scavbind(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self maps\mp\gametypes\_damagefeedback::updateDamageFeedback("scavenger");
            self playLocalSound("scavenger_pack_pickup");
            self setWeaponAmmoClip(self getCurrentWeapon(), 0);
            self setWeaponAmmoStock(self getCurrentWeapon(), 999);
        }
    }
}

reflectff(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            x = getDvarInt("scr_team_fftype");
            if(x == 0)
            {
                setDvar("scr_team_fftype", 2);
                self iPrintLn("Reflect Friendly Fire: ^2On");
            }
            else
            {
                setDvar("scr_team_fftype", 0);
                self iPrintLn("Reflect Friendly Fire: ^1Off");
            }
        }
    }
}

stuckmsg(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self maps\mp\gametypes\_hud_message::playerCardSplashNotify("semtex_stuck", self);
            self thread maps\mp\gametypes\_hud_message::SplashNotify("stuck_semtex", 100);
            wait 2;
        }
    }
}

forcebarrelmala(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            self[[game[self.team + "_model"]["SNIPER"]]]();
            waitframe();
            self[[game[self.team + "_model"]["GHILLIE"]]]();
            exec2("+frag");
            exec2("-frag");
            wait 0.2;
            self illusion();
        }
    }
}

fragreap(bind, endonon)
{
    self endon("stop" + endonon);
    for(;;)
    {
        self waittill(bind);
        if(!self isInMenu())
        {
            y = getDvarInt("function_infeq");
            setDvar("function_infeq", 0);
            self setWeaponAmmoClip(self getCurrentOffhand(), 0);
            x = getDvarInt("player_throwbackinnerradius");
            z = getDvarInt("player_throwbackouterradius");
            setDvar("player_throwbackinnerradius", 0);
            setDvar("player_throwbackouterradius", 0);
            exec("+frag;-frag");
            wait 1;
            setDvar("player_throwbackinnerradius", x);
            setDvar("player_throwbackouterradius", z);
            setDvar("function_infeq", y);
        }
    }
}


// ============================================================
// TRUST / WHITENOISE CFG FUNCTIONS
// These use +command CFG binds (bound via console: bind key +command)
// ============================================================

// Helper for CFG bind waits
bindwait_trust(notif, act)
{
    self notifyOnPlayerCommand(notif + act, act);
    self waittill(notif + act);
    if(act == "+actionslot 2")
        if(self adsButtonPressed())
            wait 0.25;
}

trust_cfg_calls()
{
    if(self isHost())
    {
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
            waitframe();
            self enableWeapons();
            self illusion();
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
            waitframe();
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
            self illusion();
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
            waitframe();
            waitframe();
            x = self getCurrentWeapon();
            self takeWeaponGood(x);
            self giveWeapon("killstreak_harrier_airstrike_mp");
            self switchToWeapon("killstreak_harrier_airstrike_mp");
            wait 0.2;
            self giveWeaponGood();
            self waittill("weapon_change");
            self takeWeapon("killstreak_harrier_airstrike_mp");
            waitframe();
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
            self illusion();
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
            self illusion();
    }
}

canswapcfg_t()
{
    for(;;)
    {
        self bindwait_trust("canswapcfg", "+canswap");
        if(!self isInMenu())
            self docanswap();
    }
}

canzoomcfg_t()
{
    for(;;)
    {
        self bindwait_trust("canzoomcfg", "+canzoom");
        if(!self isInMenu())
            self docanzoom();
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
            self illusion();
            waitframe();
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
            waitframe();
            waitframe();
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
            self illusion();
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
            self illusion();
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
            self illusion();
            waitframe();
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
