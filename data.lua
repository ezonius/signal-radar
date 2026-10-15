-- Signal Radar
-- A 1x1 radar stripped of all map charting/revealing abilities.
-- It keeps the radar's circuit-network connectivity (that is the only reason it exists)
-- but never reveals sectors or performs nearby scans.

-- Base-game helper tables (these are locals inside base's own prototype files,
-- so mods must require them explicitly).
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
-- `util`, `volume_multiplier` and `default_circuit_wire_max_distance` are true globals from core.

local reveal_distances = 0 -- zero = the radar never charts the map or reveals nearby chunks

data:extend({
  {
    type = "item",
    name = "signal-radar",
    icon = "__base__/graphics/icons/radar.png",
    subgroup = "circuit-network",
    order = "f[signal-radar]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    place_result = "signal-radar",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "recipe",
    name = "signal-radar",
    ingredients =
    {
      {type = "item", name = "electronic-circuit", amount = 5},
      {type = "item", name = "iron-gear-wheel", amount = 5},
      {type = "item", name = "iron-plate", amount = 10}
    },
    results = {{type = "item", name = "signal-radar", amount = 1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "signal-radar-to-radar",
    ingredients = {{type = "item", name = "signal-radar", amount = 1}},
    results = {{type = "item", name = "radar", amount = 1}},
    enabled = false,
    categories = {"advanced-crafting"}
  },
  {
    type = "recipe",
    name = "radar-to-signal-radar",
    ingredients = {{type = "item", name = "radar", amount = 1}},
    results = {{type = "item", name = "signal-radar", amount = 1}},
    enabled = false,
    categories = {"advanced-crafting"}
  },
  {
    type = "radar",
    name = "signal-radar",
    icon = "__base__/graphics/icons/radar.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "signal-radar"},
    fast_replaceable_group = "signal-radar",
    max_health = 100,
    corpse = "radar-remnants",
    dying_explosion = "radar-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      },
      {
        type = "impact",
        percent = 30
      }
    },
    -- 1x1 footprint (vanilla radar is 3x3)
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    -- Scanning/charting is disabled: range 0 means no sectors are ever revealed.
    energy_per_sector = "10MJ",
    max_distance_of_sector_revealed = reveal_distances,
    max_distance_of_nearby_sector_revealed = reveal_distances,
    energy_per_nearby_scan = "250kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "10kW",
    integration_patch =
    {
      filename = "__base__/graphics/entity/radar/radar-integration.png",
      priority = "low",
      width = 238,
      height = 216,
      shift = util.by_pixel(0.6, 1.6),
      scale = 0.2
    },
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/radar/radar.png",
          priority = "low",
          width = 196,
          height = 254,
          apply_projection = false,
          direction_count = 64,
          line_length = 8,
          shift = util.by_pixel(0.4, -6.4),
          scale = 0.2
        },
        {
          filename = "__base__/graphics/entity/radar/radar-shadow.png",
          priority = "low",
          width = 336,
          height = 170,
          apply_projection = false,
          direction_count = 64,
          line_length = 8,
          shift = util.by_pixel(15.6, 2.4),
          draw_as_shadow = true,
          scale = 0.2
        }
      }
    },
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/radar.ogg", volume = 0.4, modifiers = volume_multiplier("main-menu", 2.0)},
      max_sounds_per_prototype = 3,
      use_doppler_shift = false
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    radius_minimap_visualisation_color = {0.059, 0.092, 0.235, 0.275},
    rotation_speed = 0.01,
    is_military_target = false,
    -- The lamp connector sits at the center of a 1x1 tile, which fits our footprint
    -- (the vanilla radar connector is offset for its 3x3 body).
    circuit_connector = circuit_connector_definitions["lamp"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  }
})
