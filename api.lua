local function pfd(pos)
    return minetest.get_node(pos).param2
end

function morebombs.register(name, def, exists)
    local g = table.copy(def.groups or {})
    g.mesecon = 2
    g.flammable = 5
    if not exists then
        minetest.register_node(name, {
            description = def.description,
            tiles = def.tiles,
            groups = g,
            sounds = def.sounds,
            paramtype2 = def.paramtype2,
            after_place_node = function(pos, placer)
                if placer:is_player() then
                    local meta = minetest.get_meta(pos)
                    meta:set_string("owner", placer:get_player_name())
                end
            end,
            on_blast = function(pos)
                minetest.after(0.1, def.action, pos, def, pfd(pos))
            end,
            mesecons = {
                effector = {
                    action_on = function(pos)
                        def.action(pos, def, pfd(pos))
                    end,
                },
            },
            on_burn = function(pos)
                def.action(pos, def, pfd(pos))
            end,
            on_ignite = function(pos)
                def.action(pos, def, pfd(pos))
            end,
        })
    end

    morebombs.bombs[name] = def
    morebombs.hook(name, def)
end

function morebombs.hook(name, def)
    -- Dummy function for other mods.
end

-- Catch all registrations, including those prior to (calling) mod loading.
function morebombs.register_hook(f)
    -- Run function for prior.
    for k,v in pairs(morebombs.bombs) do
        morebombs.hook(k, v)
    end
    -- Register function for later.
    local old = morebombs.hook
    morebombs.hook = function(...)
        f(...)
        old(...)
    end
end
