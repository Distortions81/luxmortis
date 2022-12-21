--Darkness Damage, every 5 seconds
--Should process x per frame instead, to prevent hitching
script.on_nth_tick(
  60,
  function(event)
    for _, player in pairs(game.connected_players) do
      if player and player.character then
        local found = false

        --Spawn position
        local spawn_pos = {x = 0, y = 0}

        --If player is near spawn they are safe
        local distance = dist_to(spawn_pos, player.position)
        if distance < 25 then
          found = true
        end

        --Look for lamps
        if not found then
          local light_found =
            player.surface.find_entities_filtered {
            position = player.position,
            radius = global.d_lightd,
            force = "player",
            type = "lamp"
          }
          for _, light in pairs(light_found) do
            if light.status ~= defines.entity_status.no_power then
              found = true
              break --Found one, stop
            end
          end
        end

        if not global.d_player_dmg then
          global.d_player_dmg = {}
        end

        --Player is safe, reset damage
        if found then
          global.d_player_dmg[player.index] = 0
        else
          --No near by light found

          --Keeps immortals from overflowing the value
          if global.d_player_dmg[player.index] and global.d_player_dmg[player.index] < 500 then
            global.d_player_dmg[player.index] = (global.d_player_dmg[player.index] + global.d_player_dmg[player.index] + 1)
          else
            global.d_player_dmg[player.index] = 0 --Init
          end

          if global.d_player_dmg[player.index] and global.d_player_dmg[player.index] > 0 then
            player.character.damage(global.d_player_dmg[player.index], game.forces["enemy"])

            --player.print("[color=red]The darkness gnaws at you...[/color]")
            player.surface.play_sound{path="__luxmortis__/sounds/poison-capsule-explosion-1.ogg", position=player.position}
          end
        end
      end
    end
  end
)