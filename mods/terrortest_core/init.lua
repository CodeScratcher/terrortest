function tt_register_liquid(name, pretty_name, anim_len, viscosity, is_renewable, range, dmg, light, color, groups)
  minetest.register_node("terrortest_core:" .. name .. "_source", {
    description = pretty_name .. " Source",
    drawtype = "liquid",
    waving = 3,
    tiles = {
      {
        name = "terrortest_" .. name .. ".png",
        backface_culling = false,
        animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = anim_len.source,},
      },
      {
        name = "terrortest_" .. name .. ".png",
        backface_culling = true,
        animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = anim_len.source,},
      },
    },
    use_texture_alpha = "blend",
    paramtype = "light",
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    is_ground_content = false,
    drop = "",
    drowning = 1,
    liquidtype = "source",
    liquid_alternative_flowing = "terrortest_core:" .. name .. "_flowing",
    liquid_alternative_source = "terrortest_core:" .. name .. "_source",
    liquid_viscosity = viscosity,
    liquid_renewable = is_renewable,
    liquid_range = range,
    damage_per_second = dmg,
    light_source = light,
    post_effect_color = color,
    groups = groups,
  })

  minetest.register_node("terrortest_core:" .. name .. "_flowing", {
    description = "Flowing " .. pretty_name,
    drawtype = "flowingliquid",
    waving = 3,
    tiles = {"terrortest_" .. name .. ".png"},
    special_tiles = {
      {
        name = "terrortest_" .. name .. ".png",
        backface_culling = false,
        animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = anim_len.flowing,},
      },
      {
        name = "terrortest_" .. name .. ".png",
        backface_culling = true,
        animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = anim_len.flowing,},
      },
    },
    use_texture_alpha = "blend",
    paramtype = "light",
    paramtype2 = "flowingliquid",
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    is_ground_content = false,
    drop = "",
    drowning = 1,
    liquidtype = "flowing",
    liquid_alternative_flowing = "terrortest_core:" .. name .. "_flowing",
    liquid_alternative_source = "terrortest_core:" .. name .. "_source",
    liquid_viscosity = viscosity,
    liquid_renewable = is_renewable,
    liquid_range = range,
    damage_per_second = dmg,
    light_source = light,
    post_effect_color = color,
    groups = groups,
  })
end

local water_groups = {water = 3, liquid = 3, not_in_creative_inventory = 1, cools_lava = 1};
local lava_groups =  {lava  = 3, liquid = 2, not_in_creative_inventory = 1, igniter    = 1};

tt_register_liquid("water",       "Water",       {source = 2.0, flowing = 0.5}, 1, true,  8, 0 * 2, 0,  {a = 103, r =  30, g = 60, b = 90}, water_groups)
tt_register_liquid("river_water", "River Water", {source = 2.0, flowing = 0.5}, 1, false, 2, 0 * 2, 0,  {a = 103, r =  30, g = 76, b = 90}, water_groups)
tt_register_liquid("lava",        "Lava",        {source = 3.0, flowing = 3.3}, 7, false, 4, 4 * 2, 13, {a = 191, r = 255, g = 64, b =  0}, lava_groups)

local function tt_register_ore_stuff(name, pretty_name, in_name, is)
  minetest.register_node("terrortest_core:stone_with_" .. name, {
    description = pretty_name .. " Ore",
    tiles = {"terrortest_" .. in_name .. ".png^terrortest_" .. name .. "_ore.png"},
    is_ground_content = false,
    groups = {cracky = 3},
    drop = "terrortest_core:" .. name .. "_lump",
  })

  minetest.register_craftitem("terrortest_core:" .. name .. "_lump", {
    description = pretty_name .. (is.lump and " Lump" or ""),
    inventory_image = name .. "_lump.png"
  })
  
  if is.ingot then
    minetest.register_craftitem("terrortest_core:" .. name .. "_ingot", {
      description = pretty_name .. " Ingot",
      inventory_image = name .. "_ingot.png"
    })
  end
  
  if is.block then
    minetest.register_node("terrortest_core:" .. name .. "_block", {
      description = pretty_name .. " Block",
      tiles = {"terrortest_" .. name .. "_block.png"},
      is_ground_content = false,
      groups = {cracky = 3},
    })

    local block_recipe = "terrortest_core:" .. name .. (is.ingot and "_ingot" or "_lump")

    minetest.register_craft({
      type = "shaped",
      output = "terrortest_core:" .. name .. "_block",
      recipe = {
        {block_recipe, block_recipe, block_recipe,},
        {block_recipe, block_recipe, block_recipe,},
        {block_recipe, block_recipe, block_recipe,},
      },
    })

    minetest.register_craft({
      type = "shapeless",
      output = block_recipe .. " 9",
      recipe = {
        "terrortest_core:" .. name .. "_block",
      },
    })
  end
end

tt_register_ore_stuff("coal", "Coal", "normal_stone", {lump = true, ingot = false, block = true})

minetest.register_item(":", {
  type = "none",
  wield_image = "terrortest_wieldhand.png",
  wield_scale = {x=1, y=1, z=2.5},
  tool_capabilities = {
    full_punch_interval = 0.9,
    max_drop_level = 0,
    groupcaps = {
      crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
      snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
      oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
    },
    damage_groups = {fleshy=1},
  }
})

minetest.register_node("terrortest_core:stone", {
  description = "Stone",
  tiles = {"terrortest_normal_stone.png"},
  is_ground_content = true,
  groups = {cracky = 3, stone = 1},
})

-- TODO write tt_register_wood_type()

minetest.register_node("terrortest_core:barren_tree", {
  description = "Barren Tree Log",
  tiles = {
    "terrortest_barren_tree_top.png",
    "terrortest_barren_tree_top.png",
    "terrortest_barren_tree_side.png",
    "terrortest_barren_tree_side.png",
    "terrortest_barren_tree_side.png",
    "terrortest_barren_tree_side.png",
  },
  is_ground_content = false,
  groups = {choppy = 2, oddly_breakable_by_hand = 1, wood = 1, tree = 1, flammable = 2},
})

minetest.register_node("terrortest_core:barren_planks", {
  description = "Barren Tree Planks",
  tiles = {"terrortest_barren_planks.png",},
  is_ground_content = false,
  groups = {choppy = 2, oddly_breakable_by_hand = 1, wood = 1, planks = 1, flammable = 2},
})

minetest.register_craft({
  type = "shapeless",
  output = "terrortest_core:barren_planks 4",
  recipe = {{"terrortest_core:barren_tree"}},
})

minetest.register_craftitem("terrortest_core:stick", {
  description = "Stick",
  inventory_image = "terrortest_stick.png"
})

minetest.register_craft({
  type = "shapeless",
  output = "terrortest_core:stick 4",
  recipe = {{"terrortest_core:barren_planks"}},
})
