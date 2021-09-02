local function tt_get_tool_recipe(tool_type, material_item, handle_material)
  local tab = {
    sword = {
      {"",              material_item,   ""           },
      {"",              material_item,   ""           },
      {"",              handle_material, ""           },
    },
    pick = {
      {material_item,   material_item,   material_item},
      {"",              handle_material, ""           },
      {"",              handle_material, ""           },
    },
    shovel = {
      {"",              material_item,   ""           },
      {"",              handle_material, ""           },
      {"",              handle_material, ""           },
    },
    axe = {
      {material_item,   material_item,   ""           },
      {material_item,   handle_material, ""           },
      {"",              handle_material, ""           },
    },
    hoe = {
      {material_item,   material_item,   ""           },
      {"",              handle_material, ""           },
      {"",              handle_material, ""           },
    },
  }

  return tab[tool_type] or tab.pick
end

local function tt_register_tool_stuff(tool_type, pretty_tool_type, material, pretty_material, material_item, handle_material, tool_caps, groups)
  minetest.register_tool("terrortest_tools:" .. tool_type .. "_" .. material, {
    description = pretty_material .. " " .. pretty_tool_type,
    inventory_image = "terrortest_" .. tool_type .. "_" .. material .. ".png",
    tool_capabilities = tool_caps,
    groups = groups,
  })

  minetest.register_craft({
    output = "terrortest_tools:" .. tool_type .. "_" .. material,
    recipe = tt_get_tool_recipe(tool_type, material_item, handle_material),
  })
end

tt_register_tool_stuff("pick", "Pickaxe", "wood", "Wooden", "group:planks", "terrortest_core:stick", {
  full_punch_interval = 1.2,
  max_drop_level=0,
  groupcaps={
    cracky = {times={[3]=1.60}, uses=10, maxlevel=1},
  },
  damage_groups = {fleshy=2},
}, {pickaxe = 1, flammable = 2})

tt_register_tool_stuff("pick", "Pickaxe", "stone", "Stone", "group:stone", "terrortest_core:stick", {
  full_punch_interval = 1.3,
  max_drop_level=0,
  groupcaps={
    cracky = {times={[2]=2.0, [3]=1.00}, uses=20, maxlevel=1},
  },
  damage_groups = {fleshy=3},
}, {pickaxe = 1})
