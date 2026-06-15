// ============================================================
// AZZA MENU — Setup & Initialization
// Handles menu struct creation, color scheme, and RGB accent
// ============================================================

#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include azza\menu\_utils;

setupMenu()
{
    self.menu = spawnStruct();
    self.menu.isopen = false;
    self.menu.smoothscroll = false;

    // --- Color Scheme: Black + RGB Accent ---
    self.menu.color = [];
    self.menu.color["background"] = (0, 0, 0);         // Pure black background
    self.menu.color["header"]     = (0.05, 0.05, 0.05); // Slightly lighter header
    self.menu.color["scrollbar"]  = (0.08, 0.08, 0.08); // Dark scrollbar track
    self.menu.color["text"]       = (1, 1, 1);           // White text
    self.menu.color["accent"]     = (1, 0, 0);           // RGB accent (starts red, cycles)

    // --- Menu Settings ---
    self.menutitle = "AZZA";
    self.menu.maxsize = 10;   // Max visible options at once

    // --- RGB Accent Cycle ---
    self thread rgbAccentCycle();

    // --- Start Menu Logic ---
    self thread azza\menu\_logic::menuButtons();
    self thread closeOnDeath();
    self createNotifys();
}

// ============================================================
// RGB ACCENT — Cycles the accent color through the rainbow
// Gives the menu a smooth RGB glow effect on accent elements
// ============================================================
rgbAccentCycle()
{
    self endon("disconnect");
    self endon("death");

    r = 1; g = 0; b = 0;
    step = 0.02;  // Speed of color transition (lower = slower)

    while(true)
    {
        // Red -> Yellow
        while(g < 1) { g += step; self.menu.color["accent"] = (r, g, b); wait 0.05; }
        g = 1;
        // Yellow -> Green
        while(r > 0) { r -= step; self.menu.color["accent"] = (r, g, b); wait 0.05; }
        r = 0;
        // Green -> Cyan
        while(b < 1) { b += step; self.menu.color["accent"] = (r, g, b); wait 0.05; }
        b = 1;
        // Cyan -> Blue
        while(g > 0) { g -= step; self.menu.color["accent"] = (r, g, b); wait 0.05; }
        g = 0;
        // Blue -> Magenta
        while(r < 1) { r += step; self.menu.color["accent"] = (r, g, b); wait 0.05; }
        r = 1;
        // Magenta -> Red
        while(b > 0) { b -= step; self.menu.color["accent"] = (r, g, b); wait 0.05; }
        b = 0;
    }
}

createNotifys()
{
    // Register button notifys for menu navigation
    foreach(value in strTok("+actionslot 1,+actionslot 2,+actionslot 3,+actionslot 4,+frag,+smoke,+usereload,+melee", ","))
    {
        self notifyOnPlayerCommand(value, value);
    }
}

closeOnDeath()
{
    self endon("disconnect");

    while(true)
    {
        self waittill("death");
        self thread azza\menu\_utils::destroyMenu();
        self.menu.isopen = false;
        self freezeControls(false);
    }
}
