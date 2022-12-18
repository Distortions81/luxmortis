-- GLOBALS
-- Create globals, if needed
function make_dark_globals()
    -- Lamp radius
    if not global.d_lightd then
        global.d_lightd = 10
    end
    -- Limited fire life
    if not global.d_firelife then
        global.d_firelife = 5400
    end
    -- Player darkness damage
    if not global.d_player_dmg then
        global.d_player_dmg = {}
    end
end


--Map setup
function dark_startmap()

    if not global.dark_settings_set then
        -- Starting map settings
        global.dark_settings_set = true

        game.surfaces[1].freeze_daytime = true
        game.surfaces[1].brightness_visual_weights = {1 / 0.85, 1 / 0.85, 1 / 0.85}
        game.surfaces[1].daytime = 0.5

        -- Get spawn position
        local cpos = {
            x = 3,
            y = 5
        }

        -- Start box
        local boxpos = {
            x = -1,
            y = -1
        }
        local startbox = game.surfaces[1].create_entity {
            name = "iron-chest",
            position = boxpos,
            force = "player"
        }
        startbox.insert {
            name = "burner-mining-drill",
            count = 16
        }
        startbox.insert {
            name = "stone-furnace",
            count = 8
        }
        startbox.insert {
            name = "small-lamp",
            count = 50
        }
        startbox.insert {
            name = "firearm-magazine",
            count = 50
        }

        -- start pump
        local ppos = {
            x = 4,
            y = 2
        }
        local startpump = game.surfaces[1].create_entity {
            name = "offshore-pump",
            position = ppos,
            force = "player"
        }
        startpump.minable = false
        startpump.rotatable = false
        startpump.destructible = false

        -- start boiler
        local bpos = {
            x = 5,
            y = 4
        }
        local startboiler = game.surfaces[1].create_entity {
            name = "boiler",
            position = bpos,
            force = "player",
            direction = 3
        }
        startboiler.minable = false
        startboiler.rotatable = false
        startboiler.destructible = false
        startboiler.insert {
            name = "wood",
            count = 100
        }
        -- start engine
        local epos = {
            x = 8,
            y = 4
        }
        local startengine = game.surfaces[1].create_entity {
            name = "steam-engine",
            position = epos,
            force = "player",
            direction = 3
        }
        startengine.minable = false
        startengine.rotatable = false
        startengine.destructible = false

        -- start pole
        local pppos = {
            x = 8,
            y = 2
        }
        local startpole = game.surfaces[1].create_entity {
            name = "small-electric-pole",
            position = pppos,
            force = "player",
            direction = 3
        }
        startpole.minable = false
        startpole.rotatable = false
        startpole.destructible = false

        -- start lamp
        local lpos = {
            x = 9,
            y = 2
        }
        local startlamp = game.surfaces[1].create_entity {
            name = "small-lamp",
            position = lpos,
            force = "player",
            direction = 3
        }
        startlamp.minable = false
        startlamp.rotatable = false
        startlamp.destructible = false
    end

end

function d_player_globals(player)
    if not global.d_player_dmg then
        global.d_player_dmg = {}
    end

    global.d_player_dmg[player.index] = 0
end
