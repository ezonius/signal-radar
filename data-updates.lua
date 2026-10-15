-- Unlock the signal radar and both conversion recipes alongside the vanilla radar.

local radar_tech = data.raw.technology["radar"]
if radar_tech and radar_tech.effects then
  table.insert(radar_tech.effects, {type = "unlock-recipe", recipe = "signal-radar"})
  table.insert(radar_tech.effects, {type = "unlock-recipe", recipe = "signal-radar-to-radar"})
  table.insert(radar_tech.effects, {type = "unlock-recipe", recipe = "radar-to-signal-radar"})
end
