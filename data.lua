local vanilla = "small-lamp"
local lamp_name = "burner-lamp"

local entity = table.deepcopy(data.raw.lamp[vanilla])
entity.name = lamp_name
entity.energy_source = {type = "void"}
entity.localised_name = {"entity-name."..lamp_name}
entity.localised_description = {"entity-description."..lamp_name}

local recipe = table.deepcopy(data.raw.recipe[vanilla])
recipe.name = lamp_name
recipe.results = { {type = "item", name = lamp_name, amount = 1} }
recipe.localised_name = {"entity-name."..lamp_name}
recipe.localised_description = {"entity-description."..lamp_name}
recipe.ingredients =
    {
      {"stone-furnace", 1},
      {"iron-gear-wheel", 3},
      {"iron-plate", 3}
    }

local item = table.deepcopy(data.raw.item[vanilla])
item.name = lamp_name
item.place_result = lamp_name
item.localised_name = {"entity-name."..lamp_name}
item.localised_description = {"entity-description."..lamp_name}

local dark_sound =
{
  type = "sound",
  name = "dark-damage",
  variations = {
    {filename = "__luxmortis__/sounds/swarm-1.ogg", volume = 1},
  }
}

local pain =
{
  type = "sound",
  name = "pain-damage",
  variations = {
    {filename = "__luxmortis__/sounds/pain-1.ogg", volume = 1},
    {filename = "__luxmortis__/sounds/pain-2.ogg", volume = 1},
    {filename = "__luxmortis__/sounds/pain-3.ogg", volume = 1},
    {filename = "__luxmortis__/sounds/pain-4.ogg", volume = 1},
    {filename = "__luxmortis__/sounds/pain-5.ogg", volume = 1},
    {filename = "__luxmortis__/sounds/pain-6.ogg", volume = 1},
    {filename = "__luxmortis__/sounds/pain-7.ogg", volume = 1},
  }
}

local ots45 = {
  type = "sprite",
  name = "ots45",
  width=256,
  height=256,
  filename = "__luxmortis__/img/intro.png"
}

data:extend({entity, item, recipe, dark_sound, pain, ots45})
