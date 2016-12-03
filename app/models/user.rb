class User < ApplicationRecord
  validates :x, numericality: { greater_than_or_equal_to: 0 }
  validates :y, numericality: { greater_than_or_equal_to: 0 }

  def up
    increment(:y)
  end

  def down
    decrement(:y)
  end

  def right
    increment(:x)
  end

  def left
    decrement(:x)
  end

  def lua_position
    {x: x + 1, y: y + 1}
  end

  def lua_position=(lua_position)
    self.x = lua_position["x"] - 1
    self.y = lua_position["y"] - 1
  end
end
