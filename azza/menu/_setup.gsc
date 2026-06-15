// ============================================================
// AZZA MENU — Setup & Initialization
// Black background with RGB cycling accent
// ============================================================

#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include azza\_util;
#include azza\menu\_utils;
#include azza\menu\_logic;

menuInit() {
    self.menu = spawnStruct();
    self.menu.isopen = false;
    self.menu.scroll = 0;
    self.menu.maxsize = 12;
    self.menu.maxsizehalf = 6;
    self.menu.text = [];
    self.menu.bool = [];
    self.menu.func = [];
    self.menu.input = [];
    self.menu.input2 = [];
    self.menu.slidertype = [];
    self.menu.pers = [];
    self.menu.dvar = [];
    self.menu.min = [];
    self.menu.max = [];
    self.menu.amount = [];
    self.menu.array = [];
    self.menu.arrayname = [];
    self.menu.parent = [];
    self.menu.lastscroll = [];
    self.menu.smoothscroll = true;
    self.menutitle = "AZZA";

    // Black + RGB colors
    self.menu.color = [];
    self.menu.color["background"] = (0, 0, 0);
    self.menu.color["header"] = (0.05, 0.05, 0.05);
    self.menu.color["accent"] = (1, 0, 0);

    // Init persistent variables
    self SetPersIfUni("ufo", "Off");

    // Start RGB cycle
    self thread rgbCycle();

    // Start menu buttons
    self thread menuButtons();
}

// ============================================================
// RGB Cycling — Smooth rainbow accent color
// ============================================================

rgbCycle() {
    self endon("disconnect");
    self endon("death");

    r = 1; g = 0; b = 0;
    step = 0.05;

    for(;;) {
        // Red to Yellow
        for(g = 0; g <= 1; g += step) {
            self.menu.color["accent"] = (1, g, 0);
            wait 0.05;
        }
        // Yellow to Green
        for(r = 1; r >= 0; r -= step) {
            self.menu.color["accent"] = (r, 1, 0);
            wait 0.05;
        }
        // Green to Cyan
        for(b = 0; b <= 1; b += step) {
            self.menu.color["accent"] = (0, 1, b);
            wait 0.05;
        }
        // Cyan to Blue
        for(g = 1; g >= 0; g -= step) {
            self.menu.color["accent"] = (0, g, 1);
            wait 0.05;
        }
        // Blue to Magenta
        for(r = 0; r <= 1; r += step) {
            self.menu.color["accent"] = (r, 0, 1);
            wait 0.05;
        }
        // Magenta to Red
        for(b = 1; b >= 0; b -= step) {
            self.menu.color["accent"] = (1, 0, b);
            wait 0.05;
        }
    }
}
