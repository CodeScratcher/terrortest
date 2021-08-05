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

minetest.register_node("terrortest_core:stone", {
    description = "Stone",
    tiles = {"stone.png"},
    is_ground_content = true,
    groups = {cracky = 3, stone = 1}
})
