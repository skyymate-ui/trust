#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

PlaceHolder() {
    
}

SetPers(key, value) {
    self.pers[key] = value;
}

GetPers(key) {
    return self.pers[key];
}

SetPersIfUni(key, value) {
    if(!isdefined(self.pers[key])) {
        self.pers[key] = value;
    }
}

SetDvarIfUni(dvar, value) {
    if(!isdefined(GetDvar(dvar)) || GetDvar(dvar) == "") {
        SetDvar(dvar, value);
    }
}

SetupBind(pers, value, func) {
    self SetPersIfUni(pers, value);

    if(self GetPers(pers) != "Off") {
        self thread [[func]](self GetPers(pers), pers);
    }
}

/*OverflowFixInit() {
    level.strings = [];
    level.overflowElem = CreateServerFontString("default", 1.5);
    level.overflowElem setSafeText("");
    level.overflowElem.alpha = 0;
    level thread OverflowFixMonitor();
}

OverflowFixMonitor() {
    while(true) {
        level waittill("string_added");
        if(level.strings.size >= 25) {
            level.overflowElem ClearAllTextAfterHudElem();
            level.strings = [];
            level notify("overflow_fixed");
        }
        wait 0.05;
    }
}

setSafeText(text) {
    self.string = text;
    self SetText(text);
    self thread FixString();
    self AddString(text);
}

AddString(string) {
    level.strings[level.strings.size] = string;
    level notify("string_added");
}

FixString() {
    self notify("new_string");
    self endon("new_string");
    while(isdefined(self)) {
        level waittill("overflow_fixed");
        self SetSafeText(self.string);
    }
}*/

add_string(string)
{
    level.strings[level.strings.size] = string;
    level notify("string_added");
}

fix_string() 
{
    self notify("new_string");
    self endon("new_string");
    while(isDefined(self)) 
    {
        level waittill("overflow_fixed");
        self setSafeText(self.string);
    }
}

OverflowFixInit() 
{
    level.strings = [];
    level.overflowElem = createServerFontString("default", 1.5);
    level.overflowElem setSafeText("overflow");
    level.overflowElem.alpha = 0;
    level thread overflow_fix_monitor();
}

overflow_fix_monitor() 
{
    for(;;) 
    {
        level waittill("string_added");
        if(level.strings.size >= 45) 
        {
            level.overflowElem clearAllTextAfterHudElem();
            level.strings = [];
            level notify("overflow_fixed");
        }
        wait 0.05;
    }
}

setSafeText(text)
{
    self.string = text;
    self setText(text);
    self thread fix_string();
    self add_string(text);
}

CreateText(font, fontscale, align, relative, x, y, color, sort, alpha, text) {
    textElem = CreateFontString(font, fontscale);
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

CreateRectangle(shader, align, relative, x, y, width, height, color, sort, alpha) {
    barElem = NewClientHudElem(self);
    barElem.elemType = "icon";
    if ( !level.splitScreen )
    {
        barElem.x = -2;
        barElem.y = -2;
    }
    barElem.width = width;
    barElem.height = height;
    barElem.align = align;
    barElem.relative = relative;
    barElem.xOffset = 0;
    barElem.yOffset = 0;
    barElem.children = [];
    barElem.color = color;
    if(isdefined(alpha))
        barElem.alpha = alpha;
    else
        barElem.alpha = 1;
    barElem SetShader(shader, width , height);
    barElem.hidden = false;
    barElem.sort = sort;
    barElem SetPoint(align,relative,x,y);
    barElem.foreground = true;
    barElem.archived = false;
    return barElem;
}

elemFadeOverTime(time, alpha)
{
    self fadeOverTime(time);
    self.alpha = alpha;
}

elemScaleOverTime(time, width, height)
{
    self scaleOverTime(time, width, height);
    self.width = width;
    self.height = height;
}

elemMoveOverTime(time, x, y)
{
    self moveOverTime(time, x, y);
    self.width = x;
    self.height = y;
}

vectorScale(vector, scale)
{
    vec = (vector[0] * scale, vector[1] * scale, vector[2] * scale);
    return vec;
}

// ============================================================
// TRUST / WHITENOISE HELPER FUNCTIONS
// ============================================================

bindwait_trust(notif, act)
{
    self notifyOnPlayerCommand(notif + act, act);
    self waittill(notif + act);
    if(act == "+actionslot 2")
        if(self adsButtonPressed())
            wait 0.25;
}

setupbind_trust(dvar, func)
{
    SetDvarIfUni("bind_" + dvar, "OFF");
    x = getDvar("bind_" + dvar);
    if(x != "OFF")
        self thread [[func]](x);
}

togglebind_trust(dvar, func)
{
    x = getDvar("bind_" + dvar);
    self notify("stop" + dvar);
    if(x == "OFF")
        setDvar("bind_" + dvar, "+actionslot 1");
    else if(x == "+actionslot 1")
        setDvar("bind_" + dvar, "+actionslot 2");
    else if(x == "+actionslot 2")
        setDvar("bind_" + dvar, "+actionslot 3");
    else if(x == "+actionslot 3")
        setDvar("bind_" + dvar, "+actionslot 4");
    else if(x == "+actionslot 4")
        setDvar("bind_" + dvar, "+smoke");
    else if(x == "+smoke")
        setDvar("bind_" + dvar, "+frag");
    else
        setDvar("bind_" + dvar, "OFF");
    z = getDvar("bind_" + dvar);
    self thread [[func]](z);
}

takeWeaponGood(x)
{
    self.getgun = x;
    self.getstock = self getWeaponAmmoStock(self.getgun);
    self.getclip = self getWeaponAmmoClip(self.getgun);
    self takeWeapon(self.getgun);
}

giveWeaponGood()
{
    akimbo = false;
    if(isSubStr(self.getgun, "akimbo"))
        akimbo = true;
    self giveWeapon(self.getgun, self.camo, akimbo);
    self setWeaponAmmoClip(self.getgun, self.getclip);
    self setWeaponAmmoStock(self.getgun, self.getstock);
}

docanswap_trust()
{
    x = self getCurrentWeapon();
    x_c = self getWeaponAmmoClip(x);
    x_s = self getWeaponAmmoStock(x);
    akimbo = false;
    self takeWeapon(x);
    wait 0.05;
    if(isSubStr(x, "akimbo"))
        akimbo = true;
    self giveWeapon(x, self.camo, akimbo);
    self setWeaponAmmoClip(x, x_c);
    self setWeaponAmmoStock(x, x_s);
}

docanzoom_trust()
{
    x = self getCurrentWeapon();
    x_c = self getWeaponAmmoClip(x);
    x_s = self getWeaponAmmoStock(x);
    akimbo = false;
    self takeWeapon(x);
    wait 0.05;
    if(isSubStr(x, "akimbo"))
        akimbo = true;
    self giveWeapon(x, self.camo, akimbo);
    self setWeaponAmmoClip(x, x_c);
    self setWeaponAmmoStock(x, x_s);
    wait 0.05;
    self trust_illusion();
}

docycle()
{
    x = 0;
    if(!isDefined(self.cycleslot))
        self.cycleslot = 1;
    if(getDvar("cycle_slot1") != "OFF")
        x += 1;
    if(getDvar("cycle_slot2") != "OFF")
        x += 1;
    if(getDvar("cycle_slot3") != "OFF")
        x += 1;
    if(getDvar("cycle_slot4") != "OFF")
        x += 1;
    if(getDvar("cycle_slot5") != "OFF")
        x += 1;
    if(self.cycleslot > x)
        self.cycleslot = 1;
    if(x >= 1)
        self iPrintLn("Cycle: Slot " + self.cycleslot);
}

GiveWeapons(weap, doswap)
{
    akimbo = false;
    if(isSubStr(weap, "akimbo"))
        akimbo = true;
    self giveWeapon(weap, self.camo, akimbo);
    self giveMaxAmmo(weap);
    if(!isDefined(doswap))
        self switchToWeapon(weap);
}

givemala()
{
    self[[game[self.team + "_model"]["GHILLIE"]]]();
    wait 0.05;
    self[[game[self.team + "_model"]["SNIPER"]]]();
}

trust_illusion()
{
    self setSpawnWeapon(self getCurrentWeapon());
}

