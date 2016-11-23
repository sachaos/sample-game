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
end
