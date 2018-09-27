morebombs.register("morebombs:packed_tnt", {
    description = "Packed TNT",
    tiles = {"morebombs_packed_tnt.png"},
    sounds = default.node_sound_metal_defaults(),
    groups = {cracky = 2},
    action = function(pos)
        tnt.boom(pos, {
            radius = 5,
        })
    end,
})

minetest.register_craft{
    output = "morebombs:packed_tnt",
    recipe = {
        {"default:tinblock", "tnt:tnt", "default:tinblock"},
        {"tnt:tnt", "tnt:tnt", "tnt:tnt"},
        {"default:tinblock", "tnt:tnt", "default:tinblock"},
    },
}

morebombs.register("morebombs:thunderfist", {
    description = "Thunderfist",
    tiles = {"morebombs_thunderfist.png"},
    sounds = default.node_sound_metal_defaults(),
    groups = {cracky = 2},
    action = function(pos)
        tnt.boom(pos, {
            radius = 9,
        })
    end,
})

minetest.register_craft{
    output = "morebombs:thunderfist",
    recipe = {
        {"default:steelblock", "morebombs:packed_tnt", "default:steelblock"},
        {"morebombs:packed_tnt", "morebombs:packed_tnt", "morebombs:packed_tnt"},
        {"default:steelblock", "morebombs:packed_tnt", "default:steelblock"},
    },
}

morebombs.register("morebombs:overkill", {
    description = "Overkill",
    tiles = {"morebombs_overkill.png"},
    sounds = default.node_sound_metal_defaults(),
    groups = {cracky = 2},
    action = function(pos)
        tnt.boom(pos, {
            radius = 13,
        })
    end,
})

minetest.register_craft{
    output = "morebombs:overkill",
    recipe = {
        {"default:bronzeblock", "morebombs:thunderfist", "default:bronzeblock"},
        {"default:bronzeblock", "morebombs:thunderfist", "default:bronzeblock"},
        {"default:bronzeblock", "morebombs:thunderfist", "default:bronzeblock"},
    },
}

morebombs.register("morebombs:desolation", {
    description = "Desolation",
    tiles = {"morebombs_desolation.png"},
    sounds = default.node_sound_metal_defaults(),
    groups = {cracky = 2},
    action = function(pos)
        tnt.boom(pos, {
            radius = 19,
        })
    end,
})

minetest.register_craft{
    output = "morebombs:desolation",
    recipe = {
        {"default:mese", "morebombs:overkill", "default:mese"},
        {"default:mese", "morebombs:overkill", "default:mese"},
        {"default:mese", "morebombs:overkill", "default:mese"},
    },
}
