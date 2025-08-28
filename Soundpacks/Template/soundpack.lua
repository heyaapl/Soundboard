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
    ["duration"] = 5.5,                          -- Optional: sound duration + 1 second (for queue timing)
    ["msg"] = "message shown with emote",         -- Optional: emote message
    ["emote"] = "dance",                          -- Optional: WoW emote (without "/")
    ["category"] = "Category Name",               -- Optional: menu category
    ["subcategory"] = "Subcategory",              -- Optional: subcategory
};

PARAMETERS EXPLAINED:
- unique_key: Must be unique across ALL soundpacks (used for slash commands)
- text: Displayed in dropdown menu and chat when played
- file: Path to your MP3 file (always use dir.. prefix)
- duration: Optional sound duration in seconds (actual duration + 1 second for queue timing)
           If not specified, defaults to 10 seconds
- msg: Optional message shown when emote is performed
- emote: Optional WoW emote to perform (dance, cheer, roar, etc.)
- category: Groups sounds in the dropdown menu
- subcategory: Creates sub-groups within categories
]]

-- EXAMPLE SOUNDS (remove these and add your own):

-- soundboard_data["example1"] = {
--     ["text"] = "* Example Sound 1 *",
--     ["file"] = dir.."example1.mp3",
--     ["duration"] = 4.5,  -- 3.5 second sound + 1 second = 4.5 total
--     ["msg"] = "plays an example sound!",
--     ["emote"] = "cheer",
--     ["category"] = "Examples",
-- };

-- soundboard_data["example2"] = {
--     ["text"] = "* Example Sound 2 *",
--     ["file"] = dir.."example2.mp3",
--     -- No duration specified - will default to 10 seconds
--     ["msg"] = "plays another example sound!",
--     ["emote"] = "dance",
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
6. Add duration attributes to your sounds (actual duration + 1 second)
7. Restart WoW or reload UI (/reload) to load your new soundpack

SLASH COMMANDS:
Each sound will automatically get a slash command: /soundboard yoursoundkey
For example: /soundboard example1

DURATION ATTRIBUTE:
- Set duration to actual sound length + 1 second for proper queue timing
- If not specified, sounds default to 10 seconds
- Use /soundboarddurations command to auto-calculate durations for existing sounds
- Proper durations prevent sound overlap in the queue system

TIPS:
- Keep sound files under 1MB for faster loading
- Use descriptive but short sound keys
- Organize sounds with categories for better menu navigation
- Measure your sound durations and add 1 second for best queue timing
- Test your sounds before sharing with others
]]

