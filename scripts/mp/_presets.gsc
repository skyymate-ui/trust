#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;
#include scripts\mp\menu\_structure;
#include scripts\mp\_binds;
#include scripts\mp\_functions;

/*
        
        //setdvar("bot_prestige", 0);
        setdvar("bot_emblem", "");
        setdvar("bot_title", "");
        setdvar("botx",0);
        setdvar("botz",0);
        setdvar("boty",0);
        setdvar("bot2x",0);
        setdvar("bot2z",0);
        setdvar("bot2y",0);
        setDvar("viewanglebot", 0);
        setDvar("viewanglebot2", 0);

        setDvar("posx", 0);
        setDvar("posz", 0);
        setDvar("posy", 0);
        setDvar("viewangle", 0);

        setdvar("velx", 0);
        setdvar("velz", 0);
        setdvar("vely", 0);
        setdvar("velx2", 0);
        setdvar("velz2", 0);
        setdvar("vely2", 0);

        self setpers("bindname","+actionslot X");
        check _bind.gsc to finb your bind name

        self setpers("functionname","on/off/value");
        check _function.gsc to finb your function name

        replace "return" by "break" when preset is define to a map
        
*/
        
presetload()
{
    switch(getDvar("ui_mapname"))
    {
    case "mp_highrise":
        setdvar("bot_prestige", 10);
        setdvar("bot_emblem", "cardicon_humantrophy");
        setdvar("bot_title", "cardtitle_flasher");
        setdvar("botx",-1244);
        setdvar("botz",6513);
        setdvar("boty",3043);
        setdvar("bot2x",-1190);
        setdvar("bot2z",7388);
        setdvar("bot2y",3061);
        setDvar("viewanglebot", 45);
        setDvar("viewanglebot2", -90);

        setDvar("posx", 275);
        setDvar("posz", 7663);
        setDvar("posy", 3277);
        setDvar("viewangle", -28);

        setdvar("velx", 0);
        setdvar("velz", 0);
        setdvar("vely", 0);
        setdvar("velx2", 0);
        setdvar("velz2", 0);
        setdvar("vely2", 0);

        setdvar("nacmod1","model1887_akimbo_mp");
        setdvar("nacmod2","onemanarmy_mp");

        self setPers("drop_weapon_location", (257,7770,3398));
        setdvar("drop_weapon_name","model1887_akimbo_mp");
        setdvar("drop_weapon_clip",7);
        setdvar("drop_weapon_stock",42);
        self thread drop_weapon();
        self SetPers("dropdeletebind","+actionslot 2");
        self setPers("cp_location", (-38,7730,3110));
        self setPers("cponpos", "On");
        break;
        
    case "mp_terminal":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    case "mp_boneyard":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    case "mp_afghan":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    case "mp_derail":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    case "mp_estate":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    case "mp_favela":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;
        
    case "mp_invasion":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    case "mp_karachi":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    case "mp_quarry":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    case "mp_rundown":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    case "mp_rust":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    case "mp_skidrow":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    case "mp_subbase":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    case "mp_underpass":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    case "mp_brecourt":
        self iPrintLnBold( "[^5No preset found ! Please define your preset in the preset GSC.^7]" );
        return;

    }


    viewpos = getDvarInt("viewangle");
    self setPlayerAngles((0,viewpos,0));
    posx = getDvarInt("posx");
    posz = getDvarInt("posz");
    posy = getDvarInt("posy");
    self setOrigin((posx,posz,posy));
    self setVelocity((0,0,0));
    foreach ( player in level.players )
    if(isSubStr(player.guid, "bot"))
    {
    player maps\mp\perks\_perks::givePerk( "specialty_extendedmelee" );
    if(player.pers["team"] != self.pers["team"])
	{
        posx2 = getDvarInt("botx");
        posz2 = getDvarInt("botz");
        posy2 = getDvarInt("boty");

        player setOrigin((posx2,posz2,posy2));
    	player setVelocity((0,0,0));
        viewpos = getDvarInt("viewanglebot");
        player setPlayerAngles((0,viewpos,0));

    }
    if(isSubStr(player.guid, "bot"))
    if(player.pers["team"] == self.pers["team"])
	{
        posx2 = getDvarInt("bot2x");
        posz2 = getDvarInt("bot2z");
        posy2 = getDvarInt("bot2y");

        player setOrigin((posx2,posz2,posy2));
    	player setVelocity((0,0,0));
        viewpos = getDvarInt("viewanglebot2");
        player setPlayerAngles((0,viewpos,0));
    }
    }
    self iPrintLnBold("Saved Game Loaded");
    wait 1;
    self thread savepos();

}