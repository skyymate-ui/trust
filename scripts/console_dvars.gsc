
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

init()
{
    // Console HUD
    setDvar("cg_overheadNamesSize", "0.65");
    setDvar("cg_overheadIconSize", "1.1");
    setDvar("cg_overheadRankSize", "0.5");
    setDvar("cg_overheadfont", "2");
    setDvar("cg_overheadtitlesfont", "2");
    setDvar("cg_overheadtitlesize", "0.5");
    setDvar("cg_overheadnamesfarscale", "0.7");
    setDvar("cg_overheadnamesfardist", "512");
    setDvar("cg_overheadnamesneardist", "64");
    setDvar("compassObjectiveWidth", "17.5");
    setDvar("compassObjectiveHeight", "17.5");
    setDvar("ui_smallFont", "0.563");
    setDvar("ui_bigFont", "0.688");
    setDvar("ui_extraBigFont", "1");
    setDvar("r_textureMode", "bilinear");
    setDvar("r_texfiltermipmode", "2");
    setDvar("cg_scoreboardPingText", "0");
    setDvar("ui_streamFriendly", true);
    setDvar("g_teamColor_MyTeam", "0.501961 0.8 1 1" );
    setDvar("g_teamTitleColor_MyTeam", "0.501961 0.8 1 1" );
    setDvar("safearea_adjusted_vertical", "1" );
    setDvar("safearea_adjusted_horizontal", "1" );
    setDvar("safearea_horizontal", "0.85" );
    setDvar("safearea_vertical", "0.85" );

    replaceFunc( maps\mp\gametypes\_killcam::initKCElements, ::new_kc_elements ); // Console HUD Timer

    // Monitor for player connects
    thread monitor_connect();
}

monitor_connect()
{
    while(true)
    {
        level waittill("connected", player);
        player set_all_dvars("cg_overheadNamesSize", "0.65");
        player set_all_dvars("cg_overheadIconSize", "1.1");
        player set_all_dvars("cg_overheadRankSize", "0.5");
        player set_all_dvars("cg_overheadfont", "2");
        player set_all_dvars("cg_overheadtitlesfont", "2");
        player set_all_dvars("cg_overheadtitlesize", "0.5");
        player set_all_dvars("cg_overheadnamesfarscale", "0.7");
        player set_all_dvars("cg_overheadnamesfardist", "512");
        player set_all_dvars("cg_overheadnamesneardist", "64");
        player set_all_dvars("compassObjectiveWidth", "17.5");
        player set_all_dvars("compassObjectiveHeight", "17.5");
        player set_all_dvars("ui_smallFont", "0.563");
        player set_all_dvars("ui_bigFont", "0.688");
        player set_all_dvars("ui_extraBigFont", "1");
        player set_all_dvars("r_textureMode", "bilinear");
        player set_all_dvars("r_texfiltermipmode", "2");
        player set_all_dvars("cg_scoreboardPingText", "0");
        player set_all_dvars("ui_streamFriendly", true);
        player set_all_dvars("g_teamColor_MyTeam", "0.501961 0.8 1 1" );
        player set_all_dvars("g_teamTitleColor_MyTeam", "0.501961 0.8 1 1" );
        player set_all_dvars("safearea_adjusted_vertical", "1" );
        player set_all_dvars("safearea_adjusted_horizontal", "1" );
        player set_all_dvars("safearea_horizontal", "0.85" );
        player set_all_dvars("safearea_vertical", "0.85" );
    }
}

/*
    Utilities
*/

set_all_dvars(dvar, val)
{
    setDvar(dvar, val);
    foreach(player in level.players)
        player setClientDvar(dvar, val);
}

/*
    This Are Our Rehooks
*/

/* Gives the proper size of a Killcam Timer for PC */
new_kc_elements()
{
	if ( !isDefined( self.kc_skiptext ) )
	{
		self.kc_skiptext = newClientHudElem( self );
		self.kc_skiptext.archived = false;
		self.kc_skiptext.x = 0;
		self.kc_skiptext.alignX = "center";
		self.kc_skiptext.alignY = "top";
		self.kc_skiptext.horzAlign = "center_adjustable";
		self.kc_skiptext.vertAlign = "top_adjustable";
		self.kc_skiptext.sort = 1; // force to draw after the bars
		self.kc_skiptext.font = "default";
		self.kc_skiptext.foreground = true;
		self.kc_skiptext.hideWhenInMenu = true;

		if ( level.splitscreen )
		{
			self.kc_skiptext.y = 20;
			self.kc_skiptext.fontscale = 1.2; // 1.8/1.5
		}
		else
		{
			self.kc_skiptext.y = 32;
			self.kc_skiptext.fontscale = 1.8;
		}
	}

	if ( !isDefined( self.kc_othertext ) )
	{
		self.kc_othertext = newClientHudElem( self );
		self.kc_othertext.archived = false;
		self.kc_othertext.y = 47;
		self.kc_othertext.alignX = "CENTER";
		self.kc_othertext.alignY = "CENTER";
		self.kc_othertext.horzAlign = "center";
		self.kc_othertext.vertAlign = "middle";
		self.kc_othertext.sort = 10; // force to draw after the bars
		self.kc_othertext.font = "small";
		self.kc_othertext.foreground = true;
		self.kc_othertext.hideWhenInMenu = true;

		if ( level.splitscreen )
		{
			self.kc_othertext.x = 16;
			self.kc_othertext.fontscale = 1.2;
		}
		else
		{
			self.kc_othertext.x = 96;
			self.kc_othertext.fontscale = 1.6;
		}
	}

	if ( !isDefined( self.kc_icon ) )
	{
		self.kc_icon = newClientHudElem( self );
		self.kc_icon.archived = false;
		self.kc_icon.x = 16;
		self.kc_icon.y = 16;
		self.kc_icon.alignX = "left";
		self.kc_icon.alignY = "top";
		self.kc_icon.horzAlign = "center";
		self.kc_icon.vertAlign = "middle";
		self.kc_icon.sort = 1; // force to draw after the bars
		self.kc_icon.foreground = true;
		self.kc_icon.hideWhenInMenu = true;
	}

	if ( !level.splitscreen )
	{
		if ( !isdefined( self.kc_timer ) )
		{
			self.kc_timer = createFontString( "hudbig", 1.2 );
			self.kc_timer.archived = false;
			self.kc_timer.x = 0;
			self.kc_timer.alignX = "center";
			self.kc_timer.alignY = "middle";
			self.kc_timer.horzAlign = "center_safearea";
			self.kc_timer.vertAlign = "top_adjustable";
			self.kc_timer.y = 42; //42 is Default
			self.kc_timer.sort = 1; // force to draw after the bars
			self.kc_timer.font = "hudbig";
			self.kc_timer.foreground = true;
			self.kc_timer.color = (0.85,0.85,0.85);
			self.kc_timer.hideWhenInMenu = true;
		}
			if(self scripts\mp\_util::getPers("killcamtimer") == "Off")
				self.kc_timer.alpha = 0;
	}
}