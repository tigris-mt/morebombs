function morebombs.nuke(pos, radius)
    tnt.boom(pos, {
        radius = radius,
    })

    local corium = minetest.find_node_near(pos, 3, {"air"}) or pos
    minetest.set_node(corium, {name = "morebombs:falling_corium"})
    minetest.check_for_falling(corium)
end

minetest.register_node("morebombs:falling_corium", {
    drawtype = "airlike",
    paramtype = "light",
    groups = {falling_node = 1, not_in_creative_inventory = 1},
})

minetest.register_abm{
    label = "Falling Corium Transformation",
    nodenames = {"morebombs:falling_corium"},
    interval = 1,
    chance = 1,
    action = function(pos)
        minetest.set_node(pos, {name = "technic:corium_source"})
    end,
}

morebombs.register("morebombs:nuclear_bomb", {
    description = "Nuclear Bomb",
    tiles = {"morebombs_nuke.png"},
    sounds = default.node_sound_metal_defaults(),
    groups = {cracky = 2},
    action = function(pos)
        morebombs.nuke(pos, 14)
    end,
})

minetest.register_craft{
    output = "morebombs:nuclear_bomb 2",
    recipe = {
        {"default:mese_crystal", "tnt:tnt", "default:mese_crystal"},
        {"technic:stainless_steel_block", "technic:uranium_fuel", "technic:stainless_steel_block"},
        {"default:mese_crystal", "tnt:tnt", "default:mese_crystal"},
    },
}

morebombs.register("morebombs:infused_nuclear_bomb", {
    description = "Infused Nuclear Bomb",
    tiles = {"morebombs_infused.png"},
    sounds = default.node_sound_metal_defaults(),
    groups = {cracky = 2},
    action = function(pos)
        morebombs.nuke(pos, 22)
    end,
})

minetest.register_craft{
    output = "morebombs:infused_nuclear_bomb",
    recipe = {
        {"morebombs:nuclear_bomb", "morebombs:nuclear_bomb", "morebombs:nuclear_bomb"},
        {"technic:stainless_steel_block", "morebombs:nuclear_bomb", "technic:stainless_steel_block"},
        {"technic:stainless_steel_block", "default:diamondblock", "technic:stainless_steel_block"},
    },
}

morebombs.register("morebombs:armageddon", {
    description = "Armageddon",
    tiles = {"morebombs_armageddon.png"},
    sounds = default.node_sound_metal_defaults(),
    groups = {cracky = 2},
    action = function(pos)
        morebombs.nuke(pos, 30)
    end,
})

minetest.register_craft{
    output = "morebombs:armageddon",
    recipe = {
        {"morebombs:infused_nuclear_bomb", "morebombs:thunderfist", "morebombs:infused_nuclear_bomb"},
        {"technic:stainless_steel_block", "morebombs:infused_nuclear_bomb", "technic:stainless_steel_block"},
        {"technic:stainless_steel_block", "default:diamondblock", "technic:stainless_steel_block"},
    },
}
