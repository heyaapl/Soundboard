-- Author      : Barogio, KarlThePagan, Onilink, Moonrydre, Bleric, and Potdisc all have authored the addon. Latest revision by heyaapl.
-- Create Date : 8/9/2012 11:08:28 PM

--[[ TODO:
	Check if IsInRaid() works in Battleground.
]]
Soundboard = LibStub("AceAddon-3.0"):NewAddon("Soundboard", "AceConsole-3.0", "AceEvent-3.0", "AceComm-3.0")
-- GLOBALS: Soundboard, soundboard_data

-- Debug system
local function DebugPrint(...)
	-- Use database setting instead of global variable
	if Soundboard and Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.DebugMode then
		Soundboard:Print("[DEBUG]", ...)
	end
end

-- ElvUI-Style UI System (independent implementation)
local SoundboardUI = {
	-- Template-specific Color Schemes
	templates = {
		Default = {
			backdrop = {0, 0, 0, 1},           -- Solid black background
			backdropFade = {0, 0, 0, 1},       -- Solid black
			border = {1, 0.82, 0, 1},          -- Gold border (was black)
			text = {1, 0.82, 0, 1},            -- Gold text
			textHover = {1, 1, 1, 1},          -- White hover
			scrollbar = {1, 0.82, 0, 1},       -- Gold scrollbar
			alpha = 1.0,                       -- Fully opaque
		},
		Transparent = {
			backdrop = {0.1, 0.1, 0.1, 1},     -- Dark gray background (alpha handled separately)
			backdropFade = {0.06, 0.06, 0.06, 1}, -- Dark fade (alpha handled separately)
			border = {0, 0, 0, 1},             -- Black border
			text = {1, 1, 1, 1},               -- White text
			textHover = {0.7, 0.7, 0.7, 1},    -- Light gray hover
			scrollbar = {1, 1, 1, 1},          -- White scrollbar
			alpha = 0.7,                       -- 70% opacity (more visible than 60%)
		},
		ClassColor = {
			backdrop = {0.1, 0.1, 0.1, 1},     -- Dark gray background (alpha handled separately)
			backdropFade = {0.06, 0.06, 0.06, 1}, -- Dark fade (alpha handled separately)
			border = nil,                       -- Will be set to class color
			text = nil,                         -- Will be set to class color
			textHover = {1, 1, 1, 1},          -- White hover (except priests)
			scrollbar = nil,                    -- Will be set to class color
			alpha = 0.8,                       -- 80% opacity (more visible than 30%)
		}
	},
	
	-- Current active template colors (will be set based on selection)
	colors = {
		backdrop = {0, 0, 0, 1},
		backdropFade = {0, 0, 0, 1},
		border = {0, 0, 0, 1},
		text = {1, 0.82, 0, 1},
		textHover = {1, 1, 1, 1},
		scrollbar = {1, 0.82, 0, 1},
		classColor = nil, -- Will be set based on player class
		alpha = 1.0 -- Current template alpha
	}
}

-- Initialize class color and template colors
local function InitializeClassColor()
	local _, class = UnitClass("player")
	if class and RAID_CLASS_COLORS[class] then
		local color = RAID_CLASS_COLORS[class]
		SoundboardUI.colors.classColor = {color.r, color.g, color.b, 1}
		
		-- Set ClassColor template colors
		SoundboardUI.templates.ClassColor.border = {color.r, color.g, color.b, 1}
		SoundboardUI.templates.ClassColor.text = {color.r, color.g, color.b, 1}
		SoundboardUI.templates.ClassColor.scrollbar = {color.r, color.g, color.b, 1}
		
		-- Special case for priests - grey hover instead of white
		if class == "PRIEST" then
			SoundboardUI.templates.ClassColor.textHover = {0.7, 0.7, 0.7, 1}
		end
	else
		-- Fallback to default colors
		SoundboardUI.colors.classColor = {0, 0, 0, 1}
		SoundboardUI.templates.ClassColor.border = {0, 0, 0, 1}
		SoundboardUI.templates.ClassColor.text = {1, 1, 1, 1}
		SoundboardUI.templates.ClassColor.scrollbar = {0, 0, 0, 1}
	end
end

-- Update active colors based on template selection
local function UpdateTemplateColors(template)
	template = template or "Default"
	local templateColors = SoundboardUI.templates[template]
	if not templateColors then
		templateColors = SoundboardUI.templates.Default
	end
	
	-- Update active colors
	SoundboardUI.colors.backdrop = templateColors.backdrop
	SoundboardUI.colors.backdropFade = templateColors.backdropFade  
	SoundboardUI.colors.border = templateColors.border
	SoundboardUI.colors.text = templateColors.text
	SoundboardUI.colors.textHover = templateColors.textHover
	SoundboardUI.colors.scrollbar = templateColors.scrollbar
	SoundboardUI.colors.alpha = templateColors.alpha
	
	DebugPrint("Template colors updated for: " .. template .. " (alpha: " .. templateColors.alpha .. ")")
end

-- Scaling function (like ElvUI's E:Scale)
local function Scale(value)
	local uiScale = UIParent:GetEffectiveScale()
	local perfectScale = 768 / select(2, GetPhysicalScreenSize())
	return (value / perfectScale) * uiScale
end

-- SetTemplate function (like ElvUI's SetTemplate)
local function SetTemplate(frame, template, glossTex, ignoreUpdates, forcePixelMode)
	template = template or "Default"
	
	-- Update colors for selected template
	UpdateTemplateColors(template)
	
	frame.template = template
	
	-- Remove existing backdrop
	if frame.backdrop then
		frame.backdrop:Hide()
		frame.backdrop = nil
	end
	
	-- Create backdrop frame
	local backdrop = CreateFrame("Frame", nil, frame, "BackdropTemplate")
	backdrop:SetAllPoints(frame)
	backdrop:SetFrameLevel(math.max(0, frame:GetFrameLevel() - 1))
	
	-- Set backdrop with thinner borders
	backdrop:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8x8",
		edgeFile = "Interface\\Buttons\\WHITE8x8",
		tile = false,
		tileSize = 0,
		edgeSize = Scale(0.5), -- Reduced from 1 to 0.5 for thinner outlines
		insets = {left = Scale(0.5), right = Scale(0.5), top = Scale(0.5), bottom = Scale(0.5)} -- Reduced insets too
	})
	
	-- Apply template-specific colors with proper alpha handling
	local r, g, b = unpack(SoundboardUI.colors.backdrop)
	backdrop:SetBackdropColor(r, g, b, SoundboardUI.colors.alpha)
	backdrop:SetBackdropBorderColor(unpack(SoundboardUI.colors.border))
	
	frame.backdrop = backdrop
	return backdrop
end

-- CreateBackdrop function (like ElvUI's CreateBackdrop) 
local function CreateBackdrop(frame, template, ignoreUpdates, forcePixelMode)
	return SetTemplate(frame, template, nil, ignoreUpdates, forcePixelMode)
end

-- Handle scrollbar styling (exact ElvUI implementation)
local function HandleScrollBar(scrollBar, template)
	if not scrollBar then return end
	
	-- Allow re-styling by clearing previous styling flag
	if scrollBar.sbStyled and scrollBar.backdrop then
		-- Clear existing styling to allow re-application
		scrollBar.backdrop:Hide()
		scrollBar.backdrop = nil
		scrollBar.sbStyled = nil
	elseif scrollBar.backdrop then
		return -- Already styled and not clearing
	end
	
	template = template or "Default"
	UpdateTemplateColors(template) -- Ensure colors are updated
	
	-- Find buttons - ElvUI method
	local upButton = scrollBar.ScrollUpButton or scrollBar.UpButton
	local downButton = scrollBar.ScrollDownButton or scrollBar.DownButton
	
	-- Find thumb - ElvUI method  
	local thumb = scrollBar.ThumbTexture or (scrollBar.GetThumbTexture and scrollBar:GetThumbTexture())
	
	-- Strip all textures like ElvUI
	if scrollBar.Background then scrollBar.Background:Hide() end
	if scrollBar.Track then scrollBar.Track:SetTexture("") end
	if scrollBar.ScrollUpBorder then scrollBar.ScrollUpBorder:Hide() end
	if scrollBar.ScrollDownBorder then scrollBar.ScrollDownBorder:Hide() end
	
	-- Create main backdrop exactly like ElvUI (between buttons, not covering them)
	CreateBackdrop(scrollBar, "Transparent")
	
	-- Position backdrop to fill full height (not just between buttons)
	scrollBar.backdrop:SetPoint('TOPLEFT', scrollBar, 'TOPLEFT', 0, 0)
	scrollBar.backdrop:SetPoint('BOTTOMRIGHT', scrollBar, 'BOTTOMRIGHT', 0, 0)
	
	local frameLevel = scrollBar:GetFrameLevel()
	
	-- Style up button exactly like ElvUI's HandleNextPrevButton
	if upButton then
		-- Strip textures
		upButton:SetNormalTexture("")
		upButton:SetPushedTexture("")
		upButton:SetDisabledTexture("")
		upButton:SetHighlightTexture("")
		if upButton.Texture then upButton.Texture:SetAlpha(0) end
		
		-- Create button backdrop with minimal/no border
		CreateBackdrop(upButton, "Transparent") -- Use transparent template for minimal borders
		upButton:SetFrameLevel(frameLevel + 3) -- Above scrollbar backdrop
		upButton:SetSize(18, 18) -- ElvUI standard size
		
		-- Use ElvUI arrow texture approach
		upButton:SetNormalTexture("Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\ArrowUp")
		upButton:SetPushedTexture("Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\ArrowUp")
		upButton:SetDisabledTexture("Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\ArrowUp")
		
		local normal = upButton:GetNormalTexture()
		local pushed = upButton:GetPushedTexture()
		local disabled = upButton:GetDisabledTexture()
		
		-- Get template colors for arrows
		local scrollbarColor = SoundboardUI.colors.scrollbar
		
		if normal then
			normal:SetAllPoints()
			normal:SetTexCoord(0, 1, 0, 1)
			normal:SetVertexColor(unpack(scrollbarColor)) -- Use theme color
		end
		if pushed then
			pushed:SetAllPoints()
			pushed:SetTexCoord(0, 1, 0, 1)
			pushed:SetVertexColor(unpack(scrollbarColor)) -- Use theme color
		end
		if disabled then
			disabled:SetAllPoints()
			disabled:SetTexCoord(0, 1, 0, 1)
			disabled:SetVertexColor(0.3, 0.3, 0.3) -- Keep disabled as gray
		end
	end
	
	-- Style down button exactly like ElvUI's HandleNextPrevButton
	if downButton then
		-- Strip textures
		downButton:SetNormalTexture("")
		downButton:SetPushedTexture("")
		downButton:SetDisabledTexture("")
		downButton:SetHighlightTexture("")
		if downButton.Texture then downButton.Texture:SetAlpha(0) end
		
		-- Create button backdrop with minimal/no border
		CreateBackdrop(downButton, "Transparent") -- Use transparent template for minimal borders
		downButton:SetFrameLevel(frameLevel + 3) -- Above scrollbar backdrop  
		downButton:SetSize(18, 18) -- ElvUI standard size
		
		-- Use ElvUI arrow texture approach with rotation
		downButton:SetNormalTexture("Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\ArrowUp")
		downButton:SetPushedTexture("Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\ArrowUp") 
		downButton:SetDisabledTexture("Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\ArrowUp")
		
		local normal = downButton:GetNormalTexture()
		local pushed = downButton:GetPushedTexture()
		local disabled = downButton:GetDisabledTexture()
		
		-- Get template colors for arrows
		local scrollbarColor = SoundboardUI.colors.scrollbar
		
		if normal then
			normal:SetAllPoints()
			normal:SetTexCoord(0, 1, 0, 1)
			normal:SetVertexColor(unpack(scrollbarColor)) -- Use theme color
			normal:SetRotation(math.pi) -- Rotate for down arrow
		end
		if pushed then
			pushed:SetAllPoints()
			pushed:SetTexCoord(0, 1, 0, 1)
			pushed:SetVertexColor(unpack(scrollbarColor)) -- Use theme color
			pushed:SetRotation(math.pi)
		end
		if disabled then
			disabled:SetAllPoints()
			disabled:SetTexCoord(0, 1, 0, 1)
			disabled:SetVertexColor(0.3, 0.3, 0.3) -- Keep disabled as gray
			disabled:SetRotation(math.pi)
		end
	end
	
	-- Style thumb exactly like ElvUI
	if thumb then
		thumb:SetTexture() -- Remove default texture
		
		-- Always recreate backdrop for template changes (remove existing first)
		if thumb.backdrop then
			thumb.backdrop:Hide()
			thumb.backdrop = nil
		end
		
		CreateBackdrop(thumb, template)
		
		if not scrollBar.Thumb then
			scrollBar.Thumb = thumb
		end
		
		if thumb.backdrop then
			-- ElvUI thumb positioning with offsets
			local thumbX, thumbY = 0, 0
			thumb.backdrop:SetPoint('TOPLEFT', thumb, thumbX, -thumbY)
			thumb.backdrop:SetPoint('BOTTOMRIGHT', thumb, -thumbX, thumbY)
			thumb.backdrop:SetFrameLevel(frameLevel + 1)
			
			-- Use template-specific scrollbar color with some transparency for better visibility
			local scrollbarColor = SoundboardUI.colors.scrollbar
			local backgroundColor = {scrollbarColor[1], scrollbarColor[2], scrollbarColor[3], 0.8} -- 80% alpha for thumb background
			thumb.backdrop:SetBackdropColor(unpack(backgroundColor))
			thumb.backdrop:SetBackdropBorderColor(unpack(SoundboardUI.colors.border))
			
			-- Add hover effects for better interactivity
			thumb:SetScript("OnEnter", function()
				if thumb.backdrop then
					thumb.backdrop:SetBackdropColor(scrollbarColor[1], scrollbarColor[2], scrollbarColor[3], 0.9) -- Brighter on hover
				end
			end)
			
			thumb:SetScript("OnLeave", function()
				if thumb.backdrop then
					thumb.backdrop:SetBackdropColor(scrollbarColor[1], scrollbarColor[2], scrollbarColor[3], 0.8) -- Back to normal
				end
			end)
		end
	end
end

-- Button styling function  
local function StyleButton(button, template)
	if not button or button.sbStyled then return end
	
	CreateBackdrop(button, template or "Default")
	
	-- Remove default textures
	button:SetNormalTexture("")
	button:SetHighlightTexture("")
	button:SetPushedTexture("")
	button:SetDisabledTexture("")
	
	-- Add hover effects
	local originalColor = SoundboardUI.colors.backdrop
	
	button:HookScript("OnEnter", function()
		if button.backdrop then
			button.backdrop:SetBackdropColor(unpack(SoundboardUI.colors.highlight))
		end
	end)
	
	button:HookScript("OnLeave", function()
		if button.backdrop then
			button.backdrop:SetBackdropColor(unpack(originalColor))
		end
	end)
	
	button.sbStyled = true
end

-- Add functions to SoundboardUI for easy access
SoundboardUI.SetTemplate = SetTemplate
SoundboardUI.CreateBackdrop = CreateBackdrop  
SoundboardUI.HandleScrollBar = HandleScrollBar
SoundboardUI.StyleButton = StyleButton
SoundboardUI.Scale = Scale

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

-- Sound Queue System
local SoundQueue = {
	queue = {},                    -- Queue of pending sounds
	currentSound = nil,            -- Currently playing sound info
	isPlaying = false,            -- Is a sound currently playing
	processingTimer = nil,        -- Timer for processing queue
	defaultDuration = 3.0,        -- Default sound duration (seconds)
}

-- Sound duration estimates (in seconds) for better queue timing
local SoundDurations = {
	-- Add common sound durations here
	-- ["soundfile.mp3"] = duration_in_seconds
	["hero.mp3"] = 4.5,
	["leeroy.mp3"] = 4.2,
	["ff-fightsong-start.mp3"] = 3.8,
	-- Add more as needed
}

-- Sound Queue Functions
local function GetSoundDuration(soundFile)
	if not soundFile then
		return SoundQueue.defaultDuration
	end
	
	-- Extract filename from full path
	local filename = soundFile:match("([^\\]+)$") or soundFile
	return SoundDurations[filename] or SoundQueue.defaultDuration
end

local function IsSameSoundPlaying(soundFile)
	if not SoundQueue.isPlaying or not SoundQueue.currentSound then
		return false
	end
	return SoundQueue.currentSound.file == soundFile
end

local function AddSoundToQueue(soundFile, volume, key)
	-- Check if same sound is already playing - ignore if so
	if IsSameSoundPlaying(soundFile) then
		DebugPrint("Ignoring duplicate sound request: " .. tostring(soundFile))
		return false
	end
	
	-- Add to queue
	table.insert(SoundQueue.queue, {
		file = soundFile,
		volume = volume or 1.0,
		key = key,
		timestamp = time()
	})
	
	DebugPrint("Added sound to queue: " .. tostring(soundFile) .. " (Queue size: " .. #SoundQueue.queue .. ")")
	return true
end

local function PlayNextInQueue()
	if #SoundQueue.queue == 0 then
		SoundQueue.isPlaying = false
		SoundQueue.currentSound = nil
		DebugPrint("Sound queue is empty")
		return
	end
	
	-- Get next sound from queue
	local nextSound = table.remove(SoundQueue.queue, 1)
	SoundQueue.currentSound = nextSound
	SoundQueue.isPlaying = true
	
	DebugPrint("Playing next sound from queue: " .. tostring(nextSound.file))
	
	-- Play the sound using our volume-controlled method
	local success = Soundboard:PlaySoundDirect(nextSound.file, nextSound.volume)
	
	if success then
		-- Set timer for when sound finishes
		local duration = GetSoundDuration(nextSound.file)
		DebugPrint("Sound duration estimated at " .. tostring(duration) .. " seconds")
		
		if SoundQueue.processingTimer then
			SoundQueue.processingTimer:Cancel()
		end
		
		SoundQueue.processingTimer = C_Timer.NewTimer(duration, function()
			DebugPrint("Sound finished, processing next in queue")
			PlayNextInQueue()
		end)
	else
		DebugPrint("Failed to play sound: " .. tostring(nextSound.file))
		-- Try next sound immediately if this one failed
		SoundQueue.isPlaying = false
		SoundQueue.currentSound = nil
		PlayNextInQueue()
	end
end

local function QueueSound(soundFile, volume, key)
	if not soundFile then
		DebugPrint("No sound file provided")
		return false
	end
	
	-- If nothing is playing, play immediately
	if not SoundQueue.isPlaying then
		SoundQueue.queue = {{
			file = soundFile,
			volume = volume or 1.0,
			key = key,
			timestamp = time()
		}}
		PlayNextInQueue()
		return true
	end
	
	-- Otherwise add to queue
	return AddSoundToQueue(soundFile, volume, key)
end

local LE_PARTY_CATEGORY_HOME = LE_PARTY_CATEGORY_HOME
local LE_PARTY_CATEGORY_INSTANCE = LE_PARTY_CATEGORY_INSTANCE

-- Detect whether party category constants and categorized IsInGroup/IsInRaid are available
local HAS_PARTY_CATEGORIES = type(LE_PARTY_CATEGORY_HOME) == "number" and type(LE_PARTY_CATEGORY_INSTANCE) == "number"

-- Simple dropdown replacement (LibUIDropDownMenu is broken in modern clients)
local SoundboardDropdown = {}

function SoundboardDropdown:Initialize()
	DebugPrint("Initializing dropdown system with ElvUI styling...")
	
	-- Initialize class colors and template for ElvUI styling  
	InitializeClassColor()
	
	-- Get selected template and update colors
	local selectedTemplate = (Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.UITemplate) or "Default"
	UpdateTemplateColors(selectedTemplate)
	
	-- Main frame
	self.frame = CreateFrame("Frame", "SoundboardDropdownFrame", UIParent)
	self.frame:SetFrameStrata("DIALOG")
	self.frame:SetFrameLevel(100)
	self.frame:SetClampedToScreen(true)
	self.frame:Hide()
	self.frame:SetScript("OnHide", function() 
		self.isOpen = false 
	end)
	
	-- Apply ElvUI-style backdrop using selected template from settings
	local selectedTemplate = (Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.UITemplate) or "Default"
	SoundboardUI.SetTemplate(self.frame, selectedTemplate)
	DebugPrint("ElvUI-style backdrop applied to main frame with template: " .. selectedTemplate)
	
	-- Create scroll frame with proper template - ensure scrollbar stays within bounds
	local scrollFrame = CreateFrame("ScrollFrame", nil, self.frame, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", SoundboardUI.Scale(4), -SoundboardUI.Scale(4))
	scrollFrame:SetPoint("BOTTOMRIGHT", -SoundboardUI.Scale(10), SoundboardUI.Scale(4)) -- Scrollbar stays in original position
	self.scrollFrame = scrollFrame
	DebugPrint("Scroll frame created with scrollbar in original position")
	
	-- Set up mouse wheel scrolling (will be enabled/disabled by UpdateScrollbar as needed)
	self.frame:EnableMouseWheel(false) -- Start disabled, UpdateScrollbar will enable if needed
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
	
	-- Create content frame
	local content = CreateFrame("Frame", nil, scrollFrame)
	content:SetSize(1, 1)
	scrollFrame:SetScrollChild(content)
	self.content = content
	DebugPrint("Content frame created and set as scroll child")
	
	-- Apply ElvUI-style scrollbar styling with selected template
	local scrollBar = scrollFrame.ScrollBar or scrollFrame.scrollBar
	if scrollBar then
		DebugPrint("Applying ElvUI-style scrollbar...")
		local selectedTemplate = (Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.UITemplate) or "Default"
		SoundboardUI.HandleScrollBar(scrollBar, selectedTemplate)
		self.scrollbar = scrollBar
		DebugPrint("ElvUI scrollbar styling applied successfully with template: " .. selectedTemplate)
	else
		DebugPrint("WARNING: Could not find scrollbar to style")
	end
	
	self.buttons = {}
	self.categories = {}
	self.isOpen = false
	self.currentView = "main" -- "main", "category", "sounds"
	self.selectedCategory = nil
	
	DebugPrint("Dropdown initialization completed with ElvUI styling")
end

function SoundboardDropdown:Toggle(anchor)
	DebugPrint("=== TOGGLE CALLED ===")
	DebugPrint("Toggle called - isOpen: " .. tostring(self.isOpen))
	DebugPrint("Anchor passed to Toggle: " .. tostring(anchor and anchor:GetName() or "nil"))
	
	-- Force reset isOpen state if frame doesn't exist or isn't shown
	if not self.frame or not self.frame:IsShown() then
		DebugPrint("Frame doesn't exist or isn't shown - resetting isOpen to false")
		self.isOpen = false
	end
	
	if self.isOpen then
		DebugPrint("Dropdown is open, hiding it")
		if self.frame then
			self.frame:Hide()
		end
		self.isOpen = false
		return
	end
	
	DebugPrint("Dropdown is closed, calling Show()")
	self:Show(anchor)
	DebugPrint("=== TOGGLE END ===")
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
	-- Organize sounds by category and subcategory
	for key, data in pairs(soundboard_data) do
		local category = data.category or "Uncategorized"
		local subcategory = data.subcategory
		
		if not self.categories[category] then
			self.categories[category] = {
				sounds = {},  -- Direct sounds in this category
				subcategories = {}  -- Subcategories within this category
			}
			DebugPrint("Created new category: " .. category)
		end
		
		if subcategory then
			-- This sound belongs to a subcategory
			if not self.categories[category].subcategories[subcategory] then
				self.categories[category].subcategories[subcategory] = {}
				DebugPrint("Created new subcategory: " .. category .. " -> " .. subcategory)
			end
			tinsert(self.categories[category].subcategories[subcategory], {key = key, data = data})
		else
			-- This sound belongs directly to the main category
			tinsert(self.categories[category].sounds, {key = key, data = data})
		end
		
		totalSounds = totalSounds + 1
	end
	
	DebugPrint("Total sounds processed: " .. totalSounds)
	DebugPrint("Total categories found: " .. self:CountCategories())
	
	-- Sort sounds in each category and subcategory
	for categoryName, categoryData in pairs(self.categories) do
		-- Sort direct sounds in category
		tsort(categoryData.sounds, function(a, b) return a.key < b.key end)
		
		-- Sort sounds in each subcategory
		for subcategoryName, sounds in pairs(categoryData.subcategories) do
			tsort(sounds, function(a, b) return a.key < b.key end)
			DebugPrint("Subcategory '" .. categoryName .. " -> " .. subcategoryName .. "' has " .. #sounds .. " sounds")
		end
		
		local totalInCategory = #categoryData.sounds
		for _, sounds in pairs(categoryData.subcategories) do
			totalInCategory = totalInCategory + #sounds
		end
		DebugPrint("Category '" .. categoryName .. "' has " .. totalInCategory .. " total sounds")
	end
	
	self.categoriesBuilt = true
	DebugPrint("Categories built successfully")
end

-- Helper function to update all button widths to fit within content area (not clipped by scrollbar)
function SoundboardDropdown:UpdateButtonWidths()
	if not self.content then return end
	
	-- Calculate available width for content to avoid border clipping
	-- Frame is 300px wide, scroll frame right edge at 290px (300-10), scrollbar ~20px wide
	-- Need additional space for border rendering on the right side
	-- Button positioning: 4px left offset within content, need ~10px right margin for full borders
	-- Effective button width: 250px (prevents border clipping and ensures full box styling)
	local buttonWidth = 250 -- Fixed width that allows full border rendering
	
	-- Update all buttons in the content frame
	local buttons = {self.content:GetChildren()}
	for _, button in ipairs(buttons) do
		if button:GetObjectType() == "Button" then
			local _, currentHeight = button:GetSize()
			button:SetSize(buttonWidth, currentHeight)
		end
	end
	
	DebugPrint("Updated " .. #buttons .. " buttons to width " .. buttonWidth .. " (fixed width to allow full border rendering)")
end

function SoundboardDropdown:CountCategories()
	local count = 0
	if self.categories then
		for _ in pairs(self.categories) do
			count = count + 1
		end
	end
	return count
end

function SoundboardDropdown:ShowMainMenu()
	DebugPrint("ShowMainMenu called")
	DebugPrint("STACK TRACE - ShowMainMenu called from:")
	DebugPrint("Frame is open: " .. tostring(self.isOpen))
	DebugPrint("Frame exists: " .. tostring(self.frame ~= nil))
	if self.frame then
		DebugPrint("Frame is shown: " .. tostring(self.frame:IsShown()))
	end
	
	-- CRITICAL FIX: If ShowMainMenu is called but frame isn't visible, make it visible
	if self.frame and not self.frame:IsShown() and not self.isOpen then
		DebugPrint("CRITICAL: ShowMainMenu called but frame not visible - forcing show")
		self.frame:SetSize(300, 400)
		-- Try to position near minimap button if available
		local minimapButton = Soundboard and Soundboard.minimapButton
		if minimapButton then
			DebugPrint("Positioning near minimap button")
			self:Position(minimapButton)
		else
			DebugPrint("No minimap button found, positioning at cursor")
			self:Position(nil)
		end
		self.frame:Show()
		self.isOpen = true
		DebugPrint("Frame forced to show")
	end
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
	local guildEnabled = (addonDB and addonDB.GuildBroadcast) or false
	DebugPrint("DB values retrieved")
	
	-- Title
	DebugPrint("Creating title button...")
	local title = self:CreateButton("Soundboard Menu", yOffset, true)
	title:SetScript("OnClick", nil)
	yOffset = yOffset - buttonHeight
	DebugPrint("Title button created")
	
	-- Settings Toggle Header
	local settingsHeader = self:CreateButton("Settings Toggle", yOffset, false, true) -- Secondary header: not title, but is secondary header
	settingsHeader:SetScript("OnClick", nil)
	yOffset = yOffset - buttonHeight
	
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
	yOffset = yOffset - buttonHeight
	
	-- Guild broadcast option
	local guildBtn = self:CreateButton(
		guildEnabled and "Guild: |cFF00FF00ON|r" or "Guild: |cFFFF0000OFF|r",
		yOffset
	)
	guildBtn:SetScript("OnClick", function()
		local currentDB = Soundboard.db and Soundboard.db.profile
		DebugPrint("Guild button clicked, currentDB exists: " .. tostring(currentDB ~= nil))
		if currentDB then
			local oldValue = currentDB.GuildBroadcast
			currentDB.GuildBroadcast = not currentDB.GuildBroadcast
			DebugPrint("GuildBroadcast changed from " .. tostring(oldValue) .. " to " .. tostring(currentDB.GuildBroadcast))
			if currentDB.GuildBroadcast then
				Soundboard:Print("Guild broadcast |cFF00FF00enabled|r")
			else
				Soundboard:Print("Guild broadcast |cFFFF0000disabled|r")
			end
			self:ShowMainMenu()
		else
			DebugPrint("ERROR: Soundboard.db.profile is nil when clicking guild button!")
			Soundboard:Print("Error: Database not available")
		end
	end)
	yOffset = yOffset - buttonHeight
	
	-- Categories Header
	local categoriesHeader = self:CreateButton("Categories", yOffset, false, true) -- Secondary header: not title, but is secondary header
	categoriesHeader:SetScript("OnClick", nil)
	yOffset = yOffset - buttonHeight
	
	-- Categories with simple styling
	local categoryNames = {}
	for category, _ in pairs(self.categories) do
		tinsert(categoryNames, category)
	end
	
	-- Custom sort to put miscellaneous categories at the end
		local function isMiscCategory(categoryName)
		local lowerName = strlower(categoryName)
		return lowerName == "misc" or lowerName == "miscellaneous" or
		       lowerName == "etc" or lowerName == "other" or
		       lowerName == "uncategorized"
	end
	
	local function isMissingCategory(categoryName)
		return categoryName == "Missing Configuration"
	end
	
	tsort(categoryNames, function(a, b)
		local aIsMisc = isMiscCategory(a)
		local bIsMisc = isMiscCategory(b)
		local aIsMissing = isMissingCategory(a)
		local bIsMissing = isMissingCategory(b)
		
		-- Missing Configuration always goes last
		if aIsMissing ~= bIsMissing then
			return not aIsMissing
		end
		
		-- If both are misc or both are not misc, sort alphabetically  
		if aIsMisc == bIsMisc then
			return a < b
		end
		
		-- Otherwise, non-misc categories come first
		return not aIsMisc
	end)
	
	for _, category in ipairs(categoryNames) do
		-- Skip Missing Configuration category if debug mode is off
		if not (category == "Missing Configuration" and not Soundboard.db.profile.DebugMode) then
			local categoryData = self.categories[category]
			local count = #categoryData.sounds
			-- Add sounds from subcategories
			for _, sounds in pairs(categoryData.subcategories) do
				count = count + #sounds
			end
			
			-- Apply red text formatting for Missing Configuration category
			local displayText
			if category == "Missing Configuration" then
				displayText = "|cFFFF0000" .. category .. " |cFF888888(" .. count .. ")|r"
			else
				displayText = category .. " |cFF888888(" .. count .. ")|r"
			end
			
			local catBtn = self:CreateButton(displayText, yOffset)
			catBtn:SetScript("OnClick", function()
				self:ShowCategory(category)
			end)
			yOffset = yOffset - buttonHeight
		end
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
	
	-- Special handling for Missing Configuration category when debug is off
	if categoryName == "Missing Configuration" and not Soundboard.db.profile.DebugMode then
		local errorBtn = self:CreateButton("Debug mode required", yOffset)
		errorBtn:SetScript("OnClick", nil)
		self.content:SetHeight(math.abs(yOffset) + 10)
		self:UpdateScrollbar()
		return
	end
	
	-- Category title with red formatting for Missing Configuration
	local titleText = categoryName
	if categoryName == "Missing Configuration" then
		titleText = "|cFFFF0000" .. categoryName .. "|r"
	end
	local title = self:CreateButton(titleText, yOffset, true)
	title:SetScript("OnClick", nil)
	yOffset = yOffset - buttonHeight - 5
	
	local categoryData = self.categories[categoryName]
	if not categoryData then
		-- Handle error case
		local errorBtn = self:CreateButton("Category not found", yOffset)
		errorBtn:SetScript("OnClick", nil)
		self.content:SetHeight(math.abs(yOffset) + 10)
		self:UpdateScrollbar()
		return
	end
	
	-- Show subcategories first (if any)
	local subcategoryNames = {}
	for subcategory, _ in pairs(categoryData.subcategories) do
		tinsert(subcategoryNames, subcategory)
	end
	tsort(subcategoryNames)
	
	for _, subcategory in ipairs(subcategoryNames) do
		local subCategoryCount = #categoryData.subcategories[subcategory]
		local subcatBtn = self:CreateButton(
			"» " .. subcategory .. " |cFF888888(" .. subCategoryCount .. ")|r", 
			yOffset
		)
		subcatBtn:SetScript("OnClick", function()
			self:ShowSubcategory(categoryName, subcategory)
		end)
		yOffset = yOffset - buttonHeight
	end
	
	-- Show direct sounds in category (if any)
	if #categoryData.sounds > 0 then
		-- Add separator if there are subcategories
		if #subcategoryNames > 0 then
			local separator = self:CreateButton("--- Direct Sounds ---", yOffset)
			separator:SetScript("OnClick", nil)
			yOffset = yOffset - buttonHeight - 3
		end
		
		for _, sound in ipairs(categoryData.sounds) do
			local displayText = "/" .. sound.key
			-- Add description if available and not too long
			if sound.data.text and string.len(sound.data.text) < 30 then
				displayText = displayText .. " |cFF888888- " .. sound.data.text .. "|r"
			end
			
			-- Apply red text formatting for Missing Configuration category
			if categoryName == "Missing Configuration" then
				displayText = "|cFFFF0000" .. displayText .. "|r"
			end
			
			local soundBtn = self:CreateButton(displayText, yOffset)
			soundBtn:SetScript("OnClick", function()
				Soundboard:SayGagKey(sound.key)
				self.frame:Hide()
			end)
			yOffset = yOffset - buttonHeight
		end
	end
	
	-- Update content size and scrollbar
	self.content:SetHeight(math.abs(yOffset) + 10)
	self:UpdateScrollbar()
end

function SoundboardDropdown:ShowSubcategory(categoryName, subcategoryName)
	self:ClearContent()
	
	local yOffset = -5
	local buttonHeight = 20
	
	-- Back button
	local backBtn = self:CreateButton("< Back to " .. categoryName, yOffset)
	backBtn:SetScript("OnClick", function()
		self:ShowCategory(categoryName)
	end)
	yOffset = yOffset - buttonHeight - 5
	
	-- Subcategory title
	local title = self:CreateButton(categoryName .. " > " .. subcategoryName, yOffset, true)
	title:SetScript("OnClick", nil)
	yOffset = yOffset - buttonHeight - 5
	
	local categoryData = self.categories[categoryName]
	if not categoryData or not categoryData.subcategories[subcategoryName] then
		-- Handle error case
		local errorBtn = self:CreateButton("Subcategory not found", yOffset)
		errorBtn:SetScript("OnClick", nil)
		self.content:SetHeight(math.abs(yOffset) + 10)
		self:UpdateScrollbar()
		return
	end
	
	-- Show sounds in subcategory
	local sounds = categoryData.subcategories[subcategoryName]
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

function SoundboardDropdown:CreateButton(text, yOffset, isTitle, isSecondaryHeader)
	DebugPrint("CreateButton called: '" .. tostring(text) .. "' at yOffset " .. tostring(yOffset))
	
	if not self.content then
		DebugPrint("ERROR: self.content is nil!")
		return nil
	end
	
	local button = CreateFrame("Button", nil, self.content)
	DebugPrint("Button frame created")
	
	-- Fixed button width to allow full border rendering
	-- Matches UpdateButtonWidths calculation: 250px to ensure full box borders display
	local buttonWidth = 250
	button:SetSize(buttonWidth, 20)
	button:SetPoint("TOPLEFT", SoundboardUI.Scale(4), yOffset)
	DebugPrint("Button positioned with fixed width to prevent scrollbar clipping")
	
	-- Apply ElvUI-style button styling for non-titles using selected template
	if not isTitle and not isSecondaryHeader then
		local selectedTemplate = (Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.UITemplate) or "Default"
		SoundboardUI.StyleButton(button, selectedTemplate)
		DebugPrint("ElvUI button styling applied with template: " .. selectedTemplate)
	end
	
	-- Text with ElvUI-style fonts
	DebugPrint("Creating font string...")
	local fontString = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	fontString:SetPoint("LEFT", SoundboardUI.Scale(4), 0)
	fontString:SetPoint("RIGHT", -SoundboardUI.Scale(4), 0)
	fontString:SetJustifyH("LEFT")
	fontString:SetText(text)
	
	-- Template-specific font styling  
	if isTitle then
		fontString:SetJustifyH("CENTER")
		fontString:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")  -- Main title: 14pt, centered
		-- Use template text color for titles too
		fontString:SetTextColor(unpack(SoundboardUI.colors.text))
		fontString:SetPoint("LEFT", 0, 0)
		fontString:SetPoint("RIGHT", 0, 0)
		DebugPrint("Title styling applied with template colors")
	elseif isSecondaryHeader then
		fontString:SetJustifyH("LEFT")  -- Secondary headers: left-aligned
		fontString:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")  -- Secondary header: 12pt, left-aligned
		-- Use template text color for secondary headers
		fontString:SetTextColor(unpack(SoundboardUI.colors.text))
		DebugPrint("Secondary header styling applied - left-aligned and smaller")
	else
		-- Use template-specific text colors
		fontString:SetTextColor(unpack(SoundboardUI.colors.text))
		
		-- Template-specific hover effects
		local originalEnter = button:GetScript("OnEnter")
		local originalLeave = button:GetScript("OnLeave")
		
		button:SetScript("OnEnter", function(btn)
			if originalEnter then originalEnter(btn) end
			fontString:SetTextColor(unpack(SoundboardUI.colors.textHover))
		end)
		
		button:SetScript("OnLeave", function(btn)
			if originalLeave then originalLeave(btn) end
			fontString:SetTextColor(unpack(SoundboardUI.colors.text))
		end)
		
		DebugPrint("Regular button styling applied with template-specific colors")
	end
	
	button.text = fontString -- Store reference for easy access
	DebugPrint("Button creation completed successfully with ElvUI styling")
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
		-- Smart scrollbar - only show if content significantly exceeds frame height
		local needsScrolling = contentHeight > (frameHeight + 20) -- More generous padding
		
		if needsScrolling then
			DebugPrint("Content exceeds frame, showing scrollbar")
			self.scrollbar:Show()
			self.scrollbar:SetMinMaxValues(0, math.max(0, contentHeight - frameHeight))
			self.scrollbar:SetValue(0) -- Reset to top
			-- Keep scrollbar properly within bounds
			self.scrollFrame:SetPoint("BOTTOMRIGHT", -SoundboardUI.Scale(10), SoundboardUI.Scale(4))
			-- Enable mouse wheel scrolling
			self.frame:EnableMouseWheel(true)
		else
			DebugPrint("Content fits in frame, hiding scrollbar and expanding content area")
			self.scrollbar:Hide()
			self.scrollFrame:SetVerticalScroll(0)
			-- Expand scroll frame to full width when no scrollbar needed
			self.scrollFrame:SetPoint("BOTTOMRIGHT", -SoundboardUI.Scale(4), SoundboardUI.Scale(4))
			-- Disable mouse wheel scrolling when not needed
			self.frame:EnableMouseWheel(false)
		end
		
		-- Update button widths to match scrollbar visibility
		self:UpdateButtonWidths()
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
		DebugPrint("SoundboardLDB OnClick called with button: " .. tostring(button))
		DebugPrint("this (anchor) exists: " .. tostring(this ~= nil))
		DebugPrint("About to call SoundboardDropdown:Toggle(this)")
		SoundboardDropdown:Toggle(this);
		DebugPrint("Toggle call completed")
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
					get = function() return Soundboard.db.profile.IsEnabled end,
					set = function(info, value) 
						Soundboard.db.profile.IsEnabled = value
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
					get = function() return Soundboard.db.profile.ShowMinimapButton end,
					set = function(info, value) 
						Soundboard.db.profile.ShowMinimapButton = value
						-- Control the direct minimap button, not LibDBIcon
						if Soundboard.minimapButton then
							if value then
								Soundboard.minimapButton:Show()
								Soundboard:Print("Minimap button shown")
							else
								Soundboard.minimapButton:Hide()
								Soundboard:Print("Minimap button hidden")
							end
						else
							Soundboard:Print("Minimap button not available")
						end
					end,
					disabled = function() return not Soundboard.db.profile.IsEnabled end,
				},
				uiTemplate = {
					order = 3,
					type = 'select',
					name = 'UI Template',
					desc = 'Choose the visual style for the dropdown interface',
					get = function() return Soundboard.db.profile.UITemplate end,
					set = function(info, value) 
						Soundboard.db.profile.UITemplate = value
						Soundboard:Print("UI Template changed to: " .. value)
						
						-- Refresh dropdown completely if it exists
						if SoundboardDropdown and SoundboardDropdown.frame then
							DebugPrint("Template changed - reinitializing dropdown UI")
							
							-- Close dropdown if open
							if SoundboardDropdown.isOpen then
								SoundboardDropdown.frame:Hide()
								SoundboardDropdown.isOpen = false
							end
							
							-- Clear all styling
							if SoundboardDropdown.frame.backdrop then
								SoundboardDropdown.frame.backdrop:Hide()
								SoundboardDropdown.frame.backdrop = nil
							end
							
							-- Clear scrollbar styling
							if SoundboardDropdown.scrollbar and SoundboardDropdown.scrollbar.backdrop then
								SoundboardDropdown.scrollbar.backdrop:Hide()
								SoundboardDropdown.scrollbar.backdrop = nil
								SoundboardDropdown.scrollbar.sbStyled = nil
							end
							
							-- Re-initialize class colors and apply new template
							InitializeClassColor()
							UpdateTemplateColors(value)
							
							-- Re-apply template to main frame
							SoundboardUI.SetTemplate(SoundboardDropdown.frame, value)
							
							-- Re-style scrollbar if it exists
							if SoundboardDropdown.scrollbar then
								SoundboardUI.HandleScrollBar(SoundboardDropdown.scrollbar, value)
							end
							
							DebugPrint("Dropdown UI reinitialized with template: " .. value)
						end
					end,
					values = {
						["Default"] = "Default - Solid black background with gold text",
						["Transparent"] = "Transparent - 70% opacity background with white text",
						["ClassColor"] = "Class Color - 80% opacity with your class colors"
					},
					disabled = function() return not Soundboard.db.profile.IsEnabled end,
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
					get = function() return Soundboard.db.profile.SoundEnabled end,
					set = function(info, value) Soundboard.db.profile.SoundEnabled = value end,
					disabled = function() return not Soundboard.db.profile.IsEnabled end,
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
					get = function() return Soundboard.db.profile.MasterVolume end,
					set = function(info, value) Soundboard.db.profile.MasterVolume = value end,
					disabled = function() return not Soundboard.db.profile.IsEnabled or not Soundboard.db.profile.SoundEnabled end,
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
					get = function() return Soundboard.db.profile.EmoteEnabled end,
					set = function(info, value) Soundboard.db.profile.EmoteEnabled = value end,
					disabled = function() return not Soundboard.db.profile.IsEnabled end,
				},


				guildBroadcast = {
					order = 2,
					type = 'toggle',
					name = 'Guild Broadcasting',
					desc = 'Share sounds with guild members who have Soundboard installed',
					get = function() return Soundboard.db.profile.GuildBroadcast end,
					set = function(info, value) Soundboard.db.profile.GuildBroadcast = value end,
					disabled = function() return not Soundboard.db.profile.IsEnabled end,
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
					get = function() return Soundboard.db.profile.GroupEnabled end,
					set = function(info, value) 
						Soundboard.db.profile.GroupEnabled = value
						Soundboard:ToggleGroup()
					end,
					disabled = function() return not Soundboard.db.profile.IsEnabled end,
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
					disabled = function() return not Soundboard.db.profile.IsEnabled end,
				},
				ping = {
					order = 2,
					type = 'execute',
					name = 'Ping All',
					desc = 'Check which players can receive your sound broadcasts (group and guild)',
					func = function() Soundboard:Ping() end,
					disabled = function() return not Soundboard.db.profile.IsEnabled or not Soundboard.db.profile.GroupEnabled end,
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
								Soundboard:Print("Testing sound at " .. tostring(Soundboard.db.profile.MasterVolume * 100) .. "% volume...")
								Soundboard:PlaySoundWithVolume(heroSound.file, Soundboard.db.profile.MasterVolume, "hero")
							else
								Soundboard:Print("Hero sound file not found")
							end
						else
							Soundboard:Print("Test sound not available")
						end
					end,
					disabled = function() return not Soundboard.db.profile.IsEnabled or not Soundboard.db.profile.SoundEnabled end,
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
					desc = 'Enable debug output and show "Missing Configuration" category for unconfigured sound files',
					get = function() return Soundboard.db.profile.DebugMode end,
					set = function(info, value) 
						Soundboard.db.profile.DebugMode = value
						Soundboard:Print("Debug mode " .. (value and "enabled" or "disabled"))
						-- Handle debug mode changes safely
						if value then
							-- Scan for orphaned files now that debug is enabled
							if soundboard_data and type(soundboard_data) == "table" then
								Soundboard:ScanForOrphanedFiles()
								Soundboard:Print("Debug mode enabled - Missing Configuration category available")
							end
						else
							-- Clean up missing configuration entries when debug is disabled
							Soundboard:CleanupMissingEntries()
							-- Refresh dropdown if it's currently open
							if SoundboardDropdown and SoundboardDropdown.isOpen then
								SoundboardDropdown:ShowMainMenu()
							end
							Soundboard:Print("Debug mode disabled - Missing Configuration category hidden")
						end
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
			LDBIconStorage = {}, -- LibDBIcon storage
			-- Audio Settings
			MasterVolume = 1.0,        -- Master volume (0.0 to 1.0)
			SoundEnabled = true,       -- Enable/disable all sound playback
			-- UI Settings
			ShowMinimapButton = true,  -- Show/hide minimap button
			UITemplate = "Default",    -- UI template: "Default", "Transparent", "ClassColor"
			-- Broadcasting Settings
			GuildBroadcast = true,     -- true/false
			-- Advanced Settings
			DebugMode = false,         -- Enable debug output
		}
	 }
	self.db = LibStub("AceDB-3.0"):New("SoundboardDB", defaults, true)
	db = self.db.profile
	DebugPrint("Database initialized successfully, db exists: " .. tostring(db ~= nil))
	DebugPrint("self.db exists: " .. tostring(self.db ~= nil))
	DebugPrint("self.db.profile exists: " .. tostring(self.db.profile ~= nil))
	
	-- Handle database migration for new broadcasting settings
	if db.GuildBroadcast == nil then
		db.GuildBroadcast = true
		DebugPrint("Migrated GuildBroadcast to default: true")
	end
	-- Remove old settings if they exist
	if db.SayEnabled ~= nil then
		db.SayEnabled = nil
		DebugPrint("Removed legacy SayEnabled setting")
	end
	if db.NearbyBroadcast ~= nil then
		db.NearbyBroadcast = nil
		DebugPrint("Removed NearbyBroadcast setting")
	end

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
		DebugPrint("=== MINIMAP BUTTON CLICKED ===")
		DebugPrint("Direct button clicked! Button: " .. tostring(button))
		DebugPrint("MINIMAP BUTTON CLICKED - CHECK WORKS!")
		if SoundboardLDB and SoundboardLDB.OnClick then
			DebugPrint("Calling SoundboardLDB.OnClick")
			SoundboardLDB.OnClick(self, button)
		else
			DebugPrint("No OnClick handler found")
			Soundboard:Print("ERROR: No OnClick handler found")
		end
		DebugPrint("=== MINIMAP BUTTON CLICK END ===")
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
	if Soundboard.db.profile.ShowMinimapButton then
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
		local db = Soundboard.db.profile
		db.DebugMode = not db.DebugMode
		Soundboard:Print("Debug mode " .. (db.DebugMode and "|cFF00FF00ENABLED|r" or "|cFFFF0000DISABLED|r"))
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
		local db = Soundboard.db.profile
		db.DebugMode = not db.DebugMode
		Soundboard:Print("Debug mode " .. (db.DebugMode and "|cFF00FF00ENABLED|r" or "|cFFFF0000DISABLED|r"))
		if db.DebugMode then
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
					Soundboard:PlaySoundWithVolume(heroSound.file, volume, "hero")
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
					Soundboard:PlaySoundWithVolume(heroSound.file, currentVolume, "hero")
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
	
	-- Sound Queue Management Commands
	_G.SlashCmdList["SOUNDBOARDQUEUE"] = function(msg)
		Soundboard:GetQueueStatus()
	end
	_G["SLASH_SOUNDBOARDQUEUE1"] = "/soundboardqueue"
	
	_G.SlashCmdList["SOUNDBOARDCLEARQUEUE"] = function(msg)
		Soundboard:ClearSoundQueue()
	end
	_G["SLASH_SOUNDBOARDCLEARQUEUE1"] = "/soundboardclearqueue"
	
	
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


function Soundboard:GROUP_ROSTER_UPDATE()
	if UnitIsGroupLeader("player") then
		if(db.GroupEnabled) then
			self:SendCommMessage("Soundboard", "GroupEnable", IsInRaid() and "RAID" or "PARTY")
		else
			self:SendCommMessage("Soundboard", "GroupDisable", IsInRaid() and "RAID" or "PARTY")
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
	
	-- Scan for orphaned sound files (only in debug mode)
	if db.DebugMode then
		self:ScanForOrphanedFiles()
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

function Soundboard:ScanForOrphanedFiles()
	DebugPrint("Scanning for orphaned sound files... (Debug mode enabled)")
	
	-- Only proceed if debug mode is enabled
	if not db.DebugMode then
		DebugPrint("Debug mode disabled, skipping orphaned file scan")
		return
	end
	
	-- Get list of all .mp3 files referenced in soundboard_data
	local referencedFiles = {}
	if soundboard_data then
		for key, data in pairs(soundboard_data) do
			if data.file then
				-- Extract just the filename from the full path
				local filename = string.match(data.file, "([^\\]+)$")
				if filename then
					referencedFiles[string.lower(filename)] = true
				end
			end
		end
	end
	
	DebugPrint("Found " .. self:CountTable(referencedFiles) .. " referenced sound files")
	
	-- Complete list of all .mp3 files in the Sounds directory
	local knownFiles = {
		"6871.mp3", "afterlife.mp3", "ahhhh.mp3", "alrighthen.mp3", "anoffer.mp3", "apology2.mp3", "applause.mp3",
		"AreYouNotEntertained.mp3", "army.mp3", "arnie.mp3", "ateam.mp3", "badgerbadgerbadger.mp3", "badtouch.mp3",
		"badtouch2.mp3", "badtouch3.mp3", "badtouch4.mp3", "bailamos.mp3", "banana1.mp3", "banana2.mp3",
		"barrelroll.mp3", "bbd.mp3", "bde.mp3", "beautiful.mp3", "beback.mp3", "belikeyou.mp3", "belly.mp3",
		"bennyhill.mp3", "bf.mp3", "bf2.mp3", "bigboned.mp3", "bigbutts.mp3", "billiejean.mp3", "billnye.mp3",
		"bing.mp3", "bkb.mp3", "blade.mp3", "BladeRemix.mp3", "bleep.mp3", "blue.mp3", "boat.mp3", "bologna.mp3",
		"bomb.mp3", "bond.mp3", "Boogie.mp3", "Boomdiada.mp3", "BOOMHS.mp3", "bornscumbag.mp3", "brain.mp3",
		"brightside.mp3", "buddy.mp3", "business.mp3", "butthead.mp3", "byakuya.mp3", "byebye.mp3", "cake.mp3",
		"candy.mp3", "canonrock.mp3", "canonrock2.mp3", "canonrock3.mp3", "caramell2.mp3", "caramelldansen.mp3",
		"carryon.mp3", "caught.mp3", "cbsmail.mp3", "cgs.mp3", "champions.mp3", "change.mp3", "CHARGE.mp3",
		"chealers.mp3", "cheat.mp3", "cheeseburger.mp3", "chefsong.mp3", "chewy.mp3", "chickendance.mp3",
		"Chocolate_Rain.mp3", "chumbawamba.mp3", "cloudsong.mp3", "comeondown.mp3", "comply.mp3", "cop.mp3",
		"cotc.mp3", "crawl.mp3", "crazy.mp3", "ctm.mp3", "ctt.mp3", "cuppycake.mp3", "damned.mp3", "damnyou.mp3",
		"darkpower.mp3", "darkside.mp3", "db.mp3", "despicable.mp3", "desu.mp3", "devoted.mp3", "diabetus.mp3",
		"dirt.mp3", "dkp.mp3", "dogs.mp3", "donotgo.mp3", "donthug.mp3", "dontmake.mp3", "dontstop.mp3",
		"dontstop2.mp3", "donttazemebro.mp3", "dota.mp3", "druid.mp3", "druidtank.mp3", "EBN.mp3", "eewww.mp3",
		"eheheeh.mp3", "ellinia.mp3", "entrytovagin.mp3", "escape.mp3", "escape2.mp3", "evillaugh.mp3",
		"eyeofthetiger.mp3", "facedeath.mp3", "failed.mp3", "failuretocomm.mp3", "famguy.mp3", "familyguyhummer.mp3",
		"fart.mp3", "feelgood.mp3", "feellucky.mp3", "ff-fightsong-start.mp3", "fgfart.mp3", "finesthour.mp3",
		"fish.mp3", "flame.mp3", "flamewreathshort.mp3", "flipper.mp3", "footloose.mp3", "friendship.mp3",
		"fries.mp3", "gameover.mp3", "gas.mp3", "gdleeroy.mp3", "getdown.mp3", "getdown2.mp3", "gg.mp3",
		"ghost love score.mp3", "gifted.mp3", "ginjoint.mp3", "givethemnothing.mp3", "godlike.mp3", "gomer.mp3",
		"goofed.mp3", "gotohell.mp3", "gp.mp3", "GTFO.mp3", "gum.mp3", "h3f.mp3", "haha.mp3", "halloween.mp3",
		"hamster.mp3", "handletruth.mp3", "hard3.mp3", "HardlikeHeroic.mp3", "HardlikeHeroic2.mp3",
		"HardlikeHeroic4.mp3", "hardware.mp3", "hassan.mp3", "hasta.mp3", "hastababy.mp3", "hatedit.mp3",
		"hax.mp3", "headshot.mp3", "heart.mp3", "heman.mp3", "hereitgoesagain.mp3", "hero.mp3", "hibaby.mp3",
		"hideandseek.mp3", "hitit.mp3", "HollaBack.mp3", "HollaBackBananas.mp3", "hookedonafeeling.mp3",
		"horoscope.mp3", "hotncold.mp3", "hotpussy.mp3", "houstonproblem.mp3", "httk.mp3", "hulk-sad piano.mp3",
		"humiliation.mp3", "hunter.mp3", "hustle.mp3", "hv.mp3", "iamlady.mp3", "Icandothisallday.mp3",
		"ikeeelu.mp3", "ikeelu.mp3", "illmakeamanoutofyou.mp3", "imperial_march.mp3", "info.mp3", "innocent.mp3",
		"intheend.mp3", "IOUS.mp3", "itn.mp3", "itsmylife.mp3", "itsybitsy.mp3", "iwantcandy.mp3", "jarofdirt.mp3",
		"jasb1.mp3", "jb.mp3", "jeopardy.mp3", "jeopardy1.mp3", "jeopardy2.mp3", "jeopardy3.mp3", "jeopardy4.mp3",
		"jumponit.mp3", "justdance.mp3", "kame.mp3", "katamari.mp3", "ketchup.mp3", "killbill.mp3", "killingspree.mp3",
		"kittycat.mp3", "koolaid.mp3", "kurrosaki.mp3", "landdownunder.mp3", "lean.mp3", "lean2.mp3", "leek.mp3",
		"leeroy.mp3", "leeroychicken.mp3", "letsfightinglove.mp3", "life.mp3", "lind.mp3", "lionsleeps.mp3",
		"lis-wrng.mp3", "livetowin.mp3", "lizard-long.mp3", "lizard-single.mp3", "llap.mp3", "lls.mp3", "loca.mp3",
		"lolguild.mp3", "Lollipops.mp3", "lookin2.mp3", "loser5.mp3", "luvyaman.mp3", "macarena.mp3", "macho.mp3",
		"madness.mp3", "mage.mp3", "magic.mp3", "MakeLove.mp3", "makemyday.mp3", "mambo.mp3", "margarita.mp3",
		"mario.mp3", "matrix.mp3", "meeatcookie.mp3", "megatron.mp3", "melted.mp3", "milkshake.mp3", "mining.mp3",
		"mission.mp3", "missionimp.mp3", "mkedit.mp3", "ml.mp3", "mmmbop.mp3", "mo.mp3", "monster.mp3",
		"monsterkill.mp3", "moonlight.mp3", "moredots.mp3", "moredots2.mp3", "morningtrain.mp3", "mortal.mp3",
		"moskau.mp3", "mreh.mp3", "mt1.mp3", "mt2.mp3", "mt3.mp3", "mudabudabuda.mp3", "mudada.mp3", "murloc.mp3",
		"nannerpuss.mp3", "napoleon.mp3", "narnia.mp3", "nedm.mp3", "needajew.mp3", "ninja.mp3", "nintendo64.mp3",
		"nl.mp3", "nof.mp3", "noooo.mp3", "normalboyfriend.mp3", "numa2.mp3", "numalong2.mp3", "numanuma.mp3",
		"numanumalong.mp3", "numnuts.mp3", "o fortuna.mp3", "ocanada.mp3", "ohsnap.mp3", "ohyeah.mp3",
		"onemorequestion.mp3", "OneOnly.mp3", "ooga.mp3", "oompa.mp3", "over9000.mp3", "paladin.mp3", "party1.mp3",
		"party2.mp3", "party3.mp3", "pbj.mp3", "peewee.mp3", "peeweela.mp3", "peterlol.mp3", "peterlol2.mp3",
		"peterlol3.mp3", "petersoap.mp3", "pg.mp3", "pi.mp3", "picard.mp3", "picardlong.mp3", "pirate.mp3",
		"piratelong.mp3", "pirateshort.mp3", "PiSong.mp3", "pissing.mp3", "playwow.mp3", "pokemon.mp3",
		"pokemon2.mp3", "pokemondk.mp3", "ponpon.mp3", "ponponlong.mp3", "portal.mp3", "portal2.mp3",
		"powerofchrist.mp3", "ppanther.mp3", "prepare.mp3", "priest.mp3", "prime.mp3", "prince.mp3", "puckerup.mp3",
		"pussy.mp3", "pwlaugh.mp3", "pwrrngs.mp3", "quick.mp3", "rabies.mp3", "racist.mp3", "rainingmen.mp3",
		"rampage.mp3", "reattached.mp3", "redalert.mp3", "remember.mp3", "repressed.mp3", "rff.mp3",
		"ride spinnaz.mp3", "rit9.mp3", "rockandrollallnite.mp3", "rockboat.mp3", "rocky.mp3", "rockyou.mp3",
		"roflmao.mp3", "rogue.mp3", "rollout.mp3", "rosham.mp3", "rumble.mp3", "runaway.mp3", "saber1.mp3",
		"saber2.mp3", "safetydance.mp3", "safetydance2.mp3", "sailor.mp3", "salami.mp3", "sandman.mp3", "santa.mp3",
		"sayhello.mp3", "sexything.mp3", "shadowform.mp3", "shagpwr.mp3", "shaman.mp3", "shamanrogue.mp3",
		"shoes.mp3", "shrimpbarbie.mp3", "Shuffeling.mp3", "shun.mp3", "shutupfool.mp3", "sidious.mp3",
		"silence.mp3", "singapore.mp3", "smellslikeass.mp3", "smokin.mp3", "snickers.mp3", "spartans.mp3",
		"standbyme.mp3", "StarTrek.mp3", "StayAlive.mp3", "stewiechocolates.mp3", "stm.mp3", "stolemybike.mp3",
		"stopit.mp3", "surprisemothafucka.mp3", "survival.mp3", "tarzanandjane.mp3", "tarzanboy.mp3", "tequila.mp3",
		"tffm.mp3", "tffm2.mp3", "the mystery song.mp3", "thefinalcountdown.mp3", "thegoggles.mp3", "thepulse.mp3",
		"thinking.mp3", "ThisisMadness.mp3", "ThisisSparta.mp3", "thrall.mp3", "thrallsball.mp3", "thundercatsho.mp3",
		"tiggers.mp3", "to.mp3", "toki.mp3", "toml.mp3", "toosexy.mp3", "topgun.mp3", "touchmyself.mp3", "tralala.mp3",
		"trap.mp3", "tree.mp3", "troops.mp3", "trynot.mp3", "ttlo.mp3", "tuba.mp3", "tunaktunak.mp3", "tunatown.mp3",
		"twilight.mp3", "twinkle.mp3", "ualuealue.mp3", "uhohhotdog.mp3", "ultrakill.mp3", "undrpnts.mp3",
		"unstoppable.mp3", "vaderfather.mp3", "vegeta.mp3", "venga.mp3", "victory.mp3", "violent.mp3", "wacky.mp3",
		"waffles.mp3", "walkingonsunshine.mp3", "wantme.mp3", "warlock.mp3", "warrior.mp3", "watchu.mp3",
		"weakestlink.mp3", "whatislove.mp3", "whatwouldbrianboitanodo.mp3", "whelps.mp3", "whine.mp3", "whitewomen.mp3",
		"willsurvive.mp3", "willsurvive2.mp3", "willtell.mp3", "wish.mp3", "witchtit.mp3", "wonderful time.mp3",
		"world.mp3", "worldfavor.mp3", "wow_mr_t.mp3", "wow_shatner.mp3", "wow_van_damme.mp3", "wow_verne.mp3",
		"wow_willy_toledo.mp3", "wrong.mp3", "WRYYYYYYYYYYY.mp3", "Wurzel.mp3", "xfile.mp3", "xkill.mp3",
		"yatta.mp3", "yesmom.mp3", "YMCA2.mp3", "yngskwlk.mp3", "you lose.mp3", "youplay.mp3", "yourebeautiful.mp3",
		"yourethebest.mp3", "yourfather.mp3", "yousuck.mp3", "ytmnd.mp3", "zawarudo.mp3", "zombienation.mp3", "zzz.mp3"
	}
	
	-- Check for orphaned files
	local orphanedCount = 0
	local orphanedFiles = {}
	
	for _, filename in pairs(knownFiles) do
		local lowerFilename = string.lower(filename)
		if not referencedFiles[lowerFilename] then
			-- Found an orphaned file
			local soundKey = string.gsub(filename, "%.mp3$", "")
			soundKey = "missing_" .. soundKey  -- Prefix to avoid conflicts
			
			-- Add to soundboard_data
			soundboard_data[soundKey] = {
				["text"] = "* " .. soundKey .. " *",
				["msg"] = "plays an unconfigured sound.",
				["category"] = "Missing Configuration",
				["file"] = "Interface\\AddOns\\Soundboard\\Soundpacks\\Default\\Sounds\\" .. filename,
			}
			
			orphanedCount = orphanedCount + 1
			table.insert(orphanedFiles, filename)
			DebugPrint("Added orphaned file: " .. filename .. " as key: " .. soundKey)
		end
	end
	
	if orphanedCount > 0 then
		self:Print("Found " .. orphanedCount .. " unconfigured sound files - added to 'Missing Configuration' category")
		DebugPrint("Orphaned files: " .. table.concat(orphanedFiles, ", "))
	else
		DebugPrint("No orphaned sound files found")
	end
end

function Soundboard:CountTable(tbl)
	local count = 0
	for _ in pairs(tbl) do
		count = count + 1
	end
	return count
end

function Soundboard:CleanupMissingEntries()
	DebugPrint("Cleaning up Missing Configuration entries...")
	
	if not soundboard_data then return end
	
	local removedCount = 0
	local keysToRemove = {}
	
	-- Find all missing_ prefixed entries
	for key, data in pairs(soundboard_data) do
		if key and data and string.sub(key, 1, 8) == "missing_" and data.category == "Missing Configuration" then
			table.insert(keysToRemove, key)
		end
	end
	
	-- Remove the entries
	for _, key in ipairs(keysToRemove) do
		soundboard_data[key] = nil
		removedCount = removedCount + 1
		DebugPrint("Removed missing entry: " .. key)
	end
	
	if removedCount > 0 then
		DebugPrint("Cleaned up " .. removedCount .. " Missing Configuration entries")
	end
end

function Soundboard:PlaySoundWithVolume(soundFile, volume, key)
	-- Ensure volume is valid, fallback to 1.0 if nil or invalid
	if not volume or volume <= 0 then
		volume = 1.0
		DebugPrint("Volume was nil or invalid, using default: 1.0")
	end
	
	DebugPrint("PlaySoundWithVolume called with file: " .. tostring(soundFile) .. ", volume: " .. tostring(volume))
	
	-- Use the sound queue system instead of playing directly
	local success = QueueSound(soundFile, volume, key)
	
	if success then
		DebugPrint("Sound queued successfully at " .. tostring(volume * 100) .. "% volume")
	else
		DebugPrint("Sound was ignored (duplicate) or failed to queue: " .. tostring(soundFile))
	end
	
	return success
end

function Soundboard:PlaySoundDirect(soundFile, volume)
	-- Internal function for direct sound playing (used by queue system)
	-- Ensure volume is valid, fallback to 1.0 if nil or invalid
	if not volume or volume <= 0 then
		volume = 1.0
		DebugPrint("Volume was nil or invalid, using default: 1.0")
	end
	
	DebugPrint("PlaySoundDirect called with file: " .. tostring(soundFile) .. ", volume: " .. tostring(volume))
	
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
		DebugPrint("Sound played directly at " .. tostring(volume * 100) .. "% volume")
	else
		DebugPrint("Sound file not found: " .. tostring(soundFile))
	end
	
	return success
end

-- Sound Queue Management Functions
function Soundboard:GetQueueStatus()
	local queueSize = #SoundQueue.queue
	local isPlaying = SoundQueue.isPlaying
	local currentSoundFile = SoundQueue.currentSound and SoundQueue.currentSound.file or "None"
	
	self:Print("Sound Queue Status:")
	self:Print("  Currently playing: " .. (isPlaying and "Yes" or "No"))
	self:Print("  Current sound: " .. (currentSoundFile or "None"))
	self:Print("  Queued sounds: " .. queueSize)
	
	if queueSize > 0 then
		for i, sound in ipairs(SoundQueue.queue) do
			local filename = sound.file:match("([^\\]+)$") or sound.file
			self:Print("    " .. i .. ". " .. filename)
		end
	end
end

function Soundboard:ClearSoundQueue()
	-- Cancel any active timer
	if SoundQueue.processingTimer then
		SoundQueue.processingTimer:Cancel()
		SoundQueue.processingTimer = nil
	end
	
	-- Clear the queue
	local queueSize = #SoundQueue.queue
	SoundQueue.queue = {}
	SoundQueue.currentSound = nil
	SoundQueue.isPlaying = false
	
	self:Print("Sound queue cleared! Removed " .. queueSize .. " queued sounds.")
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
					
					-- Handle emote messages
					if (emote["msg"] ~= nil) and db.EmoteEnabled then 
						SendChatMessage(emote["msg"], "EMOTE"); 
						DebugPrint("Sent emote message: " .. emote["msg"])
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
						
						-- Apply volume control using sound queue system
						Soundboard:PlaySoundWithVolume(emote["file"], volume, key)
					elseif (emote["file"] ~= nil) and not db.SoundEnabled then
						DebugPrint("Sound playback disabled - skipping: " .. emote["file"])
					else
						DebugPrint("No sound file defined for: " .. key)
					end
					
				if arg2 then
					-- Handle broadcasting to other Soundboard users
					local guildEnabled = Soundboard.db.profile.GuildBroadcast
					if guildEnabled == nil then
						guildEnabled = true -- Default for existing users
						Soundboard.db.profile.GuildBroadcast = true
					end
					
					-- Send to group members (existing functionality)
					Soundboard:Send(key, "PARTY")
					DebugPrint("Sent to group: " .. key)
					
					-- Send to guild members if enabled
					if guildEnabled and IsInGuild() then
						Soundboard:Send(key, "GUILD")
						DebugPrint("Sent to guild: " .. key)
					end
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
			-- Reply to ping with channel information
			self:SendCommMessage("Soundboard", "PingReply:" .. (distri or "UNKNOWN"), distri, sender)

		elseif string.match(msg, "^PingReply:") then
			-- Handle ping response with channel info
			local channel = string.match(msg, "^PingReply:(.+)")
			self:HandlePingReply(sender, channel)

		else
			Soundboard:DoEmote(msg, false)
		end
	end
end

-- Communication functions
function Soundboard:Send(key, channel)
	channel = channel or "PARTY"
	
	if not key then 
		DebugPrint("Send: No key provided")
		return 
	end
	
	DebugPrint("Sending sound '" .. key .. "' via " .. channel .. " channel")
	
	-- Determine the appropriate distribution channel
	local distribution
	if channel == "GUILD" then
		distribution = "GUILD"
	elseif channel == "PARTY" then
		if IsInRaid() then
			distribution = "RAID"
		elseif IsInGroup() then
			distribution = "PARTY"
		else
			DebugPrint("Not in group/raid, cannot send to party channel")
			return
		end
	else
		DebugPrint("Unknown channel: " .. tostring(channel))
		return
	end
	
	-- Send the communication message
	self:SendCommMessage("Soundboard", key, distribution)
	DebugPrint("Sent '" .. key .. "' via " .. distribution .. " distribution")
end

function Soundboard:Ping()
	DebugPrint("Pinging for all eligible Soundboard users...")
	
	-- Initialize response tracking
	if not self.pingResponses then
		self.pingResponses = {}
	end
	self.pingResponses = {} -- Clear previous responses
	
	local channelsPinged = {}
	
	-- Send ping to party/raid
	if IsInRaid() then
		self:SendCommMessage("Soundboard", "PingSend", "RAID")
		DebugPrint("Sent ping to RAID")
		table.insert(channelsPinged, "Raid")
	elseif IsInGroup() then 
		self:SendCommMessage("Soundboard", "PingSend", "PARTY")
		DebugPrint("Sent ping to PARTY")
		table.insert(channelsPinged, "Party")
	end
	
	-- Send ping to guild if guild broadcasting is enabled
	if Soundboard.db.profile.GuildBroadcast and IsInGuild() then
		self:SendCommMessage("Soundboard", "PingSend", "GUILD")
		DebugPrint("Sent ping to GUILD")
		table.insert(channelsPinged, "Guild")
	end
	
	if #channelsPinged > 0 then
		self:Print("Pinging for Soundboard users in: " .. table.concat(channelsPinged, ", "))
		self:Print("Responses will appear below...")
		
		-- Set up timer to show summary after responses
		if C_Timer and C_Timer.After then
			C_Timer.After(3, function()
				self:ShowPingResults()
			end)
		end
	else
		self:Print("No eligible channels to ping (not in group/raid/guild or guild broadcasting disabled)")
	end
end

function Soundboard:ToggleGroup()
	if db.GroupEnabled then
		if UnitIsGroupLeader("player") then
			self:SendCommMessage("Soundboard", "GroupEnable", IsInRaid() and "RAID" or "PARTY")
			self:Print("Group sounds enabled for all members")
		end
	else 
		if UnitIsGroupLeader("player") then
			self:SendCommMessage("Soundboard", "GroupDisable", IsInRaid() and "RAID" or "PARTY")
			self:Print("Group sounds disabled for all members")  
		end
	end
end

function Soundboard:HandlePingReply(sender, channel)
	if not self.pingResponses then
		self.pingResponses = {}
	end
	
	-- Store the response with channel info
	if not self.pingResponses[sender] then
		self.pingResponses[sender] = {}
	end
	self.pingResponses[sender][channel] = true
	
	-- Format channel name for display
	local channelDisplay = channel
	if channel == "PARTY" then
		channelDisplay = "Party"
	elseif channel == "RAID" then
		channelDisplay = "Raid"  
	elseif channel == "GUILD" then
		channelDisplay = "Guild"
	end
	
	-- Show immediate response
	self:Print("├ " .. sender .. " (via " .. channelDisplay .. ")")
	DebugPrint("Received ping reply from " .. sender .. " via " .. channel)
end

function Soundboard:ShowPingResults()
	if not self.pingResponses then
		self:Print("└ No Soundboard users found")
		return
	end
	
	local totalUsers = 0
	local partyUsers = 0
	local guildUsers = 0
	local bothUsers = 0
	
	-- Count responses by channel
	for sender, channels in pairs(self.pingResponses) do
		totalUsers = totalUsers + 1
		local hasParty = channels["PARTY"] or channels["RAID"]
		local hasGuild = channels["GUILD"]
		
		if hasParty and hasGuild then
			bothUsers = bothUsers + 1
		elseif hasParty then
			partyUsers = partyUsers + 1
		elseif hasGuild then
			guildUsers = guildUsers + 1
		end
	end
	
	-- Show summary
	if totalUsers == 0 then
		self:Print("└ No Soundboard users found")
	else
		local summary = "└ Found " .. totalUsers .. " Soundboard user" .. (totalUsers > 1 and "s" or "") .. ":"
		if partyUsers > 0 then
			summary = summary .. " " .. partyUsers .. " group"
		end
		if guildUsers > 0 then
			summary = summary .. " " .. guildUsers .. " guild-only"
		end
		if bothUsers > 0 then
			summary = summary .. " " .. bothUsers .. " both"
		end
		self:Print(summary)
		
		-- Show broadcast reach
		local canReceive = {}
		if IsInGroup() or IsInRaid() then
			table.insert(canReceive, "Group sounds → " .. (partyUsers + bothUsers) .. " users")
		end
		if Soundboard.db.profile.GuildBroadcast and IsInGuild() then
			table.insert(canReceive, "Guild sounds → " .. (guildUsers + bothUsers) .. " users")
		end
		
		if #canReceive > 0 then
			for _, reach in ipairs(canReceive) do
				self:Print("  " .. reach)
			end
		end
	end
end

-- Old dropdown function removed - replaced with simple dropdown system
