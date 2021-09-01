local night = false

minetest.register_biome({
    name = "stonelands",
    node_top = "terrortest_core:stone",
    depth_top = 1,
    node_filler = "terrortest_core:stone",
    depth_filler = 3,
    y_max = 10,
    water_level = 30,
    y_min = -3,
    heat_point = 50,
    humidity_point = 50,
})

minetest.register_alias("mapgen_stone",              "terrortest_core:stone")
minetest.register_alias("mapgen_water_source",       "terrortest_core:water_source")
minetest.register_alias("mapgen_river_water_source", "terrortest_core:river_water_source")
minetest.register_alias("mapgen_lava_source",        "terrortest_core:lava_source")

minetest.register_decoration({
    deco_type = "schematic",
    place_on = {"mapgen_stone"},
    sidelen = 7,
    fill_ratio = 0.001,
    biomes = {"stonelands"},
    y_max = 200,
    y_min = 1,
    schematic = "./schematics/barren_tree.mts",
    flags = "place_center_x, place_center_z",
    rotation = "random",
})

local function tt_register_ore_gen(name, scarcity, num_ores, size, y_max, y_min)
  minetest.register_ore({
    ore_type       = "scatter",
    ore            = "terrortest_core:stone_with_" .. name,
    wherein        = "mapgen_stone",
    clust_scarcity = scarcity,
    clust_num_ores = num_ores,
    clust_size     = size,
    y_max          = y_max,
    y_min          = y_min,
  })
end

tt_register_ore_gen("coal", 8 * 8 * 8, 9, 3, 31000,   1025)
tt_register_ore_gen("coal", 8 * 8 * 8, 8, 3,    64, -31000)

minetest.register_on_joinplayer(function(player)
    if night then
        skybox.set(player, 1)
    else
        skybox.set(player, 7)
    end
end)

local interval = 1
local wait = 0

minetest.register_globalstep(function(dtime)
    wait = wait + dtime

    if wait < interval then return end

    wait = dtime

    -- this code will only execute once per sec max
    if minetest.get_timeofday() < 0.2 then
        -- it is night in the game world
        if not night then
            night = true

            for _, player in ipairs(minetest.get_connected_players()) do
                skybox.set(player,1)
            end
        end
    else
        -- it is not night in the game world
        if night then
            night = false

            for _, player in ipairs(minetest.get_connected_players()) do
                skybox.set(player,7)
            end
        end
    end
end)
