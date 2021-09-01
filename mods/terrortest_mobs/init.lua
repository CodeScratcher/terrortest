------------------------------------------
---- Rat, Zombie, Werewolves, Phantom ----
------------------------------------------

mobs:register_mob(
  "terrortest_mobs:rat",
  {
    nametag = "TESTIFICATE",
    type = "monster",
    hp_min = 3,
    hp_max = 6,
    armor = 100,
    passive = false,
    walk_velocity = 2,
    run_velocity= 3,
    jump = true,
    jump_height = 2.1,
    runaway = false,
    pushable = true,
    view_range = 30,
    damage = 1,
    damage_texture_modifier = "^[brighten",
    knock_back = true,
    fear_height = 5,
    fall_damage = true,
    water_damage = 0,
    air_damage = 0,
    lava_damage = 5,
    fire_damage = 3,
    light_damage = 0,
    suffocation = 1,
    floats = 1,
    follow = {},
    docile_by_day = false,
    attack_monsters = false,
    attack_animals = true,
    attack_npcs = true,
    attack_players = true,
    owner_loyal = false,
    group_attack = true,
    attack_type = "dogfight",
    runaway_from = {},
    ignore_invisibility = false,
    pathfinding = 1,
    makes_footstep_sound = false,
    visual = "cube", -- change to "mesh" later
    collisionbox = {-1, -1, -1, 1, 1, 1},
    selectionbox = {-1, -1, -1, 1, 1, 1},
    textures = {{"rat_dummy.png"}},
    animation = {
      die_rotate = true,
    },
  }
)

mobs:spawn(
  {
    name = "terrortest_mobs:rat",
    chance = 1,
    max_light = 7,
    active_object_count = 120,
  }
)
