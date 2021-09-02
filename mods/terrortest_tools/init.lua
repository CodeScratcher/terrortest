
minetest.register_tool("terrortest_tools:pick_wood", {
    description = "Wooden Pickaxe",
    inventory_image = "terrortest_tool_woodpick.png",
    tool_capabilities = {
        full_punch_interval = 1.2,
        max_drop_level=0,
        groupcaps={
            cracky = {times={[3]=1.60}, uses=10, maxlevel=1},
        },
        damage_groups = {fleshy=2},
    },
    groups = {pickaxe = 1, flammable = 2}
})

minetest.register_craft({
    output = "terrortest_tools:pick_wood",
    recipe = {
        {"group:planks", "group:planks", "group:planks"}, 
        {"", "terrortest_core:stick", ""}, 
        {"", "terrortest_core:stick", ""}
    }
})
-- Probably should make a func, but not feeling it right now
minetest.register_tool("terrortest_tools:pick_stone", {
    description = "Stone Pickaxe",
    inventory_image = "terrortest_tool_stonepick.png",
    tool_capabilities = {
        full_punch_interval = 1.3,
        max_drop_level=0,
        groupcaps={
            cracky = {times={[2]=2.0, [3]=1.00}, uses=20, maxlevel=1},
        },
        damage_groups = {fleshy=3},
    },
    groups = {pickaxe = 1,}
})

minetest.register_craft({
    output = "terrortest_tools:pick_stone",
    recipe = {
        {"group:stone", "group:stone", "group:stone"}, 
        {"", "terrortest_core:stick", ""}, 
        {"", "terrortest_core:stick", ""}
    }
})
