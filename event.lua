--New player
function on_player_created(event)
  if event and event.player_index then
    make_dark_globals()
    dark_startmap()

    local player = game.players[event.player_index]
    if player and player.valid then
      d_player_globals(player)
      player_setup(player)
      respawn_pitems(player)
    end
  end
end

--Respawn
function on_player_respawned(event)
  if event and event.player_index then
    local player = game.players[event.player_index]
    if player and player.valid then
      player.insert {name = "wood", count = 25}
      player_setup(player)
    end
  end
end

function player_setup(player)
  player.minimap_enabled = false
  player.disable_flashlight()
end

function respawn_pitems(player)
  player.insert {name = "small-lamp", count = 25}
  player.insert {name = "small-electric-pole", count = 25}
  player.insert {name = "wood", count = 25}
end