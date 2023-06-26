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

local function __TS__StringIncludes(self, searchString, position)
    if not position then
        position = 1
    else
        position = position + 1
    end
    local index = string.find(self, searchString, position, true)
    return index ~= nil
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

local Error, RangeError, ReferenceError, SyntaxError, TypeError, URIError
do
    local function getErrorStack(self, constructor)
        local level = 1
        while true do
            local info = debug.getinfo(level, "f")
            level = level + 1
            if not info then
                level = 1
                break
            elseif info.func == constructor then
                break
            end
        end
        if __TS__StringIncludes(_VERSION, "Lua 5.0") then
            return debug.traceback(("[Level " .. tostring(level)) .. "]")
        else
            return debug.traceback(nil, level)
        end
    end
    local function wrapErrorToString(self, getDescription)
        return function(self)
            local description = getDescription(self)
            local caller = debug.getinfo(3, "f")
            local isClassicLua = __TS__StringIncludes(_VERSION, "Lua 5.0") or _VERSION == "Lua 5.1"
            if isClassicLua or caller and caller.func ~= error then
                return description
            else
                return (description .. "\n") .. tostring(self.stack)
            end
        end
    end
    local function initErrorClass(self, Type, name)
        Type.name = name
        return setmetatable(
            Type,
            {__call = function(____, _self, message) return __TS__New(Type, message) end}
        )
    end
    local ____initErrorClass_1 = initErrorClass
    local ____class_0 = __TS__Class()
    ____class_0.name = ""
    function ____class_0.prototype.____constructor(self, message)
        if message == nil then
            message = ""
        end
        self.message = message
        self.name = "Error"
        self.stack = getErrorStack(nil, self.constructor.new)
        local metatable = getmetatable(self)
        if metatable and not metatable.__errorToStringPatched then
            metatable.__errorToStringPatched = true
            metatable.__tostring = wrapErrorToString(nil, metatable.__tostring)
        end
    end
    function ____class_0.prototype.__tostring(self)
        return self.message ~= "" and (self.name .. ": ") .. self.message or self.name
    end
    Error = ____initErrorClass_1(nil, ____class_0, "Error")
    local function createErrorClass(self, name)
        local ____initErrorClass_3 = initErrorClass
        local ____class_2 = __TS__Class()
        ____class_2.name = ____class_2.name
        __TS__ClassExtends(____class_2, Error)
        function ____class_2.prototype.____constructor(self, ...)
            ____class_2.____super.prototype.____constructor(self, ...)
            self.name = name
        end
        return ____initErrorClass_3(nil, ____class_2, name)
    end
    RangeError = createErrorClass(nil, "RangeError")
    ReferenceError = createErrorClass(nil, "ReferenceError")
    SyntaxError = createErrorClass(nil, "SyntaxError")
    TypeError = createErrorClass(nil, "TypeError")
    URIError = createErrorClass(nil, "URIError")
end

local function __TS__ObjectGetOwnPropertyDescriptors(object)
    local metatable = getmetatable(object)
    if not metatable then
        return {}
    end
    return rawget(metatable, "_descriptors") or ({})
end

local function __TS__Delete(target, key)
    local descriptors = __TS__ObjectGetOwnPropertyDescriptors(target)
    local descriptor = descriptors[key]
    if descriptor then
        if not descriptor.configurable then
            error(
                __TS__New(
                    TypeError,
                    ((("Cannot delete property " .. tostring(key)) .. " of ") .. tostring(target)) .. "."
                ),
                0
            )
        end
        descriptors[key] = nil
        return true
    end
    target[key] = nil
    return true
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

local function __TS__ArrayForEach(self, callbackFn, thisArg)
    for i = 1, #self do
        callbackFn(thisArg, self[i], i - 1, self)
    end
end

local function __TS__CountVarargs(...)
    return select("#", ...)
end

local function __TS__SparseArrayNew(...)
    local sparseArray = {...}
    sparseArray.sparseLength = __TS__CountVarargs(...)
    return sparseArray
end

local function __TS__SparseArrayPush(sparseArray, ...)
    local args = {...}
    local argsLen = __TS__CountVarargs(...)
    local listLen = sparseArray.sparseLength
    for i = 1, argsLen do
        sparseArray[listLen + i] = args[i]
    end
    sparseArray.sparseLength = listLen + argsLen
end

local function __TS__SparseArraySpread(sparseArray)
    local _unpack = unpack or table.unpack
    return _unpack(sparseArray, 1, sparseArray.sparseLength)
end

return {
  __TS__Class = __TS__Class,
  __TS__Delete = __TS__Delete,
  __TS__New = __TS__New,
  __TS__ClassExtends = __TS__ClassExtends,
  __TS__ObjectValues = __TS__ObjectValues,
  __TS__ArrayIncludes = __TS__ArrayIncludes,
  __TS__ArrayForEach = __TS__ArrayForEach,
  __TS__SparseArrayNew = __TS__SparseArrayNew,
  __TS__SparseArrayPush = __TS__SparseArrayPush,
  __TS__SparseArraySpread = __TS__SparseArraySpread
}
 end,
["loader"] = function(...) 
awful.ttd_enabled = true
awful.DevMode = true
openPVE.hunter = {}
if awful.player.spec == "Beast Mastery" then
    local ____beastMastery = require("hunter.beastMastery")
    local bm = ____beastMastery.bm
    openPVE.hunter.beastMastery = awful.Actor:New({spec = 1, class = "hunter"})
    openPVE.hunter.beastMastery:Init(function() return bm() end)
end
 end,
["core.bigWigs"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Delete = ____lualib.__TS__Delete
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local BigWigsBars = BigWigsBars or ({})
BigWigsBars.Pull = "Pull"
local BigWigsTimeLine = __TS__Class()
BigWigsTimeLine.name = "BigWigsTimeLine"
function BigWigsTimeLine.prototype.____constructor(self)
    self.bars = {}
    awful.addUpdateCallback(function()
        self:run()
    end)
end
function BigWigsTimeLine.prototype.run(self)
    self:updateBars()
end
function BigWigsTimeLine.prototype.updateBars(self)
    if BigWigsEmphasizeAnchor == nil then
        return
    end
    for bar in pairs(BigWigsEmphasizeAnchor.bars) do
        if bar.remaining > 0.1 and (self.bars[bar.candyBarLabel.text] == nil or self.bars[bar.candyBarLabel.text].start ~= bar.start) then
            self.bars[bar.candyBarLabel.text] = bar
        end
    end
    for barName in pairs(self.bars) do
        if self.bars[barName].remaining < 0.1 then
            __TS__Delete(self.bars, barName)
        end
    end
end
function BigWigsTimeLine.prototype.pullTimer(self)
    return self.bars[BigWigsBars.Pull] and self.bars[BigWigsBars.Pull].remaining or 0
end
____exports.bigWigsTimeLine = __TS__New(BigWigsTimeLine)
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
    397386,
    404754,
    406210,
    406399,
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
local kickChanneledData = {405886, 388392, 377344, 375596}
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
____exports.enemyBuffs = {
    inspiringPresence = 343502,
    sentinelsWatch = 215435,
    iceShield = 372749,
    iceBulwark = 372988,
    overwhelmingEnergy = 384132,
    primalBarrier = 374779
}
____exports.kickImmuneData = {____exports.enemyBuffs.sentinelsWatch, ____exports.enemyBuffs.iceShield, ____exports.enemyBuffs.iceBulwark}
____exports.stunImmuneData = {____exports.enemyBuffs.inspiringPresence, ____exports.enemyBuffs.sentinelsWatch, ____exports.enemyBuffs.iceShield}
____exports.damageImmuneData = {____exports.enemyBuffs.overwhelmingEnergy, ____exports.enemyBuffs.primalBarrier}
____exports.Dictionnary = __TS__Class()
local Dictionnary = ____exports.Dictionnary
Dictionnary.name = "Dictionnary"
function Dictionnary.prototype.____constructor(self, list)
    self.dictionary = {}
    for ____, key in ipairs(list) do
        self.dictionary[key] = true
    end
end
function Dictionnary.prototype.has(self, key)
    return self.dictionary[key]
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
return ____exports
 end,
["core.components"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local ____exports = {}
local green = {170, 211, 114, 1}
local white = {255, 255, 255, 1}
local dark = {21, 21, 21, 0.45}
____exports.projectTitle = "OpenPVE"
____exports.projectCmd = "opve"
local gui, settings, cmd = awful.UI:New(____exports.projectCmd, {title = ____exports.projectTitle, show = awful.DevMode, colors = {title = green, primary = white, accent = green, background = dark}})
local statusFrame = gui:StatusFrame({fontSize = 6, maxWidth = 450, colors = {background = dark}})
____exports.awfulUI = {gui = gui, settings = settings, cmd = cmd, statusFrame = statusFrame}
____exports.varSettings = {
    minTTDVar = "minTTD",
    minTTDValueVar = "minTTDValue",
    cdsToggleVar = "cdsToggle",
    cdsDisableVar = "cdsDisable",
    cdsDisableValueVar = "cdsDisableValue",
    mCdsToggleVar = "mCdsToggle",
    mCdsDisableVar = "mCdsDisable",
    mCdsDisableValueVar = "mCdsDisableValue",
    interruptsVar = "interrupts",
    defensivesVar = "defensives"
}
____exports.Tab = __TS__Class()
local Tab = ____exports.Tab
Tab.name = "Tab"
function Tab.prototype.____constructor(self, name, group)
    self.tab = group and group:Tab(name) or gui:Tab(name)
end
function Tab.prototype.checkbox(self, params)
    return __TS__New(____exports.Checkbox, self.tab, params)
end
function Tab.prototype.dropdown(self, params)
    return __TS__New(____exports.Dropdown, self.tab, params)
end
function Tab.prototype.slider(self, params)
    return __TS__New(____exports.Slider, self.tab, params)
end
function Tab.prototype.text(self, params)
    self.tab:Text(params)
end
function Tab.prototype.cooldown(self, params)
    return __TS__New(____exports.Cooldown, self.tab, params)
end
function Tab.prototype.defensive(self, params, unit)
    return __TS__New(____exports.Defensive, self, params, unit)
end
function Tab.prototype.playerDefensive(self, params)
    return __TS__New(____exports.PlayerDefensive, self, params)
end
function Tab.prototype.petDefensive(self, params)
    return __TS__New(____exports.PetDefensive, self, params)
end
function Tab.prototype.interrupt(self, params)
    return __TS__New(____exports.Interrupt, self.tab, params)
end
function Tab.prototype.separator(self)
    __TS__New(____exports.Separator, self.tab)
end
function Tab.prototype.header(self, params)
    __TS__New(____exports.Header, self.tab, params)
end
function Tab.prototype.delay(self, params)
    return __TS__New(____exports.Delay, self, params)
end
function Tab.prototype.statusFrameHandler(self)
    return __TS__New(____exports.StatusFrameHandler, self.tab)
end
____exports.Group = __TS__Class()
local Group = ____exports.Group
Group.name = "Group"
function Group.prototype.____constructor(self, params)
    self.group = gui:Group(params)
end
function Group.prototype.tab(self, name)
    return __TS__New(____exports.Tab, name, self.group)
end
____exports.CooldownMode = CooldownMode or ({})
____exports.CooldownMode.Always = 0
____exports.CooldownMode[____exports.CooldownMode.Always] = "Always"
____exports.CooldownMode.Toggle = 1
____exports.CooldownMode[____exports.CooldownMode.Toggle] = "Toggle"
____exports.CooldownMode.MiniToggle = 2
____exports.CooldownMode[____exports.CooldownMode.MiniToggle] = "MiniToggle"
____exports.CooldownMode.Never = 3
____exports.CooldownMode[____exports.CooldownMode.Never] = "Never"
____exports.RotationMode = RotationMode or ({})
____exports.RotationMode.Auto = 0
____exports.RotationMode[____exports.RotationMode.Auto] = "Auto"
____exports.RotationMode.SingleTarget = 1
____exports.RotationMode[____exports.RotationMode.SingleTarget] = "SingleTarget"
____exports.cooldownOptions = {{label = "Always", value = ____exports.CooldownMode.Always, tooltip = "Always use."}, {label = "Toggle", value = ____exports.CooldownMode.Toggle, tooltip = "Use on cooldowns &/or mini cooldowns toggle."}, {label = "Mini Toggle", value = ____exports.CooldownMode.MiniToggle, tooltip = "Use on mini cooldowns toggle."}, {label = "Never", value = ____exports.CooldownMode.Never, tooltip = "Never use."}}
____exports.Checkbox = __TS__Class()
local Checkbox = ____exports.Checkbox
Checkbox.name = "Checkbox"
function Checkbox.prototype.____constructor(self, tab, params)
    self.var = params.var
    tab:Checkbox(params)
end
function Checkbox.prototype.enabled(self)
    return settings[self.var]
end
function Checkbox.prototype.toggle(self)
    settings[self.var] = not self:enabled()
end
____exports.StatusFrameHandler = __TS__Class()
local StatusFrameHandler = ____exports.StatusFrameHandler
StatusFrameHandler.name = "StatusFrameHandler"
__TS__ClassExtends(StatusFrameHandler, ____exports.Checkbox)
function StatusFrameHandler.prototype.____constructor(self, tab)
    StatusFrameHandler.____super.prototype.____constructor(self, tab, {var = "statusFrameDisabler", text = "Hide Status frame", tooltip = "Hides the status frame when enabled.", default = false})
    self.statusFrameVisible = true
    awful.addUpdateCallback(function() return self:update() end)
end
function StatusFrameHandler.prototype.update(self)
    if self.statusFrameVisible and self:enabled() then
        statusFrame:Hide()
        self.statusFrameVisible = not self.statusFrameVisible
    elseif not self.statusFrameVisible and not self:enabled() then
        statusFrame:Show()
        self.statusFrameVisible = not self.statusFrameVisible
    end
end
____exports.Dropdown = __TS__Class()
local Dropdown = ____exports.Dropdown
Dropdown.name = "Dropdown"
function Dropdown.prototype.____constructor(self, tab, params)
    self.var = params.var
    tab:Dropdown(params)
end
function Dropdown.prototype.value(self)
    return settings[self.var]
end
function Dropdown.prototype.set(self, value)
    settings[self.var] = value
end
____exports.Slider = __TS__Class()
local Slider = ____exports.Slider
Slider.name = "Slider"
function Slider.prototype.____constructor(self, tab, params)
    self.var = params.var
    tab:Slider(params)
end
function Slider.prototype.value(self)
    return settings[self.var]
end
function Slider.prototype.set(self, value)
    settings[self.var] = value
end
____exports.Header = __TS__Class()
local Header = ____exports.Header
Header.name = "Header"
function Header.prototype.____constructor(self, tab, params)
    tab:Text(params)
end
____exports.Separator = __TS__Class()
local Separator = ____exports.Separator
Separator.name = "Separator"
function Separator.prototype.____constructor(self, tab)
    tab:Text({text = "----------------------------------------"})
end
____exports.Defensive = __TS__Class()
local Defensive = ____exports.Defensive
Defensive.name = "Defensive"
function Defensive.prototype.____constructor(self, tab, params, unit)
    self.checkbox = tab:checkbox({
        var = params.var .. "State",
        text = params.usable and (awful.textureEscape(params.usable.id, 20) .. " - ") .. params.usable.name or (params.checkboxText or "TO_REPLACE"),
        tooltip = params.usable and ("Use " .. params.usable.name) .. " as a defensive." or params.checkboxTooltip,
        default = params.default
    })
    self.slider = tab:slider({
        var = params.var .. "Value",
        text = "",
        tooltip = params.usable and ("Minimum health to use " .. params.usable.name) .. " as a defensive." or params.sliderTooltip,
        default = params.minHP,
        min = 0,
        max = 100,
        step = 1
    })
    self.unit = function() return unit() end
end
function Defensive.prototype.usable(self)
    return self.checkbox:enabled() and self:unit().hp <= self.slider:value()
end
____exports.PlayerDefensive = __TS__Class()
local PlayerDefensive = ____exports.PlayerDefensive
PlayerDefensive.name = "PlayerDefensive"
__TS__ClassExtends(PlayerDefensive, ____exports.Defensive)
function PlayerDefensive.prototype.____constructor(self, tab, params)
    PlayerDefensive.____super.prototype.____constructor(
        self,
        tab,
        params,
        function() return awful.player end
    )
end
____exports.PetDefensive = __TS__Class()
local PetDefensive = ____exports.PetDefensive
PetDefensive.name = "PetDefensive"
__TS__ClassExtends(PetDefensive, ____exports.Defensive)
function PetDefensive.prototype.____constructor(self, tab, params)
    PetDefensive.____super.prototype.____constructor(
        self,
        tab,
        params,
        function() return awful.pet end
    )
end
____exports.Delay = __TS__Class()
local Delay = ____exports.Delay
Delay.name = "Delay"
function Delay.prototype.____constructor(self, tab, params)
    self.delays = {}
    self.minDelay = tab:slider({
        var = params.var .. "Min",
        text = params.text .. " min delay",
        tooltip = "Minimum delay to " .. params.text,
        min = 0,
        max = 2,
        default = 0.1,
        valueType = "s",
        step = 0.1
    })
    self.maxDelay = tab:slider({
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
function Delay.prototype.delay(self)
    local min = self.minDelay:value()
    local max = self.maxDelay:value()
    if not self.delays[min] then
        self.delays[min] = {}
    end
    if not self.delays[min][max] then
        self.delays[min][max] = awful.delay(min, max)
    end
    return self.delays[min][max].now
end
____exports.Cooldown = __TS__Class()
local Cooldown = ____exports.Cooldown
Cooldown.name = "Cooldown"
__TS__ClassExtends(Cooldown, ____exports.Dropdown)
function Cooldown.prototype.____constructor(self, tab, params)
    Cooldown.____super.prototype.____constructor(
        self,
        tab,
        {
            var = params.var,
            header = params.usable and (awful.textureEscape(params.usable.id, 20) .. " - ") .. params.usable.name or params.header,
            options = ____exports.cooldownOptions,
            tooltip = params.usable and params.usable.name .. " usage mode." or params.tooltip,
            default = params.default or ____exports.CooldownMode.Toggle
        }
    )
    self.traits = params.traits or ({})
end
function Cooldown.prototype.usable(self, traits)
    local value = self:value()
    local ____temp_2
    if (traits and traits.ignoreTTD) ~= nil then
        ____temp_2 = traits.ignoreTTD
    else
        ____temp_2 = self.traits.ignoreTTD
    end
    local ignoreTTD = ____temp_2
    return (ignoreTTD or not settings[____exports.varSettings.minTTDVar] or awful.FightRemains() > settings[____exports.varSettings.minTTDValueVar]) and (value == ____exports.CooldownMode.Always or (value == ____exports.CooldownMode.Toggle or value == ____exports.CooldownMode.MiniToggle) and settings[____exports.varSettings.cdsToggleVar] or value == ____exports.CooldownMode.MiniToggle and settings[____exports.varSettings.mCdsToggleVar])
end
____exports.Interrupt = __TS__Class()
local Interrupt = ____exports.Interrupt
Interrupt.name = "Interrupt"
__TS__ClassExtends(Interrupt, ____exports.Checkbox)
function Interrupt.prototype.____constructor(self, tab, params)
    Interrupt.____super.prototype.____constructor(
        self,
        tab,
        {
            var = params.var,
            text = params.usable and (awful.textureEscape(params.usable.id, 20) .. " - ") .. params.usable.name or (params.text or "TO_REPLACE"),
            tooltip = params.usable and ("Use  " .. params.usable.name) .. " to interrupt." or params.tooltip,
            default = params.default
        }
    )
end
function Interrupt.prototype.usable(self)
    return Interrupt.____super.prototype.enabled(self) and settings[____exports.varSettings.interruptsVar]
end
____exports.Trigger = __TS__Class()
local Trigger = ____exports.Trigger
Trigger.name = "Trigger"
function Trigger.prototype.____constructor(self, disableDelay)
    if disableDelay == nil then
        disableDelay = 1.5
    end
    self.enable = false
    self.timer = 0
    self.delay = disableDelay
    awful.addUpdateCallback(function() return self:update() end)
end
function Trigger.prototype.enabled(self)
    return self.enable
end
function Trigger.prototype.disable(self)
    self.enable = false
end
function Trigger.prototype.trigger(self)
    self.timer = awful.time
    self.enable = true
end
function Trigger.prototype.update(self)
    if self.timer < awful.time - self.delay then
        self.enable = false
    end
end
____exports.Toggle = __TS__Class()
local Toggle = ____exports.Toggle
Toggle.name = "Toggle"
function Toggle.prototype.____constructor(self, eVar, label)
    self.var = eVar
    statusFrame:Toggle({
        label = label,
        var = self.var,
        onClick = function() return self:invert() end,
        valueText = function() return self:valueText() end
    })
end
function Toggle.prototype.valueText(self)
    return self:enabled() and "|cff00ff00ON" or "|cffff0000OFF"
end
function Toggle.prototype.enabled(self)
    return settings[self.var]
end
function Toggle.prototype.invert(self)
    settings[self.var] = not self:enabled()
end
____exports.RotationModeSwitch = __TS__Class()
local RotationModeSwitch = ____exports.RotationModeSwitch
RotationModeSwitch.name = "RotationModeSwitch"
function RotationModeSwitch.prototype.____constructor(self)
    self.var = "rotationMode"
    statusFrame:Toggle({
        label = "Mode: ",
        var = self.var,
        valueText = function() return self:valueText() end,
        onClick = function() return self:invert() end
    })
    if not __TS__ArrayIncludes(
        __TS__ObjectValues(____exports.RotationMode),
        settings[self.var]
    ) then
        settings[self.var] = ____exports.RotationMode.Auto
    end
end
function RotationModeSwitch.prototype.valueText(self)
    return "|cffbfff81" .. (self:value() == ____exports.RotationMode.Auto and "Auto" or "ST")
end
function RotationModeSwitch.prototype.invert(self)
    if self:auto() then
        settings[self.var] = ____exports.RotationMode.SingleTarget
    else
        settings[self.var] = ____exports.RotationMode.Auto
    end
end
function RotationModeSwitch.prototype.value(self)
    return settings[self.var]
end
function RotationModeSwitch.prototype.auto(self)
    return self:value() == ____exports.RotationMode.Auto
end
function RotationModeSwitch.prototype.singleTarget(self)
    return self:value() == ____exports.RotationMode.SingleTarget
end
____exports.CooldownsToggle = __TS__Class()
local CooldownsToggle = ____exports.CooldownsToggle
CooldownsToggle.name = "CooldownsToggle"
__TS__ClassExtends(CooldownsToggle, ____exports.Toggle)
function CooldownsToggle.prototype.____constructor(self, eVar, disableVar, disableValueVar, label)
    CooldownsToggle.____super.prototype.____constructor(self, eVar, label)
    self.lastCooldowns = 0
    self.disableVar = disableVar
    self.disableValueVar = disableValueVar
    awful.addUpdateCallback(function() return self:update() end)
end
function CooldownsToggle.prototype.invert(self)
    if not self:enabled() then
        self.lastCooldowns = awful.time
    end
    CooldownsToggle.____super.prototype.invert(self)
end
function CooldownsToggle.prototype.update(self)
    if self:enabled() and settings[self.disableVar] and awful.time - self.lastCooldowns > settings[self.disableValueVar] then
        CooldownsToggle.____super.prototype.invert(self)
    end
end
____exports.RotationToggle = __TS__Class()
local RotationToggle = ____exports.RotationToggle
RotationToggle.name = "RotationToggle"
function RotationToggle.prototype.____constructor(self)
    statusFrame:Toggle({
        label = "Status: ",
        var = "rotationToggle",
        valueText = function() return self:valueText() end,
        onClick = function() return self:invert() end
    })
end
function RotationToggle.prototype.valueText(self)
    return awful.enabled and "|cff00ff00ON" or "|cffff0000OFF"
end
function RotationToggle.prototype.invert(self)
    awful.enabled = not awful.enabled
end
return ____exports
 end,
["core.spells"] = function(...) 
local ____exports = {}
____exports.bloodFury = awful.NewSpell(20572, {targeted = false})
____exports.ancestralCall = awful.NewSpell(274738, {targeted = false})
____exports.fireblood = awful.NewSpell(265221, {targeted = false})
____exports.lightsJudgment = awful.NewSpell(255647, {targeted = false, ranged = true, radius = 5})
____exports.bagOfTricks = awful.NewSpell(312411, {targeted = true, ranged = true, damage = "physical"})
____exports.berserking = awful.NewSpell(26297, {targeted = false})
____exports.arcaneTorrent = awful.NewSpell(25046, {targeted = false})
return ____exports
 end,
["core.items"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local trinketsCache = {}
local Trinket = __TS__Class()
Trinket.name = "Trinket"
function Trinket.prototype.____constructor(self, slot, options)
    self.slot = slot
    self.options = options or ({})
    self:updateAwfulItem()
end
function Trinket.prototype.getAwfulItem(self)
    local itemId = GetInventoryItemID("player", self.slot)
    if itemId == 0 then
        return nil
    end
    if trinketsCache[itemId] ~= nil then
        return trinketsCache[itemId]
    end
    local item = awful.NewItem(itemId)
    trinketsCache[itemId] = item
    return awful.NewItem(itemId)
end
function Trinket.prototype.updateAwfulItem(self)
    self.trinket = self:getAwfulItem()
end
function Trinket.prototype.canUse(self)
    local start, ____, enable = awful.call("GetInventoryItemCooldown", "player", self.slot)
    return enable == 1 and start == 0
end
function Trinket.prototype.ignoreGriefTorche(self, options)
    local ____temp_2 = options and options.ignoreGriefTorche
    if ____temp_2 == nil then
        ____temp_2 = self.options.ignoreGriefTorche
    end
    local ignoreGriefTorche = ____temp_2
    local ____temp_5 = ignoreGriefTorche == true
    if ____temp_5 then
        local ____opt_3 = self.trinket
        ____temp_5 = (____opt_3 and ____opt_3.id) == 194308
    end
    return ____temp_5
end
function Trinket.prototype.use(self, options)
    local player = awful.player
    if not self:canUse() then
        return false
    end
    self:updateAwfulItem()
    if self.trinket == nil then
        return false
    end
    if self.trinket.casttime > 0 and player.moving then
        return false
    end
    if self:ignoreGriefTorche(options) then
        return false
    end
    if self.trinket:Use(awful.target) then
        return true
    end
    return self.trinket:Use()
end
____exports.trinket1 = __TS__New(Trinket, 13)
____exports.trinket2 = __TS__New(Trinket, 14)
local newItem = awful.NewItem
____exports.healthStone = newItem(5512)
____exports.refreshingHealingPotionOne = newItem(191378)
____exports.refreshingHealingPotionTwo = newItem(191379)
____exports.refreshingHealingPotionThree = newItem(191380)
return ____exports
 end,
["core.ui"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____components = require("core.components")
local CooldownsToggle = ____components.CooldownsToggle
local RotationModeSwitch = ____components.RotationModeSwitch
local RotationToggle = ____components.RotationToggle
local Tab = ____components.Tab
local Toggle = ____components.Toggle
local varSettings = ____components.varSettings
local awfulUI = ____components.awfulUI
local CooldownMode = ____components.CooldownMode
local coreSpells = require("core.spells")
local coreItems = require("core.items")
____exports.rotation = __TS__New(RotationToggle)
____exports.mode = __TS__New(RotationModeSwitch)
____exports.cooldowns = __TS__New(
    CooldownsToggle,
    varSettings.cdsToggleVar,
    varSettings.cdsDisableVar,
    varSettings.cdsDisableValueVar,
    "Cds: "
)
____exports.miniCooldowns = __TS__New(
    CooldownsToggle,
    varSettings.mCdsToggleVar,
    varSettings.mCdsDisableVar,
    varSettings.mCdsDisableValueVar,
    "M.Cds: "
)
____exports.interrupts = __TS__New(Toggle, varSettings.interruptsVar, "Int: ")
____exports.defensives = __TS__New(Toggle, varSettings.defensivesVar, "Def: ")
____exports.generalTab = __TS__New(Tab, "General")
____exports.generalTab:header({text = "Fight"})
____exports.startCombat = ____exports.generalTab:checkbox({var = "startCombat", text = "Start Combat", tooltip = "Engage combat when the target is in range."})
____exports.generalTab:separator()
____exports.generalTab:header({text = "Targeting"})
____exports.autoTarget = ____exports.generalTab:checkbox({var = "autoTarget", text = "Auto Target", tooltip = "Automatically swap to the best target when the current one dies."})
____exports.statusFrameHandler = ____exports.generalTab:statusFrameHandler()
____exports.cooldownsTab = __TS__New(Tab, "Cooldowns")
____exports.cooldownsTab:header({text = "TTD Checker"})
____exports.checkMinTTD = ____exports.cooldownsTab:checkbox({var = varSettings.minTTDVar, text = "Check for minimum TTD", tooltip = "Check for minimum TTD before using cooldowns.", default = false})
____exports.minTTD = ____exports.cooldownsTab:slider({
    var = varSettings.minTTDValueVar,
    text = "Minimum TTD",
    tooltip = "Minimum TTD to use cooldowns.",
    min = 0,
    max = 20,
    default = 8,
    valueType = "sec",
    step = 1
})
____exports.cooldownsTab:separator()
____exports.cooldownsTab:header({text = "Cooldowns Disabler"})
____exports.cdsDisabler = ____exports.cooldownsTab:checkbox({var = varSettings.cdsDisableVar, text = "Disable Cooldowns", tooltip = "Disable cooldowns after a certain amount of time.", default = false})
____exports.cdsDisablerValue = ____exports.cooldownsTab:slider({
    var = varSettings.cdsDisableValueVar,
    text = "Disable Cooldowns After",
    tooltip = "Disable cooldowns after set amount of time.",
    min = 0,
    max = 20,
    default = 6,
    valueType = "sec",
    step = 1
})
____exports.mCdsDisabler = ____exports.cooldownsTab:checkbox({var = varSettings.mCdsDisableVar, text = "Disable Mini Cooldowns", tooltip = "Disable mini cooldowns after a certain amount of time.", default = false})
____exports.mCdsDisablerValue = ____exports.cooldownsTab:slider({
    var = varSettings.mCdsDisableValueVar,
    text = "Disable Mini Cooldowns After",
    tooltip = "Disable mini cooldowns after set amount of time.",
    min = 0,
    max = 20,
    default = 6,
    valueType = "sec"
})
____exports.cooldownsTab:separator()
local racials = {
    coreSpells.bloodFury,
    coreSpells.ancestralCall,
    coreSpells.fireblood,
    coreSpells.lightsJudgment,
    coreSpells.bagOfTricks,
    coreSpells.berserking,
    coreSpells.arcaneTorrent
}
____exports.getRacialSpell = function()
    for ____, racial in ipairs(racials) do
        if racial.known then
            return racial
        end
    end
    return nil
end
local racialSpell = ____exports.getRacialSpell()
____exports.racial = racialSpell ~= nil and ____exports.cooldownsTab:cooldown({var = "racial", usable = racialSpell, default = CooldownMode.Toggle}) or nil
____exports.interruptsTab = __TS__New(Tab, "Interrupts")
____exports.interruptsTab:header({text = "Conditions"})
____exports.whitelist = ____exports.interruptsTab:checkbox({var = "interruptWhitelist", text = "Whitelisted Only", tooltip = "Only interrupt spells on the whitelist.", default = false})
____exports.focus = ____exports.interruptsTab:checkbox({var = "interruptFocus", text = "Focus Only", tooltip = "Only interrupt spells from the focus target."})
____exports.minCastPercent = ____exports.interruptsTab:slider({
    var = "minCastPercent",
    text = "Min. cast %",
    tooltip = "Interrupt spells when they are at least this % cast.",
    min = 0,
    max = 100,
    default = 0,
    valueType = "%",
    step = 5
})
____exports.interruptDelay = ____exports.interruptsTab:delay({var = "interrupt", text = "Interrupt"})
____exports.generalTab:separator()
____exports.interruptsTab:header({text = "Spells"})
____exports.defensivesTab = __TS__New(Tab, "Defensives")
____exports.healthStone = ____exports.defensivesTab:playerDefensive({var = "healthStone", usable = coreItems.healthStone, minHP = 40})
____exports.refreshingHealingPotion = ____exports.defensivesTab:playerDefensive({var = "refreshingHealingPotion", usable = coreItems.refreshingHealingPotionThree, minHP = 40})
awfulUI.cmd:New(function(msg)
    repeat
        local ____switch7 = msg
        local ____cond7 = ____switch7 == "sf"
        if ____cond7 then
            ____exports.statusFrameHandler:toggle()
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "mode"
        if ____cond7 then
            ____exports.mode:invert()
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "cooldowns"
        if ____cond7 then
            ____exports.cooldowns:invert()
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "miniCooldowns"
        if ____cond7 then
            ____exports.miniCooldowns:invert()
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "defensives"
        if ____cond7 then
            ____exports.defensives:invert()
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "interrupts"
        if ____cond7 then
            ____exports.interrupts:invert()
            break
        end
        do
            break
        end
    until true
end)
return ____exports
 end,
["core.utility"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local ____exports = {}
local ____lists = require("core.lists")
local kickCast = ____lists.kickCast
local kickChanneled = ____lists.kickChanneled
local kickChanneling = ____lists.kickChanneling
local stunCast = ____lists.stunCast
local stunChanneled = ____lists.stunChanneled
local stunChanneling = ____lists.stunChanneling
local bypassThreat = ____lists.bypassThreat
local damageImmuneData = ____lists.damageImmuneData
local kickImmuneData = ____lists.kickImmuneData
local stunImmuneData = ____lists.stunImmuneData
local coreUI = require("core.ui")
____exports.hasBuffFromList = function(enemy, buffs)
    __TS__ArrayForEach(
        buffs,
        function(____, buff)
            if enemy.buff(buff) ~= nil then
                return true
            end
        end
    )
    return false
end
____exports.isFightableUnit = function(unit)
    local player = awful.player
    return unit.exists and not unit.dead and player.canAttack(unit) and unit.health > 2
end
____exports.canCombat = function() return ____exports.isFightableUnit(awful.target) end
____exports.canStartCombat = function()
    local player = awful.player
    local target = awful.target
    return player.combat or target.combat or coreUI.startCombat:enabled()
end
____exports.isDamageImmune = function(enemy) return ____exports.hasBuffFromList(enemy, damageImmuneData) end
____exports.isKickImmune = function(enemy) return ____exports.hasBuffFromList(enemy, kickImmuneData) end
____exports.isStunImmune = function(enemy) return ____exports.hasBuffFromList(enemy, stunImmuneData) end
____exports.isGroupTagged = function(unit)
    if bypassThreat:has(unit.id) then
        return true
    end
    for ____, ally in ipairs(awful.fGroup) do
        if awful.call("UnitThreatSituation", ally.pointer, unit.pointer) ~= nil then
            return true
        end
    end
    return false
end
____exports.canRun = function()
    local player = awful.player
    return player.exists and not player.dead and not player.mounted and not player.casting and not player.channeling and player.gcdRemains <= awful.buffer
end
____exports.canKickCast = function(enemy)
    return enemy.casting ~= nil and enemy.castRemains >= awful.buffer and (enemy.castPct >= coreUI.minCastPercent:value() and enemy.castTimeComplete >= coreUI.interruptDelay:delay() or enemy.castRemains < awful.gcd + awful.buffer * 2) and (not coreUI.whitelist:enabled() and not enemy.casting8 or kickCast:has(enemy.castID))
end
____exports.canKickChannel = function(enemy)
    local ____, ____, ____, ____, ____, ____, notInterruptible = awful.call("UnitChannelInfo", enemy.pointer)
    return enemy.channeling ~= nil and enemy.channelRemains >= awful.buffer and (not coreUI.whitelist:enabled() and not notInterruptible or kickChanneling:has(enemy.channelID) and enemy.channelRemains > 1.5 or kickChanneled:has(enemy.channelID))
end
____exports.canKickEnemy = function(enemy)
    return (not coreUI.focus:enabled() or enemy.isUnit(awful.focus)) and not ____exports.isKickImmune(enemy) and (____exports.canKickCast(enemy) or ____exports.canKickChannel(enemy))
end
____exports.canStunCast = function(enemy, delay)
    return enemy.casting ~= nil and enemy.castRemains >= delay and (enemy.castPct >= coreUI.minCastPercent:value() and enemy.castTimeComplete >= coreUI.interruptDelay:delay() or enemy.castRemains < awful.gcd + awful.buffer * 2) and (not coreUI.whitelist:enabled() and not enemy.casting8 or stunCast:has(enemy.castID) or kickCast:has(enemy.castID))
end
____exports.canStunChannel = function(enemy, delay)
    local ____, ____, ____, ____, ____, ____, notInterruptible = awful.call("UnitChannelInfo", enemy.pointer)
    return enemy.channeling ~= nil and enemy.channelRemains >= delay and (not coreUI.whitelist:enabled() and not notInterruptible or (stunChanneling:has(enemy.channelID) or kickChanneling:has(enemy.channelID)) and enemy.channelRemains > 1 + delay or stunChanneled:has(enemy.channelID) or kickChanneled:has(enemy.channelID))
end
____exports.canStunEnemy = function(enemy, delay)
    delay = (delay or 0) + awful.buffer
    return (not coreUI.focus:enabled() or enemy.isUnit(awful.focus)) and not ____exports.isStunImmune(enemy) and (____exports.canStunCast(enemy, delay) or ____exports.canStunChannel(enemy, delay))
end
____exports.callAll = function(spells) return __TS__ArrayForEach(
    spells,
    function(____, toCall) return toCall() end
) end
____exports.useItem = function(item)
    if not item.usable then
        return false
    end
    return item:Use()
end
return ____exports
 end,
["core.cache"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____lists = require("core.lists")
local unitBlacklist = ____lists.unitBlacklist
local ____utility = require("core.utility")
local isDamageImmune = ____utility.isDamageImmune
local isGroupTagged = ____utility.isGroupTagged
local UnitCache = __TS__Class()
UnitCache.name = "UnitCache"
function UnitCache.prototype.____constructor(self)
    awful.addUpdateCallback(function() return self:reset() end)
end
function UnitCache.prototype.reset(self)
    self.cache = {}
end
function UnitCache.prototype.dynamicFilter(self, options, unit)
    if not awful.player.canAttack(unit) then
        return false
    end
    if unit.health <= 2 then
        return false
    end
    if options.distance ~= nil and unit.distance > options.distance then
        return false
    end
    if options.distanceLiteral ~= nil and unit.distanceLiteral > options.distanceLiteral then
        return false
    end
    if options.distanceFrom ~= nil and options.fromUnit ~= nil and unit.distanceTo(options.fromUnit) > options.distanceFrom then
        return false
    end
    if options.distanceFromLiteral ~= nil and options.fromUnit ~= nil and unit.distanceToLiteral(options.fromUnit) > options.distanceFromLiteral then
        return false
    end
    if options.meleeFrom ~= nil and options.fromUnit ~= nil and unit.meleeRangeOf(options.fromUnit) then
        return false
    end
    if options.melee ~= nil and not unit.meleeRange then
        return false
    end
    if options.alive ~= nil and unit.dead then
        return false
    end
    if options.affectingCombat ~= nil and not isGroupTagged(unit) then
        return false
    end
    if options.notCc ~= nil and unit.cc then
        return false
    end
    if options.notBlacklisted ~= nil and unitBlacklist:has(unit.id) then
        return false
    end
    if options.los ~= nil and not unit.los then
        return false
    end
    if options.facing ~= nil and not unit.playerFacing then
        return false
    end
    if options.facingPlayer ~= nil and not unit.facing(awful.player) then
        return false
    end
    if options.immune ~= nil and isDamageImmune(unit) then
        return false
    end
    return true
end
function UnitCache.prototype.getIndex(self, listKey, options)
    local index = listKey
    if options.melee ~= nil then
        index = index .. "melee"
    end
    if options.distance ~= nil then
        index = index .. "distance" .. tostring(options.distance)
    end
    if options.distanceLiteral ~= nil then
        index = index .. "distanceLiteral" .. tostring(options.distanceLiteral)
    end
    if options.fromUnit ~= nil then
        index = index .. options.fromUnit.guid
    end
    if options.meleeFrom ~= nil then
        index = index .. "meleeFrom"
    end
    if options.distanceFrom ~= nil then
        index = index .. "distanceFrom" .. tostring(options.distanceFrom)
    end
    if options.distanceFromLiteral ~= nil then
        index = index .. "distanceFromLiteral" .. tostring(options.distanceFromLiteral)
    end
    if options.alive ~= nil then
        index = index .. "alive"
    end
    if options.affectingCombat ~= nil then
        index = index .. "affectingCombat"
    end
    if options.notCc ~= nil then
        index = index .. "notCc"
    end
    if options.notBlacklisted ~= nil then
        index = index .. "notBlacklisted"
    end
    if options.los ~= nil then
        index = index .. "los"
    end
    if options.facing ~= nil then
        index = index .. "facing"
    end
    if options.facingPlayer ~= nil then
        index = index .. "facingPlayer"
    end
    if options.immune ~= nil then
        index = index .. "immune"
    end
    return index
end
function UnitCache.prototype.get(self, list, listKey, options)
    local index = self:getIndex(listKey, options)
    if self.cache[index] ~= nil then
        return self.cache[index]
    end
    local units = list.filter(function(unit) return self:dynamicFilter(options, unit) end)
    self.cache[index] = units
    return units
end
function UnitCache.prototype.getUnits(self, options)
    return self:get(awful.units, "units", options)
end
function UnitCache.prototype.getEnemies(self, options)
    return self:get(awful.enemies, "enemies", options)
end
function UnitCache.prototype.getExplosives(self, options)
    return self:get(awful.explosives, "explosives", options)
end
____exports.coreCache = __TS__New(UnitCache)
return ____exports
 end,
["core.rotation"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____cache = require("core.cache")
local coreCache = ____cache.coreCache
local ____items = require("core.items")
local healthStone = ____items.healthStone
local refreshingHealingPotionOne = ____items.refreshingHealingPotionOne
local refreshingHealingPotionThree = ____items.refreshingHealingPotionThree
local refreshingHealingPotionTwo = ____items.refreshingHealingPotionTwo
local coreUI = require("core.ui")
local ____utility = require("core.utility")
local canCombat = ____utility.canCombat
local useItem = ____utility.useItem
____exports.selectNewTarget = function(getEnemies)
    if not coreUI.autoTarget:enabled() or canCombat() then
        return
    end
    local enemies = getEnemies()
    local bestEnemy
    enemies.loop(function(enemy)
        if not bestEnemy or bestEnemy.health < enemy.health then
            bestEnemy = enemy
        end
    end)
    if bestEnemy then
        bestEnemy.setTarget()
    end
end
____exports.coreDefensives = {
    function() return coreUI.healthStone:usable() and useItem(healthStone) end,
    function() return coreUI.refreshingHealingPotion:usable() and useItem(refreshingHealingPotionThree) and useItem(refreshingHealingPotionTwo) and useItem(refreshingHealingPotionOne) end
}
local aroundParameters = {distance = 40, alive = true}
local function unitsAround()
    return coreCache:getEnemies(aroundParameters)
end
____exports.playerHasAggro = function(units)
    if units == nil then
        units = unitsAround
    end
    local player = awful.player
    local enemies = units()
    for ____, enemy in ipairs(enemies) do
        local threat = awful.call("UnitThreatSituation", player.pointer, enemy.pointer)
        if threat == 1 or threat == 3 then
            return true
        end
    end
    return false
end
local FightTracker = __TS__Class()
FightTracker.name = "FightTracker"
function FightTracker.prototype.____constructor(self)
    self.fightStart = 0
    self.started = false
    awful.addUpdateCallback(function() return self:update() end)
end
function FightTracker.prototype.update(self)
    local player = awful.player
    if player.combat then
        if not self.started then
            self.fightStart = awful.time
            self.started = true
        end
    else
        self.fightStart = awful.time
        self.started = false
    end
end
function FightTracker.prototype.time(self)
    return awful.time - self.fightStart
end
____exports.fightTracker = __TS__New(FightTracker)
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
____exports.castRegen = function(spell)
    local regen = ____exports.regenRate()
    local spellDescription = GetSpellDescription(spell.id)
    local generates = string.gsub(spellDescription, "%D+", "")
    local tooltip = tonumber(string.sub(generates, -2)) or 0
    local castTime = spell.castTime
    if castTime == 0 or castTime < awful.gcd then
        castTime = awful.gcd
    end
    return regen * castTime + tooltip
end
local function isRefreshable(buffInfos)
    if not buffInfos then
        return true
    end
    local duration = buffInfos[5]
    local expirationTime = buffInfos[6]
    local remains = expirationTime - awful.time
    return remains <= (duration - remains) * 0.3
end
____exports.isRefreshableDebuff = function(unit, buffId) return isRefreshable(unit.debuff(buffId)) end
____exports.isRefreshableBuff = function(unit, buffId) return isRefreshable(unit.buff(buffId)) end
return ____exports
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
____exports.serpentStingDuration = 12
return ____exports
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
____exports.intimidation = newSpell(19577, {targeted = true, cc = "stun", ranged = true, ignoreFacing = true})
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
["hunter.utility"] = function(...) 
local ____exports = {}
local ____cache = require("core.cache")
local coreCache = ____cache.coreCache
local ____lists = require("hunter.lists")
local hunterTalents = ____lists.hunterTalents
local petBuffs = ____lists.petBuffs
local hunterSpells = require("hunter.spells")
local coreUI = require("core.ui")
____exports.modeParams = {
    distanceFrom = 8,
    alive = true,
    notCc = true,
    notBlacklisted = true,
    immune = true
}
local function isValidUnitForModeParams(unit)
    return unit.exists and not unit.dead
end
awful.addUpdateCallback(function()
    local target = awful.target
    if isValidUnitForModeParams(target) then
        ____exports.modeParams.fromUnit = awful.target
    else
        ____exports.modeParams.fromUnit = awful.player
    end
end)
____exports.modeUnits = function() return coreCache:getUnits(____exports.modeParams) end
____exports.fourthyFightableLosFacingParams = {
    distance = 40,
    alive = true,
    affectingCombat = true,
    notCc = true,
    notBlacklisted = true,
    los = true,
    facing = true,
    immune = true
}
____exports.fourthyFightableLosFacingUnits = function() return coreCache:getUnits(____exports.fourthyFightableLosFacingParams) end
____exports.petAlive = function() return awful.pet.exists and not awful.pet.dead end
____exports.fourthyEngagedLosFacingParams = {
    distance = 40,
    alive = true,
    affectingCombat = true,
    notCc = true,
    los = true,
    facing = true
}
____exports.fourthyEngagedLosFacingUnits = function() return coreCache:getUnits(____exports.fourthyEngagedLosFacingParams) end
____exports.fourthyEngagedLosParams = {
    distance = 40,
    alive = true,
    affectingCombat = true,
    notCc = true,
    los = true
}
____exports.fourthyEngagedLosUnits = function() return coreCache:getUnits(____exports.fourthyEngagedLosParams) end
____exports.waitForBarbedShot = function()
    local pet = awful.pet
    return ____exports.petAlive() and pet.buff(petBuffs.frenzy) ~= nil and pet.buffRemains(petBuffs.frenzy) <= awful.gcd + awful.buffer * 2 and pet.buffRemains(petBuffs.frenzy) >= hunterSpells.barbedShot.cd + awful.buffer
end
____exports.isSingleTarget = function()
    local player = awful.player
    local enemiesAround = #____exports.modeUnits()
    return coreUI.mode:singleTarget() or enemiesAround < 2 or not player.hasTalent(hunterTalents.beastCleave) and enemiesAround < 3
end
____exports.petStatus = {triedPetCall = false}
____exports.disengageForwardInfos = {inverseTime = 0, playerRotation = nil}
return ____exports
 end,
["hunter.components"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____components = require("core.components")
local Dropdown = ____components.Dropdown
local awfulUI = ____components.awfulUI
local ____rotation = require("core.rotation")
local fightTracker = ____rotation.fightTracker
local playerHasAggro = ____rotation.playerHasAggro
local coreUI = require("core.ui")
local spells = require("hunter.spells")
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
____exports.misdirectionOptions = {
    {label = "Smart", value = ____exports.MisdirectionMode.Smart, tooltip = "Use on engage and when taking aggro"},
    {label = "Engage", value = ____exports.MisdirectionMode.Engage, tooltip = "Use on combat start."},
    {label = "Aggro", value = ____exports.MisdirectionMode.Aggro, tooltip = "Use when taking aggro of a mob."},
    {label = "Always", value = ____exports.MisdirectionMode.Always, tooltip = "Use on cooldown."},
    {label = "Never", value = ____exports.MisdirectionMode.Never, tooltip = "Never use."}
}
____exports.MisdirectionModeSelector = __TS__Class()
local MisdirectionModeSelector = ____exports.MisdirectionModeSelector
MisdirectionModeSelector.name = "MisdirectionModeSelector"
__TS__ClassExtends(MisdirectionModeSelector, Dropdown)
function MisdirectionModeSelector.prototype.____constructor(self)
    local name = spells.misdirection.name
    Dropdown.prototype.____constructor(
        self,
        coreUI.generalTab.tab,
        {
            var = "missdirectionModdes",
            options = ____exports.misdirectionOptions,
            header = (awful.textureEscape(spells.misdirection.id, 20) .. " - ") .. name,
            tooltip = name .. " usage mode.",
            default = ____exports.MisdirectionMode.Smart
        }
    )
end
function MisdirectionModeSelector.prototype.engage(self)
    return self:value() == ____exports.MisdirectionMode.Smart or self:value() == ____exports.MisdirectionMode.Engage
end
function MisdirectionModeSelector.prototype.aggro(self)
    return self:value() == ____exports.MisdirectionMode.Smart or self:value() == ____exports.MisdirectionMode.Aggro
end
function MisdirectionModeSelector.prototype.always(self)
    return self:value() == ____exports.MisdirectionMode.Always
end
function MisdirectionModeSelector.prototype.usable(self)
    return self:always() or self:engage() and fightTracker:time() < 5 or self:aggro() and playerHasAggro()
end
____exports.PetSlotSelector = __TS__Class()
local PetSlotSelector = ____exports.PetSlotSelector
PetSlotSelector.name = "PetSlotSelector"
function PetSlotSelector.prototype.____constructor(self)
    self.var = "petSlot"
    awfulUI.statusFrame:Toggle({
        label = "Pet: ",
        var = self.var,
        onClick = function() return self:press() end,
        valueText = function() return self:valueText() end
    })
    if self:value() == nil then
        awfulUI.settings[self.var] = 1
    end
end
function PetSlotSelector.prototype.valueText(self)
    return "|cffbfff81" .. tostring(self:value())
end
function PetSlotSelector.prototype.press(self)
    self:set(self:value() + 1)
    if self:value() > 5 then
        self:set(0)
    end
end
function PetSlotSelector.prototype.set(self, value)
    awfulUI.settings[self.var] = value
end
function PetSlotSelector.prototype.value(self)
    return awfulUI.settings[self.var]
end
function PetSlotSelector.prototype.enabled(self)
    return self:value() ~= 0
end
function PetSlotSelector.prototype.disabled(self)
    return self:value() == 0
end
return ____exports
 end,
["hunter.ui"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____components = require("core.components")
local CooldownMode = ____components.CooldownMode
local Tab = ____components.Tab
local Trigger = ____components.Trigger
local awfulUI = ____components.awfulUI
local coreUI = require("core.ui")
local ____components = require("hunter.components")
local MisdirectionModeSelector = ____components.MisdirectionModeSelector
local PetSlotSelector = ____components.PetSlotSelector
local hunterSpells = require("hunter.spells")
____exports.misdirection = __TS__New(MisdirectionModeSelector)
____exports.maxSerpentSting = coreUI.generalTab:slider({
    var = "maxSerpentSting",
    text = "Max Serpent Sting",
    tooltip = "Maximum number of Serpent Sting active.",
    default = 2,
    min = 1,
    max = 5,
    step = 1
})
____exports.petSlot = __TS__New(PetSlotSelector)
____exports.aMurderofCrows = coreUI.cooldownsTab:cooldown({var = "aMurderofCrows", usable = hunterSpells.aMurderofCrows, default = CooldownMode.Always})
____exports.aspectOfTheWild = coreUI.cooldownsTab:cooldown({var = "aspectOfTheWild", usable = hunterSpells.aspectOfTheWild, default = CooldownMode.Toggle})
____exports.barrage = coreUI.cooldownsTab:cooldown({var = "barrage", usable = hunterSpells.barrage, default = CooldownMode.Always})
____exports.deathChakram = coreUI.cooldownsTab:cooldown({var = "deathChakram", usable = hunterSpells.deathChakram, default = CooldownMode.Always})
____exports.explosiveShot = coreUI.cooldownsTab:cooldown({var = "explosiveShot", usable = hunterSpells.explosiveShot, default = CooldownMode.Always})
____exports.stampede = coreUI.cooldownsTab:cooldown({var = "stampede", usable = hunterSpells.stampede, default = CooldownMode.Toggle})
____exports.steelTrap = coreUI.cooldownsTab:cooldown({var = "steelTrap", usable = hunterSpells.steelTrap, default = CooldownMode.Always})
____exports.wailingArrow = coreUI.cooldownsTab:cooldown({var = "wailingArrow", usable = hunterSpells.wailingArrow, default = CooldownMode.Always})
____exports.bestialWrath = coreUI.cooldownsTab:cooldown({var = "bestialWrath", usable = hunterSpells.bestialWrath, default = CooldownMode.MiniToggle})
____exports.bloodshed = coreUI.cooldownsTab:cooldown({var = "bloodshed", usable = hunterSpells.bloodshed, default = CooldownMode.Always})
____exports.callOfTheWild = coreUI.cooldownsTab:cooldown({var = "callOfTheWild", usable = hunterSpells.callOfTheWild, default = CooldownMode.Toggle})
____exports.direBeast = coreUI.cooldownsTab:cooldown({var = "direBeast", usable = hunterSpells.direBeast, default = CooldownMode.Always})
____exports.counterShot = coreUI.interruptsTab:interrupt({var = "counterShot", usable = hunterSpells.counterShot, default = true})
____exports.freezingTrap = coreUI.interruptsTab:interrupt({var = "freezingTrap", usable = hunterSpells.freezingTrap, default = true})
____exports.intimidation = coreUI.interruptsTab:interrupt({var = "intimidation", usable = hunterSpells.intimidation, default = true})
____exports.exhilaration = coreUI.defensivesTab:playerDefensive({var = "exhilaration", usable = hunterSpells.exhilaration, minHP = 50, default = true})
____exports.aspectOfTheTurtle = coreUI.defensivesTab:playerDefensive({var = "aspectOfTheTurtle", usable = hunterSpells.aspectOfTheTurtle, minHP = 25, default = false})
____exports.feignDeath = coreUI.defensivesTab:playerDefensive({var = "feignDeath", usable = hunterSpells.feignDeath, minHP = 20, default = false})
____exports.petTab = __TS__New(Tab, "Pet")
____exports.summonRevivePet = ____exports.petTab:checkbox({var = "summonRevivePet", text = "Summon/Revive Pet", tooltip = "Automatically summon or revive your pet.", default = true})
____exports.mendPet = ____exports.petTab:petDefensive({var = "mendPet", usable = hunterSpells.mendRevivePet, minHP = 40})
____exports.disengageTrigger = __TS__New(Trigger)
awfulUI.cmd:New(function(msg)
    repeat
        local ____switch3 = msg
        local ____cond3 = ____switch3 == "forward"
        if ____cond3 then
            ____exports.disengageTrigger:trigger()
            break
        end
        do
            break
        end
    until true
end)
return ____exports
 end,
["hunter.rotation"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local ____exports = {}
local hunterUI = require("hunter.ui")
local ____utility = require("hunter.utility")
local disengageForwardInfos = ____utility.disengageForwardInfos
local petStatus = ____utility.petStatus
local hunterSpells = require("hunter.spells")
local ____utility = require("core.utility")
local callAll = ____utility.callAll
local ____rotation = require("core.rotation")
local coreDefensives = ____rotation.coreDefensives
local function callPet()
    local pet = awful.pet
    if hunterUI.petSlot:disabled() or not hunterUI.summonRevivePet:enabled() or pet.exists or petStatus.triedPetCall then
        return
    end
    hunterSpells["callPet" .. tostring(hunterStatusFrame.hunterPet:value())](hunterSpells)
end
____exports.petManager = function()
    hunterSpells.mendRevivePet("revive")
    callPet()
    hunterSpells.mendRevivePet("mend")
end
local ____array_0 = __TS__SparseArrayNew(
    hunterSpells.exhilaration,
    unpack(coreDefensives)
)
__TS__SparseArrayPush(____array_0, hunterSpells.aspectOfTheTurtle, hunterSpells.feignDeath)
local defensives = {__TS__SparseArraySpread(____array_0)}
____exports.defensivesHandler = function()
    local player = awful.player
    if not player.combat then
        return
    end
    callAll(defensives)
end
local interrupts = {hunterSpells.muzzle, hunterSpells.freezingTrap, hunterSpells.intimidation}
____exports.interruptsHandler = function() return callAll(interrupts) end
local function disengageForwardHandler()
    local player = awful.player
    if not hunterUI.disengageTrigger:enabled() then
        if disengageForwardInfos.playerRotation ~= nil and disengageForwardInfos.inverseTime < awful.time then
            player.face(disengageForwardInfos.playerRotation)
            disengageForwardInfos.playerRotation = nil
        end
        return
    end
    if disengageForwardInfos.playerRotation == nil then
        disengageForwardInfos.playerRotation = player.rotation
        player.face(awful.inverse(disengageForwardInfos.playerRotation))
        disengageForwardInfos.inverseTime = awful.time + 0.05
    end
    hunterSpells.disengage("forward")
end
awful.addUpdateCallback(disengageForwardHandler)
return ____exports
 end,
["hunter.cache"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____lists = require("hunter.lists")
local hunterDebuffs = ____lists.hunterDebuffs
local ____utility = require("hunter.utility")
local fourthyFightableLosFacingUnits = ____utility.fourthyFightableLosFacingUnits
local modeUnits = ____utility.modeUnits
local HunterCache = __TS__Class()
HunterCache.name = "HunterCache"
function HunterCache.prototype.____constructor(self)
    awful.addUpdateCallback(function() return self:reset() end)
end
function HunterCache.prototype.reset(self)
    self.cache = {}
end
function HunterCache.prototype.lowestbarbedShot(self)
    local player = awful.player
    if self.cache.lowestBarbedShot ~= nil then
        return self.cache.lowestBarbedShot
    end
    local enemies = modeUnits()
    local best = awful.target
    local bestRemains = best.debuffRemains(hunterDebuffs.barbedShot, player)
    for ____, enemy in ipairs(enemies) do
        local enemyRemains = enemy.debuffRemains(hunterDebuffs.barbedShot, player)
        if enemyRemains < bestRemains or enemyRemains == bestRemains and enemy.health > best.health then
            best = enemy
            bestRemains = enemyRemains
        end
    end
    self.cache.lowestBarbedShot = best
    return best
end
function HunterCache.prototype.minSerpentStingRemains(self, minTTD)
    if minTTD == nil then
        minTTD = 7
    end
    local player = awful.player
    if self.cache.minSerpentStingByTTD and self.cache.minSerpentStingByTTD[minTTD] ~= nil then
        return self.cache.minSerpentStingByTTD[minTTD]
    end
    local enemies = fourthyFightableLosFacingUnits()
    local minRemains = 100
    local minRemainsUnit = awful.target
    if not minRemainsUnit.debuffRemains(hunterDebuffs.serpentSting, player) and minRemainsUnit.ttd > minTTD then
        return minRemainsUnit
    end
    for ____, enemy in ipairs(enemies) do
        local remains = enemy.debuffRemains(hunterDebuffs.serpentSting, player)
        if enemy.ttd > minTTD and (remains < minRemains or remains == minRemains and enemy.hp > minRemainsUnit.hp) then
            minRemains = remains
            minRemainsUnit = enemy
        end
    end
    self.cache.minSerpentStingByTTD = self.cache.minSerpentStingByTTD or ({})
    self.cache.minSerpentStingByTTD[minTTD] = minRemainsUnit
    return minRemainsUnit
end
____exports.hunterCache = __TS__New(HunterCache)
return ____exports
 end,
["hunter.callbacks"] = function(...) 
local ____exports = {}
local hunterSpells = require("hunter.spells")
local hunterUI = require("hunter.ui")
local coreUI = require("core.ui")
local ____lists = require("hunter.lists")
local petBuffs = ____lists.petBuffs
local hunterTalents = ____lists.hunterTalents
local hunterBuffs = ____lists.hunterBuffs
local serpentStingDuration = ____lists.serpentStingDuration
local hunterDebuffs = ____lists.hunterDebuffs
local ____simc = require("core.simc")
local castRegen = ____simc.castRegen
local executeTime = ____simc.executeTime
local fullRechargeTime = ____simc.fullRechargeTime
local isRefreshableDebuff = ____simc.isRefreshableDebuff
local timeToMax = ____simc.timeToMax
local ____cache = require("hunter.cache")
local hunterCache = ____cache.hunterCache
local ____utility = require("core.utility")
local canCombat = ____utility.canCombat
local canKickEnemy = ____utility.canKickEnemy
local canStartCombat = ____utility.canStartCombat
local canStunEnemy = ____utility.canStunEnemy
local ____utility = require("hunter.utility")
local disengageForwardInfos = ____utility.disengageForwardInfos
local fourthyEngagedLosFacingUnits = ____utility.fourthyEngagedLosFacingUnits
local fourthyEngagedLosUnits = ____utility.fourthyEngagedLosUnits
local fourthyFightableLosFacingUnits = ____utility.fourthyFightableLosFacingUnits
local petAlive = ____utility.petAlive
local coreSpells = require("core.spells")
local function barbedShotLowestCallback(spell)
    local target = hunterCache:lowestbarbedShot()
    return spell:Cast(target)
end
hunterSpells.barbedShot:Callback(function(spell)
    local target = awful.target
    if not petAlive() then
        return
    end
    spell:Cast(target)
end)
hunterSpells.barbedShot:Callback(
    "lowest",
    function(spell)
        if not petAlive() then
            return
        end
        barbedShotLowestCallback(spell)
    end
)
hunterSpells.barbedShot:Callback(
    "refresh",
    function(spell)
        local pet = awful.pet
        if not canCombat() or not petAlive() or not canStartCombat() then
            return
        end
        local frenzyRemain = pet.buffRemains(petBuffs.frenzy)
        if pet.buff(petBuffs.frenzy) ~= nil and frenzyRemain <= awful.gcd + awful.buffer * 2 and frenzyRemain >= awful.buffer then
            if coreUI.mode:singleTarget() then
                spell:Cast(awful.target)
            else
                barbedShotLowestCallback(spell)
            end
        end
    end
)
hunterSpells.barbedShot:Callback(
    "bm.barbedShot.st.1",
    function(spell)
        local player = awful.player
        local pet = awful.pet
        if not petAlive() then
            return
        end
        local frenzyRemain = pet.buffRemains(petBuffs.frenzy)
        if pet.buff(petBuffs.frenzy) and frenzyRemain <= awful.gcd + awful.buffer * 2 and frenzyRemain >= awful.buffer or player.hasTalent(hunterTalents.scentOfBlood) and pet.buffStacks(petBuffs.frenzy) < 3 and hunterUI.bestialWrath:usable() and hunterSpells.bestialWrath.cd <= awful.gcd then
            if coreUI.mode:singleTarget() then
                spell:Cast(awful.target)
            else
                barbedShotLowestCallback(spell)
            end
        end
    end
)
hunterSpells.barbedShot:Callback(
    "bm.barbedShot.st.2",
    function(spell)
        local player = awful.player
        if not petAlive() then
            return
        end
        if player.hasTalent(hunterTalents.wildInstincts) and player.buff(hunterTalents.callOfTheWild) or player.hasTalent(hunterTalents.wildCall) and hunterSpells.barbedShot.chargesFrac > 1.4 or fullRechargeTime(hunterSpells.barbedShot) < awful.gcd + awful.buffer * 2 and (not hunterUI.bestialWrath:usable() or hunterSpells.bestialWrath.cd > awful.gcd) or player.hasTalent(hunterTalents.scentOfBlood) and (hunterUI.bestialWrath:usable() and hunterSpells.bestialWrath.cd < 12 + awful.gcd + awful.buffer or fullRechargeTime(hunterSpells.barbedShot) + awful.gcd + awful.buffer < 8 and hunterUI.bestialWrath:usable() and hunterSpells.bestialWrath.cd < 24 + (8 - awful.gcd) + fullRechargeTime(hunterSpells.barbedShot) + awful.buffer) or awful.FightRemains() < 9 then
            if coreUI.mode:singleTarget() then
                spell:Cast(awful.target)
            else
                barbedShotLowestCallback(spell)
            end
        end
    end
)
hunterSpells.barbedShot:Callback(
    "bm.barbedShot.cleave.1",
    function(spell)
        local player = awful.player
        local pet = awful.pet
        if not petAlive() then
            return
        end
        local frenzyRemain = pet.buffRemains(petBuffs.frenzy)
        if pet.buff(petBuffs.frenzy) and frenzyRemain <= awful.gcd + awful.buffer * 2 and frenzyRemain >= awful.buffer or player.hasTalent(hunterTalents.scentOfBlood) and hunterUI.bestialWrath:usable() and hunterSpells.bestialWrath.cd < 12 + awful.gcd or fullRechargeTime(hunterSpells.barbedShot) < awful.gcd + awful.buffer and (not hunterUI.bestialWrath:usable() or hunterSpells.bestialWrath.cd > awful.gcd) then
            barbedShotLowestCallback(spell)
        end
    end
)
hunterSpells.barbedShot:Callback(
    "bm.barbedShot.cleave.2",
    function(spell)
        local player = awful.player
        if not petAlive() then
            return
        end
        if player.hasTalent(hunterTalents.wildInstincts) and player.buff(hunterTalents.callOfTheWild) or awful.FightRemains() < 9 or player.hasTalent(hunterTalents.wildCall) and spell.chargesFrac > 1.2 then
            barbedShotLowestCallback(spell)
        end
    end
)
local function killCommandDistanceCheck(target)
    local pet = awful.pet
    return pet.distanceToLiteral(target) <= 50
end
local function killCommandCallback(spell)
    local target = awful.target
    if killCommandDistanceCheck(target) then
        spell:Cast(target)
    end
end
hunterSpells.killCommand:Callback(function(spell)
    if not petAlive() then
        return
    end
    killCommandCallback(spell)
end)
hunterSpells.killCommand:Callback(
    "bm.killCommand.st.1",
    function(spell)
        local player = awful.player
        if petAlive() and player.hasTalent(hunterTalents.alphaPredator) and fullRechargeTime(spell) <= awful.gcd + awful.buffer * 2 then
            killCommandCallback(spell)
        end
    end
)
hunterSpells.killCommand:Callback(
    "bm.killCommand.cleave.1",
    function(spell)
        local player = awful.player
        if not petAlive() then
            return
        end
        if fullRechargeTime(spell) < awful.gcd + awful.buffer and player.hasTalent(hunterTalents.alphaPredator) and player.hasTalent(hunterTalents.killCleave) then
            killCommandCallback(spell)
        end
    end
)
hunterSpells.callOfTheWild:Callback(function(spell)
    if not hunterUI.callOfTheWild:usable() then
        return
    end
    spell:Cast()
end)
hunterSpells.multiShot:Callback(
    "bm.multishot.cleave.1",
    function(spell)
        local player = awful.player
        local pet = awful.pet
        local target = awful.target
        if not petAlive() or not player.hasTalent(hunterTalents.beastCleave) then
            return
        end
        if pet.buffRemains(petBuffs.beastCleave) < awful.gcd + awful.buffer * 2 then
            spell:Cast(target)
        end
    end
)
hunterSpells.deathChakram:Callback(function(spell)
    local target = awful.target
    if not hunterUI.deathChakram:usable() then
        return
    end
    spell:Cast(target)
end)
local function bloodshedDistanceCheck(target)
    local pet = awful.pet
    return pet.distanceToLiteral(target) <= 50
end
hunterSpells.bloodshed:Callback(function(spell)
    local target = awful.target
    if petAlive() and hunterUI.bloodshed:usable() and bloodshedDistanceCheck(target) then
        spell:Cast(target)
    end
end)
hunterSpells.stampede:Callback(function(spell)
    if not hunterUI.stampede:usable() then
        return
    end
    spell:Cast()
end)
hunterSpells.aMurderofCrows:Callback(function(spell)
    local target = awful.target
    if not hunterUI.aMurderofCrows:usable() then
        return
    end
    spell:Cast(target)
end)
hunterSpells.barrage:Callback(
    "bm.barrage.cleave.1",
    function(spell)
        local pet = awful.pet
        if hunterUI.barrage:usable() and (not petAlive() or not pet.buff(petBuffs.frenzy) or pet.buffRemains(petBuffs.frenzy) > executeTime(2.8) + awful.buffer * 2) then
            spell:Cast()
        end
    end
)
hunterSpells.steelTrap:Callback(function(spell)
    local target = awful.target
    if not hunterUI.steelTrap:usable() then
        return
    end
    spell:AoECast(target)
end)
local function explosiveShotCallback(spell)
    local target = awful.target
    if not hunterUI.explosiveShot:usable() then
        return false
    end
    return spell:Cast(target)
end
hunterSpells.explosiveShot:Callback(explosiveShotCallback)
local function serpentStingLowestForFullDuration(spell)
    local lowestSerpentSting = hunterCache:minSerpentStingRemains(serpentStingDuration)
    if isRefreshableDebuff(lowestSerpentSting, hunterDebuffs.serpentSting) and lowestSerpentSting.target.ttd > serpentStingDuration then
        spell:Cast(lowestSerpentSting.target)
    end
end
hunterSpells.serpentSting:Callback("bm.serpentSting.cleave.1", serpentStingLowestForFullDuration)
hunterSpells.serpentSting:Callback("bm.serpentSting.st.1", serpentStingLowestForFullDuration)
hunterSpells.bestialWrath:Callback(function(spell)
    local player = awful.player
    local target = awful.target
    if petAlive() and hunterUI.bestialWrath:usable() and player.distanceTo(target) <= 50 then
        spell:Cast()
    end
end)
hunterSpells.direBeast:Callback(function(spell)
    local target = awful.target
    if not hunterUI.direBeast:usable() then
        return
    end
    spell:Cast(target)
end)
local function killShotIgnoreHP()
    local player = awful.player
    return player.buff(hunterBuffs.deathblow) ~= nil or player.buff(hunterBuffs.coordinatedAssault) ~= nil and player.hasTalent(hunterTalents.coordinatedKill) ~= false
end
hunterSpells.killShot:Callback(function(spell)
    local target = awful.target
    if not killShotIgnoreHP() and target.hp > 20 then
        return
    end
    spell:Cast(target)
end)
hunterSpells.killShot:Callback(
    "aoe",
    function(spell)
        local enemies = fourthyFightableLosFacingUnits()
        if killShotIgnoreHP() then
            spell:Cast(awful.target)
        end
        for ____, enemy in ipairs(enemies) do
            if enemy.hp <= 20 then
                if spell:Cast(enemy) then
                    return
                end
            end
        end
    end
)
hunterSpells.aspectOfTheWild:Callback(function(spell)
    local target = awful.target
    if not hunterUI.aspectOfTheWild:usable() then
        return
    end
    spell:Cast(target)
end)
hunterSpells.cobraShot:Callback(function(spell)
    local target = awful.target
    spell:Cast(target)
end)
hunterSpells.cobraShot:Callback(
    "bm.cobraShot.cleave.1",
    function(spell)
        local player = awful.player
        local target = awful.target
        local ttm = timeToMax()
        if ttm < awful.gcd * 2 or player.buff(hunterBuffs.aspectOfTheWild) and ttm < awful.gcd * 4 then
            spell:Cast(target)
        end
    end
)
hunterSpells.wailingArrow:Callback(function(spell)
    local pet = awful.pet
    local target = awful.target
    if hunterUI.wailingArrow:usable() and (not petAlive() or not pet.buff(petBuffs.frenzy) or pet.buffRemains(petBuffs.frenzy) > hunterSpells.wailingArrow.castTime + awful.buffer * 2 or awful.FightRemains() < 5) then
        spell:Cast(target)
    end
end)
hunterSpells.counterShot:Callback(function(spell)
    if not hunterUI.counterShot:enabled() or not coreUI.interrupts:enabled() then
        return
    end
    local enemies = fourthyEngagedLosFacingUnits()
    for ____, enemy in ipairs(enemies) do
        if canKickEnemy(enemy) then
            if spell:Cast(enemy) then
                return
            end
        end
    end
end)
hunterSpells.intimidation:Callback(function(spell)
    local pet = awful.pet
    if not petAlive() or not hunterUI.intimidation:enabled() or not coreUI.interrupts:enabled() then
        return
    end
    local enemies = fourthyEngagedLosUnits()
    for ____, enemy in ipairs(enemies) do
        if enemy.distanceTo(pet) <= 50 and canStunEnemy(enemy, 0.5) then
            if spell:Cast(enemy) then
                return
            end
        end
    end
end)
hunterSpells.freezingTrap:Callback(function(spell)
    if not hunterUI.freezingTrap:enabled() or not coreUI.interrupts:enabled() then
        return
    end
    local enemies = fourthyEngagedLosUnits()
    for ____, enemy in ipairs(enemies) do
        if canStunEnemy(enemy, 1) then
            if spell:AoECast(enemy) then
                return
            end
        end
    end
end)
hunterSpells.exhilaration:Callback(function(spell)
    if hunterUI.exhilaration:usable() then
        spell:Cast()
    end
end)
hunterSpells.aspectOfTheTurtle:Callback(function(spell)
    if hunterUI.aspectOfTheTurtle:usable() and not awful.player.buff(hunterBuffs.aspectOfTheTurtle) then
        spell:Cast()
    end
end)
hunterSpells.feignDeath:Callback(function(spell)
    if hunterUI.feignDeath:usable() and not awful.player.buff(hunterBuffs.feignDeath) then
        spell:Cast()
    end
end)
hunterSpells.cobraShot:Callback(
    "mechanic",
    function(spell, unit)
        if unit.los and unit.playerFacing and unit.distance < 40 then
            spell:Cast(unit)
        end
    end
)
hunterSpells.counterShot:Callback(
    "mechanic",
    function(spell, unit)
        if unit.los and unit.playerFacing and unit.distance < 40 then
            spell:Cast(unit)
        end
    end
)
hunterSpells.tranquilizingShot:Callback(
    "mechanic",
    function(spell, unit)
        if unit.los and unit.playerFacing and unit.distance < 40 then
            spell:Cast(unit)
        end
    end
)
hunterSpells.freezingTrap:Callback(
    "mechanic",
    function(spell, unit)
        if unit.los and unit.distance < 40 then
            spell:AoECast(unit)
        end
    end
)
hunterSpells.tarTrap:Callback(
    "mechanic",
    function(spell, unit)
        if unit.los and unit.distance <= 40 then
            spell:AoECast(unit)
        end
    end
)
hunterSpells.bindingShot:Callback(
    "mechanic",
    function(spell, unit)
        if unit.los and unit.distance <= 30 then
            spell:AoECast(unit)
        end
    end
)
hunterSpells.serpentSting:Callback(
    "mechanic",
    function(spell, unit)
        if unit.los and unit.playerFacing and unit.distance <= 40 then
            spell:Cast(unit)
        end
    end
)
hunterSpells.intimidation:Callback(
    "mechanic",
    function(spell, unit)
        local pet = awful.pet
        local target = unit
        if not petAlive() then
            return
        end
        if target.los and target.distance < 100 and target.distanceTo(pet) < 50 then
            spell:Cast(target)
        end
    end
)
hunterSpells.feignDeath:Callback(
    "mechanic",
    function(spell)
        spell:Cast()
    end
)
hunterSpells.disengage:Callback(
    "forward",
    function(spell)
        if disengageForwardInfos.inverseTime > awful.time then
            return
        end
        if spell:Cast() then
            hunterUI.disengageTrigger:disable()
            disengageForwardInfos.inverseTime = awful.time + 0.05
        end
    end
)
hunterSpells.misdirection:Callback(function(spell)
    local allies = awful.group
    local pet = awful.pet
    if not hunterUI.misdirection:usable() then
        return
    end
    for ____, ally in ipairs(allies) do
        if ally.los and not ally.dead and ally.distance < 100 and ally.isTank then
            if spell:Cast(ally) then
                return
            end
        end
    end
    if petAlive() and pet.distance < 100 and pet.los then
        spell:Cast(pet)
    end
end)
local function racialCallback(spell)
    if coreUI.racial == nil then
        return
    end
    if coreUI.racial:usable() then
        spell:Cast()
    end
end
coreSpells.bloodFury:Callback(racialCallback)
coreSpells.ancestralCall:Callback(racialCallback)
coreSpells.fireblood:Callback(racialCallback)
coreSpells.berserking:Callback(racialCallback)
coreSpells.arcaneTorrent:Callback(racialCallback)
coreSpells.arcaneTorrent:Callback(
    "bm.arcaneTorrent.st.1",
    function(spell)
        local player = awful.player
        if coreUI.racial == nil then
            return
        end
        if coreUI.racial:usable() and player.focus + castRegen(coreSpells.arcaneTorrent) + 15 < player.focusMax then
            spell:Cast()
        end
    end
)
coreSpells.arcaneTorrent:Callback(
    "bm.arcaneTorrent.cleave.1",
    function(spell)
        local player = awful.player
        if coreUI.racial == nil then
            return
        end
        if coreUI.racial:usable() and player.focus + castRegen(coreSpells.arcaneTorrent) + 30 < player.focusMax then
            spell:Cast()
        end
    end
)
coreSpells.lightsJudgment:Callback(function(spell)
    local player = awful.player
    local target = awful.target
    if coreUI.racial == nil then
        return
    end
    if not player.buff(hunterBuffs.trueShot) and not player.buff(hunterBuffs.bestialWrath) and coreUI.racial:usable() then
        spell:AoECast(target)
    end
end)
coreSpells.bagOfTricks:Callback(function(spell)
    local player = awful.player
    local target = awful.target
    if coreUI.racial == nil then
        return
    end
    if (not player.buff(hunterBuffs.trueShot) and not player.buff(hunterBuffs.bestialWrath) or awful.FightRemains() < 5) and coreUI.racial:usable() then
        spell:Cast(target)
    end
end)
____exports.load = function()
end
return ____exports
 end,
["hunter.beastMastery"] = function(...) 
local ____exports = {}
local ____rotation = require("core.rotation")
local selectNewTarget = ____rotation.selectNewTarget
local ____utility = require("core.utility")
local canCombat = ____utility.canCombat
local canRun = ____utility.canRun
local ____utility = require("hunter.utility")
local fourthyFightableLosFacingUnits = ____utility.fourthyFightableLosFacingUnits
local isSingleTarget = ____utility.isSingleTarget
local waitForBarbedShot = ____utility.waitForBarbedShot
local hunterSpells = require("hunter.spells")
local ____rotation = require("hunter.rotation")
local defensivesHandler = ____rotation.defensivesHandler
local interruptsHandler = ____rotation.interruptsHandler
local petManager = ____rotation.petManager
local ____bigWigs = require("core.bigWigs")
local bigWigsTimeLine = ____bigWigs.bigWigsTimeLine
local hunterUI = require("hunter.ui")
local ____callbacks = require("hunter.callbacks")
local load = ____callbacks.load
local coreSpells = require("core.spells")
load()
local function st()
    hunterSpells.barbedShot("bm.barbedShot.st.1")
    hunterSpells.killCommand("bm.killCommand.st.1")
    hunterSpells.callOfTheWild()
    hunterSpells.deathChakram()
    hunterSpells.bloodshed()
    hunterSpells.stampede()
    hunterSpells.aMurderofCrows()
    hunterSpells.steelTrap()
    hunterSpells.exhilaration()
    hunterSpells.bestialWrath()
    hunterSpells.killCommand()
    hunterSpells.barbedShot("bm.barbedShot.st.2")
    hunterSpells.direBeast()
    hunterSpells.serpentSting("bm.serpentSting.st.1")
    hunterSpells.killShot()
    hunterSpells.aspectOfTheWild()
    hunterSpells.cobraShot()
    hunterSpells.wailingArrow()
    coreSpells.bagOfTricks()
    coreSpells.arcaneTorrent("bm.arcaneTorrent.st.1")
end
local function cleave()
    hunterSpells.barbedShot("bm.barbedShot.cleave.1")
    hunterSpells.multiShot("bm.multishot.cleave.1")
    hunterSpells.bestialWrath()
    hunterSpells.killCommand("bm.killCommand.cleave.1")
    hunterSpells.callOfTheWild()
    hunterSpells.explosiveShot()
    hunterSpells.stampede()
    hunterSpells.bloodshed()
    hunterSpells.deathChakram()
    hunterSpells.steelTrap()
    hunterSpells.aMurderofCrows()
    hunterSpells.barbedShot("bm.barbedShot.cleave.2")
    hunterSpells.killCommand()
    hunterSpells.direBeast()
    hunterSpells.serpentSting("bm.serpentSting.cleave.1")
    hunterSpells.barrage("bm.barrage.cleave.1")
    hunterSpells.aspectOfTheWild()
    hunterSpells.cobraShot("bm.cobraShot.cleave.1")
    hunterSpells.wailingArrow()
    coreSpells.bagOfTricks()
    coreSpells.arcaneTorrent("bm.arcaneTorrent.cleave.1")
    hunterSpells.killShot()
end
local function cds()
    coreSpells.ancestralCall()
    coreSpells.fireblood()
    coreSpells.berserking()
    coreSpells.bloodFury()
    coreSpells.lightsJudgment()
end
local function opener()
    local pulltimer = bigWigsTimeLine:pullTimer()
    if pulltimer == 0 or pulltimer < 0.5 then
        return
    end
    if pulltimer <= 1.5 then
        hunterSpells.steelTrap()
    end
    if pulltimer <= hunterSpells.wailingArrow.castTime + awful.buffer and (not hunterSpells.steelTrap.usable or not hunterUI.wailingArrow:usable()) then
        hunterSpells.wailingArrow()
    end
end
____exports.bm = function()
    if not canRun() then
        return
    end
    selectNewTarget(fourthyFightableLosFacingUnits)
    hunterSpells.barbedShot("refresh")
    if waitForBarbedShot() then
        return
    end
    defensivesHandler()
    petManager()
    hunterSpells.misdirection()
    interruptsHandler()
    opener()
    if not canCombat() then
        return
    end
    awful.call("StartAttack")
    cds()
    if isSingleTarget() then
        st()
    else
        cleave()
    end
end
return ____exports
 end,
}
require("loader", ...)
