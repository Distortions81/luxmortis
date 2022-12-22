-- Darkness Damage, every 5 seconds
-- Should process x per frame instead, to prevent hitching
script.on_event(defines.events.on_tick, function(event)

  --Not init yet
  if not global.MaxPlayers then
    return
  end

    local numplayers = 0
    for _, _ in pairs(game.connected_players) do
        numplayers = numplayers + 1
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
    if game.tick % global.FramesPerPlayer == 0 then

        if global.DamPos < numplayers then
            global.DamPos = global.DamPos + 1
        else
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

                -- Keeps immortals from overflowing the value
                if global.d_player_dmg[player.index] and global.d_player_dmg[player.index] < 500 then
                    global.d_player_dmg[player.index] = (global.d_player_dmg[player.index] + global.d_player_dmg[player.index])
                else
                    global.d_player_dmg[player.index] = 5 -- Init
                end

                if global.d_player_dmg[player.index] and global.d_player_dmg[player.index] > 5 then
                    player.character.damage(global.d_player_dmg[player.index], game.forces["enemy"])

                    player.print("[color=red]The darkness gnaws at you...[/color]")
                end
            end
        end
    end
end)
