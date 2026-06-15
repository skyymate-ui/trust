// ============================================================
// AZZA MENU — HUD Utilities
// Full menu framework: options, sliders, dvars, arrays, binds
// ============================================================

#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include azza\_util;

IsInMenu() {
    return self.menu.isopen;
}

CreateMenu(menu, parent) {
    self.menu.text[menu] = [];
    self.menu.bool[menu] = [];
    self.menu.parent[menu] = parent;
}

AddOption(menu, text, func, bool, input, input2) {
    index = self.menu.text[menu].size;
    if(isdefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::PlaceHolder;
    if(isdefined(bool))
        self.menu.bool[menu][index] = "[" + bool + "]";
    else
        self.menu.bool[menu][index] = "";
    if(isdefined(func) && func == ::LoadMenu)
        self.menu.bool[menu][index] = ">";
    self.menu.text[menu][index] = text;
    self.menu.input[menu][index] = input;
    self.menu.input2[menu][index] = input2;
    self.menu.slidertype[menu][index] = "none";
}

AddSlider(menu, text, func, pers, min, max, amount) {
    index = self.menu.text[menu].size;
    if(isdefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::Placeholder;
    self.menu.text[menu][index] = text;
    self.menu.bool[menu][index] = "[" + self GetPers(pers) + "]";
    self.menu.pers[menu][index] = pers;
    self.menu.min[menu][index] = min;
    self.menu.max[menu][index] = max;
    self.menu.amount[menu][index] = amount;
    self.menu.slidertype[menu][index] = "slider";
}

AddDvarSlider(menu, text, func, dvar, min, max, amount, player) {
    index = self.menu.text[menu].size;
    if (isdefined(func)) {
        self.menu.func[menu][index] = func;
    } else {
        self.menu.func[menu][index] = ::Placeholder;
    }
    if (isdefined(player)) {
        self.menu.bool[menu][index] = "[" + player.name + "]";
    } else {
        self.menu.bool[menu][index] = "[" + GetDvarFloat(dvar) + "]";
    }
    self.menu.text[menu][index] = text;
    self.menu.dvar[menu][index] = dvar;
    self.menu.min[menu][index] = min;
    self.menu.max[menu][index] = max;
    self.menu.amount[menu][index] = amount;
    self.menu.slidertype[menu][index] = "dvar";
}

AddArraySlider(menu, text, func, array, arrayname, input) {
    index = self.menu.text[menu].size;
    if(!isdefined(level.arrayscrolls))
        level.arrayscrolls = [];
    level.arrayscrolls[arrayname] = array;
    self.menu.array[menu][index] = array;
    self.menu.arrayname[menu][index] = arrayname;
    if(!isdefined(self GetPers("arrayindex_" + arrayname)))
        self SetPers("arrayindex_" + arrayname, 0);
    self.menu.bool[menu][index] = "[" + level.arrayscrolls[arrayname][Int(self GetPers("arrayindex_" + arrayname))] + "]";
    if(isdefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::Placeholder;
    self.menu.text[menu][index] = text;
    self.menu.input[menu][index] = input;
    self.menu.slidertype[menu][index] = "array";
}

AddBindSliders(menu, text, func, pers) {
    index = self.menu.text[menu].size;
    if(isdefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::Placeholder;
    self.menu.text[menu][index] = text;
    if(self GetPers(pers) != "[Off]" && self GetPers(pers) != "Off")
        self.menu.bool[menu][index] = "[[{" + self GetPers(pers) + "}]]";
    else
        self.menu.bool[menu][index] = "[Off]";
    self.menu.pers[menu][index] = pers;
    self.menu.slidertype[menu][index] = "bind";
}

PlaceHolder() {
}

Placeholder() {
}

ExecuteFunction(f, i1, i2) {
    if(isdefined(i2))
        return self thread [[f]](i1, i2);
    else if(isdefined(i1))
        return self thread [[f]](i1);
    return self thread [[f]]();
}

LoadMenu(menu) {
    self azza\menu\_structure::Structure();
    self.menu.smoothscroll = false;
    self.menu.lastscroll[self.menu.current] = self.menu.scroll;
    if(self IsInMenu())
        self DestroyMenuHud();
    self.menu.current = menu;
    if(!isdefined(self.menu.lastscroll[self.menu.current]))
        self.menu.scroll = 0;
    else
        self.menu.scroll = self.menu.lastscroll[self.menu.current];
    self CreateMenuHud();
    self azza\menu\_logic::UpdateScroll();
    self UpdateMenuBackground();
    self.menu.smoothscroll = true;
}

// ============================================================
// HUD RENDERING — Black + RGB Accent
// ============================================================

DestroyMenuHud() {
    self notify("endCordsUpdate");
    foreach(key, element in self.hud) {
        if(key != "text" && key != "bool_text") {
            element Destroy();
        }
        else {
            foreach(text_element in self.hud[key]) {
                text_element Destroy();
            }
        }
    }
}

CreateMenuHud() {
    self.hud = [];

    // --- Background (pure black) ---
    self.hud["background"] = self CreateRectangle("white", "TOP", "CENTER", 280, -150, 180, 200, self.menu.color["background"], 0, 0.85);

    // --- Header box (slightly lighter) ---
    self.hud["header_box"] = self CreateRectangle("white", "TOP", "CENTER", 280, -150, 180, 17, self.menu.color["header"], 1, 0.95);

    // --- RGB accent line top ---
    self.hud["accent_top"] = self CreateRectangle("white", "TOP", "CENTER", 280, -133, 180, 2, self.menu.color["accent"], 2, 1);

    // --- Title ---
    self.hud["title"] = CreateText("objective", 1.3, "TOP", "CENTER", 280, -150, (1, 1, 1), 3, 1, self.menutitle);

    // --- Scrollbar (RGB accent) ---
    self.hud["scroll"] = self CreateRectangle("white", "TOP", "CENTER", 192, -128, 3, 13, self.menu.color["accent"], 2, 1);

    // --- RGB accent line bottom ---
    self.hud["accent_bot"] = self CreateRectangle("white", "TOP", "CENTER", 280, 52, 180, 2, self.menu.color["accent"], 2, 1);

    // --- Text elements ---
    self.hud["text"] = [];
    self.hud["bool_text"] = [];
    for(i = 0; i < self.menu.maxsize; i++) {
        self.hud["text"][i] = CreateText("objective", 1.1, "TOP", "CENTER", 220, -128 + (i * 15), (1, 1, 1), 3, 1, "");
        self.hud["bool_text"][i] = CreateText("objective", 1.1, "TOP", "CENTER", 340, -128 + (i * 15), (0.7, 0.7, 0.7), 3, 1, "");
    }

    // Start RGB accent update
    self thread updateAccentElements();
}

UpdateMenuBackground() {
    totalItems = self.menu.text[self.menu.current].size;
    if(totalItems > self.menu.maxsize)
        totalItems = self.menu.maxsize;
    height = 20 + (totalItems * 15);
    self.hud["background"] setShader("white", 180, height);
}

updateAccentElements() {
    self endon("disconnect");
    self endon("death");
    self endon("endCordsUpdate");

    while(true) {
        if(isDefined(self.hud["accent_top"]))
            self.hud["accent_top"].color = self.menu.color["accent"];
        if(isDefined(self.hud["accent_bot"]))
            self.hud["accent_bot"].color = self.menu.color["accent"];
        if(isDefined(self.hud["scroll"]))
            self.hud["scroll"].color = self.menu.color["accent"];
        wait 0.05;
    }
}

// ============================================================
// LOW-LEVEL HUD PRIMITIVES
// ============================================================

CreateRectangle(shader, align, relative, x, y, width, height, color, sort, alpha) {
    barElem = NewClientHudElem(self);
    barElem.elemType = "icon";
    barElem.width = width;
    barElem.height = height;
    barElem.align = align;
    barElem.relative = relative;
    barElem.xOffset = 0;
    barElem.children = [];
    barElem.color = color;
    barElem.alpha = alpha;
    barElem SetShader(shader, width, height);
    barElem.sort = sort;
    barElem SetPoint(align, relative, x, y);
    barElem.foreground = true;
    barElem.archived = false;
    return barElem;
}

CreateText(font, fontscale, align, relative, x, y, color, sort, alpha, text) {
    textElem = CreateServerFontString(font, fontscale);
    textElem SetPoint(align, relative, x, y);
    textElem.sort = sort;
    textElem.type = "text";
    textElem SetSafeText(text);
    textElem.color = color;
    textElem.alpha = alpha;
    textElem.hideWhenInMenu = true;
    textElem.foreground = true;
    textElem.archived = true;
    return textElem;
}

elemFadeOverTime(time, alpha) {
    self fadeOverTime(time);
    self.alpha = alpha;
}
