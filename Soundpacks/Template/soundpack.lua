-- Template Soundpack for Soundboard Addon
-- Author: Your Name Here
-- Version: 1.0.0
-- Description: A template showing how to create custom soundpacks

-- IMPORTANT: Change "Template" to your soundpack name in the path below
local dir = "Interface\\AddOns\\Soundboard\\Soundpacks\\Template\\Sounds\\";

-- Initialize soundboard_data if it doesn't exist (required)
if not soundboard_data or type(soundboard_data) ~= "table" then
    soundboard_data = {};
end

--[[ 
SOUND ENTRY FORMAT:

soundboard_data["unique_key"] = {
    ["text"] = "* Text shown in menu and chat *",
    ["file"] = dir.."audiofile.mp3",              -- Required: path to audio file
    ["msg"] = "message shown with emote",         -- Optional: emote message
    ["emote"] = "dance",                          -- Optional: WoW emote (without "/")
    ["category"] = "Category Name",               -- Optional: menu category
    ["subcategory"] = "Subcategory",              -- Optional: subcategory
};

PARAMETERS EXPLAINED:
- unique_key: Must be unique across ALL soundpacks (used for slash commands)
- text: Displayed in dropdown menu and chat when played
- file: Path to your MP3 file (always use dir.. prefix)
- msg: Optional message shown when emote is performed
- emote: Optional WoW emote to perform (dance, cheer, roar, etc.)
- category: Groups sounds in the dropdown menu
- subcategory: Creates sub-groups within categories
]]

-- EXAMPLE SOUNDS (remove these and add your own):

-- soundboard_data["example1"] = {
--     ["text"] = "* Example Sound 1 *",
--     ["file"] = dir.."example1.mp3",
--     ["msg"] = "plays an example sound!",
--     ["emote"] = "cheer",
--     ["category"] = "Examples",
-- };

-- Add more sounds here following the same pattern...

--[[
USAGE INSTRUCTIONS:

1. Rename this folder from "Template" to your desired soundpack name
2. Update the 'dir' path above to match your new folder name
3. Replace the example sounds above with your own
4. Add your MP3 files to the Sounds/ folder
5. Make sure each sound key is unique (no duplicates across all soundpacks)
6. Restart WoW or reload UI (/reload) to load your new soundpack

SLASH COMMANDS:
Each sound will automatically get a slash command: /soundboard yoursoundkey
For example: /soundboard example1

TIPS:
- Keep sound files under 1MB for faster loading
- Use descriptive but short sound keys
- Organize sounds with categories for better menu navigation
- Test your sounds before sharing with others
]]

