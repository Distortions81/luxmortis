

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

data:extend({dark_sound, pain, ots45})

