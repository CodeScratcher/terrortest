minetest.register_node("terrortest_core:water_source", {
    description = "Water Source",
    drawtype = "liquid",
    waving = 3,
    tiles = {
        {
            name = "river_water.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 2.0,
            },
        },
        {
            name = "river_water.png",
            backface_culling = true,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 2.0,
            },
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
    liquid_alternative_flowing = "terrortest_core:water_flowing",
    liquid_alternative_source = "terrortest_core:water_source",
    liquid_viscosity = 1,
    post_effect_color = {a = 103, r = 30, g = 60, b = 90},
    groups = {water = 3, liquid = 3, cools_lava = 1},
})

minetest.register_node("terrortest_core:water_flowing", {
    description = "Flowing Water",
    drawtype = "flowingliquid",
    waving = 3,
    tiles = {"river_water.png"},
    special_tiles = {
        {
            name = "river_water.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 0.5,
            },
        },
        {
            name = "river_water.png",
            backface_culling = true,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 0.5,
            },
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
    liquid_alternative_flowing = "terrortest_core:water_flowing",
    liquid_alternative_source = "terrortest_core:water_source",
    liquid_viscosity = 1,
    post_effect_color = {a = 103, r = 30, g = 60, b = 90},
    groups = {
        water = 3, liquid = 3, not_in_creative_inventory = 1,
        cools_lava = 1
    },
})


minetest.register_node("terrortest_core:river_water_source", {
    description = "River Water Source",
    drawtype = "liquid",
    tiles = {
        {
            name = "river_water.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 2.0,
            },
        },
        {
            name = "river_water.png",
            backface_culling = true,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 2.0,
            },
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
    liquid_alternative_flowing = "terrortest_core:river_water",
    liquid_alternative_source = "terrortest_core:river_water",
    liquid_viscosity = 1,
    -- Not renewable to avoid horizontal spread of water sources in sloping
    -- rivers that can cause water to overflow riverbanks and cause floods.
    -- River water source is instead made renewable by the 'force renew'
    -- option used in the 'bucket' mod by the river water bucket.
    liquid_renewable = false,
    liquid_range = 2,
    post_effect_color = {a = 103, r = 30, g = 76, b = 90},
    groups = {water = 3, liquid = 3, cools_lava = 1},
    
})

minetest.register_node("terrortest_core:river_water_flowing", {
    description = "Flowing River Water",
    drawtype = "flowingliquid",
    tiles = {"river_water.png"},
    special_tiles = {
        {
            name = "river_water.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 0.5,
            },
        },
        {
            name = "river_water.png",
            backface_culling = true,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 0.5,
            },
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
    liquid_alternative_flowing = "terrortest_core:river_water_flowing",
    liquid_alternative_source = "terrortest_core:river_water_source",
    liquid_viscosity = 1,
    liquid_renewable = false,
    liquid_range = 2,
    post_effect_color = {a = 103, r = 30, g = 76, b = 90},
    groups = {
        water = 3, liquid = 3, not_in_creative_inventory = 1,
        cools_lava = 1
    },
})

minetest.register_node("terrortest_core:lava_source", {
    description = "Lava Source",
    drawtype = "liquid",
    tiles = {
        {
            name = "lava.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 3.0,
            },
        },
        {
            name = "lava.png",
            backface_culling = true,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 3.0,
            },
        },
    },
    paramtype = "light",
    light_source = 14 - 1,
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    is_ground_content = false,
    drop = "",
    drowning = 1,
    liquidtype = "source",
    liquid_alternative_flowing = "terrortest_core:lava_flowing",
    liquid_alternative_source = "terrortest_core:lava_source",
    liquid_viscosity = 7,
    liquid_renewable = false,
    damage_per_second = 4 * 2,
    post_effect_color = {a = 191, r = 255, g = 64, b = 0},
    groups = {lava = 3, liquid = 2, igniter = 1},
})

minetest.register_node("terrortest_core:lava_flowing", {
    description = "Flowing Lava",
    drawtype = "flowingliquid",
    tiles = {"lava.png"},
    special_tiles = {
        {
            name = "lava.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 3.3,
            },
        },
        {
            name = "lava.png",
            backface_culling = true,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 3.3,
            },
        },
    },
    paramtype = "light",
    paramtype2 = "flowingliquid",
    light_source = 14 - 1,
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    is_ground_content = false,
    drop = "",
    drowning = 1,
    liquidtype = "flowing",
    liquid_alternative_flowing = "terrortest_core:lava_flowing",
    liquid_alternative_source = "terrortest_core:lava_source",
    liquid_viscosity = 7,
    liquid_renewable = false,
    damage_per_second = 4 * 2,
    post_effect_color = {a = 191, r = 255, g = 64, b = 0},
    groups = {
        lava = 3, liquid = 2, igniter = 1,
        not_in_creative_inventory = 1
    },
})

minetest.register_item(":", {
  type = "none",
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
    tiles = {"stone.png"},
    is_ground_content = true,
    groups = {cracky = 3, stone = 1},
})

local function tt_register_ore_stuff(name, pretty_name, is)
  minetest.register_node("terrortest_core:stone_with_" .. name, {
    description = pretty_name .. " Ore",
    tiles = {"stone.png^" .. name .. "_ore.png"},
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
      tiles = {name .. "_block.png"},
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

tt_register_ore_stuff("coal", "Coal", {lump = true, ingot = false, block = true})

minetest.register_node("terrortest_core:barren_tree", {
    description = "Barren Tree Log",
    tiles = {"barren_tree.png"},
    is_ground_content = false,
    groups = {choppy = 2, oddly_breakable_by_hand = 1, wood = 1, tree = 1, flammable = 2}
})
