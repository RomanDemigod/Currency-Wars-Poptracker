-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Custom Items
ScriptHost:LoadScript("scripts/custom_items/class.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlus.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlusWrapper.lua")

-- Items
Tracker:AddItems("items/items.json")

if not IS_ITEMS_ONLY then -- <--- use variant info to optimize loading
    -- Maps
    Tracker:AddMaps("maps/maps.json")
    -- Location
    Tracker:AddLocations("locations/Node/a0.json")
	Tracker:AddLocations("locations/Node/a1.json")
	Tracker:AddLocations("locations/Node/a2.json")
	Tracker:AddLocations("locations/Node/a3.json")
	Tracker:AddLocations("locations/Node/a4.json")
	Tracker:AddLocations("locations/Node/a5.json")
	Tracker:AddLocations("locations/Node/a6.json")
	Tracker:AddLocations("locations/Node/a7.json")
	Tracker:AddLocations("locations/Node/a8.json")
end

-- Layout
--Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/access cards.json")
Tracker:AddLayouts("layouts/equipment.json")
Tracker:AddLayouts("layouts/characters.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
