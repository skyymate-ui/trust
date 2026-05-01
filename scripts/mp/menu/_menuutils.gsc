#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;

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
    if(self GetPers(pers) != "[Off]")
        self.menu.bool[menu][index] = "[[{" + self GetPers(pers) + "}]]";
    else
        self.menu.bool[menu][index] = self GetPers(pers);
    self.menu.pers[menu][index] = pers;
    self.menu.slidertype[menu][index] = "bind";
}

LoadMenu(menu) {
    self scripts\mp\menu\_structure::Structure();
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

    self scripts\mp\menu\_menulogic::UpdateScroll();
    self UpdateMenuBackground();
    self.menu.smoothscroll = true;

}



ExecuteFunction(f, i1, i2) { 
    if(isdefined( i2 ))
        return self thread [[ f ]]( i1, i2 );
    else if(isdefined( i1 ))
        return self thread [[ f ]]( i1 );

    return self thread [[ f ]]();
}

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
    self.hud["background"] = self CreateRectangle("white", "TOP", "CENTER", 280, -150, 180, 200, self.menu.color["backgorund"], 0, 0.85);
    self.hud["header_box"] = self CreateRectangle("white", "TOP", "CENTER", 280, -150, 180, 17, self.menu.color["backgorund"], 1, 0.85);
    self.hud["top_bar"] = self CreateRectangle("white", "TOP", "CENTER", 280, -150, 180, 1, self.menu.color["black"], 5, 1);
    self.hud["middle_bar"] = self CreateRectangle("white", "TOP", "CENTER", 280, -134, 180, 1, self.menu.color["black"], 5, 1);
    self.hud["left_bar"] = self CreateRectangle("white", "TOP", "CENTER", 190, -150, 1, 200, self.menu.color["black"], 5, 1);
    self.hud["right_bar"] = self CreateRectangle("white", "TOP", "CENTER", 370, -150, 1, 200, self.menu.color["black"], 5, 1);
    self.hud["bottom_bar"] = self CreateRectangle("white", "TOP", "CENTER", 280, 150, 181, 1, self.menu.color["black"], 5, 1);


    self.hud["top_bar"].foreground = true;
    self.hud["middle_bar"].foreground = true;
    self.hud["left_bar"].foreground = true;
    self.hud["right_bar"].foreground = true;
    self.hud["bottom_bar"].foreground = true;

    self.hud["title"] = self CreateText("big", 1, "CENTER", "CENTER", 277, -144, self.menu.color["black"], 4, 1, "COUNTER UAV");

    self.hud["scroll"] = self CreateRectangle("minimap_scanlines", "CENTER", "CENTER", 280, -126, 180, 15, self.menu.color["black"], 4, 0.8);

    self.hud["cords"] = self createText("agency", 1, "LEFT", "CENTER", -255, -190, self.menu.color["white"], 4, 1, " ");
    self.hud["instruc"] = self createText("agency", 1, "LEFT", "CENTER",  -420, 220, self.menu.color["white"], 4, 1, " ");
    self.hud["instruc"] setSafeText("\nScroll: [{+actionslot 1}] / [{+actionslot 2}] - Change Value [{+actionslot 3}] / [{+actionslot 4}] - Select [{+usereload}]");

    self.hud["text"] = [];
    self.hud["text2"] = [];
    self.hud["bool_text"] = [];

    for (i = 0; i < self.menu.maxsize; i++) {
        self.hud["text"][i] = self CreateText("agency", 1, "LEFT", "CENTER", 192, -129 + (i * 15), self.menu.color["white"], 6, 1, "Option " + (i + 1));

        self.hud["bool_text"][i] = self CreateText("agency", 1, "RIGHT", "CENTER", 363, -129 + (i * 15), self.menu.color["black"], 6, 1, "[OFF]");
    }
}

updateBarColors()
{
    staticColor = (0, 0, 0); // Example: greenish tone. Use any RGB tuple here.

    self.hud["top_bar"].color = staticColor;
    self.hud["middle_bar"].color = staticColor;
    self.hud["left_bar"].color = staticColor;
    self.hud["right_bar"].color = staticColor;
    self.hud["bottom_bar"].color = staticColor;
    self.hud["scroll"].color = staticColor;
    self.hud["title"].color = staticColor;

    // Update all bool_text colors statically
    for (i = 0; i < 10; i++)
    {
        if (isDefined(self.hud["bool_text"][i]))
            self.hud["bool_text"][i].color = staticColor;
    }
}

getColorFromHue(hue, saturation, value) 
{
    hue = hue * 360;  
    i = int(hue / 60) % 6; // Détermine la section de la roue des couleurs
    f = (hue / 60) - i;     // Fraction de la couleur
    p = value * (1 - saturation); // Couleur minimum
    q = value * (1 - f * saturation); // Couleur intermédiaire
    t = value * (1 - (1 - f) * saturation); // Couleur intermédiaire

    switch (i) {
        case 0: return (value, t, p); // 0° à 60° (Rouge)
        case 1: return (q, value, p); // 60° à 120° (Vert)
        case 2: return (p, value, t); // 120° à 180° (Cyan)
        case 3: return (p, q, value); // 180° à 240° (Bleu)
        case 4: return (t, p, value); // 240° à 300° (Magenta)
        case 5: return (value, p, q); // 300° à 360° (Rouge)
    }

    return (1, 1, 1); 
}

cordsUpdate()
{
    self endon("endCordsUpdate");
    self endon("death");
    self endon("disconnect");
    while(self.menu.isopen)
    {
        self.hud["cords"] setSafeText(self getOrigin() + "\n" + self getPlayerAngles() + "\nScript One: " + self getPers("scriptonescript") + "\nScript Two: " + self getPers("scripttwoscript"));
        wait 0.1;
    }
}
//"\nScroll: [{+actionslot 1}] / [{+actionslot 2}] - Change Value [{+actionslot 3}] / [{+actionslot 4}] - Select [{+usereload}]"
UpdateMenuBackground() {
    amount = self.menu.text[self.menu.current].size;
    if(amount > self.menu.maxsize) {
        amount = self.menu.maxsize;
    }

    if(amount == 5 || amount == 7 || amount == 9)
        plusamount = 17;
    else 
        plusamount = 16;
    
    self.hud["background"] SetShader("white", 180, plusamount + (15 * amount));
    self.hud["left_bar"] SetShader("white", 1, plusamount + (15 * amount));
    self.hud["right_bar"] SetShader("white", 1, plusamount + (15 * amount));
    self.hud["bottom_bar"].y = -137 + (15 * amount);
}