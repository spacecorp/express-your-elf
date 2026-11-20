ExpressYourElf.Helpers = {}

function ExpressYourElf.Helpers.parseText(s, tab)
  return (s:gsub("($%b{})", function(w)
    return tab[w:sub(3, -2)] or w
  end))
end

function ExpressYourElf.Helpers.GetRandomWorld()
  local listOfWolds = { "Azeroth", "The Shadowlands", "Outland", "Argus", "Draenor" }

  return listOfWolds[fastrandom(1, #listOfWolds)]
end

function ExpressYourElf.Helpers.mergeTable(t1, t2)
  for i = 1, #t2 do
    t1[#t1 + 1] = t2[i]
  end
  return t1
end

function ExpressYourElf.Helpers.GetHisHer(gender)
  if (gender == "male") then
    return "His"
  end

  return "Her"
end

function ExpressYourElf.Helpers.GetHimHer(gender)
  if (gender == "male") then
    return "Him"
  end

  return "Her"
end

function ExpressYourElf.Helpers.GetHeShe(gender)
  if (gender == "male") then
    return "he"
  end

  return "she"
end

function ExpressYourElf.Helpers.GetSirMam(gender)
  if (gender == "male") then
    return "sir"
  end

  return "ma'm"
end

function ExpressYourElf.Helpers.oppositeBfGf(gender)
  if (gender == "male") then
    return "girlfriend"
  end

  return "boyfriend"
end

function ExpressYourElf.Helpers.GetGuyGirl(gender)
  if (gender == "male") then
    return "guy"
  end

  return "girl"
end

function ExpressYourElf.Helpers.GetManWoman(gender)
  if (gender == "male") then
    return "man"
  end

  return "woman"
end

function ExpressYourElf.Helpers.GetPoppaMomma(gender)
  if (gender == "male") then
    return "poppa"
  end

  return "momma"
end

-- WoW: Forever characters have a first and last name. There, UnitName/UnitFullName/GetPlayerInfoByGUID
-- return the surname in the second value, where other versions return the realm.
local isForever = (WOW_PROJECT_ID == (WOW_PROJECT_CAMELOT or 18))

local function joinName(firstName, secondValue)
  if (isForever and firstName and type(secondValue) == "string" and secondValue ~= "") then
    return firstName .. " " .. secondValue
  end

  return firstName
end

-- Returns "Firstname Lastname" on WoW: Forever, just the character name on other versions.
function ExpressYourElf.Helpers.GetUnitFullName(unit)
  return joinName(UnitName(unit))
end

-- First word of a (full) name, for comparing against hard-coded character names.
function ExpressYourElf.Helpers.GetFirstName(name)
  return name and name:match("^%S+") or name
end

-- UnitClass/GetPlayerInfoByGUID return a localized (and in some languages gendered) class name.
-- Map the language-neutral class token (e.g. "DEATHKNIGHT") to the English name in Constants.Class,
-- so comparisons like playerClass == Class.Paladin work on every game client.
-- Constants.lua loads after this file, so the lookup happens at call time.
local function getEnglishClassName(localizedClass, classToken)
  local classes = ExpressYourElf.Constants and ExpressYourElf.Constants.Class
  if (classes and type(classToken) == "string") then
    for key, englishName in pairs(classes) do
      if (string.upper(key) == classToken) then
        return englishName
      end
    end
  end

  return localizedClass
end

-- UnitRace/GetPlayerInfoByGUID also return a localized (and gendered) race name. Map the
-- language-neutral race token to the English name in Constants.Race. Most tokens equal the
-- Constants.Race key; these are the exceptions.
local raceTokenAliases = {
  Scourge = "Undead",
  EarthenDwarf = "Earthen",
  Harronir = "Haranir",
}

local function getEnglishRaceName(localizedRace, raceToken)
  local races = ExpressYourElf.Constants and ExpressYourElf.Constants.Race
  if (races and type(raceToken) == "string") then
    local key = raceTokenAliases[raceToken] or raceToken
    if races[key] then
      return races[key]
    end
  end

  return localizedRace
end

local function getCharacterinfo(target)
  local genderTable = { "neuter or unknown", "male", "female" }
  local playerClass, englishClass, classIndex = UnitClass(target)
  playerClass = getEnglishClassName(playerClass, englishClass)
  local name = ExpressYourElf.Helpers.GetUnitFullName(target)
  local unitLevel = UnitLevel(target)
  local gender = genderTable[UnitSex(target)]
  local race, raceEn = UnitRace(target)
  race = getEnglishRaceName(race, raceEn)

  return name, gender, playerClass, race, unitLevel
end

function ExpressYourElf.Helpers.GetTargetInformation()
  if UnitFullName("target") then
    return getCharacterinfo("target")
  end

  return nil
end

function ExpressYourElf.Helpers.GetTargetInformationByUID(uid)
  local genderTable = { "neutral or unknown", "male", "female" }
  local targetClass, engClass, targetRace, engRace, gender, targetName, server =
    GetPlayerInfoByGUID(uid)
  targetClass = getEnglishClassName(targetClass, engClass)
  targetRace = getEnglishRaceName(targetRace, engRace)
  targetName = joinName(targetName, server)
  -- UnitSex() does not accept GUIDs; GetPlayerInfoByGUID already returns the sex.
  local targetGender = genderTable[gender or 1]

  return targetName, targetGender, targetClass, targetRace
end

function ExpressYourElf.Helpers.GetPlayerInformation()
  return getCharacterinfo("player")
end

function ExpressYourElf.Helpers.GetScrabbleScore(input)
  local values = {
    A = 1,
    E = 1,
    I = 1,
    O = 1,
    U = 1,
    L = 1,
    N = 1,
    S = 1,
    T = 1,
    R = 1,
    D = 2,
    G = 2,
    B = 3,
    C = 3,
    M = 3,
    P = 3,
    F = 4,
    H = 4,
    V = 4,
    W = 4,
    Y = 4,
    K = 5,
    J = 8,
    X = 8,
    Q = 10,
    Z = 10,
  }

  local total = 0
  for i = 1, #input do
    local char = string.upper(string.sub(input, i, i))
    total = total + (values[char] or 0)
  end
  return total
end

function ExpressYourElf.Helpers.tableContainsValue(table, val)
  for index, value in ipairs(table) do
    if value == val then
      return true
    end
  end

  return false
end
