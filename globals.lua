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
    
    --Starting map settings
    if not global.dark_settings_set then
      global.dark_settings_set = true
  
      game.surfaces[1].freeze_daytime = true
      game.surfaces[1].brightness_visual_weights = {1 / 0.85, 1 / 0.85, 1 / 0.85}
      game.surfaces[1].daytime = 0.5
    end
  
    --Get spawn position
    local cpos = {x = 0, y = 0}
  
    --Add lamp
    if global.m45logo_lamp then
      rendering.destroy(global.m45logo_lamp)
    end
    global.m45logo_lamp =
      rendering.draw_sprite {
      sprite = "entity/small-lamp",
      render_layer = "floor",
      target = {x = cpos.x, y = cpos.y + 3.5},
      x_scale = 2,
      y_scale = 2,
      surface = game.surfaces[1]
    }
  end
  
function d_player_globals(player)
    if not global.d_player_dmg then
      global.d_player_dmg = {}
    end
  
    global.d_player_dmg[player.index] = 0
  end