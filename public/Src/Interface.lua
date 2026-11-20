ExpressYourElf = {}
ExpressYourElfMessageColor = "\124cffff4f98"

local function dump(o)
  if type(o) == "table" then
    local s = "{ "
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. dump(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

local function debugPrint(feature, message)
  if not ExpressYourElfVars then return end

  if (ExpressYourElfVars.debugMode == true) then
    local prefix = "[EYELF_DEBUG (" .. feature .. ")] "
    print(prefix .. message)
  end
end

function ExpressYourElf_Reset_Tooltips()
  local targetName = ExpressYourElf.Helpers.GetUnitFullName("target")
  local scale = 0.7

  ExpressYourElf_DancingButton:SetScript("OnEnter", nil)
  ExpressYourElf_DancingButton:SetScript("OnLeave", nil)
  ExpressYourElf_GiftButton:SetScript("OnEnter", nil)
  ExpressYourElf_GiftButton:SetScript("OnLeave", nil)
  ExpressYourElf_RudeButton:SetScript("OnEnter", nil)
  ExpressYourElf_RudeButton:SetScript("OnLeave", nil)
  ExpressYourElf_FlirtButton:SetScript("OnEnter", nil)
  ExpressYourElf_FlirtButton:SetScript("OnLeave", nil)
  ExpressYourElf_SeduceButton:SetScript("OnEnter", nil)
  ExpressYourElf_SeduceButton:SetScript("OnLeave", nil)
  ExpressYourElf_RandomButton:SetScript("OnEnter", nil)
  ExpressYourElf_RandomButton:SetScript("OnLeave", nil)

  ExpressYourElf_ComplimentButton:SetScript("OnEnter", nil)
  ExpressYourElf_ComplimentButton:SetScript("OnLeave", nil)
  ExpressYourElf_JokeButton:SetScript("OnEnter", nil)
  ExpressYourElf_JokeButton:SetScript("OnLeave", nil)

  if ExpressYourElf_DancingButton:IsEnabled() then
    local danceText = "Dance"
    if (targetName ~= nil) then
      danceText = "Dance with " .. targetName
    end

    ExpressYourElf_DancingButton:SetScript("OnEnter", function(self)
      AltGameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
      AltGameTooltip:SetScale(scale)
      AltGameTooltip:SetText(danceText, 1.0, 0.82, 0.0, 1, true)
      AltGameTooltip:Show()
    end)
    ExpressYourElf_DancingButton:SetScript("OnLeave", function(self)
      AltGameTooltip:Hide()
      AltGameTooltip:SetScale(1)
    end)
  end

  if ExpressYourElf_GiftButton:IsEnabled() then
    ExpressYourElf_GiftButton:SetScript("OnEnter", function(self)
      AltGameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
      AltGameTooltip:SetScale(scale)
      AltGameTooltip:SetText("Give a present to " .. targetName, 1.0, 0.82, 0.0, 1, true)
      AltGameTooltip:Show()
    end)
    ExpressYourElf_GiftButton:SetScript("OnLeave", function(self)
      AltGameTooltip:Hide()
      AltGameTooltip:SetScale(1)
    end)
  end

  if ExpressYourElf_RudeButton:IsEnabled() then
    ExpressYourElf_RudeButton:SetScript("OnEnter", function(self)
      AltGameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
      AltGameTooltip:SetScale(scale)
      AltGameTooltip:SetText("Be rude to " .. targetName, 1.0, 0.82, 0.0, 1, true)
      AltGameTooltip:Show()
    end)
    ExpressYourElf_RudeButton:SetScript("OnLeave", function(self)
      AltGameTooltip:Hide()
      AltGameTooltip:SetScale(1)
    end)
  end

  if ExpressYourElf_FlirtButton:IsEnabled() then
    ExpressYourElf_FlirtButton:SetScript("OnEnter", function(self)
      AltGameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
      AltGameTooltip:SetScale(scale)
      AltGameTooltip:SetText("Flirt with " .. targetName, 1.0, 0.82, 0.0, 1, true)
      AltGameTooltip:Show()
    end)
    ExpressYourElf_FlirtButton:SetScript("OnLeave", function(self)
      AltGameTooltip:Hide()
      AltGameTooltip:SetScale(1)
    end)
  end

  if ExpressYourElf_SeduceButton:IsEnabled() then
    ExpressYourElf_SeduceButton:SetScript("OnEnter", function(self)
      AltGameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
      AltGameTooltip:SetScale(scale)
      AltGameTooltip:SetText("Seduce " .. targetName, 1.0, 0.82, 0.0, 1, true)
      AltGameTooltip:Show()
    end)
    ExpressYourElf_SeduceButton:SetScript("OnLeave", function(self)
      AltGameTooltip:Hide()
      AltGameTooltip:SetScale(1)
    end)
  end

  if ExpressYourElf_RandomButton:IsEnabled() then
    local randomText = "Say something random"

    if (targetName ~= nil and UnitPlayerControlled("target")) then
      randomText = "Say something random to " .. targetName
    end

    ExpressYourElf_RandomButton:SetScript("OnEnter", function(self)
      AltGameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
      AltGameTooltip:SetScale(scale)
      AltGameTooltip:SetText(randomText, 1.0, 0.82, 0.0, 1, true)
      AltGameTooltip:Show()
    end)
    ExpressYourElf_RandomButton:SetScript("OnLeave", function(self)
      AltGameTooltip:Hide()
      AltGameTooltip:SetScale(1)
    end)
  end

  if ExpressYourElf_ComplimentButton:IsEnabled() then
    ExpressYourElf_ComplimentButton:SetScript("OnEnter", function(self)
      AltGameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
      AltGameTooltip:SetScale(scale)
      AltGameTooltip:SetText("Give a compliment to " .. targetName, 1.0, 0.82, 0.0, 1, true)
      AltGameTooltip:Show()
    end)
    ExpressYourElf_ComplimentButton:SetScript("OnLeave", function(self)
      AltGameTooltip:Hide()
      AltGameTooltip:SetScale(1)
    end)
  end

  if ExpressYourElf_JokeButton:IsEnabled() then
    ExpressYourElf_JokeButton:SetScript("OnEnter", function(self)
      AltGameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
      AltGameTooltip:SetScale(scale)
      AltGameTooltip:SetText("Tell a joke", 1.0, 0.82, 0.0, 1, true)
      AltGameTooltip:Show()
    end)
    ExpressYourElf_JokeButton:SetScript("OnLeave", function(self)
      AltGameTooltip:Hide()
      AltGameTooltip:SetScale(1)
    end)
  end
end

function ExpressYourElf_SetScale(scale)
  local newValue = math.floor(scale * 100) / 100
  ExpressYourElf_Frame:SetScale(newValue)
  ExpressYourElfVars.interfaceScale = newValue
end

function ExpressYourElf_ShowButtons()
  ExpressYourElf_Frame:Show()
  ExpressYourElfVars.isShown = true -- same key as read on load ("IsShown" was never read back)
end

function ExpressYourElf_HideButtons()
  ExpressYourElf_Frame:Hide()
  ExpressYourElfVars.isShown = false
end

function ExpressYourElf_AllowMatureContent()
  ExpressYourElfVars.allowMatureContent = true
  ExpressYourElf_SeduceButton:Enable()
  ExpressYourElf_SeduceButton:SetAlpha(1)
end

function ExpressYourElf_DisallowMatureContent()
  ExpressYourElfVars.allowMatureContent = false
  ExpressYourElf_SeduceButton:Disable()
  ExpressYourElf_SeduceButton:SetAlpha(0.3)
end

function ExpressYourElf_AllowYoMamaContent()
  ExpressYourElfVars.allowYoMamaContent = true
end

function ExpressYourElf_DisallowYoMamaContent()
  ExpressYourElfVars.allowYoMamaContent = false
end

function ExpressYourElf_ConsentToFlirt()
  ExpressYourElfVars.flirtConsent = true
  ExpressYourElf_FlirtButton:Enable()
  ExpressYourElf_FlirtButton:SetAlpha(1)

  if ExpressYourElfVars.allowMatureContent then
    ExpressYourElf_SeduceButton:Enable()
    ExpressYourElf_SeduceButton:SetAlpha(1)
  end
end

function ExpressYourElf_DoNotConsentToFlirt()
  ExpressYourElfVars.flirtConsent = false
  ExpressYourElf_SeduceButton:Disable()
  ExpressYourElf_FlirtButton:Disable()
  ExpressYourElf_SeduceButton:SetAlpha(0.3)
  ExpressYourElf_FlirtButton:SetAlpha(0.3)
end

local function allConversationButtons()
  return {
    ExpressYourElf_DancingButton, ExpressYourElf_RandomButton, ExpressYourElf_RudeButton,
    ExpressYourElf_ComplimentButton, ExpressYourElf_GiftButton, ExpressYourElf_FlirtButton,
    ExpressYourElf_SeduceButton, ExpressYourElf_JokeButton,
  }
end

-- Collapse (only the title bar stays) or expand the conversation buttons.
-- option: true = collapse, false = expand, nil = toggle.
function ExpressYourElf_ToggleMinimize(option)
  local collapse = option
  if (collapse == nil) then
    collapse = not ExpressYourElfVars.minimized
  end
  ExpressYourElfVars.minimized = collapse

  for _, button in ipairs(allConversationButtons()) do
    if (collapse) then
      button:Hide()
    else
      button:Show()
    end
  end
  ExpressYourElf_Frame:SetHeight(collapse and 1 or 125)

  -- title bar button: "+" expands, "-" collapses
  local collapseButton = ExpressYourElf_Frame_CollapseButton
  if (collapseButton) then
    local icon = collapse and "Plus" or "Minus"
    collapseButton:SetNormalTexture("Interface\\Buttons\\UI-" .. icon .. "Button-Up")
    collapseButton:SetPushedTexture("Interface\\Buttons\\UI-" .. icon .. "Button-Down")
    if (GameTooltip:IsOwned(collapseButton)) then
      GameTooltip:SetText(collapse and "Expand" or "Collapse")
    end
  end
end

-- Moving ----------------------------------------------------------------------------------------
-- The buttons are moved with Blizzard's Edit Mode (Esc > Edit Mode). WoW versions without Edit Mode
-- keep moving by dragging the title bar. WoW remembers the position of a moved frame by itself.

local hasEditMode = EventRegistry ~= nil and EventRegistry.RegisterCallback ~= nil and EditModeManagerFrame ~= nil
local isEditing = false
local dragHandle

function ExpressYourElf_CanMove()
  return isEditing or not hasEditMode
end

local function placeDragHandle()
  local frame = ExpressYourElf_Frame
  dragHandle:ClearAllPoints()

  if (isEditing) then
    -- the whole bar, including the title above it
    dragHandle:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 22)
    dragHandle:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    dragHandle.highlight:Show()
    dragHandle:Show()
  elseif (not hasEditMode) then
    -- versions without Edit Mode: drag the title bar
    dragHandle:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 22)
    dragHandle:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", 0, -2)
    dragHandle.highlight:Hide()
    dragHandle:Show()
  else
    dragHandle:Hide()
  end
end

local function setEditing(editing)
  local frame = ExpressYourElf_Frame
  isEditing = editing

  if (editing) then
    -- show the bar while editing, even when it is hidden with /eyelf hide
    frame.hiddenBeforeEditMode = not frame:IsShown()
    frame:Show()
  else
    frame:StopMovingOrSizing()
    if (frame.hiddenBeforeEditMode) then
      frame:Hide()
    end
    frame.hiddenBeforeEditMode = nil
  end

  placeDragHandle()
end

-- called once on ADDON_LOADED (see ConversationButtons/Interface.xml)
function ExpressYourElf_SetupMoving()
  if (dragHandle) then
    return
  end

  local frame = ExpressYourElf_Frame
  dragHandle = CreateFrame("Frame", "ExpressYourElf_Frame_DragHandle", frame)
  dragHandle:SetFrameLevel(frame:GetFrameLevel() + 20)
  dragHandle:EnableMouse(true)
  dragHandle:RegisterForDrag("LeftButton")
  dragHandle:SetScript("OnDragStart", function()
    if (ExpressYourElf_CanMove()) then
      frame:StartMoving()
    end
  end)
  dragHandle:SetScript("OnDragStop", function()
    frame:StopMovingOrSizing()
  end)

  -- Edit Mode look: translucent blue selection
  dragHandle.highlight = dragHandle:CreateTexture(nil, "OVERLAY")
  dragHandle.highlight:SetAllPoints()
  dragHandle.highlight:SetColorTexture(0.25, 0.55, 1, 0.35)

  -- keep the collapse button clickable above the drag handle
  ExpressYourElf_Frame_CollapseButton:SetFrameLevel(dragHandle:GetFrameLevel() + 5)

  if (hasEditMode) then
    EventRegistry:RegisterCallback("EditMode.Enter", function() setEditing(true) end, ExpressYourElf)
    EventRegistry:RegisterCallback("EditMode.Exit", function() setEditing(false) end, ExpressYourElf)
  end

  placeDragHandle()
end

-- function ExpressYourElf_BombsGoBurrOn()
--     ExpressYourElfVars.bombsGoBurrIsOn = true
-- end

-- function ExpressYourElf_BombsGoBurrOff()
--     ExpressYourElfVars.bombsGoBurrIsOn = false
-- end

function ExpressYourElf_DebugOn()
  print("Express Your Elf: Debug mode is now ON.")
  ExpressYourElfVars.debugMode = true
end

function ExpressYourElf_DebugOff()
  print("Express Your Elf: Debug mode is now OFF.")
  ExpressYourElfVars.debugMode = false
end

local function ExpressYourElf_Init(msg)
  -- pattern matching that skips leading whitespace and whitespace between cmd and args
  -- any whitespace at end of args is retained
  local _, _, cmd, args = string.find(msg, "%s?(%w+)%s?(.*)")

  if cmd == "dance" then
    ExpressYourElf.DanceWithMe.run()
  elseif cmd == "compliment" then
    ExpressYourElf.Compliment.run()
  elseif cmd == "reset" then
    ExpressYourElfVars = nil
    if (ExpressYourElfVars == nil) then
      print("Express your Elf has been reset. You should now type /reload.")
    end
  elseif cmd == "show" then
    ExpressYourElf_ShowButtons()
  elseif cmd == "hide" then
    ExpressYourElf_HideButtons()
  elseif cmd == "debug" then
    if (ExpressYourElfVars and ExpressYourElfVars.debugMode) then
      ExpressYourElf_DebugOff()
      return
    end

    if (not ExpressYourElfVars or ExpressYourElfVars and ExpressYourElfVars.debugMode == false) then
      ExpressYourElf_DebugOn()
    end
    local dumpedVars = dump(ExpressYourElfVars)
    print("Dumped EYELF Vars: " .. dumpedVars)
  else
    ExpressYourElf_ConfigScreen:Show()
    -- If not handled above, display some sort of help message
    print("To show or hide the button ;interface, use one of these commands:")
    print("Syntax: /eyelf show")
    print("Syntax: /eyelf hide")
    print("", "And to reset the vars")
    print("Syntax: /eyelf reset")
  end
end

SlashCmdList["EYELF"] = ExpressYourElf_Init

SLASH_EYELF1 = "/eyelf"
SLASH_EYELF2 = "/expressyourelf"
