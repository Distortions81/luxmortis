--item.lua
local burnerLamp = table.deepcopy(data.raw["item"]["small-lamp"])

burnerLamp.name = "burner-lamp"
burnerLamp.icons = {
  {
    icon = burnerLamp.icon,
    tint = {r=1,g=0,b=0,a=0.3}
  },
}

local recipe = table.deepcopy(data.raw["recipe"]["small-lamp"])
recipe.enabled = true
recipe.name = "burner-lamp"
recipe.ingredients = {{"copper-plate",2},{"steel-plate",1},{"coal",10},{"stone",2}}
recipe.result = "burner-lamp"

data:extend{burnerLamp,recipe}
