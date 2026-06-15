# AZZA — iw4x Private Match Trickshot Menu

Black UI with cycling RGB accent. Full-featured trickshot menu for private match.

## Controls
- **ADS + Dpad Up** = Open menu
- **Dpad Up** = Scroll up
- **Dpad Down** = Scroll down
- **Dpad Left/Right** = Slider adjust / Bind cycle
- **Reload** = Select option
- **Melee** = Back / Close

## Submenus
| Menu | What's in it |
|------|-------------|
| Misc | UFO, God Mode, Killcam, OMA, Overlays, Instaswaps, Easy Ele |
| Teleport | Save/Load positions, per-map custom locations, bind sliders |
| Aimbot | Weapon, strength, delay, mid-air, headshots, friendly, hitmarker |
| Binds | Velocity, Nac Mod, Kill Bot, Set Anim, Swap, Force Barrel, all bind sliders |
| Weapon | Drop/Spawn weapons, give weapons by category, infinite equipment |
| Killstreaks | Give streaks, carepackage functions, spawn/delete CP |
| Game Profile | Primary/Secondary weapon editor, camos, perks, equipment |
| Game Settings | Timescale, gravity, lag, speed, jump height, rounds, bounces, maps |
| Bots | Spawn, teleport, kick, velocity, presets, mantle bind |
| Players | Per-player actions (kick, teleport, freeze) |
| CFG Commands | Reference list of all available +commands |

## File Structure
```
azza/
├── _main.gsc          Entry point (init, connect, spawn)
├── _util.gsc          Utilities (SetPers, GetPers, overflow fix, setSafeText)
├── _functions.gsc     All gameplay functions (toggles, weapons, game settings)
├── _binds.gsc         Bind implementations (velocity, bolt, force, etc.)
├── _cfg.gsc           CFG command handlers (+nac, +oma, +loadpos, etc.)
├── _bolt.gsc          Bolt movement system
├── _aimbot.gsc        Aimbot logic
├── _presets.gsc       Bot presets, weapon loadouts
└── menu/
    ├── _setup.gsc     Menu initialization + RGB cycling
    ├── _utils.gsc     HUD framework (CreateMenu, AddOption, sliders, etc.)
    ├── _logic.gsc     Navigation (scroll, select, back, slider controls)
    └── _structure.gsc Menu tree (all submenus and options)
```

## How to Add Your Own Stuff

### Add a function to the menu
1. Write your function in `_functions.gsc`
2. In `menu/_structure.gsc`, add to the right submenu:
   ```gsc
   self AddOption("Misc", "My Function", ::myFunction, getPers("myfunction"));
   ```

### Add a bind
1. Write your bind function in `_binds.gsc`
2. In `menu/_structure.gsc`:
   ```gsc
   self AddBindSliders("Binds", "My Bind", ::mybind, "mybind");
   ```
3. In `_main.gsc` setupBindsOnSpawn():
   ```gsc
   self SetupBind("mybind", "Off", ::mybind);
   ```

### Add a DVAR slider
```gsc
self AddDvarSlider("Game", "My Dvar", undefined, "dvar_name", min, max, step);
```

### Add a CFG command
1. In `_cfg.gsc` inside `cfg_calls()`:
   ```gsc
   self notifyOnPlayerCommand("mycommand", "+mycommand");
   ```
2. Add the waittill loop and function below

## Installation
Place the `azza` folder in your iw4x scripts directory and load via `_main.gsc`.
