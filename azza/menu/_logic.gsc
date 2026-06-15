// ============================================================
// AZZA MENU — Navigation Logic
// Handles opening, closing, scrolling, and selecting options
// ============================================================

#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include azza\menu\_utils;

// ============================================================
// MENU BUTTON LISTENERS
// ============================================================

menuButtons()
{
    self thread monitorOpen();
    self thread menuScrollUp();
    self thread menuScrollDown();
    self thread menuSelect();
    self thread menuBack();
}

// --- Open Menu: ADS + Dpad Up ---
monitorOpen()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("menuOpen", "+actionslot 1");

    while(true)
    {
        self waittill("menuOpen");
        if(self adsButtonPressed())
        {
            if(!self.menu.isopen)
            {
                self.menu.isopen = true;
                self loadMenu("Main");
                self freezeControls(true);
            }
        }
    }
}

// --- Scroll Up: Dpad Up ---
menuScrollUp()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("menuUp", "+actionslot 1");

    while(true)
    {
        self waittill("menuUp");
        if(self.menu.isopen && !self adsButtonPressed())
        {
            self.menu.scroll--;
            if(self.menu.scroll < 0)
                self.menu.scroll = self.menu.text[self.menu.current].size - 1;
            self updateScroll();
        }
    }
}

// --- Scroll Down: Dpad Down ---
menuScrollDown()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("menuDown", "+actionslot 2");

    while(true)
    {
        self waittill("menuDown");
        if(self.menu.isopen)
        {
            self.menu.scroll++;
            if(self.menu.scroll >= self.menu.text[self.menu.current].size)
                self.menu.scroll = 0;
            self updateScroll();
        }
    }
}

// --- Select: Use/Reload ---
menuSelect()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("menuSelect", "+usereload");

    while(true)
    {
        self waittill("menuSelect");
        if(self.menu.isopen)
        {
            func = self.menu.func[self.menu.current][self.menu.scroll];
            input = self.menu.input[self.menu.current][self.menu.scroll];

            if(isDefined(input))
                self thread [[func]](input);
            else
                self thread [[func]]();
        }
    }
}

// --- Back/Close: Melee ---
menuBack()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("menuBack", "+melee");

    while(true)
    {
        self waittill("menuBack");
        if(self.menu.isopen)
        {
            parent = self.menu.parent[self.menu.current];
            if(parent == "exit")
            {
                // Close the menu entirely
                self destroyMenu();
                self.menu.isopen = false;
                self freezeControls(false);
            }
            else
            {
                // Go back to parent menu
                self loadMenu(parent);
            }
        }
    }
}

// ============================================================
// SCROLL / DISPLAY UPDATE
// ============================================================

updateScroll()
{
    menu = self.menu.current;
    total = self.menu.text[menu].size;

    for(i = 0; i < self.menu.maxsize; i++)
    {
        if(i < total)
        {
            self.hud["options"][i] setText(self.menu.text[menu][i]);
            self.hud["values"][i] setText(self.menu.bool[menu][i]);

            // Highlight selected option
            if(i == self.menu.scroll)
            {
                self.hud["options"][i].color = self.menu.color["accent"];
                self.hud["values"][i].color = self.menu.color["accent"];
            }
            else
            {
                self.hud["options"][i].color = self.menu.color["text"];
                self.hud["values"][i].color = (0.7, 0.7, 0.7);
            }
        }
        else
        {
            self.hud["options"][i] setText("");
            self.hud["values"][i] setText("");
        }
    }

    // Move scrollbar to current position
    if(isDefined(self.hud["scrollbar"]))
    {
        targetY = -105 + (self.menu.scroll * 22);
        if(self.menu.smoothscroll)
            self.hud["scrollbar"] moveOverTime(0.12);
        self.hud["scrollbar"].y = targetY;
    }
}
