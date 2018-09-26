function morebombs.drill(start, radius, dir)
    local pos = table.copy(start)
    -- First the drill explodes.
    tnt.boom(pos, {
        radius = 1,
    })
    -- Then blast the drill path.
    for i=radius,1,-1 do
        -- Add direction, 2x if not first blast.
        pos = vector.add(pos, vector.multiply(dir, (i == radius) and i or (i * 2)))
        tnt.boom(pos, {
            radius = i,
        })
    end
end

morebombs.register("morebombs:drill", {
    description = "Drill Explosive",
    tiles = {
        "morebombs_drill.png",
        "morebombs_drill.png",
        "morebombs_drill.png^morebombs_drill_side.png^[transformR180",
        "morebombs_drill.png^morebombs_drill_side.png",
        "morebombs_drill.png^morebombs_drill_front.png",
        "morebombs_drill.png",
    },
    sounds = default.node_sound_metal_defaults(),
    groups = {cracky = 2},
    paramtype2 = "facedir",
    action = function(pos)
        morebombs.drill(pos, 5, minetest.facedir_to_dir(minetest.get_node(pos).param2))
    end,
})


minetest.register_craft{
    output = "morebombs:drill",
    recipe = {
        {"default:diamond", "default:steelblock", "default:steelblock"},
        {"", "", "morebombs:packed_tnt"},
        {"default:diamond", "default:steelblock", "default:steelblock"},
    },
}

morebombs.register("morebombs:drill_large", {
    description = "Large Drill Explosive",
    tiles = {
        "morebombs_large_drill.png",
        "morebombs_large_drill.png",
        "morebombs_large_drill.png^morebombs_drill_side.png^[transformR180",
        "morebombs_large_drill.png^morebombs_drill_side.png",
        "morebombs_large_drill.png^morebombs_drill_front.png",
        "morebombs_large_drill.png",
    },
    sounds = default.node_sound_metal_defaults(),
    groups = {cracky = 2},
    paramtype2 = "facedir",
    action = function(pos)
        morebombs.drill(pos, 8, minetest.facedir_to_dir(minetest.get_node(pos).param2))
    end,
})


minetest.register_craft{
    output = "morebombs:drill_large",
    recipe = {
        {"morebombs:drill", "morebombs:drill", "morebombs:drill"},
        {"morebombs:drill", "default:mese", "morebombs:drill"},
        {"morebombs:drill", "morebombs:drill", "morebombs:drill"},
    },
}
