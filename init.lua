morebombs = {
    -- Need Technic radioactivity stuff.
    nuclear = minetest.get_modpath("technic") and true or false,
    bombs = {},
}

local function include(p)
    return dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/" .. p)
end

include("api.lua")

-- Allow default tnt to work with hooks.
morebombs.register("tnt:tnt", {
    description = "TNT",
    action = function(pos)
        tnt.boom(pos, {
            radius = tonumber(minetest.settings:get("tnt_radius") or 3)
        })
    end,
}, true)

include("conventional.lua")
include("drill.lua")

if morebombs.nuclear then
    include("nuclear.lua")
end
