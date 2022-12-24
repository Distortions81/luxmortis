data:extend({{
    type = "sprite",
    name = "ots45",
    width = 256,
    height = 256,
    filename = "__luxmortis__/img/intro.png"
}})

data:extend({{

    type = "sound",
    name = "dark-damage",
    variations = {{
        filename = "__luxmortis__/sounds/swarm-1.ogg",
        volume = 1
    }}
}})

data:extend({{
    type = "sound",
    name = "pain-damage",
    variations = {{
        filename = "__luxmortis__/sounds/pain-1.ogg",
        volume = 1
    }, {
        filename = "__luxmortis__/sounds/pain-2.ogg",
        volume = 1
    }, {
        filename = "__luxmortis__/sounds/pain-3.ogg",
        volume = 1
    }, {
        filename = "__luxmortis__/sounds/pain-4.ogg",
        volume = 1
    }, {
        filename = "__luxmortis__/sounds/pain-5.ogg",
        volume = 1
    }, {
        filename = "__luxmortis__/sounds/pain-6.ogg",
        volume = 1
    }, {
        filename = "__luxmortis__/sounds/pain-7.ogg",
        volume = 1
    }}
}})

data:extend({{
    type = "item",
    name = "large-lamp",
    icon = "__luxmortis__/graphics/icons/large-lamp.png",
    icon_size = 64,
    group = "logistics",
    subgroup = "circuit-network",
    order = "a[light]-a[large-lamp]-b",
    place_result = "large-lamp",
    stack_size = 50
}})

data:extend({{
    type = "lamp",
    name = "large-lamp",
    icon = "__luxmortis__/graphics/icons/large-lamp.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {
        hardness = 0.2,
        mining_time = 0.5,
        result = "large-lamp"
    },
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    vehicle_impact_sound = {
        filename = "__base__/sound/car-metal-impact.ogg",
        volume = 0.65
    },
    energy_source = {
        type = "electric",
        usage_priority = "lamp"
    },
    energy_usage_per_tick = "30KW",
    darkness_for_all_lamps_on = 0.5,
    darkness_for_all_lamps_off = 0.3,
    light = {
        intensity = 0.9,
        size = 80,
        color = {
            r = 0.9,
            g = 0.9,
            b = 1.0
        }
    },
    light_when_colored = {
        intensity = 1,
        size = 12,
        color = {
            r = 0.9,
            g = 0.9,
            b = 1.0
        }
    },
    glow_size = 12,
    glow_color_intensity = 0.16,
    picture_off = {
        layers = {{
            filename = "__luxmortis__/graphics/entity/large-lamp.png",
            priority = "high",
            width = 42,
            height = 36,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(0, 3),
            hr_version = {
                filename = "__luxmortis__/graphics/entity/large-lamp/hr-lamp.png",
                priority = "high",
                width = 83,
                height = 70,
                frame_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(0.25, 3),
                scale = 0.5
            }
        }, {
            filename = "__luxmortis__/graphics/entity/large-lamp/lamp-shadow.png",
            priority = "high",
            width = 38,
            height = 24,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(4, 5),
            draw_as_shadow = true,
            hr_version = {
                filename = "__luxmortis__/graphics/entity/large-lamp/hr-lamp-shadow.png",
                priority = "high",
                width = 76,
                height = 47,
                frame_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(4, 4.75),
                draw_as_shadow = true,
                scale = 0.5
            }
        }}
    },
    picture_on = {
        filename = "__luxmortis__/graphics/entity/large-lamp/lamp-light.png",
        priority = "high",
        width = 46,
        height = 40,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0, -7),
        hr_version = {
            filename = "__luxmortis__/graphics/entity/large-lamp/hr-lamp-light.png",
            priority = "high",
            width = 90,
            height = 78,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(0, -7),
            scale = 0.5
        }
    },
    signal_to_color_mapping = {{
        type = "virtual",
        name = "signal-red",
        color = {
            r = 1,
            g = 0,
            b = 0
        }
    }, {
        type = "virtual",
        name = "signal-green",
        color = {
            r = 0,
            g = 1,
            b = 0
        }
    }, {
        type = "virtual",
        name = "signal-blue",
        color = {
            r = 0,
            g = 0,
            b = 1
        }
    }, {
        type = "virtual",
        name = "signal-yellow",
        color = {
            r = 1,
            g = 1,
            b = 0
        }
    }, {
        type = "virtual",
        name = "signal-pink",
        color = {
            r = 1,
            g = 0,
            b = 1
        }
    }, {
        type = "virtual",
        name = "signal-cyan",
        color = {
            r = 0,
            g = 1,
            b = 1
        }
    }},

    circuit_wire_connection_point = circuit_connector_definitions["lamp"].points,
    circuit_connector_sprites = circuit_connector_definitions["lamp"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
}})

data:extend({{
    type = "recipe",
    name = "large-lamp",
    enabled = false,
    energy_required = 2.5,
    ingredients = {{"small-lamp", 4}, {"iron-plate", 1}, {"copper-plate", 1}},
    result = "large-lamp"
}})

data:extend({{
    type = "technology",
    name = "large-lamp",
    icon = "__luxmortis__/graphics/technology/large-lamps.png",
    icon_size = 128,
    prerequisites = {"optics"},
    effects = {},
    unit = {
        count = 5,
        ingredients = {{"automation-science-pack", 1}},
        time = 5
    }
}})

table.insert(data.raw["technology"]["large-lamp"].effects, {
    type = "unlock-recipe",
    recipe = "large-lamp"
})
