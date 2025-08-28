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
	defaultDuration = 4.0,        -- Default sound duration (seconds) - slightly longer for safety
	currentSoundStartTime = nil,   -- When the current sound started playing (for accurate remaining time)
}

-- Dynamic Sound Duration Learning System
local SoundDurationLearning = {
	-- Start with basic categories/estimates, then learn actual durations
	estimatesByPattern = {
		-- File name patterns to initial estimates
		[".*long.*%.mp3"] = 8.0,    -- Files with "long" in name
		[".*short.*%.mp3"] = 2.0,   -- Files with "short" in name  
		[".*song.*%.mp3"] = 12.0,   -- Music files
		[".*theme.*%.mp3"] = 10.0,  -- Theme songs
		[".*laugh.*%.mp3"] = 3.0,   -- Laugh sounds
		[".*scream.*%.mp3"] = 2.5,  -- Scream sounds
	},
	
	-- Default estimates by probable duration
	defaultShort = 2.0,     -- Most voice clips/effects
	defaultMedium = 4.0,    -- Medium clips 
	defaultLong = 8.0,      -- Longer speeches/music
	defaultVeryLong = 15.0, -- Full songs
}

-- Learned durations storage (saved per-character or account-wide)
local LearnedDurations = {}

-- Dynamic Sound Duration Functions
local function GetSoundDuration(soundFile, key)
	if not soundFile then
		return 10.0 -- 10 second fallback as requested
	end
	
	-- First try to get duration from soundpack data using the key
	if key and soundboard_data and soundboard_data[key] and soundboard_data[key].duration then
		return soundboard_data[key].duration
	end
	
	-- Fallback to old hardcoded durations for compatibility
	local filename = soundFile:match("([^\\]+)$") or soundFile
	
	-- First check learned durations (most accurate)
	if LearnedDurations[filename] then
		DebugPrint("Using learned duration for " .. filename .. ": " .. LearnedDurations[filename] .. "s")
		return LearnedDurations[filename]
	end
	
	-- Try pattern-based estimates
	for pattern, estimate in pairs(SoundDurationLearning.estimatesByPattern) do
		if filename:match(pattern) then
			DebugPrint("Using pattern estimate for " .. filename .. ": " .. estimate .. "s")
			return estimate
		end
	end
	
	-- Intelligent fallback based on filename characteristics
	local lowerName = filename:lower()
	if lowerName:match("song") or lowerName:match("music") or lowerName:match("theme") then
		DebugPrint("Music file detected, using long estimate: " .. SoundDurationLearning.defaultLong .. "s")
		return SoundDurationLearning.defaultLong
	elseif lowerName:match("march") or lowerName:match("anthem") then
		DebugPrint("Anthem detected, using very long estimate: " .. SoundDurationLearning.defaultVeryLong .. "s")
		return SoundDurationLearning.defaultVeryLong
	elseif lowerName:match("laugh") or lowerName:match("scream") or lowerName:match("yell") then
		DebugPrint("Voice effect detected, using medium estimate: " .. SoundDurationLearning.defaultMedium .. "s")
		return SoundDurationLearning.defaultMedium
	elseif lowerName:match("shot") or lowerName:match("hit") or lowerName:match("boom") then
		DebugPrint("Sound effect detected, using short estimate: " .. SoundDurationLearning.defaultShort .. "s")
		return SoundDurationLearning.defaultShort
	end
	
	-- Final fallback
	DebugPrint("Using default duration for unknown file " .. filename .. ": " .. SoundQueue.defaultDuration .. "s")
	return SoundQueue.defaultDuration
end

-- Learn actual duration when sound finishes
local function LearnSoundDuration(soundFile, actualDuration)
	if not soundFile or not actualDuration then
		return
	end
	
	local filename = soundFile:match("([^\\]+)$") or soundFile
	local previousDuration = LearnedDurations[filename]
	
	if previousDuration then
		-- Average with previous learned duration for better accuracy
		LearnedDurations[filename] = (previousDuration + actualDuration) / 2
		DebugPrint("Updated learned duration for " .. filename .. ": " .. LearnedDurations[filename] .. "s (was " .. previousDuration .. "s)")
	else
		-- First time learning this sound
		LearnedDurations[filename] = actualDuration
		DebugPrint("Learned new duration for " .. filename .. ": " .. actualDuration .. "s")
	end
	
	-- Save to persistent storage
	if Soundboard.db and Soundboard.db.profile then
		if not Soundboard.db.profile.LearnedSoundDurations then
			Soundboard.db.profile.LearnedSoundDurations = {}
		end
		Soundboard.db.profile.LearnedSoundDurations[filename] = LearnedDurations[filename]
	end
end

-- Load learned durations from saved data
local function LoadLearnedDurations()
	if Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.LearnedSoundDurations then
		LearnedDurations = Soundboard.db.profile.LearnedSoundDurations
		local count = 0
		for _ in pairs(LearnedDurations) do count = count + 1 end
		DebugPrint("Loaded " .. count .. " learned sound durations from saved data")
	end
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
		Soundboard:Print("That sound is already playing - wait until it finishes before playing it again")
		return false, "playing"
	end
	
	-- Check if same sound is already in queue
	for i, queuedSound in ipairs(SoundQueue.queue) do
		if queuedSound.file == soundFile then
			DebugPrint("Sound already in queue: " .. tostring(soundFile))
			Soundboard:Print("That sound is already queued - wait until it finishes before playing it again")
			return false, "queued"
		end
	end
	
	-- Add to queue
	table.insert(SoundQueue.queue, {
		file = soundFile,
		volume = volume or 1.0,
		key = key,
		timestamp = time()
	})
	
	DebugPrint("Added sound to queue: " .. tostring(soundFile) .. " (Queue size: " .. #SoundQueue.queue .. ")")
	return true, "queued"
end

local function PlayNextInQueue()
	-- Cancel any existing timer first to prevent overlaps
	if SoundQueue.processingTimer then
		SoundQueue.processingTimer:Cancel()
		SoundQueue.processingTimer = nil
		DebugPrint("Cancelled previous timer")
	end
	
	if #SoundQueue.queue == 0 then
		SoundQueue.isPlaying = false
		SoundQueue.currentSound = nil
		SoundQueue.currentSoundStartTime = nil
		DebugPrint("Sound queue is empty")
		return
	end
	
	-- Ensure we're not already playing (prevent overlaps)
	if SoundQueue.isPlaying and SoundQueue.currentSound then
		DebugPrint("WARNING: Already playing a sound, ignoring PlayNextInQueue")
		return
	end
	
	-- Get next sound from queue
	local nextSound = table.remove(SoundQueue.queue, 1)
	SoundQueue.currentSound = nextSound
	SoundQueue.isPlaying = true
	
	DebugPrint("Playing next sound from queue: " .. tostring(nextSound.file))
	
	-- Play the sound using our volume-controlled method
	local success = Soundboard:PlaySoundDirect(nextSound.file, nextSound.volume)
	
	-- Set timing AFTER successful sound start for better accuracy
	if success then
		SoundQueue.currentSoundStartTime = time()  -- Track when sound started
		DebugPrint("Sound started successfully at time: " .. SoundQueue.currentSoundStartTime)
	end
	
	if success then
		-- Set timer for when sound finishes
		local duration = GetSoundDuration(nextSound.file, nextSound.key)
		DebugPrint("Sound duration estimated at " .. tostring(duration) .. " seconds")
		
		SoundQueue.processingTimer = C_Timer.NewTimer(duration, function()
			DebugPrint("Sound finished, processing next in queue")
			
			-- Learn the actual duration if we have timing data
			if SoundQueue.currentSound and SoundQueue.currentSoundStartTime then
				local actualDuration = time() - SoundQueue.currentSoundStartTime
				LearnSoundDuration(SoundQueue.currentSound.file, actualDuration)
			end
			
			SoundQueue.isPlaying = false
			SoundQueue.currentSound = nil
			SoundQueue.currentSoundStartTime = nil
			PlayNextInQueue()
		end)
	else
		DebugPrint("Failed to play sound: " .. tostring(nextSound.file))
		-- Try next sound immediately if this one failed
		SoundQueue.isPlaying = false
		SoundQueue.currentSound = nil
		SoundQueue.currentSoundStartTime = nil
		PlayNextInQueue()
	end
end

local function CalculateQueueTime()
	local totalTime = 0
	
	-- Add remaining time for currently playing sound
	if SoundQueue.isPlaying and SoundQueue.currentSound then
		if SoundQueue.currentSoundStartTime then
			-- Use precise timing if available
			local currentDuration = GetSoundDuration(SoundQueue.currentSound.file, SoundQueue.currentSound.key)
			local elapsed = time() - SoundQueue.currentSoundStartTime
			local remaining = math.max(0, currentDuration - elapsed)
			totalTime = totalTime + remaining
			DebugPrint("Current sound (" .. (SoundQueue.currentSound.key or "unknown") .. ") remaining: " .. string.format("%.1f", remaining) .. "s (elapsed: " .. string.format("%.1f", elapsed) .. "s, total: " .. string.format("%.1f", currentDuration) .. "s)")
		else
			-- Fallback: assume full duration remaining (should be rare)
			local currentDuration = GetSoundDuration(SoundQueue.currentSound.file, SoundQueue.currentSound.key)
			totalTime = totalTime + currentDuration
			DebugPrint("Current sound (" .. (SoundQueue.currentSound.key or "unknown") .. ") estimated remaining (no start time): " .. currentDuration .. "s")
		end
	end
	
	-- Add time for all queued sounds (excluding the one we're calculating for)
	local queueCount = 0
	for _, queuedSound in ipairs(SoundQueue.queue) do
		local soundDuration = GetSoundDuration(queuedSound.file, queuedSound.key)
		totalTime = totalTime + soundDuration
		queueCount = queueCount + 1
		DebugPrint("Queued sound #" .. queueCount .. " (" .. (queuedSound.key or "unknown") .. ") duration: " .. soundDuration .. "s")
	end
	
	DebugPrint("Total queue time: " .. string.format("%.1f", totalTime) .. "s (" .. queueCount .. " queued sounds)")
	return totalTime
end

local function QueueSound(soundFile, volume, key, sender)
	if not soundFile then
		DebugPrint("No sound file provided")
		return false
	end
	
	-- If nothing is playing, play immediately
	if not SoundQueue.isPlaying then
		-- Set up the first item and mark as playing before starting
		local queueItem = {
			file = soundFile,
			volume = volume or 1.0,
			key = key,
			timestamp = time()
		}
		SoundQueue.queue = {queueItem}
		SoundQueue.isPlaying = true  -- Mark as playing immediately to prevent race conditions
		
		PlayNextInQueue()
		
		-- Provide user feedback for immediate play
		local soundName = key and ("/" .. key) or "Sound"
		local senderText = sender and (" (sent by " .. sender .. ")") or ""
		Soundboard:Print(soundName .. " is now playing" .. senderText .. "!")
		return true
	end
	
	-- Try to add to queue first
	local success, status = AddSoundToQueue(soundFile, volume, key)
	
	-- Calculate position and time AFTER adding to queue for accurate results
	local queuePosition = #SoundQueue.queue  -- Current position in queue
	local estimatedWaitTime = CalculateQueueTime()
	
	if success then
		-- Provide user feedback with queue position and estimated time
		local soundName = key and ("/" .. key) or "Sound"
		local senderText = sender and (" (sent by " .. sender .. ")") or ""
		local soundsAhead = queuePosition - 1  -- Sounds ahead in queue (not counting currently playing)
		
		-- Round the wait time to a reasonable precision
		local waitTimeRounded = math.max(1, math.ceil(estimatedWaitTime))
		
		if soundsAhead == 0 then
			Soundboard:Print(soundName .. " will play next in " .. waitTimeRounded .. " second" .. (waitTimeRounded == 1 and "" or "s") .. senderText)
		else
			Soundboard:Print(soundName .. " will play in " .. waitTimeRounded .. " second" .. (waitTimeRounded == 1 and "" or "s") .. ", and is behind " .. soundsAhead .. " sound" .. (soundsAhead > 1 and "s" or "") .. senderText)
		end
		
		-- Debug output for troubleshooting
		DebugPrint("Queue feedback: " .. soundName .. " | Position: " .. queuePosition .. " | Estimated wait: " .. string.format("%.1f", estimatedWaitTime) .. "s | Sounds ahead: " .. soundsAhead)
	end
	
	return success
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

-- ==================== FAVORITES SYSTEM ====================

-- Toggle favorite status for a sound
function SoundboardDropdown:ToggleFavorite(soundKey)
	if not Soundboard.db or not Soundboard.db.profile then
		DebugPrint("ERROR: Cannot toggle favorite - database not available")
		return false
	end
	
	local favorites = Soundboard.db.profile.Favorites
	local wasFavorited = favorites[soundKey] == true
	
	if wasFavorited then
		favorites[soundKey] = nil
		DebugPrint("Removed favorite: " .. tostring(soundKey))
	else
		favorites[soundKey] = true
		DebugPrint("Added favorite: " .. tostring(soundKey))
	end
	
	return not wasFavorited -- Return new favorite status
end

-- Check if a sound is favorited
function SoundboardDropdown:IsFavorite(soundKey)
	if not Soundboard.db or not Soundboard.db.profile then
		return false
	end
	return Soundboard.db.profile.Favorites[soundKey] == true
end

-- Get all favorited sounds
function SoundboardDropdown:GetFavorites()
	if not Soundboard.db or not Soundboard.db.profile then
		return {}
	end
	
	local favorites = {}
	for soundKey, _ in pairs(Soundboard.db.profile.Favorites) do
		if soundboard_data[soundKey] then
			favorites[soundKey] = soundboard_data[soundKey]
		end
	end
	
	return favorites
end

-- Check if any favorites exist
function SoundboardDropdown:HasFavorites()
	if not Soundboard.db or not Soundboard.db.profile then
		return false
	end
	
	for soundKey, _ in pairs(Soundboard.db.profile.Favorites) do
		if soundboard_data[soundKey] then
			return true
		end
	end
	
	return false
end

-- ==================== SEARCH SYSTEM ====================

-- Initialize search state
SoundboardDropdown.searchText = ""
SoundboardDropdown.searchActive = false

-- Update search text and refresh display
function SoundboardDropdown:UpdateSearch(searchText)
	self.searchText = searchText or ""
	self.searchActive = self.searchText ~= ""
	DebugPrint("Search updated: '" .. self.searchText .. "' (active: " .. tostring(self.searchActive) .. ")")
	
	-- Refresh the display
	if self.searchActive then
		self:ShowSearchResults()
	else
		self:ShowMainMenu()
	end
end

-- Search through categories, subcategories, and sounds
function SoundboardDropdown:SearchSounds(query)
	if not query or query == "" then
		return {categories = {}, subcategories = {}, sounds = {}}
	end
	
	query = string.lower(query)
	local results = {categories = {}, subcategories = {}, sounds = {}}
	
	-- Search through all sounds
	for soundKey, soundData in pairs(soundboard_data) do
		local category = soundData.category or "Uncategorized"
		local subcategory = soundData.subcategory
		local text = soundData.text or ""
		local cmd1 = soundData.cmd1 or ""
		
		-- Check if sound matches
		local soundMatches = string.find(string.lower(text), query) or 
		                    string.find(string.lower(cmd1), query) or
		                    string.find(string.lower(soundKey), query)
		
		-- Check if category matches
		local categoryMatches = string.find(string.lower(category), query)
		
		-- Check if subcategory matches
		local subcategoryMatches = subcategory and string.find(string.lower(subcategory), query)
		
		if soundMatches then
			if not results.sounds[category] then
				results.sounds[category] = {}
			end
			if subcategory then
				if not results.sounds[category][subcategory] then
					results.sounds[category][subcategory] = {}
				end
				results.sounds[category][subcategory][soundKey] = soundData
			else
				results.sounds[category][soundKey] = soundData
			end
		end
		
		if categoryMatches then
			results.categories[category] = true
		end
		
		if subcategoryMatches then
			if not results.subcategories[category] then
				results.subcategories[category] = {}
			end
			results.subcategories[category][subcategory] = true
		end
	end
	
	return results
end

-- Show search results
function SoundboardDropdown:ShowSearchResults()
	DebugPrint("ShowSearchResults called with query: '" .. self.searchText .. "'")
	self:ClearContent()
	
	local yOffset = -5
	local buttonHeight = 22
	
	-- Search bar (always visible)
	self:CreateSearchBar(yOffset)
	yOffset = yOffset - 30  -- Search bar height
	
	-- Back button
	local backBtn = self:CreateButton("< Back to Menu", yOffset)
	backBtn:SetScript("OnClick", function()
		self.searchText = ""
		self.searchActive = false
		self:ShowMainMenu()
	end)
	yOffset = yOffset - buttonHeight - 5
	
	local results = self:SearchSounds(self.searchText)
	local hasResults = false
	
	-- Show matching categories
	local categoryNames = {}
	for category, _ in pairs(results.categories) do
		table.insert(categoryNames, category)
	end
	table.sort(categoryNames)
	
	if #categoryNames > 0 then
		local categoryHeader = self:CreateButton("Categories", yOffset, false, true)
		yOffset = yOffset - buttonHeight
		hasResults = true
		
		for _, category in ipairs(categoryNames) do
			local catBtn = self:CreateButton(category .. " (Category)", yOffset)
			catBtn:SetScript("OnClick", function()
				self:ShowCategory(category)
			end)
			yOffset = yOffset - buttonHeight
		end
		yOffset = yOffset - 5  -- Extra spacing
	end
	
	-- Show matching subcategories  
	local subcategoryList = {}
	for category, subcats in pairs(results.subcategories) do
		for subcategory, _ in pairs(subcats) do
			table.insert(subcategoryList, {category = category, subcategory = subcategory})
		end
	end
	table.sort(subcategoryList, function(a, b) 
		if a.category == b.category then
			return a.subcategory < b.subcategory
		end
		return a.category < b.category
	end)
	
	if #subcategoryList > 0 then
		local subcategoryHeader = self:CreateButton("Sub-Categories", yOffset, false, true)
		yOffset = yOffset - buttonHeight
		hasResults = true
		
		for _, item in ipairs(subcategoryList) do
			local subcatBtn = self:CreateButton(item.category .. " > " .. item.subcategory, yOffset)
			subcatBtn:SetScript("OnClick", function()
				self:ShowSubcategory(item.category, item.subcategory)
			end)
			yOffset = yOffset - buttonHeight
		end
		yOffset = yOffset - 5  -- Extra spacing
	end
	
	-- Show matching sounds
	local soundsList = {}
	for category, categoryData in pairs(results.sounds) do
		for key, soundData in pairs(categoryData) do
			if type(soundData) == "table" and soundData.text then
				-- Direct sound in category
				table.insert(soundsList, {key = key, data = soundData, category = category})
			elseif type(soundData) == "table" then
				-- Subcategory containing sounds
				for soundKey, actualSoundData in pairs(soundData) do
					if type(actualSoundData) == "table" and actualSoundData.text then
						table.insert(soundsList, {key = soundKey, data = actualSoundData, category = category, subcategory = key})
					end
				end
			end
		end
	end
	
	if #soundsList > 0 then
		local soundsHeader = self:CreateButton("Sounds", yOffset, false, true)
		yOffset = yOffset - buttonHeight
		hasResults = true
		
		table.sort(soundsList, function(a, b) return a.data.text < b.data.text end)
		
		for _, soundItem in ipairs(soundsList) do
			local soundBtn = self:CreateSoundButtonWithStar(soundItem.key, soundItem.data, yOffset)
			yOffset = yOffset - buttonHeight
		end
	end
	
	-- Show "No results" message if nothing found
	if not hasResults then
		local noResultsBtn = self:CreateButton("No results found for '" .. self.searchText .. "'", yOffset)
		noResultsBtn:SetScript("OnClick", nil)
		yOffset = yOffset - buttonHeight
	end
	
	-- Update content size and scrollbar
	self.content:SetHeight(math.abs(yOffset) + 10)
	self:UpdateScrollbar()
	self:UpdateButtonWidths()
end

-- ==================== UI CREATION FUNCTIONS ====================

-- Create search bar EditBox
function SoundboardDropdown:CreateSearchBar(yOffset)
	-- Always recreate the search box to avoid stale references after ClearContent()
	if self.searchBox then
		self.searchBox:Hide()
		self.searchBox = nil
	end
	
	-- Create search box frame
	local searchBox = CreateFrame("EditBox", nil, self.content)
	searchBox:SetSize(240, 20)
	searchBox:SetPoint("TOPLEFT", SoundboardUI.Scale(4), yOffset)
	searchBox:SetAutoFocus(false)
	searchBox:SetFontObject("GameFontNormal")
	searchBox:SetText(self.searchText or "")
	searchBox:SetMaxLetters(50)
	DebugPrint("Search box created with text: '" .. (self.searchText or "") .. "'")
	
	-- Style the search box with ElvUI-style backdrop
	local selectedTemplate = (Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.UITemplate) or "Default"
	SoundboardUI.CreateBackdrop(searchBox, selectedTemplate)
	
	-- Set text insets for padding
	searchBox:SetTextInsets(4, 4, 0, 0)
	
	-- Search functionality - only search on Enter key press
	searchBox:SetScript("OnTextChanged", function(self, userInput)
		-- Don't search on every character - wait for Enter key
	end)
	
	searchBox:SetScript("OnEnterPressed", function(self)
		local text = self:GetText()
		if text == "Search sounds... (Press Enter)" then text = "" end  -- Clear placeholder
		SoundboardDropdown:UpdateSearch(text)
		self:ClearFocus()
	end)
	
	searchBox:SetScript("OnEscapePressed", function(self)
		self:SetText("")
		self:ClearFocus()
		-- Clear search and return to main menu
		SoundboardDropdown:UpdateSearch("")
	end)
	
	-- Get template colors for search box
	local templateColors = SoundboardUI.templates[selectedTemplate] or SoundboardUI.templates.Default
	
	-- Placeholder text when empty - updated to indicate Enter key requirement
	searchBox:SetScript("OnEditFocusLost", function(self)
		if self:GetText() == "" then
			self:SetTextColor(0.5, 0.5, 0.5, 1)  -- Gray placeholder
			self:SetText("Search sounds... (Press Enter)")
		end
	end)
	
	searchBox:SetScript("OnEditFocusGained", function(self)
		if self:GetText() == "Search sounds... (Press Enter)" then
			self:SetText("")
		end
		-- Use template text color when focused
		self:SetTextColor(templateColors.text[1], templateColors.text[2], templateColors.text[3], templateColors.text[4])
	end)
	
	-- Initialize placeholder if empty
	if self.searchText == "" or self.searchText == nil then
		searchBox:SetTextColor(0.5, 0.5, 0.5, 1)  -- Gray placeholder
		searchBox:SetText("Search sounds... (Press Enter)")
	else
		-- Use template text color for actual search text
		searchBox:SetTextColor(templateColors.text[1], templateColors.text[2], templateColors.text[3], templateColors.text[4])
	end
	
	self.searchBox = searchBox
	return searchBox
end

-- Create sound button with star icon
function SoundboardDropdown:CreateSoundButtonWithStar(soundKey, soundData, yOffset)
	local buttonWidth = 250
	local button = CreateFrame("Button", nil, self.content)
	button:SetSize(buttonWidth, 20)
	button:SetPoint("TOPLEFT", SoundboardUI.Scale(4), yOffset)
	
	-- Apply ElvUI-style button styling
	local selectedTemplate = (Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.UITemplate) or "Default"
	SoundboardUI.StyleButton(button, selectedTemplate)
	
	-- Create star button (left side)
	local starButton = CreateFrame("Button", nil, button)
	starButton:SetSize(16, 16)
	starButton:SetPoint("LEFT", 2, 0)
	
	-- Star texture
	local starTexture = starButton:CreateTexture(nil, "ARTWORK")
	starTexture:SetAllPoints()
	
	-- Update star appearance based on favorite status
	local function updateStar()
		local isFavorited = self:IsFavorite(soundKey)
		if isFavorited then
			starTexture:SetTexture("Interface\\Common\\FavoritesIcon")
			starTexture:SetVertexColor(1, 0.8, 0, 1)  -- Gold
		else
			starTexture:SetTexture("Interface\\Common\\FavoritesIcon")
			starTexture:SetVertexColor(0.3, 0.3, 0.3, 1)  -- Dark gray
		end
	end
	
	-- Star click handler
	starButton:SetScript("OnClick", function()
		local newStatus = self:ToggleFavorite(soundKey)
		updateStar()
		Soundboard:Print((newStatus and "Added" or "Removed") .. " favorite: " .. (soundData.text or soundKey))
		
		-- Refresh main menu if we're viewing favorites and removed the last one
		if not newStatus and not self:HasFavorites() and self.currentView == "favorites" then
			self:ShowMainMenu()
		end
	end)
	
	-- Initialize star appearance
	updateStar()
	
	-- Main sound text (offset to make room for star) - show command and description
	local fontString = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	fontString:SetPoint("LEFT", 20, 0)  -- Offset for star
	fontString:SetPoint("RIGHT", -4, 0)
	fontString:SetJustifyH("LEFT")
	
	-- Format: /command - description (like original)
	local displayText = "/" .. soundKey
	if soundData.text and string.len(soundData.text) < 30 then
		displayText = displayText .. " |cFF888888- " .. soundData.text .. "|r"
	end
	fontString:SetText(displayText)
	
	-- Apply proper theme colors initially
	local selectedTemplate = (Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.UITemplate) or "Default"
	local templateColors = SoundboardUI.templates[selectedTemplate] or SoundboardUI.templates.Default
	fontString:SetTextColor(templateColors.text[1], templateColors.text[2], templateColors.text[3], templateColors.text[4])
	
	-- Sound play functionality
	button:SetScript("OnClick", function()
		DebugPrint("Sound button clicked: " .. tostring(soundKey))
		
		if not Soundboard.db or not Soundboard.db.profile then
			DebugPrint("ERROR: Database not available for sound playback")
			return
		end
		
		if Soundboard.db.profile.IsEnabled then
			-- Use SayGagKey to ensure proper queue handling
			Soundboard:SayGagKey(soundKey)
			self.frame:Hide()
			self.isOpen = false
		else
			Soundboard:Print("Soundboard is disabled. Enable it first.")
		end
	end)
	
	-- Hover effects
	button:SetScript("OnEnter", function(self)
		local selectedTemplate = (Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.UITemplate) or "Default"
		local templateColors = SoundboardUI.templates[selectedTemplate] or SoundboardUI.templates.Default
		fontString:SetTextColor(templateColors.textHover[1], templateColors.textHover[2], templateColors.textHover[3], templateColors.textHover[4])
	end)
	
	button:SetScript("OnLeave", function(self)
		local selectedTemplate = (Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.UITemplate) or "Default"
		local templateColors = SoundboardUI.templates[selectedTemplate] or SoundboardUI.templates.Default
		
		-- Reapply the formatted text with proper coloring
		local displayText = "/" .. soundKey
		if soundData.text and string.len(soundData.text) < 30 then
			displayText = displayText .. " |cFF888888- " .. soundData.text .. "|r"
		end
		fontString:SetText(displayText)
		fontString:SetTextColor(templateColors.text[1], templateColors.text[2], templateColors.text[3], templateColors.text[4])
	end)
	
	return button
end

-- Show favorites category
function SoundboardDropdown:ShowFavorites()
	DebugPrint("ShowFavorites called")
	self:ClearContent()
	self.currentView = "favorites"
	
	local yOffset = -5
	local buttonHeight = 22
	
	-- Back button
	local backBtn = self:CreateButton("< Back to Menu", yOffset)
	backBtn:SetScript("OnClick", function()
		self.currentView = nil
		self:ShowMainMenu()
	end)
	yOffset = yOffset - buttonHeight - 5
	
	-- Favorites title with star icon
	local title = self:CreateButtonWithIcon("Favorites", yOffset, "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1", true)
	title:SetScript("OnClick", nil)
	yOffset = yOffset - buttonHeight - 5
	
	-- Get all favorited sounds
	local favorites = self:GetFavorites()
	local favoritesList = {}
	
	for soundKey, soundData in pairs(favorites) do
		table.insert(favoritesList, {key = soundKey, data = soundData})
	end
	
	-- Sort favorites alphabetically by text
	table.sort(favoritesList, function(a, b) 
		return (a.data.text or "") < (b.data.text or "") 
	end)
	
	-- Show favorite sounds with stars
	if #favoritesList > 0 then
		for _, favorite in ipairs(favoritesList) do
			local soundBtn = self:CreateSoundButtonWithStar(favorite.key, favorite.data, yOffset)
			yOffset = yOffset - buttonHeight
		end
	else
		-- This shouldn't happen since HasFavorites() checked first, but just in case
		local noFavoritesBtn = self:CreateButton("No favorites found", yOffset)
		noFavoritesBtn:SetScript("OnClick", nil)
		yOffset = yOffset - buttonHeight
	end
	
	-- Update content size and scrollbar
	self.content:SetHeight(math.abs(yOffset) + 10)
	self:UpdateScrollbar()
	self:UpdateButtonWidths()
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
	
	-- Search bar below Categories header (always recreate to ensure visibility)
	DebugPrint("Creating search bar at yOffset: " .. yOffset)
	self:CreateSearchBar(yOffset)
	yOffset = yOffset - 25  -- Search bar height + spacing
	DebugPrint("Search bar created, new yOffset: " .. yOffset)
	
	-- Favorites category (only show if favorites exist)
	if self:HasFavorites() then
		local favoritesBtn = self:CreateButtonWithIcon("Favorites", yOffset, "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1")
		favoritesBtn:SetScript("OnClick", function()
			self:ShowFavorites()
		end)
		yOffset = yOffset - buttonHeight
	end
	
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
			local soundBtn = self:CreateSoundButtonWithStar(sound.key, sound.data, yOffset)
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
	
	-- Show sounds in subcategory with stars
	local sounds = categoryData.subcategories[subcategoryName]
	for _, sound in ipairs(sounds) do
		local soundBtn = self:CreateSoundButtonWithStar(sound.key, sound.data, yOffset)
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
	
	-- Get current template colors directly (more reliable than SoundboardUI.colors)
	local selectedTemplate = (Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.UITemplate) or "Default"
	local templateColors = SoundboardUI.templates[selectedTemplate] or SoundboardUI.templates.Default
	
	-- Template-specific font styling  
	if isTitle then
		fontString:SetJustifyH("CENTER")
		fontString:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")  -- Main title: 14pt, centered
		-- Use template text color for titles
		fontString:SetTextColor(templateColors.text[1], templateColors.text[2], templateColors.text[3], templateColors.text[4])
		fontString:SetPoint("LEFT", 0, 0)
		fontString:SetPoint("RIGHT", 0, 0)
		DebugPrint("Title styling applied with template colors: " .. selectedTemplate)
	elseif isSecondaryHeader then
		fontString:SetJustifyH("LEFT")  -- Secondary headers: left-aligned
		fontString:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")  -- Secondary header: 12pt, left-aligned
		-- Use template text color for secondary headers
		fontString:SetTextColor(templateColors.text[1], templateColors.text[2], templateColors.text[3], templateColors.text[4])
		DebugPrint("Secondary header styling applied with template colors: " .. selectedTemplate)
	else
		-- Use template-specific text colors for regular buttons
		fontString:SetTextColor(templateColors.text[1], templateColors.text[2], templateColors.text[3], templateColors.text[4])
		
		-- Template-specific hover effects
		local originalEnter = button:GetScript("OnEnter")
		local originalLeave = button:GetScript("OnLeave")
		
		button:SetScript("OnEnter", function(btn)
			if originalEnter then originalEnter(btn) end
			fontString:SetTextColor(templateColors.textHover[1], templateColors.textHover[2], templateColors.textHover[3], templateColors.textHover[4])
		end)
		
		button:SetScript("OnLeave", function(btn)
			if originalLeave then originalLeave(btn) end
			fontString:SetTextColor(templateColors.text[1], templateColors.text[2], templateColors.text[3], templateColors.text[4])
		end)
		
		DebugPrint("Regular button styling applied with template-specific colors: " .. selectedTemplate)
	end
	
	button.text = fontString -- Store reference for easy access
	DebugPrint("Button creation completed successfully with ElvUI styling")
	return button
end

-- Create button with icon (for favorites category)
function SoundboardDropdown:CreateButtonWithIcon(text, yOffset, iconTexture, isTitle)
	DebugPrint("CreateButtonWithIcon called: '" .. tostring(text) .. "' with icon: " .. tostring(iconTexture))
	
	if not self.content then
		DebugPrint("ERROR: self.content is nil!")
		return nil
	end
	
	local button = CreateFrame("Button", nil, self.content)
	DebugPrint("Button frame created")
	
	-- Fixed button width to allow full border rendering
	local buttonWidth = 250
	button:SetSize(buttonWidth, 20)
	button:SetPoint("TOPLEFT", SoundboardUI.Scale(4), yOffset)
	DebugPrint("Button positioned with fixed width")
	
	-- Apply ElvUI-style button styling for non-titles
	if not isTitle then
		local selectedTemplate = (Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.UITemplate) or "Default"
		SoundboardUI.StyleButton(button, selectedTemplate)
		DebugPrint("ElvUI button styling applied")
	end
	
	-- Create icon on the left
	local iconFrame = CreateFrame("Frame", nil, button)
	iconFrame:SetSize(16, 16)
	iconFrame:SetPoint("LEFT", 4, 0)
	
	local iconTextureFrame = iconFrame:CreateTexture(nil, "ARTWORK")
	iconTextureFrame:SetAllPoints()
	iconTextureFrame:SetTexture(iconTexture)
	iconTextureFrame:SetVertexColor(1, 0.8, 0, 1)  -- Gold color like favorites
	
	-- Text with proper offset for icon
	local fontString = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	fontString:SetPoint("LEFT", SoundboardUI.Scale(24), 0)  -- Offset for icon
	fontString:SetPoint("RIGHT", -SoundboardUI.Scale(4), 0)
	fontString:SetJustifyH("LEFT")
	fontString:SetText(text)
	
	-- Get current template colors directly
	local selectedTemplate = (Soundboard.db and Soundboard.db.profile and Soundboard.db.profile.UITemplate) or "Default"
	local templateColors = SoundboardUI.templates[selectedTemplate] or SoundboardUI.templates.Default
	
	-- Template-specific font styling  
	if isTitle then
		fontString:SetJustifyH("LEFT")  -- Keep left-aligned for icon
		fontString:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")  -- Main title: 14pt
		fontString:SetTextColor(templateColors.text[1], templateColors.text[2], templateColors.text[3], templateColors.text[4])
		DebugPrint("Title styling applied with icon and template colors: " .. selectedTemplate)
	else
		-- Use template-specific text colors for regular buttons
		fontString:SetTextColor(templateColors.text[1], templateColors.text[2], templateColors.text[3], templateColors.text[4])
		
		-- Template-specific hover effects
		button:SetScript("OnEnter", function(btn)
			fontString:SetTextColor(templateColors.textHover[1], templateColors.textHover[2], templateColors.textHover[3], templateColors.textHover[4])
		end)
		
		button:SetScript("OnLeave", function(btn)
			fontString:SetTextColor(templateColors.text[1], templateColors.text[2], templateColors.text[3], templateColors.text[4])
		end)
		
		DebugPrint("Regular button styling applied with icon and template-specific colors: " .. selectedTemplate)
	end
	
	button.text = fontString -- Store reference for easy access
	button.icon = iconTextureFrame -- Store icon reference
	DebugPrint("Button with icon creation completed successfully")
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
	
	-- Clear search box reference so it gets recreated properly
	if self.searchBox then
		DebugPrint("Clearing search box reference")
		self.searchBox = nil
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
								Soundboard:PlaySoundWithVolume(heroSound.file, Soundboard.db.profile.MasterVolume, "hero", nil)
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
	
	-- Load learned durations will be called after database initialization below
	
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
			-- Favorites System (Account-wide)
			Favorites = {},            -- Table of favorited sound keys {soundKey = true}
			-- Dynamic Sound Duration Learning
			LearnedSoundDurations = {},-- Learned actual durations for sound files
			-- Advanced Settings
			DebugMode = false,         -- Enable debug output
		}
	 }
	self.db = LibStub("AceDB-3.0"):New("SoundboardDB", defaults, true)
	db = self.db.profile
	DebugPrint("Database initialized successfully, db exists: " .. tostring(db ~= nil))
	
	-- Load learned durations from saved data
	LoadLearnedDurations()
	DebugPrint("self.db exists: " .. tostring(self.db ~= nil))
	DebugPrint("self.db.profile exists: " .. tostring(self.db.profile ~= nil))
	
	-- Handle database migration for new broadcasting settings
	if db.GuildBroadcast == nil then
		db.GuildBroadcast = true
		DebugPrint("Migrated GuildBroadcast to default: true")
	end
	
	-- Handle database migration for favorites system
	if db.Favorites == nil then
		db.Favorites = {}
		DebugPrint("Migrated Favorites to default: empty table")
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
					Soundboard:PlaySoundWithVolume(heroSound.file, volume, "hero", nil)
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
					Soundboard:PlaySoundWithVolume(heroSound.file, currentVolume, "hero", nil)
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
	
	-- Add duration calculation command
	_G.SlashCmdList["SOUNDBOARDDURATIONS"] = function(msg)
		Soundboard:CalculateSoundDurations()
	end
	_G["SLASH_SOUNDBOARDDURATIONS1"] = "/soundboarddurations"
	
	-- Sound Queue Management Commands
	_G.SlashCmdList["SOUNDBOARDQUEUE"] = function(msg)
		Soundboard:GetQueueStatus()
	end
	_G["SLASH_SOUNDBOARDQUEUE1"] = "/soundboardqueue"
	
	_G.SlashCmdList["SOUNDBOARDCLEARQUEUE"] = function(msg)
		Soundboard:ClearSoundQueue()
	end
	_G["SLASH_SOUNDBOARDCLEARQUEUE1"] = "/soundboardclearqueue"
	
	-- Show learned sound durations
	_G.SlashCmdList["SOUNDBOARDLEARNED"] = function(msg)
		Soundboard:ShowLearnedDurations()
	end
	_G["SLASH_SOUNDBOARDLEARNED1"] = "/soundboardlearned"

	
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
	
	-- Calculate durations for sounds that don't have them
	self:CalculateSoundDurations()
	
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

function Soundboard:CalculateSoundDurations()
	DebugPrint("Calculating sound durations for soundpack items...")
	
	if not soundboard_data then 
		DebugPrint("No soundboard_data available")
		return 
	end
	
	local updatedCount = 0
	local estimatedDurations = {
		-- Common sound duration estimates (actual duration + 1 second as requested)
		-- These are rough estimates - ideally you'd measure each sound file
		["6871.mp3"] = 3.0, ["afterlife.mp3"] = 31.0, ["ahhhh.mp3"] = 4.0, ["alrighthen.mp3"] = 2.0,
		["anoffer.mp3"] = 4.0, ["apology2.mp3"] = 3.0, ["applause.mp3"] = 6.0, ["AreYouNotEntertained.mp3"] = 3.0,
		["army.mp3"] = 3.0, ["arnie.mp3"] = 2.0, ["ateam.mp3"] = 5.0, ["badgerbadgerbadger.mp3"] = 31.0,
		["bailamos.mp3"] = 31.0, ["banana1.mp3"] = 11.0, ["banana2.mp3"] = 11.0, ["barrelroll.mp3"] = 2.0,
		["bbd.mp3"] = 11.0, ["bde.mp3"] = 4.0, ["beautiful.mp3"] = 4.0, ["beback.mp3"] = 2.0,
		["belikeyou.mp3"] = 31.0, ["belly.mp3"] = 2.0, ["bennyhill.mp3"] = 31.0, ["bf.mp3"] = 31.0,
		["bf2.mp3"] = 31.0, ["bigboned.mp3"] = 3.0, ["bigbutts.mp3"] = 31.0, ["billiejean.mp3"] = 31.0,
		["billnye.mp3"] = 4.0, ["bing.mp3"] = 1.0, ["bkb.mp3"] = 31.0, ["blade.mp3"] = 31.0,
		["BladeRemix.mp3"] = 31.0, ["bleep.mp3"] = 2.0, ["blue.mp3"] = 31.0, ["boat.mp3"] = 31.0,
		["bologna.mp3"] = 3.0, ["bond.mp3"] = 3.0, ["Boogie.mp3"] = 31.0, ["Boomdiada.mp3"] = 11.0,
		["BOOMHS.mp3"] = 3.0, ["bornscumbag.mp3"] = 3.0, ["brain.mp3"] = 11.0, ["brightside.mp3"] = 31.0,
		["buddy.mp3"] = 2.0, ["business.mp3"] = 31.0, ["butthead.mp3"] = 2.0, ["byakuya.mp3"] = 4.0,
		["byebye.mp3"] = 2.0, ["cake.mp3"] = 31.0, ["candy.mp3"] = 11.0, ["canonrock.mp3"] = 31.0,
		["canonrock2.mp3"] = 31.0, ["canonrock3.mp3"] = 31.0, ["caramell2.mp3"] = 31.0, ["caramelldansen.mp3"] = 31.0,
		["carryon.mp3"] = 31.0, ["caught.mp3"] = 4.0, ["cbsmail.mp3"] = 3.0, ["cgs.mp3"] = 2.0,
		["champions.mp3"] = 31.0, ["change.mp3"] = 31.0, ["CHARGE.mp3"] = 2.0, ["chealers.mp3"] = 11.0,
		["cheat.mp3"] = 2.0, ["cheeseburger.mp3"] = 31.0, ["chefsong.mp3"] = 11.0, ["chewy.mp3"] = 2.0,
		["chickendance.mp3"] = 31.0, ["Chocolate_Rain.mp3"] = 31.0, ["chumbawamba.mp3"] = 31.0, ["cloudsong.mp3"] = 4.0,
		["comeondown.mp3"] = 2.0, ["comply.mp3"] = 3.0, ["cop.mp3"] = 2.0, ["cotc.mp3"] = 31.0,
		["crawl.mp3"] = 31.0, ["crazy.mp3"] = 3.0, ["ctm.mp3"] = 31.0, ["ctt.mp3"] = 31.0,
		["cuppycake.mp3"] = 31.0, ["damned.mp3"] = 4.0, ["damnyou.mp3"] = 2.0, ["darkpower.mp3"] = 4.0,
		["darkside.mp3"] = 4.0, ["db.mp3"] = 4.0, ["despicable.mp3"] = 2.0, ["desu.mp3"] = 2.0,
		["devoted.mp3"] = 31.0, ["diabetus.mp3"] = 11.0, ["dirt.mp3"] = 4.0, ["dkp.mp3"] = 3.0,
		["dogs.mp3"] = 31.0, ["donotgo.mp3"] = 3.0, ["donthug.mp3"] = 2.0, ["dontmake.mp3"] = 2.0,
		["dontstop.mp3"] = 31.0, ["dontstop2.mp3"] = 31.0, ["donttazemebro.mp3"] = 3.0, ["dota.mp3"] = 31.0,
		["druid.mp3"] = 11.0, ["druidtank.mp3"] = 4.0, ["eewww.mp3"] = 2.0, ["eheheeh.mp3"] = 2.0,
		["ellinia.mp3"] = 2.0, ["entrytovagin.mp3"] = 3.0, ["escape.mp3"] = 31.0, ["escape2.mp3"] = 31.0,
		["evillaugh.mp3"] = 3.0, ["eyeofthetiger.mp3"] = 31.0, ["facedeath.mp3"] = 3.0, ["failed.mp3"] = 2.0,
		["failuretocomm.mp3"] = 3.0, ["famguy.mp3"] = 11.0, ["familyguyhummer.mp3"] = 4.0, ["fart.mp3"] = 2.0,
		["feelgood.mp3"] = 31.0, ["feellucky.mp3"] = 4.0, ["ff-fightsong-start.mp3"] = 4.8, ["fgfart.mp3"] = 11.0,
		["finesthour.mp3"] = 4.0, ["fish.mp3"] = 11.0, ["flame.mp3"] = 4.0, ["flamewreathshort.mp3"] = 2.0,
		["flipper.mp3"] = 3.0, ["footloose.mp3"] = 31.0, ["friendship.mp3"] = 4.0, ["fries.mp3"] = 11.0,
		["gameover.mp3"] = 3.0, ["gas.mp3"] = 2.0, ["gdleeroy.mp3"] = 3.0, ["getdown.mp3"] = 31.0,
		["getdown2.mp3"] = 31.0, ["gg.mp3"] = 11.0, ["ghost love score.mp3"] = 31.0, ["gifted.mp3"] = 3.0,
		["ginjoint.mp3"] = 4.0, ["givethemnothing.mp3"] = 3.0, ["godlike.mp3"] = 2.0, ["gomer.mp3"] = 11.0,
		["goofed.mp3"] = 3.0, ["gotohell.mp3"] = 4.0, ["gp.mp3"] = 31.0, ["GTFO.mp3"] = 3.0,
		["gum.mp3"] = 4.0, ["h3f.mp3"] = 11.0, ["haha.mp3"] = 2.0, ["halloween.mp3"] = 11.0,
		["hamster.mp3"] = 3.0, ["handletruth.mp3"] = 3.0, ["hard3.mp3"] = 11.0, ["HardlikeHeroic.mp3"] = 31.0,
		["HardlikeHeroic2.mp3"] = 31.0, ["HardlikeHeroic4.mp3"] = 31.0, ["hardware.mp3"] = 11.0, ["hassan.mp3"] = 3.0,
		["hasta.mp3"] = 2.0, ["hastababy.mp3"] = 2.0, ["hatedit.mp3"] = 2.0, ["hax.mp3"] = 31.0,
		["headshot.mp3"] = 2.0, ["heart.mp3"] = 31.0, ["heman.mp3"] = 3.0, ["hereitgoesagain.mp3"] = 31.0,
		["hero.mp3"] = 5.5, ["hibaby.mp3"] = 2.0, ["hideandseek.mp3"] = 31.0, ["hitit.mp3"] = 3.0,
		["HollaBack.mp3"] = 31.0, ["HollaBackBananas.mp3"] = 31.0, ["hookedonafeeling.mp3"] = 31.0, ["horoscope.mp3"] = 31.0,
		["hotncold.mp3"] = 31.0, ["hotpussy.mp3"] = 11.0, ["houstonproblem.mp3"] = 3.0, ["httk.mp3"] = 3.0,
		["hulk-sad piano.mp3"] = 31.0, ["humiliation.mp3"] = 2.0, ["hunter.mp3"] = 11.0, ["hustle.mp3"] = 31.0,
		["hv.mp3"] = 4.0, ["iamlady.mp3"] = 2.0, ["Icandothisallday.mp3"] = 2.0, ["ikeeelu.mp3"] = 2.0,
		["ikeelu.mp3"] = 2.0, ["illmakeamanoutofyou.mp3"] = 31.0, ["imperial_march.mp3"] = 31.0, ["info.mp3"] = 4.0,
		["innocent.mp3"] = 2.0, ["intheend.mp3"] = 31.0, ["IOUS.mp3"] = 2.0, ["itn.mp3"] = 31.0,
		["itsmylife.mp3"] = 31.0, ["itsybitsy.mp3"] = 31.0, ["iwantcandy.mp3"] = 31.0, ["jarofdirt.mp3"] = 4.0,
		["jasb1.mp3"] = 3.0, ["jb.mp3"] = 31.0, ["jeopardy.mp3"] = 11.0, ["jeopardy1.mp3"] = 11.0,
		["jeopardy2.mp3"] = 11.0, ["jeopardy3.mp3"] = 11.0, ["jeopardy4.mp3"] = 11.0, ["jumponit.mp3"] = 31.0,
		["justdance.mp3"] = 31.0, ["kame.mp3"] = 4.0, ["katamari.mp3"] = 31.0, ["ketchup.mp3"] = 31.0,
		["killbill.mp3"] = 31.0, ["killingspree.mp3"] = 2.0, ["kittycat.mp3"] = 11.0, ["koolaid.mp3"] = 2.0,
		["kurrosaki.mp3"] = 4.0, ["landdownunder.mp3"] = 31.0, ["lean.mp3"] = 31.0, ["lean2.mp3"] = 31.0,
		["leek.mp3"] = 31.0, ["leeroy.mp3"] = 5.2, ["leeroychicken.mp3"] = 3.0, ["letsfightinglove.mp3"] = 31.0,
		["life.mp3"] = 31.0, ["lind.mp3"] = 31.0, ["lionsleeps.mp3"] = 31.0, ["lis-wrng.mp3"] = 4.0,
		["livetowin.mp3"] = 31.0, ["lizard-long.mp3"] = 11.0, ["lizard-single.mp3"] = 2.0, ["llap.mp3"] = 2.0,
		["lls.mp3"] = 31.0, ["loca.mp3"] = 31.0, ["lolguild.mp3"] = 11.0, ["Lollipops.mp3"] = 31.0,
		["lookin2.mp3"] = 3.0, ["loser5.mp3"] = 2.0, ["luvyaman.mp3"] = 2.0, ["macarena.mp3"] = 31.0,
		["macho.mp3"] = 31.0, ["madness.mp3"] = 2.0, ["mage.mp3"] = 11.0, ["magic.mp3"] = 31.0,
		["MakeLove.mp3"] = 31.0, ["makemyday.mp3"] = 3.0, ["mambo.mp3"] = 31.0, ["margarita.mp3"] = 31.0,
		["mario.mp3"] = 11.0, ["matrix.mp3"] = 3.0, ["meeatcookie.mp3"] = 2.0, ["megatron.mp3"] = 2.0,
		["melted.mp3"] = 3.0, ["milkshake.mp3"] = 31.0, ["mining.mp3"] = 11.0, ["mission.mp3"] = 3.0,
		["missionimp.mp3"] = 11.0, ["mkedit.mp3"] = 31.0, ["ml.mp3"] = 11.0, ["mmmbop.mp3"] = 31.0,
		["mo.mp3"] = 2.0, ["monster.mp3"] = 31.0, ["monsterkill.mp3"] = 2.0, ["moonlight.mp3"] = 31.0,
		["moredots.mp3"] = 3.0, ["moredots2.mp3"] = 3.0, ["morningtrain.mp3"] = 31.0, ["mortal.mp3"] = 31.0,
		["moskau.mp3"] = 31.0, ["mreh.mp3"] = 1.0, ["mt1.mp3"] = 11.0, ["mt2.mp3"] = 11.0,
		["mt3.mp3"] = 11.0, ["mudabudabuda.mp3"] = 3.0, ["mudada.mp3"] = 2.0, ["murloc.mp3"] = 2.0,
		["nannerpuss.mp3"] = 11.0, ["napoleon.mp3"] = 31.0, ["narnia.mp3"] = 31.0, ["nedm.mp3"] = 31.0,
		["needajew.mp3"] = 11.0, ["ninja.mp3"] = 31.0, ["nintendo64.mp3"] = 3.0, ["nl.mp3"] = 3.0,
		["nof.mp3"] = 31.0, ["noooo.mp3"] = 3.0, ["normalboyfriend.mp3"] = 3.0, ["numa2.mp3"] = 31.0,
		["numalong2.mp3"] = 31.0, ["numanuma.mp3"] = 31.0, ["numanumalong.mp3"] = 31.0, ["numnuts.mp3"] = 4.0,
		["o fortuna.mp3"] = 31.0, ["ocanada.mp3"] = 11.0, ["ohsnap.mp3"] = 2.0, ["ohyeah.mp3"] = 2.0,
		["onemorequestion.mp3"] = 3.0, ["OneOnly.mp3"] = 31.0, ["ooga.mp3"] = 2.0, ["oompa.mp3"] = 11.0,
		["over9000.mp3"] = 3.0, ["paladin.mp3"] = 11.0, ["party1.mp3"] = 31.0, ["party2.mp3"] = 31.0,
		["party3.mp3"] = 31.0, ["pbj.mp3"] = 31.0, ["peewee.mp3"] = 2.0, ["peeweela.mp3"] = 3.0,
		["peterlol.mp3"] = 2.0, ["peterlol2.mp3"] = 2.0, ["peterlol3.mp3"] = 2.0, ["petersoap.mp3"] = 11.0,
		["pg.mp3"] = 3.0, ["pi.mp3"] = 31.0, ["picard.mp3"] = 31.0, ["picardlong.mp3"] = 31.0,
		["pirate.mp3"] = 31.0, ["piratelong.mp3"] = 31.0, ["pirateshort.mp3"] = 31.0, ["PiSong.mp3"] = 31.0,
		["pissing.mp3"] = 2.0, ["playwow.mp3"] = 11.0, ["pokemon.mp3"] = 31.0, ["pokemon2.mp3"] = 31.0,
		["pokemondk.mp3"] = 31.0, ["ponpon.mp3"] = 31.0, ["ponponlong.mp3"] = 31.0, ["portal.mp3"] = 31.0,
		["portal2.mp3"] = 31.0, ["powerofchrist.mp3"] = 3.0, ["ppanther.mp3"] = 31.0, ["prepare.mp3"] = 2.0,
		["priest.mp3"] = 11.0, ["prime.mp3"] = 2.0, ["prince.mp3"] = 31.0, ["puckerup.mp3"] = 2.0,
		["pussy.mp3"] = 2.0, ["pwlaugh.mp3"] = 3.0, ["pwrrngs.mp3"] = 31.0, ["quick.mp3"] = 2.0,
		["rabies.mp3"] = 2.0, ["racist.mp3"] = 2.0, ["rainingmen.mp3"] = 31.0, ["rampage.mp3"] = 2.0,
		["reattached.mp3"] = 3.0, ["redalert.mp3"] = 3.0, ["remember.mp3"] = 31.0, ["repressed.mp3"] = 3.0,
		["rff.mp3"] = 31.0, ["ride spinnaz.mp3"] = 11.0, ["rit9.mp3"] = 31.0, ["rockandrollallnite.mp3"] = 31.0,
		["rockboat.mp3"] = 31.0, ["rocky.mp3"] = 31.0, ["rockyou.mp3"] = 31.0, ["roflmao.mp3"] = 11.0,
		["rogue.mp3"] = 11.0, ["rollout.mp3"] = 2.0, ["rosham.mp3"] = 3.0, ["rumble.mp3"] = 3.0,
		["runaway.mp3"] = 31.0, ["saber1.mp3"] = 3.0, ["saber2.mp3"] = 4.0, ["safetydance.mp3"] = 31.0,
		["safetydance2.mp3"] = 31.0, ["sailor.mp3"] = 31.0, ["salami.mp3"] = 3.0, ["sandman.mp3"] = 31.0,
		["santa.mp3"] = 4.0, ["sayhello.mp3"] = 3.0, ["sexything.mp3"] = 31.0, ["shadowform.mp3"] = 4.0,
		["shagpwr.mp3"] = 3.0, ["shaman.mp3"] = 11.0, ["shamanrogue.mp3"] = 11.0, ["shoes.mp3"] = 11.0,
		["shrimpbarbie.mp3"] = 3.0, ["Shuffeling.mp3"] = 31.0, ["shun.mp3"] = 2.0, ["shutupfool.mp3"] = 2.0,
		["sidious.mp3"] = 4.0, ["silence.mp3"] = 2.0, ["singapore.mp3"] = 3.0, ["smellslikeass.mp3"] = 3.0,
		["smokin.mp3"] = 2.0, ["snickers.mp3"] = 11.0, ["spartans.mp3"] = 3.0, ["standbyme.mp3"] = 31.0,
		["StarTrek.mp3"] = 31.0, ["StayAlive.mp3"] = 31.0, ["stewiechocolates.mp3"] = 11.0, ["stm.mp3"] = 2.0,
		["stolemybike.mp3"] = 3.0, ["stopit.mp3"] = 2.0, ["surprisemothafucka.mp3"] = 2.0, ["survival.mp3"] = 4.0,
		["tarzanandjane.mp3"] = 31.0, ["tarzanboy.mp3"] = 31.0, ["tequila.mp3"] = 31.0, ["tffm.mp3"] = 11.0,
		["tffm2.mp3"] = 11.0, ["the mystery song.mp3"] = 31.0, ["thefinalcountdown.mp3"] = 31.0, ["thegoggles.mp3"] = 2.0,
		["thepulse.mp3"] = 3.0, ["thinking.mp3"] = 3.0, ["ThisisMadness.mp3"] = 2.0, ["ThisisSparta.mp3"] = 2.0,
		["thrall.mp3"] = 31.0, ["thrallsball.mp3"] = 31.0, ["thundercatsho.mp3"] = 2.0, ["tiggers.mp3"] = 31.0,
		["to.mp3"] = 4.0, ["toki.mp3"] = 2.0, ["toml.mp3"] = 31.0, ["toosexy.mp3"] = 31.0,
		["topgun.mp3"] = 31.0, ["touchmyself.mp3"] = 31.0, ["tralala.mp3"] = 31.0, ["trap.mp3"] = 2.0,
		["tree.mp3"] = 3.0, ["troops.mp3"] = 3.0, ["trynot.mp3"] = 3.0, ["ttlo.mp3"] = 31.0,
		["tuba.mp3"] = 11.0, ["tunaktunak.mp3"] = 31.0, ["tunatown.mp3"] = 3.0, ["twilight.mp3"] = 4.0,
		["twinkle.mp3"] = 11.0, ["ualuealue.mp3"] = 11.0, ["uhohhotdog.mp3"] = 2.0, ["ultrakill.mp3"] = 2.0,
		["undrpnts.mp3"] = 3.0, ["unstoppable.mp3"] = 2.0, ["vaderfather.mp3"] = 3.0, ["vegeta.mp3"] = 3.0,
		["venga.mp3"] = 31.0, ["victory.mp3"] = 2.0, ["violent.mp3"] = 2.0, ["wacky.mp3"] = 11.0,
		["waffles.mp3"] = 11.0, ["walkingonsunshine.mp3"] = 31.0, ["wantme.mp3"] = 31.0, ["warlock.mp3"] = 11.0,
		["warrior.mp3"] = 11.0, ["watchu.mp3"] = 31.0, ["weakestlink.mp3"] = 3.0, ["whatislove.mp3"] = 31.0,
		["whatwouldbrianboitanodo.mp3"] = 31.0, ["whelps.mp3"] = 2.0, ["whine.mp3"] = 2.0, ["whitewomen.mp3"] = 2.0,
		["willsurvive.mp3"] = 31.0, ["willsurvive2.mp3"] = 31.0, ["willtell.mp3"] = 31.0, ["wish.mp3"] = 31.0,
		["witchtit.mp3"] = 3.0, ["wonderful time.mp3"] = 31.0, ["world.mp3"] = 31.0, ["worldfavor.mp3"] = 3.0,
		["wow_mr_t.mp3"] = 11.0, ["wow_shatner.mp3"] = 11.0, ["wow_van_damme.mp3"] = 11.0, ["wow_verne.mp3"] = 11.0,
		["wow_willy_toledo.mp3"] = 11.0, ["wrong.mp3"] = 2.0, ["WRYYYYYYYYYYY.mp3"] = 4.0, ["Wurzel.mp3"] = 31.0,
		["xfile.mp3"] = 31.0, ["xkill.mp3"] = 2.0, ["yatta.mp3"] = 31.0, ["yesmom.mp3"] = 2.0,
		["YMCA2.mp3"] = 31.0, ["yngskwlk.mp3"] = 3.0, ["you lose.mp3"] = 3.0, ["youplay.mp3"] = 11.0,
		["yourebeautiful.mp3"] = 31.0, ["yourethebest.mp3"] = 31.0, ["yourfather.mp3"] = 3.0, ["yousuck.mp3"] = 2.0,
		["ytmnd.mp3"] = 3.0, ["zawarudo.mp3"] = 2.0, ["zombienation.mp3"] = 31.0, ["zzz.mp3"] = 2.0
	}
	
	for key, data in pairs(soundboard_data) do
		if data and data.file and not data.duration then
			-- Extract filename from full path
			local filename = data.file:match("([^\\]+)$") or data.file
			local estimatedDuration = estimatedDurations[filename]
			
			if estimatedDuration then
				data.duration = estimatedDuration
				updatedCount = updatedCount + 1
				DebugPrint("Added duration " .. estimatedDuration .. "s to sound: " .. key)
			else
				-- Use 10 second fallback for unknown sounds
				data.duration = 10.0
				updatedCount = updatedCount + 1
				DebugPrint("Added fallback duration 10s to sound: " .. key)
			end
		end
	end
	
	if updatedCount > 0 then
		self:Print("Calculated durations for " .. updatedCount .. " sounds")
		DebugPrint("Sound duration calculation completed")
	else
		DebugPrint("No sounds needed duration calculation")
	end
end

function Soundboard:PlaySoundWithVolume(soundFile, volume, key, sender)
	-- Ensure volume is valid, fallback to 1.0 if nil or invalid
	if not volume or volume <= 0 then
		volume = 1.0
		DebugPrint("Volume was nil or invalid, using default: 1.0")
	end
	
	DebugPrint("PlaySoundWithVolume called with file: " .. tostring(soundFile) .. ", volume: " .. tostring(volume) .. (sender and (" from " .. sender) or ""))
	
	-- Use the sound queue system instead of playing directly
	local success = QueueSound(soundFile, volume, key, sender)
	
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
	SoundQueue.currentSoundStartTime = nil
	
	self:Print("Sound queue cleared! Removed " .. queueSize .. " queued sounds.")
end

function Soundboard:ShowLearnedDurations()
	local count = 0
	for filename, duration in pairs(LearnedDurations) do
		count = count + 1
	end
	
	if count == 0 then
		self:Print("No learned sound durations yet. Play some sounds to build the learning database!")
		return
	end
	
	self:Print("Learned sound durations (" .. count .. " files):")
	for filename, duration in pairs(LearnedDurations) do
		self:Print("  " .. filename .. ": " .. string.format("%.1f", duration) .. "s")
	end
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

function Soundboard:DoEmote(key, arg2, sender)
	DebugPrint("DoEmote called for: " .. tostring(key) .. (sender and (" from " .. sender) or ""))
	
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
						Soundboard:PlaySoundWithVolume(emote["file"], volume, key, sender)
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
			Soundboard:DoEmote(msg, false, sender)
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
