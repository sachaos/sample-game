command_functions = {
  up = function (current_position)
    next_position = {}
    next_position["x"] = current_position["x"] + 0
    next_position["y"] = current_position["y"] + 1
    return next_position
  end,
  down = function (current_position)
    next_position = {}
    next_position["x"] = current_position["x"] + 0
    next_position["y"] = current_position["y"] - 1
    return next_position
  end,
  right = function (current_position)
    next_position = {}
    next_position["x"] = current_position["x"] + 1
    next_position["y"] = current_position["y"] + 0
    return next_position
  end,
  left = function (current_position)
    next_position = {}
    next_position["x"] = current_position["x"] - 1
    next_position["y"] = current_position["y"] + 0
    return next_position
  end
}

function move_user(map, current_position, command, point)
  current_position = command_functions[command](current_position)
  if map[current_position["y"]][current_position["x"]] == 1 then
    point = point + 1
  end
  return current_position, point
end

-- Argument examples
-- map = {
--   {0, 0},
--   {1, 1}
-- }
-- commands = {"up", "right", "left", "down", "right", "left", "up", "right", "left"}
-- current_position = {x = 1, y = 1}
function game (map, current_position, commands)
  point = 0
  for _, command in ipairs(commands) do
    current_position, point = move_user(map, current_position, command, point)
  end
  return current_position, point
end
