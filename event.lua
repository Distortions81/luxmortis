-- init
script.on_init(function()
    make_dark_globals()
end)

-- Events
script.on_event({defines.events.on_player_created, defines.events.on_player_respawned,
                 defines.events.on_cutscene_cancelled, defines.events.on_game_created_from_scenario}, function(event)
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

-- New player
function on_player_created(event)
    dark_startmap()

    if event and event.player_index then
        local player = game.players[event.player_index]
        if player and player.valid then
            d_player_globals(player)
            player_setup(player)
            respawn_citems(player)
            luxmortis_intro(player)
        end
    end
end

-- Respawn
function on_player_respawned(event)
    if event and event.player_index then
        local player = game.players[event.player_index]
        if player and player.valid then
            player_setup(player)
        end
    end
end

-- Setup charcater, disable flashlight, minimap, etc.
function player_setup(player)
    player.minimap_enabled = false
    player.disable_flashlight()
end

function respawn_citems(player)
end

function luxmortis_intro(victim)

    if victim and victim.gui and victim.gui.screen then
        if not victim.gui.screen.luxmortis_intro then
            local main_flow = victim.gui.screen.add {
                type = "frame",
                name = "luxmortis_intro",
                direction = "vertical"
            }
            main_flow.force_auto_center()
            local titlebar = main_flow.add {
                type = "frame",
                direction = "horizontal"
            }
            titlebar.drag_target = main_flow
            titlebar.style.horizontal_align = "center"
            titlebar.style.horizontally_stretchable = true

            titlebar.add {
                type = "label",
                style = "frame_title",
                caption = "[font=default-large-bold]System Status: [color=red]Red alert![/color][/font]"
            }

            local pusher = titlebar.add {
                type = "empty-widget",
                style = "draggable_space_header"
            }
            pusher.style.vertically_stretchable = true
            pusher.style.horizontally_stretchable = true
            pusher.drag_target = main_flow

            titlebar.add {
                type = "sprite-button",
                name = "banished_inform_close",
                sprite = "utility/close_white",
                style = "frame_action_button",
                tooltip = "Close this window"
            }

            local banished_main = main_flow.add {
                type = "frame",
                name = "main",
                direction = "vertical"
            }
            banished_main.style.horizontal_align = "center"

            banished_main.add {
                type = "sprite",
                sprite = "ots45"
            }
            banished_main.add {
                type = "label",
                caption = ""
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]Due to an unexpected multiple-engine failure, your ship has crashed on a rogue planet named OTS-45.[/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large-bold]Planet OTS-45 does not have a parent star, and only knows the dim glow of distant starlight.[/font]"
            }
            banished_main.add {
                type = "label",
                caption = ""
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]You have scavened some materials from the ship, to make a basic generator.[/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]Shortly after getting the generator running, your head-lamp is no longer functioning.[/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large][color=orange]You were suddenly attacked by a swarm of unknown life forms, and ran back to base.[/color][/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]Luckily, It would appear these specific life forms are [color=cyan]unable to cope with bright light.[/color][/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]Considering there is only faint starlight here, I guess that shouldn't be surprising.[/font]"
            }
            banished_main.add {
                type = "label",
                caption = ""
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large][color=gray]Lets just hope we can keep the generator running, and there aren't any other threats out in the darkness...[/color][/font]"
            }
        else
            -- Close button
            if close then
                victim.gui.screen.banished_inform.destroy()
            end
        end
    end
end
