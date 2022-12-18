-- GLOBALS
-- Create globals, if needed
function make_dark_globals()
    -- Lamp radius
    if not global.d_lightd then
        global.d_lightd = 14
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

function dark_startmap()

    -- Starting map settings
    global.dark_settings_set = true

    game.surfaces[1].freeze_daytime = true
    game.surfaces[1].brightness_visual_weights = {1 / 0.85, 1 / 0.85, 1 / 0.85}
    game.surfaces[1].daytime = 0.5

    -- Get spawn position
    local cpos = {
        x = 2,
        y = 2
    }

    --Start box
    local boxpos = {
        x = 3,
        y = 2
    }
    global.startbox = game.surfaces[1].create_entity {
        name = "iron-chest",
        position = boxpos,
        force = "player"
    }
    global.startbox.insert {
        name = "boiler",
        count = 4
    }
    global.startbox.insert {
        name = "steam-engine",
        count = 8
    }
    global.startbox.minable = false
    global.startbox.rotatable = false
    global.startbox.destructible = false

    --start pump
    local ppos = {
      x = 5,
      y = 2
  }
    global.startpump = game.surfaces[1].create_entity{name="offshore-pump", position=ppos, force="player"}
    global.startpump.minable = false
    global.startpump.rotatable = false
    global.startpump.destructible = false

    -- Add lamp
    if global.m45logo_lamp then
        rendering.destroy(global.m45logo_lamp)
    end
    global.m45logo_lamp = rendering.draw_sprite {
        sprite = "entity/small-lamp",
        render_layer = "floor",
        target = cpos,
        x_scale = 2,
        y_scale = 2,
        surface = game.surfaces[1]
    }
    if global.m45logo_light then
        rendering.destroy(global.m45logo_light)
    end
    global.m45logo_light = rendering.draw_light {
        sprite = "utility/light_medium",
        render_layer = 148,
        target = cpos,
        scale = 8,
        surface = game.surfaces[1],
        minimum_darkness = 0.5
    }
end

function d_player_globals(player)
    if not global.d_player_dmg then
        global.d_player_dmg = {}
    end

    global.d_player_dmg[player.index] = 0
end
