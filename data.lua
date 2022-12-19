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

data:extend({entity, item, recipe})
