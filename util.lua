-- Calculate distance between two points
function dist_to(pos_a, pos_b)
    if pos_a and pos_b and pos_a.x and pos_a.y and pos_b.x and pos_b.y then
        local axbx = pos_a.x - pos_b.x
        local ayby = pos_a.y - pos_b.y
        return (axbx * axbx + ayby * ayby) ^ 0.5
    else
        return 10000000
    end
end