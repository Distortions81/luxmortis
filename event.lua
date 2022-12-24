-- init
script.on_init(function()
    make_dark_globals()
end)

-- Events
script.on_event({defines.events.on_player_created, defines.events.on_player_respawned,
                 defines.events.on_cutscene_cancelled, defines.events.on_game_created_from_scenario,defines.events.on_gui_click}, function(event)
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
    elseif event.name == defines.events.on_gui_click then
        on_gui_click(event)
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
                caption = "[font=default-large-bold]Welcome to Lux Mortis: Planet OTS-45[/font]"
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
                name = "luxmortis_intro_close",
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
                caption = "[font=default-large]Due to multiple engine failures, you have crashed landed on the pitch black planet[/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]OTS-45. This rogue planet has no parent star, but it has enough atmosphere and[/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]geological heating to sustain life. As you scavenge for resources from your crashed ship[/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]and set up a power generator and lights, your head lamp runs out of power. You are then[/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]attacked by a swarm of small insect-like lifeforms. You soon discover that these[/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]lifeforms are unable to cope with bright light, likely due to evolving on a planet with[/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]no sunlight. You must use this knowledge and all your survival skills to survive on the[/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]planet and adapt to the harsh environment as you uncover the secrets of this[/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]mysterious world. But be warned, who knows what other dangers may lurk in the darkness.[/font]"
            }
            banished_main.add {
                type = "label",
                caption = "[font=default-large]You must stay vigilant at all times in order to make it out alive. Good luck.[/font]"
            }
        else
            -- Close button
            if close then
                victim.gui.screen.banished_inform.destroy()
            end
        end
    end
end

function on_gui_click(event)
    if event and event.element and event.element.valid and event.player_index then
        local player = game.players[event.player_index]

        if player and player.valid then
            -- Info window close
            if event.element.name == "luxmortis_intro_close" and player.gui and player.gui.screen then
                if player.gui.screen.luxmortis_intro then
                    player.gui.screen.luxmortis_intro.destroy()
                end
            end
        end
    end
end