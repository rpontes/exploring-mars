# Class to execute the moves of Space Probe.
#
module Moves
  CARDINAL_DIRECTIONS =%w(N E S W).freeze

  class << self
    def left(direction)
      turn_to(CARDINAL_DIRECTIONS.index(direction) - 1)
    end

    def right(direction)
      turn_to(CARDINAL_DIRECTIONS.index(direction) + 1)
    end

    def forward(position, direction)
      case direction
      when 'N'
        position[:y] += 1
      when 'E'
        position[:x] += 1
      when 'S'
        position[:y] -= 1
      when 'W'
        position[:x] -= 1
      end

      position
    end

    private

    def turn_to(direction_index)
      CARDINAL_DIRECTIONS[(direction_index % 4)]
    end
  end
end
