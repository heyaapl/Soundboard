# Soundboard Installation Guide

## Installation

1. **Download** the Soundboard addon folder
2. **Copy** the entire `Soundboard` folder to your WoW AddOns directory:
   - **Windows**: `World of Warcraft\_classic_\Interface\AddOns\`
   - **Mac**: `World of Warcraft/_classic_/Interface/AddOns/`

3. **Restart** World of Warcraft or type `/reload` in-game

## What's Included

The Soundboard addon now includes everything in one package:

```
Soundboard/
├── Soundboard.lua          # Main addon code
├── Soundboard.toc          # Addon metadata
├── embeds.xml             # Library dependencies
├── icon.png               # Custom minimap icon (32x32 PNG)
├── Libs/                  # Embedded libraries (Ace3, etc.)
├── Soundpacks/            # All soundpacks
│   ├── Default/           # Built-in soundpack (~470 sounds)
│   │   ├── soundpack.lua  # Sound definitions
│   │   └── Sounds/        # Audio files (.mp3)
│   ├── Template/          # Example for creating custom packs
│   └── README.md          # Soundpack documentation
└── INSTALLATION.md        # This file
```

## First Time Setup

1. **Load the game** - The addon will automatically load
2. **Check chat** - You should see: "Loaded XXX sounds from 1 soundpack(s)"
3. **Test the minimap button** - Click the Soundboard icon near your minimap
4. **Try a sound** - Type `/soundboard hero` or use the dropdown menu

## Commands

- **`/soundboard`** - Open addon settings panel
- **`/soundboard [soundname]`** - Play a specific sound (e.g., `/soundboard hero`)
- **`/soundboardsettings`** - Open settings panel (alternative)
- **`/soundboardconfig`** - Open settings panel (alternative)
- **Click minimap button** - Open sound menu

## Settings

Access the settings panel through:
1. **Type `/soundboard`** in chat
2. **ESC → Interface → AddOns → Soundboard**
3. **Type `/soundboardsettings`**

### Available Settings:
- **Master Volume** - Adjust sound volume (0-100%)
- **Enable/Disable Sounds** - Turn sound playback on/off
- **Enable/Disable Emotes** - Control WoW emote performance
- **Group Play** - Allow sounds to be shared with party/raid
- **Minimap Button** - Show/hide the minimap button
- **Debug Mode** - Enable troubleshooting output

## Adding Custom Soundpacks

See `Soundpacks/README.md` for detailed instructions on creating your own soundpacks.

## Troubleshooting

**No sounds playing?**
- Check that your game sound is enabled
- Verify the addon loaded (check chat messages on login)
- Try `/reload` to restart the addon

**Minimap button missing?**
- The button appears near your minimap after login
- Try `/reload` if it doesn't appear
- Type `/soundboarddeps` to check for missing libraries
- Type `/soundboardicon` for detailed icon debugging

**Commands not working?**
- Make sure you're typing `/soundboard` (not `/gag`)
- Check that sounds loaded properly (look for chat message on login)
- Type `/soundboardcheck` to verify addon status

**Dependency Issues:**
- Type `/soundboarddeps` to check all required libraries
- All libraries should show "OK" in green
- If any show "MISSING" in red, try `/reload` or reinstall the addon

## Migration from Old Gag Addon

If you're upgrading from the old "Gag" addon:

1. **Remove old addons**:
   - Delete `Gag` folder
   - Delete `GagDefaultSoundpack` folder

2. **Install new Soundboard** as described above

3. **Settings will transfer** automatically (stored in `SoundboardDB`)

## Support

The addon is now self-contained and doesn't require any external dependencies. All sounds and libraries are included in the main addon folder.

