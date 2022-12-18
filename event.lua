-- init
script.on_init(function()
    make_dark_globals()
end)

-- Events
script.on_event({defines.events.on_player_created, defines.events.on_player_respawned,
                 defines.events.on_cutscene_cancelled, defines.events.on_game_created_from_scenario,
                 defines.events.on_chunk_charted}, function(event)
    dark_event_handler(event)
end)

function dark_event_handler(event)
    if event.name == defines.events.on_player_created then
        on_player_created(event)
    elseif event.name == defines.events.on_player_respawned then
        on_player_respawned(event)
    elseif event.name == defines.events.on_cutscene_cancelled then
        on_player_created(event)
    elseif event.name == defines.events.on_game_created_from_scenario then
        make_dark_globals()
    elseif event.name == defines.events.on_chunk_charted then
        on_chunk_charted(event)
    end
end

function on_chunk_charted(event)
        event.force.unchart_chunk(event.position, event.surface_index)
end

-- New player
function on_player_created(event)
    dark_startmap()

    if event and event.player_index then
        local player = game.players[event.player_index]
        if player and player.valid then
            d_player_globals(player)
            player_setup(player)
            respawn_pitems(player)
        end
    end
end

-- Respawn
function on_player_respawned(event)
    if event and event.player_index then
        local player = game.players[event.player_index]
        if player and player.valid then
            player.insert {
                name = "wood",
                count = 25
            }
            player_setup(player)
        end
    end
end

-- Setup charcater, disable flashlight, minimap, etc.
function player_setup(player)
    player.minimap_enabled = false
    player.disable_flashlight()
end

function respawn_pitems(player)
    player.insert {
        name = "small-lamp",
        count = 25
    }
    player.insert {
        name = "small-electric-pole",
        count = 25
    }
    player.insert {
        name = "wood",
        count = 25
    }
end