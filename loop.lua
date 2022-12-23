-- Tick handler
script.on_event(defines.events.on_tick, function(event)

    -- Stop if not init yet
    if not global.MaxPlayers then
        return
    end

    -- Check how many players are online
    local numplayers = 0
    for _, victim in pairs(game.connected_players) do
        numplayers = numplayers + 1

        -- No map for you!
        if victim.render_mode ~= defines.render_mode.game then
            victim.close_map()
        end
    end

    -- Detect player count change
    if numplayers ~= global.LastPlayerCount then

        -- If the number of players decreased, make sure we don't check an invalid player
        if numplayers < global.LastPlayerCount then

            -- If so, reset position
            if numplayers < global.DamPos then
                global.DamPos = 1
            end
        end
        global.LastPlayerCount = numplayers

        -- Calculate number of ticks till next damage
        global.FramesPerPlayer = global.MaxPlayers / numplayers
    end

    -- Every FramesPerPlayer, check one player
    if game.tick % global.FramesPerPlayer == 0 then

        -- If we are aren't to the last player yet, increment
        if global.DamPos < numplayers then
            global.DamPos = global.DamPos + 1
        else -- Otherwise start over
            global.DamPos = 1
        end

        local player = game.connected_players[global.DamPos]

        if player and player.character then
            local found = false

            -- Look for lamps
            if not found then
                local light_found = player.surface.find_entities_filtered {
                    position = player.position,
                    radius = global.d_lightd,
                    force = "player",
                    type = "lamp"
                }
                for _, light in pairs(light_found) do
                    if light.status ~= defines.entity_status.no_power then
                        found = true
                        break -- Found one, stop
                    end
                end
            end

            if not global.d_player_dmg then
                global.d_player_dmg = {}
            end

            -- Player is safe, reset damage
            if found then
                global.d_player_dmg[player.index] = 5
            else
                -- No near by light found

                if global.d_player_dmg[player.index] == 5 then
                    player.character.surface.play_sound({
                        path = "dark-damage",
                        position = player.character.position,
                        volume_modifier = 1
                    })
                end

                -- Keeps immortals from overflowing the value
                if global.d_player_dmg[player.index] and global.d_player_dmg[player.index] < 500 then
                    -- Increase damage
                    global.d_player_dmg[player.index] = (global.d_player_dmg[player.index] +
                    global.d_player_dmg[player.index])
                else
                    -- Else reset
                    global.d_player_dmg[player.index] = 5 -- Init
                end

                -- If above minimum, damage player
                if global.d_player_dmg[player.index] and global.d_player_dmg[player.index] > 5 then
                    -- player.print("[color=red]The darkness gnaws at you...[/color]")
                    player.character.surface.play_sound({
                        path = "pain-damage",
                        position = player.character.position,
                        volume_modifier = 0.5
                    })
                    player.character.surface.create_entity({
                        name = "atomic-fire-smoke",
                        position = player.character.position
                    })

                    player.character.damage(global.d_player_dmg[player.index], game.forces["enemy"])
                end
            end
        end
    end
end)
