# AZZA — iw4x Trickshot Menu

Private match trickshot menu for iw4x. Black UI with cycling RGB accent.

## File Structure

```
azza/
├── _main.gsc          ← Entry point (player connect/spawn, loads menu)
├── menu/
│   ├── _setup.gsc     ← Menu initialization, colors, RGB accent cycle
│   ├── _structure.gsc ← Menu layout (submenus & options — EDIT THIS)
│   ├── _logic.gsc     ← Navigation (open, close, scroll, select)
│   └── _utils.gsc     ← HUD helpers (createRect, createText, etc.)
└── README.md
```

## How to Use

### Loading in iw4x
Place the `azza` folder in your iw4x mod directory and load it as a GSC mod in private match.

### Adding Options to Submenus
Open `menu/_structure.gsc` — each submenu has a comment block showing exactly where and how to add options.

**Basic option (runs a function):**
```gsc
self addOption("Menu Name", "Button Text", ::yourFunction);
```

**Option with input:**
```gsc
self addOption("Menu Name", "Button Text", ::yourFunction, "someInput");
```

**Submenu link:**
```gsc
self addOption("Menu Name", "Sub Menu", ::loadMenu, "Sub Menu");
```

**Toggle (On/Off display):**
```gsc
self addToggle("Menu Name", "Feature Name", ::toggleFunction, "Off");
```

### Adding Your Own Functions
Create a new file like `azza/_spins.gsc` or `azza/_swaps.gsc`, write your functions there, then reference them in `_structure.gsc`.

### Controls
| Action       | Button              |
|-------------|---------------------|
| Open Menu   | ADS + Dpad Up       |
| Scroll Up   | Dpad Up             |
| Scroll Down | Dpad Down           |
| Select      | Use/Reload          |
| Back/Close  | Melee               |

## Customization

### Colors
Edit `menu/_setup.gsc` → `setupMenu()` to change the color scheme.

### RGB Speed
Edit `menu/_setup.gsc` → `rgbAccentCycle()` — change `step` value (lower = slower cycle).

### Menu Position/Size
Edit `menu/_utils.gsc` → `createMenuHud()` — adjust x, y, width, height values.
