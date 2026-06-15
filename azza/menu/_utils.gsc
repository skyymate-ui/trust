// ============================================================
// AZZA MENU — HUD Utilities
// Helper functions for creating/destroying menu HUD elements
// ============================================================

#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

// ============================================================
// MENU CREATION HELPERS
// These are used by _structure.gsc and _logic.gsc
// ============================================================

createMenu(menu, parent)
{
    self.menu.text[menu] = [];
    self.menu.bool[menu] = [];
    self.menu.func[menu] = [];
    self.menu.input[menu] = [];
    self.menu.parent[menu] = parent;
}

addOption(menu, text, func, input)
{
    index = self.menu.text[menu].size;
    self.menu.text[menu][index] = text;

    if(isDefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::placeholder;

    if(isDefined(input))
        self.menu.input[menu][index] = input;

    // Submenu indicator
    if(isDefined(func) && func == ::loadMenu)
        self.menu.bool[menu][index] = ">";
    else
        self.menu.bool[menu][index] = "";
}

addToggle(menu, text, func, state)
{
    index = self.menu.text[menu].size;
    self.menu.text[menu][index] = text;

    if(isDefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::placeholder;

    if(isDefined(state))
        self.menu.bool[menu][index] = "[" + state + "]";
    else
        self.menu.bool[menu][index] = "[Off]";
}

placeholder()
{
    // Empty function — used as default for unimplemented options
}

loadMenu(menu)
{
    self azza\menu\_structure::structure();
    self.menu.smoothscroll = false;

    // Save scroll position of current menu
    self.menu.lastscroll[self.menu.current] = self.menu.scroll;

    if(self.menu.isopen)
        self destroyMenu();

    self.menu.current = menu;

    // Restore scroll position if returning to this menu
    if(!isDefined(self.menu.lastscroll[self.menu.current]))
        self.menu.scroll = 0;
    else
        self.menu.scroll = self.menu.lastscroll[self.menu.current];

    self createMenuHud();
    self thread azza\menu\_logic::updateScroll();
    self.menu.smoothscroll = true;
}

// ============================================================
// HUD RENDERING
// ============================================================

createMenuHud()
{
    self.hud = [];

    // --- Background Panel ---
    self.hud["background"] = self createRect("CENTER", "CENTER", 0, 0, 200, 300, self.menu.color["background"], 0, 0.85);

    // --- Header ---
    self.hud["header"] = self createRect("CENTER", "CENTER", 0, -135, 200, 25, self.menu.color["header"], 1, 0.95);

    // --- Header Accent Line (RGB) ---
    self.hud["accent_top"] = self createRect("CENTER", "CENTER", 0, -122, 200, 2, self.menu.color["accent"], 2, 1);

    // --- Title Text ---
    self.hud["title"] = self createText(self.menutitle, "objective", 1.4, "CENTER", "CENTER", 0, -135, 3, (1, 1, 1));

    // --- Scrollbar (RGB accent) ---
    self.hud["scrollbar"] = self createRect("CENTER", "CENTER", -95, -100, 3, 18, self.menu.color["accent"], 2, 1);

    // --- Bottom Accent Line (RGB) ---
    self.hud["accent_bot"] = self createRect("CENTER", "CENTER", 0, 150, 200, 2, self.menu.color["accent"], 2, 1);

    // --- Option Text Elements ---
    self.hud["options"] = [];
    self.hud["values"] = [];
    for(i = 0; i < self.menu.maxsize; i++)
    {
        self.hud["options"][i] = self createText("", "objective", 1.1, "LEFT", "CENTER", -85, -105 + (i * 22), 3, self.menu.color["text"]);
        self.hud["values"][i] = self createText("", "objective", 1.1, "RIGHT", "CENTER", 90, -105 + (i * 22), 3, self.menu.color["text"]);
    }

    // Start RGB update on accent elements
    self thread updateAccentHud();
}

destroyMenu()
{
    self notify("stopAccentUpdate");

    if(!isDefined(self.hud))
        return;

    keys = getArrayKeys(self.hud);
    for(i = 0; i < keys.size; i++)
    {
        if(keys[i] == "options" || keys[i] == "values")
        {
            for(j = 0; j < self.hud[keys[i]].size; j++)
                self.hud[keys[i]][j] destroy();
        }
        else
        {
            self.hud[keys[i]] destroy();
        }
    }
    self.hud = undefined;
}

// ============================================================
// RGB ACCENT HUD UPDATE
// Updates accent-colored HUD elements each frame to match
// the cycling RGB color
// ============================================================
updateAccentHud()
{
    self endon("disconnect");
    self endon("death");
    self endon("stopAccentUpdate");

    while(true)
    {
        if(isDefined(self.hud["accent_top"]))
            self.hud["accent_top"].color = self.menu.color["accent"];
        if(isDefined(self.hud["accent_bot"]))
            self.hud["accent_bot"].color = self.menu.color["accent"];
        if(isDefined(self.hud["scrollbar"]))
            self.hud["scrollbar"].color = self.menu.color["accent"];
        wait 0.05;
    }
}

// ============================================================
// LOW-LEVEL HUD PRIMITIVES
// ============================================================

createRect(align, relative, x, y, width, height, color, sort, alpha)
{
    elem = newClientHudElem(self);
    elem.elemType = "bar";
    elem.width = width;
    elem.height = height;
    elem.align = align;
    elem.relative = relative;
    elem.xOffset = 0;
    elem.children = [];
    elem.sort = sort;
    elem.color = color;
    elem.alpha = alpha;
    elem setPoint(align, relative, x, y);
    elem setShader("white", width, height);
    return elem;
}

createText(text, font, fontScale, align, relative, x, y, sort, color)
{
    elem = self createFontString(font, fontScale);
    elem setPoint(align, relative, x, y);
    elem.sort = sort;
    elem.alpha = 1;
    elem.color = color;
    elem setText(text);
    return elem;
}
