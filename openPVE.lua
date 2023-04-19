local Unlocker, awful, openPVE = ...

local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        ____moduleCache[file] = { value = (select("#", ...) > 0) and module(...) or module(file) }
        return ____moduleCache[file].value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["lualib_bundle"] = function(...) 
local function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

local function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

local function __TS__ClassExtends(target, base)
    target.____super = base
    local staticMetatable = setmetatable({__index = base}, base)
    setmetatable(target, staticMetatable)
    local baseMetatable = getmetatable(base)
    if baseMetatable then
        if type(baseMetatable.__index) == "function" then
            staticMetatable.__index = baseMetatable.__index
        end
        if type(baseMetatable.__newindex) == "function" then
            staticMetatable.__newindex = baseMetatable.__newindex
        end
    end
    setmetatable(target.prototype, base.prototype)
    if type(base.prototype.__index) == "function" then
        target.prototype.__index = base.prototype.__index
    end
    if type(base.prototype.__newindex) == "function" then
        target.prototype.__newindex = base.prototype.__newindex
    end
    if type(base.prototype.__tostring) == "function" then
        target.prototype.__tostring = base.prototype.__tostring
    end
end

local function __TS__ObjectValues(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = obj[key]
    end
    return result
end

local function __TS__ArrayIncludes(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    local k = fromIndex
    if fromIndex < 0 then
        k = len + fromIndex
    end
    if k < 0 then
        k = 0
    end
    for i = k + 1, len do
        if self[i] == searchElement then
            return true
        end
    end
    return false
end

return {
  __TS__Class = __TS__Class,
  __TS__New = __TS__New,
  __TS__ClassExtends = __TS__ClassExtends,
  __TS__ObjectValues = __TS__ObjectValues,
  __TS__ArrayIncludes = __TS__ArrayIncludes
}
 end,
["hunter.index"] = function(...) 
local ____exports = {}
____exports.load = function()
    openPVE.hunter = {}
    openPVE.hunter.beastMastery = awful.Actor:New({spec = 1, class = "hunter"})
    openPVE.hunter.beastMastery:Init(function()
    end)
end
return ____exports
 end,
["loader"] = function(...) 
local ____exports = {}
local hunter = require("hunter.index")
awful.ttd_enabled = true
awful.DevMode = true
hunter.load()
return ____exports
 end,
["core.lists"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local unitBlacklistData = {
    185685,
    185683,
    185680,
    165251,
    165108,
    165913,
    174175,
    171887,
    115484,
    190174,
    152703,
    151613,
    194999,
    174773,
    120651,
    101326
}
local unitStunBlacklistData = {
    195135,
    184331,
    184300,
    187033,
    185529,
    190404,
    186191,
    190609,
    184018,
    186121,
    186696,
    186208,
    196115,
    187240,
    186122,
    189729,
    187154,
    184020,
    186737,
    184131,
    197219,
    192955,
    190368,
    186226,
    186116,
    186124,
    191739,
    184124,
    184581,
    190401,
    186125,
    186644,
    184125,
    187192,
    184582,
    191164,
    186740,
    192333,
    195851,
    194316,
    190485,
    193944,
    199717,
    186151,
    189232,
    193457,
    189235,
    193462,
    189886,
    194897,
    190034,
    195927,
    195928,
    195929,
    195930,
    188252,
    197985,
    186338,
    186339,
    189472,
    186615,
    186616,
    187897,
    194315,
    198047,
    195265,
    188244,
    192800,
    190381,
    191847,
    194317,
    187139,
    196117,
    197698,
    196671,
    194401,
    191736,
    192680,
    56448,
    75652,
    76057,
    59547,
    56732,
    184580,
    104274,
    107435,
    97197,
    59873,
    97202,
    186107,
    99868,
    56762,
    97083,
    97084,
    96574,
    190403,
    97219,
    104217,
    76104,
    97081,
    95676,
    104270,
    104275,
    59552,
    104278,
    95833,
    59726,
    77700,
    200387,
    200035,
    101637,
    59051,
    105704,
    95674,
    94960,
    56439,
    75509,
    65317,
    76407,
    59553,
    191232,
    188673,
    190991,
    189719,
    197146,
    197147,
    197148,
    197149,
    196394,
    193330,
    189492,
    75829,
    196406,
    197697,
    198214,
    196679,
    104273,
    199027,
    199028,
    199029,
    199030,
    187768,
    187771,
    187772,
    189822,
    193154,
    193760,
    187767,
    184972,
    189617,
    189234,
    59546,
    186783,
    190496,
    191225,
    199333,
    192934,
    197801,
    190985,
    190245,
    192769,
    197298,
    190690,
    194649,
    192694,
    192696,
    189632,
    190405,
    187967,
    198343,
    199368,
    187593,
    197835,
    187598,
    197356,
    193232,
    169425,
    196856,
    169428,
    184986,
    186739,
    195138,
    186738,
    190686,
    197671,
    190688,
    168932,
    76518,
    200936,
    192761,
    169426,
    197793,
    190588,
    191222,
    196855,
    192764,
    191230,
    192767,
    197535,
    166473,
    164450,
    164556,
    102616,
    169769,
    165408,
    156827,
    165410,
    164218,
    164567,
    164804,
    164501,
    164517,
    164255,
    164967,
    164266,
    164267,
    162100,
    162103,
    162102,
    165318,
    163077,
    162058,
    162060,
    167410,
    166880,
    163157,
    166882,
    166945,
    164451,
    164461,
    164463,
    162317,
    162329,
    162309,
    165946,
    175616,
    176564,
    175646,
    176556,
    176555,
    176705,
    175806,
    175663,
    175546,
    180863,
    174175,
    167876,
    167612,
    167607,
    164557,
    173720,
    173714,
    173655,
    167111,
    165108,
    164926,
    173044,
    172981,
    167731,
    165919,
    165824,
    165197,
    165137,
    164578,
    163621,
    163620,
    162693,
    162689,
    171799,
    171455,
    171376,
    168058,
    162133,
    162099,
    162057,
    162047,
    162040,
    162038,
    171343,
    171184,
    170572,
    170483,
    169905,
    168942,
    168934,
    168326,
    167964,
    167962,
    170234,
    169893,
    167998,
    167538,
    167536,
    167534,
    167533,
    163086,
    162763,
    162744,
    169861,
    169498,
    168886,
    168396,
    168393,
    168153,
    165430,
    163894,
    163882,
    168844,
    168843,
    168845,
    168681,
    168318,
    163520,
    179334,
    178392,
    177808,
    179837,
    180091,
    180495,
    179842,
    179821,
    178165,
    178171,
    180429,
    171333,
    166608,
    164558,
    164555,
    164185,
    164929,
    168155,
    163915,
    169159,
    162059,
    162061,
    164414,
    162691,
    177269,
    181856,
    180773,
    183937,
    183707,
    183501,
    181224,
    181549,
    181551,
    181548,
    181546,
    180967,
    184915,
    181954,
    365120,
    181398,
    181334,
    182777,
    180990,
    150222,
    150712,
    153755,
    150159,
    150190,
    145185,
    144244,
    144246,
    144248,
    150396,
    144249,
    150397,
    151476,
    151773,
    152009,
    150160,
    150276,
    150169,
    150292,
    150168,
    114247,
    114350,
    116494,
    114790,
    114328,
    114261,
    114260,
    113971,
    114312,
    114262,
    115388,
    115395,
    115406,
    115401,
    115407,
    114330,
    114329,
    114522,
    114265,
    114598,
    114284,
    114251,
    114264,
    114895,
    189878,
    81305,
    80808,
    86231,
    80816,
    79852,
    83612,
    83613,
    83616,
    77803,
    77816,
    79545,
    80005,
    190128,
    114675
}
local kickCastData = {
    388635,
    388631,
    385553,
    374623,
    387982,
    384273,
    372315,
    372394,
    265089,
    265091,
    278755,
    265433,
    265487,
    260879,
    266106,
    265668,
    266201,
    272183,
    266209,
    272180,
    397888,
    397801,
    397889,
    395859,
    395872,
    369675,
    369674,
    369603,
    369399,
    369400,
    377500,
    369823,
    395427,
    372615,
    396925,
    374544,
    382474,
    381770,
    373804,
    385029,
    378155,
    377950,
    367500,
    382249,
    374066,
    374339,
    374080,
    389443,
    375384,
    374706,
    374563,
    377402,
    377341,
    375950,
    396812,
    388862,
    377389,
    396640,
    387843,
    388863,
    387564,
    373932,
    371306,
    386546,
    389804,
    377503,
    377488,
    375602,
    384365,
    386024,
    386012,
    387606,
    387411,
    376725,
    386490,
    392924,
    372743,
    371984,
    373017,
    392451,
    385310,
    392398,
    373803,
    384194,
    198595,
    198931,
    198934,
    198962,
    192563,
    192288,
    199726,
    198750,
    215433,
    210261,
    215204,
    209485,
    209404,
    209413,
    225100,
    211299,
    211470,
    211406,
    208165,
    209033,
    156717,
    152964,
    156718,
    153524,
    398206,
    228254,
    228239,
    228700,
    227628,
    227592,
    228255,
    228991,
    228025,
    227917,
    232115,
    226344,
    227616,
    227800,
    227987,
    228019,
    227420,
    227341,
    228279,
    226316,
    227578,
    228606,
    228280,
    228277,
    229307,
    228625,
    227543,
    227542,
    228278,
    228086,
    227999,
    228528,
    241828,
    166398,
    166335,
    176032,
    165122,
    164426,
    178154,
    173307,
    299475,
    319070,
    329239,
    328094,
    321999,
    322358,
    328338,
    328651,
    332329,
    332706,
    332666,
    332612,
    332084,
    321764,
    333875,
    334076,
    332605,
    332196,
    332234,
    320008,
    319654,
    321038,
    322433,
    321105,
    334653,
    335305,
    326952,
    325700,
    325876,
    326607,
    328322,
    323538,
    323552,
    325701,
    322938,
    324914,
    324776,
    321828,
    326046,
    337235,
    322450,
    340544,
    337251,
    337253,
    327413,
    317936,
    317963,
    328295,
    328137,
    328331,
    327648,
    341902,
    341969,
    342139,
    330562,
    330868,
    330784,
    330810,
    333231,
    341977,
    330586,
    342675,
    324589,
    334748,
    320462,
    324293,
    320170,
    338353,
    333623,
    328667,
    323190,
    335143,
    357188,
    355934,
    355057,
    355225,
    346980,
    352347,
    354297,
    357284,
    356031,
    350922,
    353835,
    347775,
    355642,
    349934,
    347015,
    358344,
    356133,
    357260,
    351119,
    360177,
    364030,
    362383,
    360259,
    365008,
    365385,
    300650,
    300414,
    300171,
    299588,
    300087,
    298669,
    300514,
    300436,
    301629,
    284219,
    301689,
    301088,
    293930,
    293729,
    300764,
    356407,
    355641
}
local kickChannelingData = {
    397914,
    396073,
    369603,
    384808,
    198959,
    211401,
    207980,
    156776,
    372743,
    373680
}
local kickChanneledData = {388392, 377344, 375596}
local stunCastData = {
    397899,
    209027,
    378818,
    384961,
    396812,
    370225,
    386526,
    383823,
    387440,
    387135,
    372735,
    212784,
    211464,
    164192,
    332329,
    332671,
    332156,
    334664,
    326450,
    325701,
    324987,
    317936,
    317661,
    321935,
    328429,
    336451,
    328651,
    328400,
    322169,
    320822,
    321807,
    334747,
    330586,
    355132,
    355640,
    347721,
    355057,
    294103,
    293861
}
local stunChanneledData = {163966}
local stunChannelingData = {
    265568,
    265540,
    265542,
    385536,
    369465,
    378282,
    385141,
    387618,
    387910,
    211401,
    156776,
    328177,
    331743,
    332671,
    332156,
    325701,
    324987,
    317936,
    317661,
    333540,
    294103,
    228200
}
local bypassThreatData = {197398, 195138, 194999}
____exports.Dictionnary = __TS__Class()
local Dictionnary = ____exports.Dictionnary
Dictionnary.name = "Dictionnary"
function Dictionnary.prototype.____constructor(self, list)
    self._dictionary = {}
    for ____, key in ipairs(list) do
        self._dictionary[key] = true
    end
end
function Dictionnary.prototype.has(self, key)
    return self._dictionary[key]
end
____exports.unitBlacklist = __TS__New(____exports.Dictionnary, unitBlacklistData)
____exports.unitStunBlacklist = __TS__New(____exports.Dictionnary, unitStunBlacklistData)
____exports.kickCast = __TS__New(____exports.Dictionnary, kickCastData)
____exports.kickChanneling = __TS__New(____exports.Dictionnary, kickChannelingData)
____exports.kickChanneled = __TS__New(____exports.Dictionnary, kickChanneledData)
____exports.stunCast = __TS__New(____exports.Dictionnary, stunCastData)
____exports.stunChanneled = __TS__New(____exports.Dictionnary, stunChanneledData)
____exports.stunChanneling = __TS__New(____exports.Dictionnary, stunChannelingData)
____exports.bypassThreat = __TS__New(____exports.Dictionnary, bypassThreatData)
____exports.enemyBuffs = {inspiringPresence = 343502, sentinelsWatch = 215435, iceShield = 372749, iceBulwark = 372988}
return ____exports
 end,
["core.simc"] = function(...) 
local ____exports = {}
____exports.fullRechargeTime = function(spell)
    local currentCharges, maxCharges, cooldownStart, cooldownDuration = GetSpellCharges(spell.id)
    if not currentCharges then
        return 0
    end
    local currentChargeTime = (currentCharges or 0) < (maxCharges or 0) and cooldownDuration - (GetTime() - (cooldownStart or 0)) or 0
    local leftChargesTotalTime = (maxCharges - currentCharges - 1) * cooldownDuration
    if currentCharges ~= maxCharges then
        return currentChargeTime + leftChargesTotalTime
    end
    return 0
end
____exports.regenRate = function()
    local ____, regenRate = awful.call("GetPowerRegen", awful.player.pointer)
    return regenRate
end
____exports.timeToMax = function()
    local player = awful.player
    local maxPower = player.powerMax
    local power = player.power
    return maxPower == power and 0 or (maxPower - power) * (1 / ____exports.regenRate())
end
____exports.executeTime = function(baseTime)
    local haste = awful.call("UnitSpellHaste", awful.player.pointer)
    return baseTime / (1 + haste / 100)
end
____exports.isRefreshable = function(unit, debuffId, duration)
    local remains = unit.debuffRemains(debuffId, awful.player)
    return remains <= (duration - remains) * 0.3
end
____exports.castRegen = function(spell, tooltip)
    if tooltip == nil then
        tooltip = 0
    end
    local regen = ____exports.regenRate()
    local castTime = spell.castTime
    if castTime == 0 or castTime < awful.gcd then
        castTime = awful.gcd
    end
    return regen * castTime + tooltip
end
____exports.isRefreshableBuff = function(unit, buffId, duration)
    local remains = unit.buffRemains(buffId)
    return remains <= (duration - remains) * 0.3
end
return ____exports
 end,
["core.enums.rotationMode"] = function(...) 
local ____exports = {}
local RotationMode = RotationMode or ({})
RotationMode.auto = 0
RotationMode[RotationMode.auto] = "auto"
RotationMode.st = 1
RotationMode[RotationMode.st] = "st"
____exports.default = RotationMode
return ____exports
 end,
["core.ui.init"] = function(...) 
local ____exports = {}
local green = {170, 211, 114, 1}
local white = {255, 255, 255, 1}
local dark = {21, 21, 21, 0.45}
____exports.projectTitle = "OpenPVE"
____exports.projectCmd = "opve"
local gui, settings, cmd = awful.UI:New(____exports.projectCmd, {title = ____exports.projectTitle, show = awful.DevMode, colors = {title = green, primary = white, accent = green, background = dark}})
local statusFrame = gui:StatusFrame({fontSize = 6, maxWidth = 450, colors = {background = dark}})
____exports.ui = {gui = gui, settings = settings, cmd = cmd, statusFrame = statusFrame}
____exports.varSettings = {
    minTTDVar = "minTTD",
    minTTDValueVar = "minTTDValue",
    cdsToggleVar = "cdsToggle",
    cdsDisableVar = "cdsDisable",
    cdsDisableValueVar = "cdsDisableValue",
    mCdsToggleVar = "mCdsToggle",
    mCdsDisableVar = "mCdsDisable",
    mCdsDisableValueVar = "mCdsDisableValue"
}
return ____exports
 end,
["core.ui.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("core.ui.init")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["core.ui.statusFrame.toggle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____init = require("core.ui.init")
local ui = ____init.ui
____exports.Toggle = __TS__Class()
local Toggle = ____exports.Toggle
Toggle.name = "Toggle"
function Toggle.prototype.____constructor(self, eVar, label)
    self._var = eVar
    ui.statusFrame:Toggle({
        label = label,
        var = self._var,
        onClick = function() return self:Invert() end,
        valueText = function() return self:ValueText() end
    })
end
function Toggle.prototype.ValueText(self)
    return self:Enabled() and "|cff00ff00ON" or "|cffff0000OFF"
end
function Toggle.prototype.Enabled(self)
    return ui.settings[self._var]
end
function Toggle.prototype.Invert(self)
    ui.settings[self._var] = not self:Enabled()
end
return ____exports
 end,
["core.ui.statusFrame.cooldownsToggle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____init = require("core.ui.init")
local ui = ____init.ui
local ____toggle = require("core.ui.statusFrame.toggle")
local Toggle = ____toggle.Toggle
____exports.CooldownsToggle = __TS__Class()
local CooldownsToggle = ____exports.CooldownsToggle
CooldownsToggle.name = "CooldownsToggle"
__TS__ClassExtends(CooldownsToggle, Toggle)
function CooldownsToggle.prototype.____constructor(self, eVar, disableVar, disableValueVar, label)
    Toggle.prototype.____constructor(self, eVar, label)
    self._lastCooldowns = 0
    self._disableVar = disableVar
    self._disableValueVar = disableValueVar
    awful.addUpdateCallback(function() return self:Update() end)
end
function CooldownsToggle.prototype.Invert(self)
    if not self:Enabled() then
        self._lastCooldowns = awful.time
    end
    Toggle.prototype.Invert(self)
end
function CooldownsToggle.prototype.Update(self)
    if self:Enabled() and ui.settings[self._disableVar] and awful.time - self._lastCooldowns > ui.settings[self._disableValueVar] then
        Toggle.prototype.Invert(self)
    end
end
return ____exports
 end,
["core.ui.statusFrame.rotationModeSwitch"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local ____exports = {}
local ____rotationMode = require("core.enums.rotationMode")
local RotationMode = ____rotationMode.default
local ____init = require("core.ui.init")
local ui = ____init.ui
____exports.RotationModeSwitch = __TS__Class()
local RotationModeSwitch = ____exports.RotationModeSwitch
RotationModeSwitch.name = "RotationModeSwitch"
function RotationModeSwitch.prototype.____constructor(self)
    self._var = "rotationMode"
    ui.statusFrame:Toggle({
        label = "Mode: ",
        var = self._var,
        valueText = function() return self:ValueText() end,
        onClick = function() return self:Invert() end
    })
    if not __TS__ArrayIncludes(
        __TS__ObjectValues(RotationMode),
        ui.settings[self._var]
    ) then
        ui.settings[self._var] = RotationMode.auto
    end
end
function RotationModeSwitch.prototype.ValueText(self)
    return "|cffbfff81" .. (self:Value() == RotationMode.auto and "Auto" or "ST")
end
function RotationModeSwitch.prototype.Invert(self)
    if self:Auto() then
        ui.settings[self._var] = RotationMode.st
    else
        ui.settings[self._var] = RotationMode.auto
    end
end
function RotationModeSwitch.prototype.Value(self)
    return ui.settings[self._var]
end
function RotationModeSwitch.prototype.Auto(self)
    return self:Value() == RotationMode.auto
end
function RotationModeSwitch.prototype.ST(self)
    return self:Value() == RotationMode.st
end
return ____exports
 end,
["core.ui.statusFrame.rotationToggle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____init = require("core.ui.init")
local ui = ____init.ui
____exports.RotationToggle = __TS__Class()
local RotationToggle = ____exports.RotationToggle
RotationToggle.name = "RotationToggle"
function RotationToggle.prototype.____constructor(self)
    ui.statusFrame:Toggle({
        label = "Status: ",
        var = "rotationToggle",
        valueText = function() return self:ValueText() end,
        onClick = function() return self:Invert() end
    })
end
function RotationToggle.prototype.ValueText(self)
    return awful.enabled and "|cff00ff00ON" or "|cffff0000OFF"
end
function RotationToggle.prototype.Invert(self)
    awful.enabled = not awful.enabled
end
return ____exports
 end,
["core.ui.statusFrame.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("core.ui.statusFrame.cooldownsToggle")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.ui.statusFrame.rotationModeSwitch")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.ui.statusFrame.rotationToggle")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.ui.statusFrame.toggle")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["core.ui.gui.widgets.separator"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.Separator = __TS__Class()
local Separator = ____exports.Separator
Separator.name = "Separator"
function Separator.prototype.____constructor(self, tab)
    tab:Text({text = "----------------------------------------"})
end
return ____exports
 end,
["core.ui.gui.widgets.checkbox"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local _____2E_2E = require("core.ui.index")
local ui = _____2E_2E.ui
____exports.Checkbox = __TS__Class()
local Checkbox = ____exports.Checkbox
Checkbox.name = "Checkbox"
function Checkbox.prototype.____constructor(self, tab, params)
    self._var = params.var
    tab:Checkbox(params)
end
function Checkbox.prototype.Enabled(self)
    return ui.settings[self._var]
end
function Checkbox.prototype.Toggle(self)
    ui.settings[self._var] = not self:Enabled()
end
return ____exports
 end,
["core.ui.gui.widgets.dropdown"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local _____2E_2E = require("core.ui.index")
local ui = _____2E_2E.ui
____exports.Dropdown = __TS__Class()
local Dropdown = ____exports.Dropdown
Dropdown.name = "Dropdown"
function Dropdown.prototype.____constructor(self, tab, params)
    self._var = params.var
    tab:Dropdown(params)
end
function Dropdown.prototype.Value(self)
    return ui.settings[self._var]
end
function Dropdown.prototype.Set(self, value)
    ui.settings[self._var] = value
end
return ____exports
 end,
["core.ui.gui.widgets.slider"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local _____2E_2E = require("core.ui.index")
local ui = _____2E_2E.ui
____exports.Slider = __TS__Class()
local Slider = ____exports.Slider
Slider.name = "Slider"
function Slider.prototype.____constructor(self, tab, params)
    self._var = params.var
    tab:Slider(params)
end
function Slider.prototype.Value(self)
    return ui.settings[self._var]
end
function Slider.prototype.Set(self, value)
    ui.settings[self._var] = value
end
return ____exports
 end,
["core.ui.gui.widgets.modes.cooldownMode"] = function(...) 
local ____exports = {}
____exports.CooldownMode = CooldownMode or ({})
____exports.CooldownMode.Always = 0
____exports.CooldownMode[____exports.CooldownMode.Always] = "Always"
____exports.CooldownMode.Toggle = 1
____exports.CooldownMode[____exports.CooldownMode.Toggle] = "Toggle"
____exports.CooldownMode.MiniToggle = 2
____exports.CooldownMode[____exports.CooldownMode.MiniToggle] = "MiniToggle"
____exports.CooldownMode.Never = 3
____exports.CooldownMode[____exports.CooldownMode.Never] = "Never"
return ____exports
 end,
["core.ui.gui.widgets.modes.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("core.ui.gui.widgets.modes.cooldownMode")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["core.ui.gui.widgets.options.cooldownOptions"] = function(...) 
local ____exports = {}
local ____cooldownMode = require("core.ui.gui.widgets.modes.cooldownMode")
local CooldownMode = ____cooldownMode.CooldownMode
____exports.cooldownOptions = {{label = "Always", value = CooldownMode.Always, tooltip = "Always use."}, {label = "On Toggle", value = CooldownMode.Toggle, tooltip = "Use on cooldowns &/or mini cooldowns toggle."}, {label = "On Mini Toggle", value = CooldownMode.MiniToggle, tooltip = "Use on mini cooldowns toggle."}, {label = "Never", value = CooldownMode.Never, tooltip = "Never use."}}
return ____exports
 end,
["core.ui.gui.widgets.options.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("core.ui.gui.widgets.options.cooldownOptions")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["core.ui.gui.widgets.cooldown"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local _____2E_2E = require("core.ui.index")
local ui = _____2E_2E.ui
local varSettings = _____2E_2E.varSettings
local ____dropdown = require("core.ui.gui.widgets.dropdown")
local Dropdown = ____dropdown.Dropdown
local ____modes = require("core.ui.gui.widgets.modes.index")
local CooldownMode = ____modes.CooldownMode
local ____options = require("core.ui.gui.widgets.options.index")
local cooldownOptions = ____options.cooldownOptions
____exports.Cooldown = __TS__Class()
local Cooldown = ____exports.Cooldown
Cooldown.name = "Cooldown"
__TS__ClassExtends(Cooldown, Dropdown)
function Cooldown.prototype.____constructor(self, tab, params)
    Dropdown.prototype.____constructor(
        self,
        tab,
        {
            var = params.var,
            header = params.usable and (awful.textureEscape(params.usable.id, 20) .. " - ") .. params.usable.name or params.header,
            options = cooldownOptions,
            tooltip = params.usable and params.usable.name .. " usage mode." or params.tooltip,
            default = params.default or CooldownMode.Toggle
        }
    )
end
function Cooldown.prototype.Usable(self, ignoreTTD)
    if ignoreTTD == nil then
        ignoreTTD = false
    end
    local value = self:Value()
    return (ignoreTTD or not ui.settings[varSettings.minTTDVar] or awful.FightRemains() > ui.settings[varSettings.minTTDValueVar]) and (value == CooldownMode.Always or (value == CooldownMode.Toggle or value == CooldownMode.MiniToggle) and ui.settings[varSettings.cdsToggleVar] or value == CooldownMode.MiniToggle and ui.settings[varSettings.mCdsToggleVar])
end
return ____exports
 end,
["core.ui.gui.widgets.defensive"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.Defensive = __TS__Class()
local Defensive = ____exports.Defensive
Defensive.name = "Defensive"
function Defensive.prototype.____constructor(self, tab, params)
    self.checkbox = tab:Checkbox({
        var = params.var .. "State",
        text = params.usable and (awful.textureEscape(params.usable.id, 20) .. " - ") .. params.usable.name or (params.checkboxText or "TO_REPLACE"),
        tooltip = params.usable and ("Use " .. params.usable.name) .. " as a defensive." or params.checkboxTooltip,
        default = params.enabled
    })
    self.slider = tab:Slider({
        var = params.var .. "Value",
        text = "",
        tooltip = params.usable and ("Minimum health to use " .. params.usable.name) .. " as a defensive." or params.sliderTooltip,
        default = params.minHp,
        min = 0,
        max = 100,
        step = 1
    })
end
function Defensive.prototype.Usable(self)
    return self.checkbox:Enabled() and awful.player.hp <= self.slider:Value()
end
return ____exports
 end,
["core.ui.gui.widgets.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("core.ui.gui.widgets.checkbox")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.ui.gui.widgets.dropdown")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.ui.gui.widgets.slider")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.ui.gui.widgets.cooldown")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.ui.gui.widgets.defensive")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["core.ui.gui.widgets.delay"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.Delay = __TS__Class()
local Delay = ____exports.Delay
Delay.name = "Delay"
function Delay.prototype.____constructor(self, tab, params)
    self._delays = {}
    self._minDelay = tab:Slider({
        var = params.var .. "Min",
        text = params.text .. " min delay",
        tooltip = "Minimum delay to " .. params.text,
        min = 0,
        max = 2,
        default = 0.1,
        valueType = "s",
        step = 0.1
    })
    self._maxDelay = tab:Slider({
        var = params.var .. "Max",
        text = params.text .. " max delay",
        tooltip = "Maximum delay to " .. params.text,
        min = 0,
        max = 2,
        default = 0.25,
        valueType = "s",
        step = 0.1
    })
end
function Delay.prototype.Delay(self)
    local min = self._minDelay:Value()
    local max = self._maxDelay:Value()
    if not self._delays[min] then
        self._delays[min] = {}
    end
    if not self._delays[min][max] then
        self._delays[min][max] = awful.delay(min, max)
    end
    return self._delays[min][max].now
end
return ____exports
 end,
["core.ui.gui.widgets.header"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.Header = __TS__Class()
local Header = ____exports.Header
Header.name = "Header"
function Header.prototype.____constructor(self, tab, params)
    tab:Text(params)
end
return ____exports
 end,
["core.ui.gui.tab"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local _____2E_2E = require("core.ui.index")
local ui = _____2E_2E.ui
local ____separator = require("core.ui.gui.widgets.separator")
local Separator = ____separator.Separator
local ____widgets = require("core.ui.gui.widgets.index")
local Checkbox = ____widgets.Checkbox
local Dropdown = ____widgets.Dropdown
local Slider = ____widgets.Slider
local Cooldown = ____widgets.Cooldown
local Defensive = ____widgets.Defensive
local ____delay = require("core.ui.gui.widgets.delay")
local Delay = ____delay.Delay
local ____header = require("core.ui.gui.widgets.header")
local Header = ____header.Header
____exports.Tab = __TS__Class()
local Tab = ____exports.Tab
Tab.name = "Tab"
function Tab.prototype.____constructor(self, name, group)
    self._tab = group and group:Tab(name) or ui.gui:Tab(name)
end
function Tab.prototype.Checkbox(self, params)
    return __TS__New(Checkbox, self._tab, params)
end
function Tab.prototype.Dropdown(self, params)
    return __TS__New(Dropdown, self._tab, params)
end
function Tab.prototype.Slider(self, params)
    return __TS__New(Slider, self._tab, params)
end
function Tab.prototype.Text(self, params)
    self._tab:Text(params)
end
function Tab.prototype.Cooldown(self, params)
    return __TS__New(Cooldown, self._tab, params)
end
function Tab.prototype.Defensive(self, params)
    return __TS__New(Defensive, self, params)
end
function Tab.prototype.Separator(self)
    __TS__New(Separator, self._tab)
end
function Tab.prototype.Header(self, params)
    __TS__New(Header, self._tab, params)
end
function Tab.prototype.Delay(self, params)
    return __TS__New(Delay, self, params)
end
return ____exports
 end,
["core.ui.gui.group"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local _____2E_2E = require("core.ui.index")
local ui = _____2E_2E.ui
local ____tab = require("core.ui.gui.tab")
local Tab = ____tab.Tab
____exports.Group = __TS__Class()
local Group = ____exports.Group
Group.name = "Group"
function Group.prototype.____constructor(self, params)
    self._group = ui.gui:Group(params)
end
function Group.prototype.Tab(self, name)
    return __TS__New(Tab, name, self._group)
end
return ____exports
 end,
["core.ui.gui.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("core.ui.gui.group")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.ui.gui.tab")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["core.ui.loader"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local _____2E = require("core.ui.index")
local varSettings = _____2E.varSettings
local ____statusFrame = require("core.ui.statusFrame.index")
local CooldownsToggle = ____statusFrame.CooldownsToggle
local RotationModeSwitch = ____statusFrame.RotationModeSwitch
local RotationToggle = ____statusFrame.RotationToggle
local ____gui = require("core.ui.gui.index")
local Tab = ____gui.Tab
____exports.rotationToggle = __TS__New(RotationToggle)
____exports.rotationMode = __TS__New(RotationModeSwitch)
____exports.cooldownsToggle = __TS__New(
    CooldownsToggle,
    varSettings.cdsToggleVar,
    varSettings.cdsDisableVar,
    varSettings.cdsDisableValueVar,
    "Cds: "
)
____exports.mCooldownsToggle = __TS__New(
    CooldownsToggle,
    varSettings.mCdsToggleVar,
    varSettings.mCdsDisableVar,
    varSettings.mCdsDisableValueVar,
    "M.Cds: "
)
____exports.generalTab = __TS__New(Tab, "General")
____exports.generalTab:Header({text = "Fight"})
____exports.startCombat = ____exports.generalTab:Checkbox({var = "startCombat", text = "Start Combat", tooltip = "Engage combat when the target is in range."})
____exports.generalTab:Separator()
____exports.generalTab:Header({text = "Targeting"})
____exports.autoTarget = ____exports.generalTab:Checkbox({var = "autoTarget", text = "Auto Target", tooltip = "Automatically swap to the best target when the current one dies."})
____exports.cooldownsTab = __TS__New(Tab, "Cooldowns")
____exports.cooldownsTab:Header({text = "TTD Checker"})
____exports.checkMinTTD = ____exports.cooldownsTab:Checkbox({var = varSettings.minTTDVar, text = "Check for minimum TTD", tooltip = "Check for minimum TTD before using cooldowns.", default = false})
____exports.minTTD = ____exports.cooldownsTab:Slider({
    var = varSettings.minTTDValueVar,
    text = "Minimum TTD",
    tooltip = "Minimum TTD to use cooldowns.",
    min = 0,
    max = 20,
    default = 8,
    valueType = "sec",
    step = 1
})
____exports.cooldownsTab:Separator()
____exports.cooldownsTab:Header({text = "Cooldowns Disabler"})
____exports.cdsDisabler = ____exports.cooldownsTab:Checkbox({var = varSettings.cdsDisableVar, text = "Disable Cooldowns", tooltip = "Disable cooldowns after a certain amount of time.", default = false})
____exports.cdsDisablerValue = ____exports.cooldownsTab:Slider({
    var = varSettings.cdsDisableValueVar,
    text = "Disable Cooldowns After",
    tooltip = "Disable cooldowns after set amount of time.",
    min = 0,
    max = 20,
    default = 6,
    valueType = "sec",
    step = 1
})
____exports.mCdsDisabler = ____exports.cooldownsTab:Checkbox({var = varSettings.mCdsDisableVar, text = "Disable Mini Cooldowns", tooltip = "Disable mini cooldowns after a certain amount of time.", default = false})
____exports.mCdsDisablerValue = ____exports.cooldownsTab:Slider({
    var = varSettings.mCdsDisableValueVar,
    text = "Disable Mini Cooldowns After",
    tooltip = "Disable mini cooldowns after set amount of time.",
    min = 0,
    max = 20,
    default = 6,
    valueType = "sec"
})
____exports.cooldownsTab:Separator()
local interruptsTab = __TS__New(Tab, "Interrupts")
interruptsTab:Header({text = "Conditions"})
____exports.whitelist = interruptsTab:Checkbox({var = "interruptWhitelist", text = "Whitelisted Only", tooltip = "Only interrupt spells on the whitelist.", default = false})
____exports.focus = interruptsTab:Checkbox({var = "interruptFocus", text = "Focus Only", tooltip = "Only interrupt spells from the focus target."})
____exports.minCastPercent = interruptsTab:Slider({
    var = "minCastPercent",
    text = "Min. cast %",
    tooltip = "Interrupt spells when they are at least this % cast.",
    min = 0,
    max = 100,
    default = 0,
    valueType = "%",
    step = 5
})
____exports.interruptDelay = interruptsTab:Delay({var = "interrupt", text = "Interrupt"})
____exports.generalTab:Separator()
interruptsTab:Header({text = "Spells"})
____exports.defensivesTab = __TS__New(Tab, "Defensives")
return ____exports
 end,
["hunter.callbacks"] = function(...) 
 end,
["hunter.lists"] = function(...) 
local ____exports = {}
____exports.hunterBuffs = {
    aspectOfTheTurtle = 186265,
    aspectOfTheWild = 193530,
    feignDeath = 5384,
    steadyFocus = 193534,
    trueShot = 288613,
    preciseShot = 260242,
    trickShots = 257622,
    bombardment = 386875,
    salvo = 400456,
    razorFragments = 388998,
    bulletstorm = 389020,
    lockAndLoad = 194594,
    deathblow = 378770,
    bestialWrath = 19574,
    coordinatedAssault = 360952,
    coordinatedAssaultEmpower = 361738,
    spearhead = 360966,
    mongooseFury = 259388,
    aspectOfTheEagle = 186289,
    deadlyDuo = 397568
}
____exports.petBuffs = {frenzy = 272790, beastCleave = 118455, mend = 136}
____exports.hunterDebuffs = {
    barbedShot = 217200,
    latentPoison = 378015,
    serpentSting = 271788,
    wildfireBomb = 269747,
    shrapnelBomb = 270339,
    internalBleeding = 270343,
    bloodseeker = 259277
}
____exports.hunterTalents = {
    callOfTheWild = 359844,
    wildCall = 185789,
    scentOfBlood = 193532,
    wildInstincts = 378442,
    alphaPredator = 269737,
    killCleave = 378207,
    beastCleave = 115939,
    trickShots = 257621,
    steadyFocus = 193533,
    chimaeraShot = 342049,
    serpentstalkersTrickery = 378888,
    salvo = 384791,
    volley = 260243,
    surgingShot = 391559,
    streamline = 260367,
    hydrasBite = 260241,
    poisonInjection = 378014,
    carefulAim = 260228,
    preciseShot = 260242,
    loneWolf = 155228,
    wildfireInfusion = 271014,
    vipersVenom = 268501,
    spearhead = 360966,
    deathChakram = 375891,
    coordinatedKill = 385739,
    ranger = 385695,
    intenseFocus = 385709,
    steelTrap = 162488,
    explosiveShot = 212431,
    stampede = 201430,
    wailingArrow = 392060
}
return ____exports
 end,
["hunter.rotation"] = function(...) 
 end,
["hunter.spells"] = function(...) 
local ____exports = {}
local newSpell = awful.NewSpell
____exports.autoShot = newSpell(75, {targeted = true, ranged = true, damage = "physical"})
____exports.barbedShot = newSpell(217200, {targeted = true, ranged = true, damage = "physical"})
____exports.barrage = newSpell(120360, {targeted = false, damage = "physical"})
____exports.killCommand = newSpell(34026, {targeted = true, ranged = true, damage = "physical"})
____exports.cobraShot = newSpell(193455, {targeted = true, ranged = true, damage = "physical"})
____exports.killShot = newSpell(53351, {targeted = true, ranged = true, damage = "physical"})
____exports.multiShot = newSpell(2643, {targeted = true, ranged = true, damage = "physical"})
____exports.serpentSting = newSpell(271788, {targeted = true, ranged = true, damage = "magic"})
____exports.aMurderofCrows = newSpell(131894, {targeted = true, ranged = true, damage = "physical"})
____exports.bestialWrath = newSpell(19574, {targeted = false})
____exports.bloodshed = newSpell(321530, {targeted = true, bleed = true, ranged = true, damage = "physical"})
____exports.aspectOfTheWild = newSpell(193530, {targeted = true, ranged = true, damage = "physical"})
____exports.callOfTheWild = newSpell(359844, {targeted = false})
____exports.explosiveShot = newSpell(212431, {targeted = true, ranged = true, damage = "magic"})
____exports.steelTrap = newSpell(162488, {targeted = false, ranged = true, radius = 3, damage = "physical"})
____exports.wailingArrow = newSpell(392060, {targeted = true, ranged = true, damage = "magic"})
____exports.deathChakram = newSpell(375891, {targeted = true, ranged = true, damage = "physical"})
____exports.direBeast = newSpell(120679, {targeted = true, ranged = true, damage = "magic"})
____exports.stampede = newSpell(201430, {targeted = false, ranged = true, damage = "physical"})
____exports.muzzle = newSpell(187707, {targeted = true})
____exports.freezingTrap = newSpell(187650, {ranged = true, cc = "stun", radius = 3, targeted = false})
____exports.tarTrap = newSpell(187698, {ranged = true, radius = 3, targeted = false})
____exports.flare = newSpell(1543, {ranged = true, radius = 10, targeted = false})
____exports.bindingShot = newSpell(109248, {ranged = true, radius = 5, targeted = false})
____exports.huntersMark = newSpell(257284, {targeted = true, ranged = true})
____exports.tranquilizingShot = newSpell(19801, {targeted = true, ranged = true})
____exports.intimidation = newSpell(19577, {targeted = true, ranged = true, ignoreFacing = true})
____exports.feignDeath = newSpell(5384, {targeted = false})
____exports.misdirection = newSpell(34477, {targeted = true, ranged = true, ignoreFacing = true})
____exports.disengage = newSpell(781, {targeted = false})
____exports.counterShot = newSpell(147362, {targeted = true, ranged = true})
____exports.exhilaration = newSpell(109304, {targeted = false})
____exports.aspectOfTheTurtle = newSpell(186265, {targeted = false})
____exports.survivalOfTheFittest = newSpell(264735, {targeted = false})
____exports.fortitudeOfTheBear = newSpell(388035, {targeted = false})
____exports.mendRevivePet = newSpell(982, {targeted = false})
____exports.callPet1 = newSpell(883, {targeted = false})
____exports.callPet2 = newSpell(83242, {targeted = false})
____exports.callPet3 = newSpell(83243, {targeted = false})
____exports.callPet4 = newSpell(83244, {targeted = false})
____exports.callPet5 = newSpell(83245, {targeted = false})
____exports.bloodFury = awful.NewSpell(20572, {targeted = false})
____exports.ancestralCall = awful.NewSpell(274738, {targeted = false})
____exports.fireblood = awful.NewSpell(265221, {targeted = false})
____exports.lightsJudgment = awful.NewSpell(255647, {targeted = false, ranged = true, radius = 5, damage = "magic"})
____exports.bagOfTricks = awful.NewSpell(312411, {targeted = true, ranged = true, damage = "physical"})
____exports.berserking = awful.NewSpell(26297, {targeted = false})
____exports.arcaneTorrent = awful.NewSpell(25046, {targeted = false})
return ____exports
 end,
["hunter.ui.gui.widgets.modes.misdirectionMode"] = function(...) 
local ____exports = {}
____exports.MisdirectionMode = MisdirectionMode or ({})
____exports.MisdirectionMode.Smart = 0
____exports.MisdirectionMode[____exports.MisdirectionMode.Smart] = "Smart"
____exports.MisdirectionMode.Engage = 1
____exports.MisdirectionMode[____exports.MisdirectionMode.Engage] = "Engage"
____exports.MisdirectionMode.Aggro = 2
____exports.MisdirectionMode[____exports.MisdirectionMode.Aggro] = "Aggro"
____exports.MisdirectionMode.Always = 3
____exports.MisdirectionMode[____exports.MisdirectionMode.Always] = "Always"
____exports.MisdirectionMode.Never = 4
____exports.MisdirectionMode[____exports.MisdirectionMode.Never] = "Never"
return ____exports
 end,
["hunter.ui.gui.widgets.modes.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("hunter.ui.gui.widgets.modes.misdirectionMode")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["hunter.ui.gui.widgets.options.misdirectionOptions"] = function(...) 
local ____exports = {}
local ____modes = require("hunter.ui.gui.widgets.modes.index")
local MisdirectionMode = ____modes.MisdirectionMode
____exports.misdirectionOptions = {
    {label = "Smart", value = MisdirectionMode.Smart, tooltip = "Use on engage and when taking aggro"},
    {label = "Engage", value = MisdirectionMode.Engage, tooltip = "Use on combat start."},
    {label = "Aggro", value = MisdirectionMode.Aggro, tooltip = "Use when taking aggro of a mob."},
    {label = "Always", value = MisdirectionMode.Always, tooltip = "Always use on cooldown."},
    {label = "Never", value = MisdirectionMode.Never, tooltip = "Never use."}
}
return ____exports
 end,
["hunter.ui.gui.widgets.options.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("hunter.ui.gui.widgets.options.misdirectionOptions")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["hunter.ui.gui.widgets.misdirectionModeSelector"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____widgets = require("core.ui.gui.widgets.index")
local Dropdown = ____widgets.Dropdown
local ____loader = require("core.ui.loader")
local generalTab = ____loader.generalTab
local spells = require("hunter.spells")
local ____modes = require("hunter.ui.gui.widgets.modes.index")
local MisdirectionMode = ____modes.MisdirectionMode
local ____options = require("hunter.ui.gui.widgets.options.index")
local misdirectionOptions = ____options.misdirectionOptions
____exports.MisdirectionModeSelector = __TS__Class()
local MisdirectionModeSelector = ____exports.MisdirectionModeSelector
MisdirectionModeSelector.name = "MisdirectionModeSelector"
__TS__ClassExtends(MisdirectionModeSelector, Dropdown)
function MisdirectionModeSelector.prototype.____constructor(self)
    local name = spells.misdirection.name
    Dropdown.prototype.____constructor(
        self,
        generalTab,
        {
            var = "missdirectionModdes",
            options = misdirectionOptions,
            header = (awful.textureEscape(spells.misdirection.id, 20) .. " - ") .. name,
            tooltip = name .. " usage mode.",
            default = MisdirectionMode.Smart
        }
    )
end
function MisdirectionModeSelector.prototype.OnEngage(self)
    return self:Value() == MisdirectionMode.Smart or self:Value() == MisdirectionMode.Engage
end
function MisdirectionModeSelector.prototype.OnAggro(self)
    return self:Value() == MisdirectionMode.Smart or self:Value() == MisdirectionMode.Aggro
end
function MisdirectionModeSelector.prototype.Always(self)
    return self:Value() == MisdirectionMode.Always
end
return ____exports
 end,
["hunter.ui.gui.widgets.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("hunter.ui.gui.widgets.misdirectionModeSelector")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["hunter.ui.statusFrame.petSlotSelector"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ui = require("core.ui.index")
local ui = ____ui.ui
____exports.PetSlotSelector = __TS__Class()
local PetSlotSelector = ____exports.PetSlotSelector
PetSlotSelector.name = "PetSlotSelector"
function PetSlotSelector.prototype.____constructor(self)
    self._var = "petSlot"
    ui.statusFrame:Toggle({
        label = "Pet: ",
        var = self._var,
        onClick = function() return self:Press() end,
        valueText = function() return self:ValueText() end
    })
    if not self:Value() then
        ui.settings[self._var] = 1
    end
end
function PetSlotSelector.prototype.ValueText(self)
    return "|cffbfff81" .. tostring(self:Value())
end
function PetSlotSelector.prototype.Press(self)
    self:Set(self:Value() + 1)
    if self:Value() > 5 then
        self:Set(0)
    end
end
function PetSlotSelector.prototype.Set(self, value)
    ui.settings[self._var] = value
end
function PetSlotSelector.prototype.Value(self)
    return ui.settings[self._var]
end
function PetSlotSelector.prototype.Enabled(self)
    return self:Value() ~= 0
end
function PetSlotSelector.prototype.Disabled(self)
    return self:Value() == 0
end
return ____exports
 end,
["hunter.ui.statusFrame.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("hunter.ui.statusFrame.petSlotSelector")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["hunter.ui.loader"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____modes = require("core.ui.gui.widgets.modes.index")
local CooldownMode = ____modes.CooldownMode
local ____loader = require("core.ui.loader")
local cooldownsTab = ____loader.cooldownsTab
local generalTab = ____loader.generalTab
local spells = require("hunter.spells")
local ____widgets = require("hunter.ui.gui.widgets.index")
local MisdirectionModeSelector = ____widgets.MisdirectionModeSelector
local ____statusFrame = require("hunter.ui.statusFrame.index")
local PetSlotSelector = ____statusFrame.PetSlotSelector
____exports.misdirectionMode = __TS__New(MisdirectionModeSelector)
____exports.maxSerpentSting = generalTab:Slider({
    var = "maxSerpentSting",
    text = "Max Serpent Sting",
    tooltip = "Maximum number of Serpent Sting active.",
    default = 2,
    min = 1,
    max = 5,
    step = 1
})
____exports.petSlot = __TS__New(PetSlotSelector)
____exports.aMurderofCrows = cooldownsTab:Cooldown({var = "aMurderofCrows", usable = spells.aMurderofCrows, default = CooldownMode.Always})
____exports.aspectOfTheWild = cooldownsTab:Cooldown({var = "aspectOfTheWild", usable = spells.aspectOfTheWild, default = CooldownMode.Toggle})
____exports.barrage = cooldownsTab:Cooldown({var = "barrage", usable = spells.barrage, default = CooldownMode.Always})
____exports.deathChakram = cooldownsTab:Cooldown({var = "deathChakram", usable = spells.deathChakram, default = CooldownMode.Always})
____exports.explosiveShot = cooldownsTab:Cooldown({var = "explosiveShot", usable = spells.explosiveShot, default = CooldownMode.Always})
____exports.stampede = cooldownsTab:Cooldown({var = "stampede", usable = spells.stampede, default = CooldownMode.Toggle})
____exports.steelTrap = cooldownsTab:Cooldown({var = "steelTrap", usable = spells.steelTrap, default = CooldownMode.Always})
____exports.wailingArrow = cooldownsTab:Cooldown({var = "wailingArrow", usable = spells.wailingArrow, default = CooldownMode.Always})
____exports.bestialWrath = cooldownsTab:Cooldown({var = "bestialWrath", usable = spells.bestialWrath, default = CooldownMode.MiniToggle})
____exports.bloodshed = cooldownsTab:Cooldown({var = "bloodshed", usable = spells.bloodshed, default = CooldownMode.Always})
____exports.callOfTheWild = cooldownsTab:Cooldown({var = "callOfTheWild", usable = spells.callOfTheWild, default = CooldownMode.Toggle})
____exports.direBeast = cooldownsTab:Cooldown({var = "direBeast", usable = spells.direBeast, default = CooldownMode.Always})
return ____exports
 end,
}
return require("loader", ...)
