-- Author      : Barogio, KarlThePagan, Onilink, Moonrydre, Bleric, and Potdisc all have authored the addon. Latest revision by heyaapl.
-- Create Date : 8/9/2012 11:08:28 PM

--[[ TODO:
	Check if IsInRaid() works in Battleground.
]]
Soundboard = LibStub("AceAddon-3.0"):NewAddon("Soundboard", "AceConsole-3.0", "AceEvent-3.0", "AceComm-3.0")
-- GLOBALS: Soundboard, soundboard_data

-- Debug system
local SoundboardDebug = {
	enabled = false, -- Set to false to disable all debug output
}

local function DebugPrint(...)
	if SoundboardDebug.enabled then
		Soundboard:Print("[DEBUG]", ...)
	end
end

-- Class color system (matching ElvUI's approach)
local function GetPlayerClassColor()
	local _, class = UnitClass("player")
	if not class then return 1, 1, 1 end -- Default to white if no class
	
	-- Use CUSTOM_CLASS_COLORS if available (ElvUI), otherwise fall back to RAID_CLASS_COLORS
	local color = (_G.CUSTOM_CLASS_COLORS and _G.CUSTOM_CLASS_COLORS[class]) or _G.RAID_CLASS_COLORS[class]
	if color then
		return color.r, color.g, color.b
	end
	
	return 1, 1, 1 -- Default to white
end

local function GetClassColorString()
	local r, g, b = GetPlayerClassColor()
	return string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
end

local _G = _G
local pairs = pairs
local tsort = table.sort
local tinsert = table.insert
local strchar = string.char
local strlen = string.len
local time = time
local strsub = string.sub
local strlower = string.lower
local strupper = string.upper
local loadstring = loadstring
local tContains = tContains

local CreateFrame = CreateFrame
local UIParent = UIParent
local PlaySoundFile = PlaySoundFile
local GetUnitName = GetUnitName
local DoEmote = DoEmote
local SendChatMessage = SendChatMessage
local UnitIsGroupLeader = UnitIsGroupLeader
local IsInRaid = IsInRaid
local IsInGroup = IsInGroup

local LE_PARTY_CATEGORY_HOME = LE_PARTY_CATEGORY_HOME
local LE_PARTY_CATEGORY_INSTANCE = LE_PARTY_CATEGORY_INSTANCE

-- Detect whether party category constants and categorized IsInGroup/IsInRaid are available
local HAS_PARTY_CATEGORIES = type(LE_PARTY_CATEGORY_HOME) == "number" and type(LE_PARTY_CATEGORY_INSTANCE) == "number"

-- Simple dropdown replacement (LibUIDropDownMenu is broken in modern clients)
local SoundboardDropdown = {}

function SoundboardDropdown:Initialize()
	DebugPrint("Initializing dropdown system...")
	-- Main frame
	self.frame = CreateFrame("Frame", "SoundboardDropdownFrame", UIParent)
	DebugPrint("Main frame created")
	self.frame:SetFrameStrata("DIALOG")
	DebugPrint("Frame strata set")
	self.frame:SetFrameLevel(100)
	DebugPrint("Frame level set")
	self.frame:SetClampedToScreen(true)
	DebugPrint("Clamp to screen set")
	self.frame:Hide()
	DebugPrint("Frame hidden")
	self.frame:SetScript("OnHide", function() 
		self.isOpen = false 
	end)
	DebugPrint("OnHide script set")
	
	-- ElvUI-style transparent dark background
	DebugPrint("Creating ElvUI-style backdrop...")
	local bg = self.frame:CreateTexture(nil, "BACKGROUND")
	bg:SetAllPoints()
	bg:SetColorTexture(0, 0, 0, 0.8) -- Very dark, semi-transparent like ElvUI
	DebugPrint("Background texture created")
	
	-- ElvUI border (black)
	local border = self.frame:CreateTexture(nil, "BORDER")
	border:SetPoint("TOPLEFT", -1, 1)
	border:SetPoint("BOTTOMRIGHT", 1, -1)
	border:SetColorTexture(0, 0, 0, 1) -- ElvUI bordercolor (black)
	DebugPrint("Border created")
	
	-- Create scroll frame using UIPanelScrollFrameTemplate like ElvUI
	DebugPrint("Creating scroll frame...")
	local scrollFrame = CreateFrame("ScrollFrame", nil, self.frame, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", 4, -4)
	scrollFrame:SetPoint("BOTTOMRIGHT", -26, 4)
	self.scrollFrame = scrollFrame
	DebugPrint("Scroll frame created")
	
	-- Enable mouse wheel scrolling on the main frame
	self.frame:EnableMouseWheel(true)
	self.frame:SetScript("OnMouseWheel", function(frame, delta)
		DebugPrint("Mouse wheel scrolled with delta: " .. tostring(delta))
		local scrollBar = SoundboardDropdown.scrollbar
		if scrollBar and scrollBar:IsShown() then
			local current = scrollBar:GetValue()
			local min, max = scrollBar:GetMinMaxValues()
			local step = 30 -- Scroll step size
			
			if delta > 0 then
				-- Scroll up
				local newValue = math.max(min, current - step)
				scrollBar:SetValue(newValue)
				DebugPrint("Scrolling up to: " .. newValue)
			else
				-- Scroll down  
				local newValue = math.min(max, current + step)
				scrollBar:SetValue(newValue)
				DebugPrint("Scrolling down to: " .. newValue)
			end
		else
			DebugPrint("Scrollbar hidden or not found - ignoring mouse wheel")
		end
	end)
	DebugPrint("Mouse wheel scrolling enabled on main frame")
	
	-- Create content frame
	DebugPrint("Creating content frame...")
	local content = CreateFrame("Frame", nil, scrollFrame)
	content:SetSize(1, 1)
	scrollFrame:SetScrollChild(content)
	self.content = content
	DebugPrint("Content frame created and set as scroll child")
	
	-- Style the scrollbar to match ElvUI
	local scrollBar = scrollFrame.ScrollBar or scrollFrame.scrollBar
	if scrollBar then
		DebugPrint("Styling scrollbar...")
		-- ElvUI-style scrollbar background
		if scrollBar.Track then
			scrollBar.Track:SetColorTexture(0.1, 0.1, 0.1, 1)
		end
		
		-- ElvUI-style thumb
		if scrollBar.ThumbTexture then
			scrollBar.ThumbTexture:SetColorTexture(0.3, 0.3, 0.3, 1)
		end
		
		self.scrollbar = scrollBar
	else
		DebugPrint("WARNING: Could not find scrollbar to style")
	end
	
	self.buttons = {}
	self.categories = {}
	self.isOpen = false
	self.currentView = "main" -- "main", "category", "sounds"
	self.selectedCategory = nil
	
	DebugPrint("Dropdown initialization completed successfully")
end

function SoundboardDropdown:Toggle(anchor)
	if self.isOpen then
		self.frame:Hide()
		return
	end
	
	self:Show(anchor)
end

function SoundboardDropdown:Show(anchor)
	DebugPrint("Opening dropdown menu...")
	DebugPrint("Anchor: " .. tostring(anchor and anchor:GetName() or "nil"))
	
	-- Initialize if not already done
	if not self.frame or not self.content then
		DebugPrint("Dropdown not properly initialized, initializing now...")
		DebugPrint("self.frame exists: " .. tostring(self.frame ~= nil))
		DebugPrint("self.content exists: " .. tostring(self.content ~= nil))
		self:Initialize()
	end
	
	if not soundboard_data then
		DebugPrint("No sound packs available for dropdown!")
		Soundboard:Print("No sound packs available!")
		return
	end
	
	DebugPrint("soundboard_data exists, creating dropdown...")
	
	-- Set frame size
	self.frame:SetSize(300, 400)
	DebugPrint("Frame size set to 300x400")
	
	-- Build categories if not done yet
	if not self.categoriesBuilt then
		DebugPrint("Building categories...")
		self:BuildCategories()
	end
	
	-- Show main menu
	DebugPrint("Showing main menu...")
	self:ShowMainMenu()
	
	-- Position and show
	DebugPrint("Positioning dropdown...")
	self:Position(anchor)
	DebugPrint("Showing dropdown frame...")
	self.frame:Show()
	self.isOpen = true
	DebugPrint("Dropdown should now be visible!")
end

function SoundboardDropdown:BuildCategories()
	DebugPrint("Building categories from soundboard_data...")
	self.categories = {}
	
	local totalSounds = 0
	-- Organize sounds by category
	for key, data in pairs(soundboard_data) do
		local category = data.category or "Uncategorized"
		if not self.categories[category] then
			self.categories[category] = {}
			DebugPrint("Created new category: " .. category)
		end
		tinsert(self.categories[category], {key = key, data = data})
		totalSounds = totalSounds + 1
	end
	
	DebugPrint("Total sounds processed: " .. totalSounds)
	DebugPrint("Total categories found: " .. #self.categories)
	
	-- Sort each category
	for categoryName, sounds in pairs(self.categories) do
		tsort(sounds, function(a, b) return a.key < b.key end)
		DebugPrint("Category '" .. categoryName .. "' has " .. #sounds .. " sounds")
	end
	
	self.categoriesBuilt = true
	DebugPrint("Categories built successfully")
end

function SoundboardDropdown:ShowMainMenu()
	DebugPrint("ShowMainMenu called")
	self:ClearContent()
	DebugPrint("Content cleared")
	
	-- Ensure database is initialized
	if not Soundboard.db then
		DebugPrint("WARNING: Soundboard.db is nil, attempting to initialize...")
		Soundboard:OnInitialize()
	end
	
	local yOffset = -5
	local buttonHeight = 22
	DebugPrint("Initial setup complete")
	
	-- Safe access to db with fallbacks
	DebugPrint("Checking db access...")
	local addonDB = Soundboard.db and Soundboard.db.profile
	DebugPrint("Soundboard.db exists: " .. tostring(Soundboard.db ~= nil))
	DebugPrint("addonDB exists: " .. tostring(addonDB ~= nil))
	local emoteEnabled = (addonDB and addonDB.EmoteEnabled) or false
	local groupEnabled = (addonDB and addonDB.GroupEnabled) or false  
	local soundboardEnabled = (addonDB and addonDB.IsEnabled) or false
	DebugPrint("DB values retrieved")
	
	-- Title
	DebugPrint("Creating title button...")
	local title = self:CreateButton("Soundboard Menu", yOffset, true)
	title:SetScript("OnClick", nil)
	yOffset = yOffset - buttonHeight
	DebugPrint("Title button created")
	
	-- Options with simple colors
	local emoteBtn = self:CreateButton(
		emoteEnabled and "Emotes: |cFF00FF00ON|r" or "Emotes: |cFFFF0000OFF|r", 
		yOffset
	)
	emoteBtn:SetScript("OnClick", function()
		local currentDB = Soundboard.db and Soundboard.db.profile
		DebugPrint("Emote button clicked, currentDB exists: " .. tostring(currentDB ~= nil))
		if currentDB then
			local oldValue = currentDB.EmoteEnabled
			currentDB.EmoteEnabled = not currentDB.EmoteEnabled
			DebugPrint("EmoteEnabled changed from " .. tostring(oldValue) .. " to " .. tostring(currentDB.EmoteEnabled))
			if currentDB.EmoteEnabled then
				Soundboard:Print("Personal emotes |cFF00FF00enabled|r")
			else
				Soundboard:Print("Personal emotes |cFFFF0000disabled|r")
			end
			self:ShowMainMenu()
		else
			DebugPrint("ERROR: Soundboard.db.profile is nil when clicking emote button!")
			Soundboard:Print("Error: Database not available")
		end
	end)
	yOffset = yOffset - buttonHeight
	
	if UnitIsGroupLeader("player") then
		local groupBtn = self:CreateButton(
			groupEnabled and "Group: |cFF00FF00ON|r" or "Group: |cFFFF0000OFF|r", 
			yOffset
		)
		groupBtn:SetScript("OnClick", function()
			Soundboard:ToggleGroup()
			self:ShowMainMenu()
		end)
		yOffset = yOffset - buttonHeight
	end
	
	local soundboardBtn = self:CreateButton(
		soundboardEnabled and "Soundboard: |cFF00FF00ON|r" or "Soundboard: |cFFFF0000OFF|r", 
		yOffset
	)
	soundboardBtn:SetScript("OnClick", function()
		local currentDB = Soundboard.db and Soundboard.db.profile
		DebugPrint("Soundboard button clicked, currentDB exists: " .. tostring(currentDB ~= nil))
		if currentDB then
			local oldValue = currentDB.IsEnabled
			currentDB.IsEnabled = not currentDB.IsEnabled
			DebugPrint("IsEnabled changed from " .. tostring(oldValue) .. " to " .. tostring(currentDB.IsEnabled))
			if currentDB.IsEnabled then
				Soundboard:Print("Soundboard |cFF00FF00enabled|r")
			else
				Soundboard:Print("Soundboard |cFFFF0000disabled|r")
			end
			self:ShowMainMenu()
		else
			DebugPrint("ERROR: Soundboard.db.profile is nil when clicking soundboard button!")
			Soundboard:Print("Error: Database not available")
		end
	end)
	yOffset = yOffset - buttonHeight - 5
	
	-- Categories with simple styling
	local categoryNames = {}
	for category, _ in pairs(self.categories) do
		tinsert(categoryNames, category)
	end
	tsort(categoryNames)
	
	for _, category in ipairs(categoryNames) do
		local count = #self.categories[category]
		local catBtn = self:CreateButton(
			category .. " |cFF888888(" .. count .. ")|r", 
			yOffset
		)
		catBtn:SetScript("OnClick", function()
			self:ShowCategory(category)
		end)
		yOffset = yOffset - buttonHeight
	end
	
	-- Update content size and scrollbar
	self.content:SetHeight(math.abs(yOffset) + 10)
	self:UpdateScrollbar()
end

function SoundboardDropdown:ShowCategory(categoryName)
	self:ClearContent()
	
	local yOffset = -5
	local buttonHeight = 20
	
	-- Back button
	local backBtn = self:CreateButton("< Back to Menu", yOffset)
	backBtn:SetScript("OnClick", function()
		self:ShowMainMenu()
	end)
	yOffset = yOffset - buttonHeight - 5
	
	-- Category title
	local title = self:CreateButton(categoryName, yOffset, true)
	title:SetScript("OnClick", nil)
	yOffset = yOffset - buttonHeight - 5
	
	-- Sounds in category
	local sounds = self.categories[categoryName]
	for _, sound in ipairs(sounds) do
		local displayText = "/" .. sound.key
		-- Add description if available and not too long
		if sound.data.text and string.len(sound.data.text) < 30 then
			displayText = displayText .. " |cFF888888- " .. sound.data.text .. "|r"
		end
		
		local soundBtn = self:CreateButton(displayText, yOffset)
		soundBtn:SetScript("OnClick", function()
			Soundboard:SayGagKey(sound.key)
			self.frame:Hide()
		end)
		yOffset = yOffset - buttonHeight
	end
	
	-- Update content size and scrollbar
	self.content:SetHeight(math.abs(yOffset) + 10)
	self:UpdateScrollbar()
end

function SoundboardDropdown:CreateButton(text, yOffset, isTitle)
	DebugPrint("CreateButton called: '" .. tostring(text) .. "' at yOffset " .. tostring(yOffset))
	
	if not self.content then
		DebugPrint("ERROR: self.content is nil!")
		return nil
	end
	
	local button = CreateFrame("Button", nil, self.content)
	DebugPrint("Button frame created")
	button:SetSize(260, 20) -- Standard button size
	button:SetPoint("TOPLEFT", 4, yOffset)
	DebugPrint("Button positioned")
	
	-- Simple ElvUI-style button
	if not isTitle then
		-- Subtle hover highlight only
		button:SetScript("OnEnter", function(btn)
			if not btn.highlight then
				btn.highlight = btn:CreateTexture(nil, "HIGHLIGHT")
				btn.highlight:SetAllPoints()
				btn.highlight:SetColorTexture(1, 1, 1, 0.1) -- Simple white highlight
			end
			btn.highlight:Show()
		end)
		button:SetScript("OnLeave", function(btn)
			if btn.highlight then
				btn.highlight:Hide()
			end
		end)
	end
	
	-- Text with standard WoW fonts
	DebugPrint("Creating font string...")
	local fontString = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	fontString:SetPoint("LEFT", 4, 0)
	fontString:SetPoint("RIGHT", -4, 0)
	fontString:SetJustifyH("LEFT")
	fontString:SetText(text)
	
	-- Font styling with class colors
	if isTitle then
		fontString:SetJustifyH("CENTER")
		fontString:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
		fontString:SetTextColor(1, 0.82, 0, 1) -- Gold color for titles
		fontString:SetPoint("LEFT", 0, 0)
		fontString:SetPoint("RIGHT", 0, 0)
	else
		-- Use player's class color for regular items (ElvUI style)
		local r, g, b = GetPlayerClassColor()
		fontString:SetTextColor(r, g, b, 1)
	end
	
	DebugPrint("Font string created and text set")
	DebugPrint("Button creation completed successfully")
	return button
end

function SoundboardDropdown:ClearContent()
	DebugPrint("ClearContent called")
	
	if not self.content then
		DebugPrint("ERROR: self.content is nil in ClearContent!")
		return
	end
	
	DebugPrint("Getting children...")
	local children = {self.content:GetChildren()}
	DebugPrint("Found " .. #children .. " children to clear")
	
	for i, child in pairs(children) do
		DebugPrint("Clearing child " .. i)
		child:Hide()
		child:SetParent(nil)
	end
	
	DebugPrint("Content cleared successfully")
end

function SoundboardDropdown:UpdateScrollbar()
	local contentHeight = self.content:GetHeight()
	local frameHeight = self.scrollFrame:GetHeight()
	
	DebugPrint("UpdateScrollbar - Content height: " .. contentHeight .. ", Frame height: " .. frameHeight)
	
	if self.scrollbar then
		-- Only show scrollbar if content is significantly larger than frame (with some padding)
		local needsScrolling = contentHeight > (frameHeight + 10)
		
		if needsScrolling then
			DebugPrint("Content is larger than frame, showing scrollbar")
			self.scrollbar:Show()
			self.scrollbar:SetMinMaxValues(0, contentHeight - frameHeight)
			self.scrollbar:SetValue(0) -- Reset to top
			-- Adjust scroll frame to make room for scrollbar
			self.scrollFrame:SetPoint("BOTTOMRIGHT", -26, 4)
			-- Enable mouse wheel scrolling
			self.frame:EnableMouseWheel(true)
		else
			DebugPrint("Content fits in frame, hiding scrollbar and disabling scrolling")
			self.scrollbar:Hide()
			self.scrollFrame:SetVerticalScroll(0)
			-- Expand scroll frame to use full width when no scrollbar needed
			self.scrollFrame:SetPoint("BOTTOMRIGHT", -4, 4)
			-- Disable mouse wheel scrolling when not needed
			self.frame:EnableMouseWheel(false)
		end
	else
		DebugPrint("WARNING: No scrollbar available to update")
	end
end

-- Old CreateButtons function removed - using new scrollable system

function SoundboardDropdown:Position(anchor)
	self.frame:ClearAllPoints()
	if anchor then
		-- Position to the left of the minimap button
		self.frame:SetPoint("TOPRIGHT", anchor, "TOPLEFT", -5, 0)
	else
		local x, y = GetCursorPosition()
		local scale = UIParent:GetEffectiveScale()
		self.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", x/scale, y/scale)
	end
end

local defaults;
local db; -- DB shortening
local LastEmoteTime = time();
local soundboard_data_sorted_keys = {};


 local SoundboardLDB = {
	type = "launcher",
	icon = "Interface\\AddOns\\Soundboard\\icon", -- Custom icon (icon.png or icon.tga)
	label = "Soundboard",
	OnClick = function(this, button)
		SoundboardDropdown:Toggle(this);
	end,
	OnTooltipShow = function(tooltip)
		tooltip:AddLine("Soundboard");
		tooltip:AddLine("Click to open a list of available songs, sounds and options!")
	end,
};

 -- Options table
 local options = {
	type = 'group',
	name = 'Soundboard',
	desc = 'Soundboard addon settings',
	args = {
		-- Header
		header = {
			order = 1,
			type = 'header',
			name = 'Soundboard Settings',
		},
		
		-- General Settings Group
		general = {
			order = 10,
			type = 'group',
			name = 'General',
			desc = 'General addon settings',
			inline = true,
			args = {
				enable = {
					order = 1,
					type = 'toggle',
					name = 'Enable Soundboard',
					desc = 'Enable or disable the entire Soundboard addon',
					get = function() return db.IsEnabled end,
					set = function(info, value) 
						db.IsEnabled = value
						if value then
							Soundboard:Enable()
						else
							Soundboard:Disable()
						end
					end,
					width = 'full',
				},
				showMinimapButton = {
					order = 2,
					type = 'toggle',
					name = 'Show Minimap Button',
					desc = 'Show or hide the minimap button',
					get = function() return db.ShowMinimapButton end,
					set = function(info, value) 
						db.ShowMinimapButton = value
						local LibDBIcon = LibStub("LibDBIcon-1.0", true)
						if LibDBIcon and LibDBIcon:IsRegistered("SoundboardMinimapButton") then
							if value then
								LibDBIcon:Show("SoundboardMinimapButton")
							else
								LibDBIcon:Hide("SoundboardMinimapButton")
							end
						end
					end,
					disabled = function() return not db.IsEnabled end,
				},
			},
		},
		
		-- Audio Settings Group
		audio = {
			order = 20,
			type = 'group',
			name = 'Audio',
			desc = 'Audio and sound settings',
			inline = true,
			args = {
				soundEnabled = {
					order = 1,
					type = 'toggle',
					name = 'Enable Sounds',
					desc = 'Enable or disable all sound playback',
					get = function() return db.SoundEnabled end,
					set = function(info, value) db.SoundEnabled = value end,
					disabled = function() return not db.IsEnabled end,
					width = 'full',
				},
				masterVolume = {
					order = 2,
					type = 'range',
					name = 'Master Volume',
					desc = 'Adjust the volume for all Soundboard sounds (0% to 100%)',
					min = 0,
					max = 1,
					step = 0.01,
					bigStep = 0.1,
					isPercent = true,
					get = function() return db.MasterVolume end,
					set = function(info, value) db.MasterVolume = value end,
					disabled = function() return not db.IsEnabled or not db.SoundEnabled end,
					width = 'full',
				},
			},
		},
		
		-- Emote Settings Group
		emotes = {
			order = 30,
			type = 'group',
			name = 'Emotes & Chat',
			desc = 'Emote and chat message settings',
			inline = true,
			args = {
				emoteEnabled = {
					order = 1,
					type = 'toggle',
					name = 'Enable Emotes',
					desc = 'Perform WoW emotes when playing sounds',
					get = function() return db.EmoteEnabled end,
					set = function(info, value) db.EmoteEnabled = value end,
					disabled = function() return not db.IsEnabled end,
				},
				sayEnabled = {
					order = 2,
					type = 'toggle',
					name = 'Enable Say Messages',
					desc = 'Send messages to Say chat when playing sounds',
					get = function() return db.SayEnabled end,
					set = function(info, value) db.SayEnabled = value end,
					disabled = function() return not db.IsEnabled end,
				},
			},
		},
		
		-- Group Settings
		group = {
			order = 40,
			type = 'group',
			name = 'Group Play',
			desc = 'Settings for playing sounds to your group',
			inline = true,
			args = {
				groupEnabled = {
					order = 1,
					type = 'toggle',
					name = 'Enable Group Sounds',
					desc = 'Allow sounds to be sent to and received from group members',
					get = function() return db.GroupEnabled end,
					set = function(info, value) 
						db.GroupEnabled = value
						Soundboard:ToggleGroup()
					end,
					disabled = function() return not db.IsEnabled end,
					width = 'full',
				},
				groupInfo = {
					order = 2,
					type = 'description',
					name = 'Group sounds allow you to play sounds for other players in your party or raid who also have Soundboard installed.',
					fontSize = 'medium',
				},
			},
		},
		
		-- Actions Group
		actions = {
			order = 50,
			type = 'group',
			name = 'Actions',
			desc = 'Useful actions and commands',
			inline = true,
			args = {
				list = {
					order = 1,
					type = 'execute',
					name = 'List All Sounds',
					desc = 'Display a list of all available sounds in chat',
					func = function() Soundboard:ListEmotes() end,
					disabled = function() return not db.IsEnabled end,
				},
				ping = {
					order = 2,
					type = 'execute',
					name = 'Ping Group',
					desc = 'Check which group members have Soundboard installed',
					func = function() Soundboard:Ping() end,
					disabled = function() return not db.IsEnabled or not db.GroupEnabled end,
				},
				testSound = {
					order = 3,
					type = 'execute',
					name = 'Test Sound',
					desc = 'Play a test sound to verify audio settings',
					func = function() 
						if soundboard_data and soundboard_data["hero"] then
							-- Test the volume system directly
							local heroSound = soundboard_data["hero"]
							if heroSound and heroSound.file then
								Soundboard:Print("Testing sound at " .. tostring(db.MasterVolume * 100) .. "% volume...")
								Soundboard:PlaySoundWithVolume(heroSound.file, db.MasterVolume)
							else
								Soundboard:Print("Hero sound file not found")
							end
						else
							Soundboard:Print("Test sound not available")
						end
					end,
					disabled = function() return not db.IsEnabled or not db.SoundEnabled end,
				},
			},
		},
		
		-- Advanced Settings
		advanced = {
			order = 60,
			type = 'group',
			name = 'Advanced',
			desc = 'Advanced settings and debugging',
			inline = true,
			args = {
				debugMode = {
					order = 1,
					type = 'toggle',
					name = 'Debug Mode',
					desc = 'Enable debug output for troubleshooting',
					get = function() return db.DebugMode end,
					set = function(info, value) 
						db.DebugMode = value
						SoundboardDebug.enabled = value
						Soundboard:Print("Debug mode " .. (value and "enabled" or "disabled"))
					end,
				},
				reloadAddon = {
					order = 2,
					type = 'execute',
					name = 'Reload UI',
					desc = 'Reload the user interface (same as /reload)',
					func = function() ReloadUI() end,
					confirm = true,
					confirmText = 'This will reload your UI. Continue?',
				},
			},
		},
	},
 }

 function Soundboard:OnInitialize()
	DebugPrint("Soundboard:OnInitialize called")
	self:RegisterComm("Soundboard")
	self:RegisterEvent("GROUP_ROSTER_UPDATE");
	self:RegisterEvent("ADDON_LOADED");
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Soundboard", options, {"soundboard"})
	
	-- Register with Interface Options
	local AceConfigDialog = LibStub("AceConfigDialog-3.0")
	AceConfigDialog:AddToBlizOptions("Soundboard", "Soundboard")

	defaults = {
		profile = {
			IsEnabled = true,
			GroupEnabled = true,
			EmoteEnabled = true,
			SayEnabled = false,
			LDBIconStorage = {}, -- LibDBIcon storage
			-- Audio Settings
			MasterVolume = 1.0,        -- Master volume (0.0 to 1.0)
			SoundEnabled = true,       -- Enable/disable all sound playback
			-- UI Settings
			ShowMinimapButton = true,  -- Show/hide minimap button
			-- Advanced Settings
			DebugMode = false,         -- Enable debug output
		}
	 }
	self.db = LibStub("AceDB-3.0"):New("SoundboardDB", defaults, true)
	db = self.db.profile
	DebugPrint("Database initialized successfully, db exists: " .. tostring(db ~= nil))
	DebugPrint("self.db exists: " .. tostring(self.db ~= nil))
	DebugPrint("self.db.profile exists: " .. tostring(self.db.profile ~= nil))

	-- Create direct minimap button (bypass LibDBIcon)
	self:Print("Creating direct minimap button...")
	
	-- Create the button directly
	local minimapButton = CreateFrame("Button", "SoundboardMinimapButton", Minimap)
	minimapButton:SetSize(31, 31)
	minimapButton:SetFrameStrata("HIGH")
	minimapButton:SetFrameLevel(25)
	minimapButton:EnableMouse(true)
	minimapButton:SetMovable(true)
	minimapButton:SetClampedToScreen(true)
	minimapButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	minimapButton:RegisterForDrag("LeftButton")
	
	-- Create textures
	local overlay = minimapButton:CreateTexture(nil, "OVERLAY")
	overlay:SetSize(53, 53)
	overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
	overlay:SetPoint("TOPLEFT")
	
	local background = minimapButton:CreateTexture(nil, "BACKGROUND")
	background:SetSize(20, 20)
	background:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
	background:SetPoint("TOPLEFT", 7, -5)
	
	local icon = minimapButton:CreateTexture(nil, "ARTWORK")
	icon:SetSize(17, 17)
	icon:SetPoint("TOPLEFT", 7, -6)
	
	-- Set icon
	local customIconPath = "Interface\\AddOns\\Soundboard\\icon"
	icon:SetTexture(customIconPath)
	
	-- Set highlight
	minimapButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
	
	-- Position button
	minimapButton:SetPoint("CENTER", Minimap, "CENTER", -52, -52)
	
	-- Event handlers
	minimapButton:SetScript("OnClick", function(self, button)
		DebugPrint("Direct button clicked! Button: " .. tostring(button))
		if SoundboardLDB and SoundboardLDB.OnClick then
			SoundboardLDB.OnClick(self, button)
		else
			DebugPrint("No OnClick handler found")
		end
	end)
	
	minimapButton:SetScript("OnEnter", function(self)
		DebugPrint("Button entered")
		if SoundboardLDB and SoundboardLDB.OnTooltipShow then
			GameTooltip:SetOwner(self, "ANCHOR_LEFT")
			SoundboardLDB.OnTooltipShow(GameTooltip)
			GameTooltip:Show()
		end
	end)
	
	minimapButton:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	minimapButton:SetScript("OnDragStart", function(self)
		DebugPrint("Drag started")
		self:StartMoving()
	end)
	
	minimapButton:SetScript("OnDragStop", function(self)
		DebugPrint("Drag stopped")
		self:StopMovingOrSizing()
	end)
	
	-- Store reference
	Soundboard.minimapButton = minimapButton
	
	-- Show/hide based on settings
	if db.ShowMinimapButton then
		minimapButton:Show()
		self:Print("Direct minimap button created and shown")
	else
		minimapButton:Hide()
		self:Print("Direct minimap button created but hidden (disabled in settings)")
	end

	-- Initialize simple dropdown system
	DebugPrint("About to initialize dropdown...")
	SoundboardDropdown:Initialize()
	DebugPrint("Dropdown initialization completed")
 end

 function Soundboard:OnEnable()
	db.IsEnabled = true
	
	-- Debug: Check if soundboard_data exists
	self:Print("Soundboard enabled. Checking for sound packs...")
	
	-- Add debug commands
	_G.SlashCmdList["SOUNDBOARDDEBUG"] = function()
		if soundboard_data then
			local count = 0
			for k, v in pairs(soundboard_data) do
				count = count + 1
				if count <= 5 then
					Soundboard:Print("Found emote: /" .. k .. " - " .. (v.text or "no text"))
				end
			end
			Soundboard:Print("Total emotes found: " .. count)
			Soundboard:Print("Checking if /aids command exists...")
			if _G.SlashCmdList["SOUNDBOARD_aids"] then
				Soundboard:Print("/aids command is registered!")
			else
				Soundboard:Print("/aids command is NOT registered!")
			end
		else
			Soundboard:Print("soundboard_data is nil!")
		end
	end
	_G["SLASH_SOUNDBOARDDEBUG1"] = "/soundboarddebug"
	
	-- Add debug toggle command
	_G.SlashCmdList["SOUNDBOARDDEBUGTOGGLE"] = function()
		SoundboardDebug.enabled = not SoundboardDebug.enabled
		Soundboard:Print("Debug mode " .. (SoundboardDebug.enabled and "|cFF00FF00ENABLED|r" or "|cFFFF0000DISABLED|r"))
	end
	_G["SLASH_SOUNDBOARDDEBUGTOGGLE1"] = "/soundboarddebugtoggle"
	
	-- Add test dropdown command
	_G.SlashCmdList["SOUNDBOARDTEST"] = function()
		DebugPrint("Testing dropdown at center of screen...")
		if SoundboardDropdown.frame then
			SoundboardDropdown.frame:ClearAllPoints()
			SoundboardDropdown.frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
			SoundboardDropdown.frame:SetSize(200, 100)
			SoundboardDropdown.frame:Show()
			DebugPrint("Test frame shown at center. Size: " .. SoundboardDropdown.frame:GetWidth() .. "x" .. SoundboardDropdown.frame:GetHeight())
		else
			DebugPrint("Dropdown frame not initialized!")
		end
	end
	_G["SLASH_SOUNDBOARDTEST1"] = "/soundboardtest"
	
	-- Add manual command registration function
	_G.SlashCmdList["SOUNDBOARDREGISTER"] = function()
		Soundboard:RegisterSlashCommands()
	end
	_G["SLASH_SOUNDBOARDREGISTER1"] = "/soundboardregister"
	
	-- Add soundboard check command
	_G.SlashCmdList["SOUNDBOARDCHECK"] = function(msg)
		Soundboard:Print("=== Soundboard Status Check ===")
		Soundboard:Print("soundboard_data exists: " .. tostring(soundboard_data ~= nil))
		if soundboard_data then
			Soundboard:Print("soundboard_data type: " .. type(soundboard_data))
			local count = 0
			for _ in pairs(soundboard_data) do count = count + 1 end
			Soundboard:Print("Total sounds: " .. count)
			
			-- Test a specific sound
			if soundboard_data["hero"] then
				Soundboard:Print("Hero sound found: " .. (soundboard_data["hero"].file or "no file"))
			else
				Soundboard:Print("Hero sound not found!")
			end
		end
		Soundboard:Print("Addon initialized: " .. tostring(Soundboard.db ~= nil))
		if Soundboard.db then
			Soundboard:Print("Database profile exists: " .. tostring(Soundboard.db.profile ~= nil))
		end
	end
	_G["SLASH_SOUNDBOARDCHECK1"] = "/soundboardcheck"
	
	-- Add settings command
	_G.SlashCmdList["SOUNDBOARDCONFIG"] = function(msg)
		-- Open the Interface Options to Soundboard panel
		InterfaceOptionsFrame_OpenToCategory("Soundboard")
		InterfaceOptionsFrame_OpenToCategory("Soundboard") -- Call twice for reliability
	end
	_G["SLASH_SOUNDBOARDCONFIG1"] = "/soundboardconfig"
	_G["SLASH_SOUNDBOARDCONFIG2"] = "/soundboardsettings"
	
	-- Add icon debug command
	_G.SlashCmdList["SOUNDBOARDICON"] = function(msg)
		Soundboard:Print("=== Icon Debug Info ===")
		local LibDBIcon = LibStub("LibDBIcon-1.0", true)
		if LibDBIcon and LibDBIcon:IsRegistered("SoundboardMinimapButton") then
			local button = LibDBIcon:GetMinimapButton("SoundboardMinimapButton")
			if button then
				Soundboard:Print("Button exists: true")
				Soundboard:Print("Button visible: " .. tostring(button:IsVisible()))
				Soundboard:Print("Icon path: " .. tostring(SoundboardLDB.icon))
				Soundboard:Print("Try re-saving your icon.png as PNG-24 with transparency")
			else
				Soundboard:Print("Button not found")
			end
		else
			Soundboard:Print("LibDBIcon not registered")
		end
	end
	_G["SLASH_SOUNDBOARDICON1"] = "/soundboardicon"
	
	-- Add dependency check command
	_G.SlashCmdList["SOUNDBOARDDEPS"] = function(msg)
		Soundboard:Print("=== Dependency Check ===")
		local deps = {
			{"LibStub", "LibStub"},
			{"AceAddon-3.0", "AceAddon-3.0"},
			{"AceConsole-3.0", "AceConsole-3.0"},
			{"AceEvent-3.0", "AceEvent-3.0"},
			{"AceComm-3.0", "AceComm-3.0"},
			{"AceDB-3.0", "AceDB-3.0"},
			{"AceConfig-3.0", "AceConfig-3.0"},
			{"AceConfigDialog-3.0", "AceConfigDialog-3.0"},
			{"LibDataBroker-1.1", "LibDataBroker-1.1"},
			{"LibDBIcon-1.0", "LibDBIcon-1.0"},
		}
		
		for _, dep in ipairs(deps) do
			local name, lib = dep[1], dep[2]
			local loaded = LibStub(lib, true)
			local status = loaded and "|cFF00FF00OK|r" or "|cFFFF0000MISSING|r"
			Soundboard:Print(name .. ": " .. status)
		end
		
		Soundboard:Print("If any libraries show MISSING, the addon may not work properly.")
	end
	_G["SLASH_SOUNDBOARDDEPS1"] = "/soundboarddeps"
	
	-- Add minimap button reset command
	_G.SlashCmdList["SOUNDBOARDRESET"] = function(msg)
		Soundboard:Print("Resetting direct minimap button...")
		
		-- Hide and remove old button if it exists
		if Soundboard.minimapButton then
			Soundboard.minimapButton:Hide()
			Soundboard.minimapButton = nil
		end
		
		-- Also clean up any LibDBIcon button
		local LibDBIcon = LibStub("LibDBIcon-1.0", true)
		if LibDBIcon and LibDBIcon:IsRegistered("SoundboardMinimapButton") then
			LibDBIcon:Hide("SoundboardMinimapButton")
		end
		
		-- Recreate using OnInitialize
		Soundboard:OnInitialize()
		Soundboard:Print("Direct minimap button reset complete")
	end
	_G["SLASH_SOUNDBOARDRESET1"] = "/soundboardreset"
	
	-- Add button test command
	_G.SlashCmdList["SOUNDBOARDTEST"] = function(msg)
		Soundboard:Print("Testing direct minimap button...")
		
		if Soundboard.minimapButton then
			local button = Soundboard.minimapButton
			Soundboard:Print("Button found: " .. tostring(button:GetName()))
			Soundboard:Print("Button visible: " .. tostring(button:IsVisible()))
			Soundboard:Print("Button enabled: " .. tostring(button:IsEnabled()))
			Soundboard:Print("Mouse enabled: " .. tostring(button:IsMouseEnabled()))
			Soundboard:Print("SoundboardLDB exists: " .. tostring(SoundboardLDB ~= nil))
			if SoundboardLDB then
				Soundboard:Print("OnClick handler exists: " .. tostring(SoundboardLDB.OnClick ~= nil))
			end
			
			-- Try to simulate a click
			Soundboard:Print("Simulating click...")
			if SoundboardLDB and SoundboardLDB.OnClick then
				SoundboardLDB.OnClick(button, "LeftButton")
			else
				Soundboard:Print("No OnClick handler available")
			end
		else
			Soundboard:Print("Direct button not found!")
		end
	end
	_G["SLASH_SOUNDBOARDTEST1"] = "/soundboardtest"
	
	-- Add frame inspection command
	_G.SlashCmdList["SOUNDBOARDFRAMES"] = function(msg)
		Soundboard:Print("Checking frames at minimap button location...")
		local LibDBIcon = LibStub("LibDBIcon-1.0", true)
		if LibDBIcon and LibDBIcon:IsRegistered("SoundboardMinimapButton") then
			local button = LibDBIcon:GetMinimapButton("SoundboardMinimapButton")
			if button then
				local x, y = button:GetCenter()
				Soundboard:Print("Button center: " .. tostring(x) .. ", " .. tostring(y))
				Soundboard:Print("Button frame level: " .. tostring(button:GetFrameLevel()))
				Soundboard:Print("Button frame strata: " .. tostring(button:GetFrameStrata()))
				
				-- Check what frame is on top at that location
				local topFrame = GetMouseFocus()
				Soundboard:Print("Current mouse focus: " .. tostring(topFrame and topFrame:GetName() or "nil"))
				
				-- Force the button to top
				button:Raise()
				Soundboard:Print("Button raised to top")
			end
		end
	end
	_G["SLASH_SOUNDBOARDFRAMES1"] = "/soundboardframes"
	
	-- Add debug toggle command
	_G.SlashCmdList["SOUNDBOARDDEBUG"] = function(msg)
		SoundboardDebug.enabled = not SoundboardDebug.enabled
		Soundboard:Print("Debug mode " .. (SoundboardDebug.enabled and "|cFF00FF00ENABLED|r" or "|cFFFF0000DISABLED|r"))
		if SoundboardDebug.enabled then
			Soundboard:Print("Minimap button interactions will now show debug output")
		else
			Soundboard:Print("Debug output disabled")
		end
	end
	_G["SLASH_SOUNDBOARDDEBUG1"] = "/soundboarddebug"
	
	-- Add volume test command
	_G.SlashCmdList["SOUNDBOARDVOLUME"] = function(msg)
		local volume = tonumber(msg)
		if volume and volume >= 0 and volume <= 1 then
			-- Test with specific volume
			if soundboard_data and soundboard_data["hero"] then
				local heroSound = soundboard_data["hero"]
				if heroSound and heroSound.file then
					Soundboard:Print("Testing sound at " .. tostring(volume * 100) .. "% volume...")
					Soundboard:PlaySoundWithVolume(heroSound.file, volume)
				else
					Soundboard:Print("Hero sound file not found")
				end
			else
				Soundboard:Print("Test sound not available")
			end
		else
			-- Test with current setting
			local currentVolume = Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.MasterVolume or 1.0
			if soundboard_data and soundboard_data["hero"] then
				local heroSound = soundboard_data["hero"]
				if heroSound and heroSound.file then
					Soundboard:Print("Testing sound at current volume (" .. tostring(currentVolume * 100) .. "%)...")
					Soundboard:PlaySoundWithVolume(heroSound.file, currentVolume)
				else
					Soundboard:Print("Hero sound file not found")
				end
			else
				Soundboard:Print("Test sound not available")
			end
			Soundboard:Print("Usage: /soundboardvolume [0.0-1.0] or just /soundboardvolume for current setting")
		end
	end
	_G["SLASH_SOUNDBOARDVOLUME1"] = "/soundboardvolume"
	
	-- Add database debug command
	_G.SlashCmdList["SOUNDBOARDDB"] = function(msg)
		Soundboard:Print("=== Database Debug ===")
		Soundboard:Print("Soundboard.db exists: " .. tostring(Soundboard.db ~= nil))
		if Soundboard.db then
			Soundboard:Print("Soundboard.db.profile exists: " .. tostring(Soundboard.db.profile ~= nil))
			if Soundboard.db.profile then
				Soundboard:Print("MasterVolume: " .. tostring(Soundboard.db.profile.MasterVolume))
				Soundboard:Print("SoundEnabled: " .. tostring(Soundboard.db.profile.SoundEnabled))
				Soundboard:Print("IsEnabled: " .. tostring(Soundboard.db.profile.IsEnabled))
			end
		end
		Soundboard:Print("Global db variable: " .. tostring(db ~= nil))
		if db then
			Soundboard:Print("db.MasterVolume: " .. tostring(db.MasterVolume))
			Soundboard:Print("db.SoundEnabled: " .. tostring(db.SoundEnabled))
		end
	end
	_G["SLASH_SOUNDBOARDDB1"] = "/soundboarddb"

	
	if not soundboard_data then
		self:Print("No soundpacks found! The default soundpack may not have loaded properly.")
		self:Print("Try /reload or check that the Soundboard addon loaded correctly.")
	else
		--Generate slash commands from soundboard_data using closures (avoid loadstring)
		for key,value in pairs(soundboard_data) do
			local function makeHandler(emoteKey)
				return function()
					Soundboard:SayGagKey(emoteKey)
				end
			end
			_G.SlashCmdList["SOUNDBOARD_"..key] = makeHandler(key)
			_G["SLASH_SOUNDBOARD_"..key.."1"] = "/"..key
		end

		--Fill the array (1-based indexing)
		local i = 1;
		for key,value in pairs(soundboard_data) do
			soundboard_data_sorted_keys[i] = key
			i = i + 1
		end
		tsort(soundboard_data_sorted_keys)
	 end
 end

function Soundboard:OnDisable()
	db.IsEnabled = false;
	self:Print("disabled")
end

function Soundboard:RegisterSlashCommands()
	self:Print("Attempting to register slash commands...")
	
	if not soundboard_data then
		self:Print("Cannot register commands: soundboard_data is nil")
		return
	end
	
	local count = 0
	--Generate slash commands from soundboard_data using closures (avoid loadstring)
	for key,value in pairs(soundboard_data) do
		local function makeHandler(emoteKey)
			return function()
				Soundboard:SayGagKey(emoteKey)
			end
		end
		_G.SlashCmdList["SOUNDBOARD_"..key] = makeHandler(key)
		_G["SLASH_SOUNDBOARD_"..key.."1"] = "/"..key
		count = count + 1
	end

	--Fill the array (1-based indexing)
	local i = 1;
	for key,value in pairs(soundboard_data) do
		soundboard_data_sorted_keys[i] = key
		i = i + 1
	end
	tsort(soundboard_data_sorted_keys)
	
	self:Print("Registered " .. count .. " slash commands")
end


function Soundboard:ToggleGroup()
	if UnitIsGroupLeader("player") then
		db.GroupEnabled = not db.GroupEnabled
		if db.GroupEnabled then
			Soundboard:Send("GroupEnable")
			self:Print("Enabled for the entire group");
		else
			Soundboard:Send("GroupDisable")
			self:Print("Disabled for the entire group");
		end
	else
		self:Print("You are not the group leader");
	end
end

function Soundboard:Send(msg, to)
	if to then
		self:SendCommMessage("Soundboard", msg, "WHISPER", to)
	else
		if IsInRaid() then
			local channel = "RAID"
			if HAS_PARTY_CATEGORIES and (not IsInRaid(LE_PARTY_CATEGORY_HOME) and IsInRaid(LE_PARTY_CATEGORY_INSTANCE)) then
				channel = "INSTANCE_CHAT"
			end
			self:SendCommMessage("Soundboard", msg, channel);
		elseif IsInGroup() then
			local channel = "PARTY"
			if HAS_PARTY_CATEGORIES and (not IsInGroup(LE_PARTY_CATEGORY_HOME) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) then
				channel = "INSTANCE_CHAT"
			end
			self:SendCommMessage("Soundboard", msg, channel);
		end
	end
end

function Soundboard:Ping()
	Soundboard:Send("PingSend")
	self:Print("Players in your group with Soundboard installed:");
end

function Soundboard:GROUP_ROSTER_UPDATE()
	if UnitIsGroupLeader("player") then
		if(db.GroupEnabled) then
			Soundboard:Send("GroupEnable");
		else
			Soundboard:Send("GroupDisable")
		end
	end
end

function Soundboard:LoadSoundpacks()
	DebugPrint("Checking soundpack data...")
	
	-- Check if soundboard_data exists (loaded by TOC)
	if not soundboard_data or type(soundboard_data) ~= "table" then
		self:Print("ERROR: No soundpack data found! Default soundpack may not have loaded.")
		soundboard_data = {}
		return
	end
	
	local soundCount = self:CountSounds()
	DebugPrint("Soundpack data found. Total sounds available: " .. soundCount)
	self:Print("Loaded " .. soundCount .. " sounds from soundpacks")
	
	-- Register slash commands after confirming soundpacks are loaded
	self:RegisterSlashCommands()
end

function Soundboard:CountSounds()
	local count = 0
	if soundboard_data then
		for _ in pairs(soundboard_data) do
			count = count + 1
		end
	end
	return count
end

function Soundboard:PlaySoundWithVolume(soundFile, volume)
	-- Ensure volume is valid, fallback to 1.0 if nil or invalid
	if not volume or volume <= 0 then
		volume = 1.0
		DebugPrint("Volume was nil or invalid, using default: 1.0")
	end
	
	-- Store original Master volume
	local originalVolume = tonumber(GetCVar("Sound_MasterVolume")) or 1.0
	
	-- Calculate target volume (user's setting * addon volume)
	local targetVolume = originalVolume * volume
	
	DebugPrint("Original Master volume: " .. tostring(originalVolume))
	DebugPrint("Addon volume setting: " .. tostring(volume))
	DebugPrint("Target volume: " .. tostring(targetVolume))
	
	-- Set temporary volume
	SetCVar("Sound_MasterVolume", targetVolume)
	
	-- Play the sound
	local success = PlaySoundFile(soundFile, "Master")
	
	-- Restore original volume after a short delay
	C_Timer.After(0.1, function()
		SetCVar("Sound_MasterVolume", originalVolume)
		DebugPrint("Master volume restored to: " .. tostring(originalVolume))
	end)
	
	if success then
		DebugPrint("Sound played successfully at " .. tostring(volume * 100) .. "% volume")
	else
		DebugPrint("Sound file not found: " .. tostring(soundFile))
	end
	
	return success
end

function Soundboard:ADDON_LOADED(event, addonName)
	if addonName == "Soundboard" then
		self:Print("Soundboard addon loaded! Loading soundpacks...")
		-- Wait a bit for the addon to fully initialize
		if C_Timer and C_Timer.After then
			C_Timer.After(1, function()
				self:LoadSoundpacks()
			end)
		else
			-- Fallback for older clients - just load immediately
			self:LoadSoundpacks()
		end
	end
end

function Soundboard:ListEmotes()
	self:Print("List of sounds/commands:");
	--Output the array
	local i = 1;
	local line = "";
		for key,value in pairs(soundboard_data_sorted_keys) do
		line = line..value.." ";
		if i == 6 then
			self:Print(line);
			i = 0;
			line = "";
		end
		i = i + 1;
	end
end

function Soundboard:SayGagKey(key)
	DebugPrint("Trying to play emote: " .. tostring(key))
	
	if(db.IsEnabled) then
		if(db.GroupEnabled) then
			if(time() - LastEmoteTime > 1) then
				local emote = soundboard_data and soundboard_data[key];
				if emote then
					DebugPrint("Found emote data for: " .. key)
					if (emote["msg"] ~= nil) and db.EmoteEnabled then 
						SendChatMessage(emote["msg"], "EMOTE"); 
						DebugPrint("Sent emote message: " .. emote["msg"])
					end
					if (emote["text"] ~= nil) and db.SayEnabled then 
						SendChatMessage(emote["text"], "SAY"); 
						DebugPrint("Sent say message: " .. emote["text"])
					end
				Soundboard:DoEmote(key, true);
				else
					DebugPrint("No emote data found for: " .. tostring(key))
				end
			else
				self:Print("Emote blocked to prevent spam");
			end
		else
			self:Print("Disabled by your group leader");
		end
	else
		self:Print("Disabled.  Type \"/soundboard enable\" to enable this mod.");
	end
end

function Soundboard:DoEmote(key, arg2)
	DebugPrint("DoEmote called for: " .. tostring(key))
	
	if (db.IsEnabled) then
		if (db.GroupEnabled) then
			if (time() - LastEmoteTime > 1) then
				local emote = soundboard_data and soundboard_data[key]
				if emote then
					DebugPrint("Processing emote: " .. key)
					
					if (emote["emote"] ~= nil) and db.EmoteEnabled then 
						DoEmote(emote["emote"]); 
						DebugPrint("Performed emote: " .. emote["emote"])
					end
					
					if (emote["file"] ~= nil) and db.SoundEnabled then 
						DebugPrint("Attempting to play sound: " .. emote["file"])
						
						-- Get volume with fallback to default
						local volume = (db and db.MasterVolume) or 1.0
						DebugPrint("Master volume: " .. tostring(volume))
						
						-- Apply volume control by temporarily adjusting Master sound volume
						Soundboard:PlaySoundWithVolume(emote["file"], volume)
					elseif (emote["file"] ~= nil) and not db.SoundEnabled then
						DebugPrint("Sound playback disabled - skipping: " .. emote["file"])
					else
						DebugPrint("No sound file defined for: " .. key)
					end
					
				if arg2 then
					Soundboard:Send(key)
						DebugPrint("Sent to group: " .. key)
				end
				LastEmoteTime = time();
				else
					DebugPrint("Emote '" .. tostring(key) .. "' not found in sound pack");
				end
			end
		else
		self:Print("Disabled by your group leader");
		end
	end
end

function Soundboard:OnCommReceived(prefix, msg, distri, sender)
	if prefix == "Soundboard" then
		--sender = Ambiguate(sender, "none") Ace Ambiguates for us
		if sender == GetUnitName("player") then return end; -- don't do anything if we send the message
		if msg == "GroupEnable" then
			db.GroupEnabled = true

		elseif msg == "GroupDisable" then
			db.GroupEnabled = false

		elseif msg == "PingSend" then
			Soundboard:Send("PingReply", sender)

		elseif msg == "PingReply" then
			self:Print(sender)

		else
			Soundboard:DoEmote(msg, false)
		end
	end
end

-- Old dropdown function removed - replaced with simple dropdown system
