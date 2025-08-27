# Soundboard Soundpacks

This folder contains soundpacks for the Soundboard addon. Each soundpack is a separate folder containing sound files and configuration.

## Default Soundpack

The `Default` folder contains the built-in soundpack with hundreds of sounds organized by category.

## Adding Custom Soundpacks

To add a new soundpack:

1. Create a new folder in the `Soundpacks` directory (e.g., `MyCustomPack`)
2. Create a `soundpack.lua` file in your folder
3. Create a `Sounds` subfolder for your audio files
4. Add your `.mp3` audio files to the `Sounds` folder
5. Configure your soundpack in the `soundpack.lua` file

## Soundpack.lua Format

Your `soundpack.lua` file should follow this format:

```lua
-- Your Soundpack Name
-- Author: Your Name
-- Version: 1.0.0

local dir = "Interface\\AddOns\\Soundboard\\Soundpacks\\YourPackName\\Sounds\\";

-- Initialize soundboard_data if it doesn't exist
if not soundboard_data or type(soundboard_data) ~= "table" then
    soundboard_data = {};
end

-- Add your sounds
soundboard_data["yoursound"] = {
    ["text"] = "* Your Sound Text *",
    ["msg"] = "plays your custom sound!",
    ["emote"] = "dance",  -- Optional WoW emote
    ["category"] = "Custom",
    ["file"] = dir.."yoursound.mp3",
};

-- Add more sounds...
```

## Sound Entry Parameters

Each sound entry can have these parameters:

- `text` (required): Text displayed in menu and chat
- `file` (required): Path to the audio file
- `msg` (optional): Message shown with emote
- `emote` (optional): WoW emote to perform (without "/")
- `category` (optional): Menu category for organization
- `subcategory` (optional): Sub-category within main category

## Audio File Requirements

- Format: MP3
- Recommended: Keep files under 1MB for faster loading
- Quality: 128kbps is usually sufficient for game sounds
- Length: Keep sounds under 10 seconds for best experience

## Example Structure

```
Soundpacks/
├── Default/
│   ├── soundpack.lua
│   └── Sounds/
│       ├── sound1.mp3
│       └── sound2.mp3
└── MyCustomPack/
    ├── soundpack.lua
    └── Sounds/
        ├── mysound1.mp3
        └── mysound2.mp3
```

## Notes

- Soundpack names should be unique to avoid conflicts
- Sound keys (like "yoursound") must be unique across all soundpacks
- The addon will automatically load all soundpacks in this folder
- Restart WoW or reload UI after adding new soundpacks

