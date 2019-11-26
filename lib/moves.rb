# Class to execute the moves of Space Probe.
#
module Moves
  CARDINAL_DIRECTIONS =%w(N E S W).freeze

  class OutOfEdge < StandardError; end

  class << self
    def left(direction)
      turn_to(CARDINAL_DIRECTIONS.index(direction) - 1)
    end

    def right(direction)
      turn_to(CARDINAL_DIRECTIONS.index(direction) + 1)
    end

    def forward(position, direction, limits)
      x_axis, y_axis = *position.values

      case direction
      when 'N'
        y_axis += 1
      when 'E'
        x_axis += 1
      when 'S'
        y_axis -= 1
      when 'W'
        x_axis -= 1
      end

      if out_of_the_edge?(x_axis, y_axis, limits)
        raise OutOfEdge, 'Houston, we have a problem. We reached our limit.'
      end

      { x: x_axis, y: y_axis }
    end

    private

    def turn_to(direction_index)
      CARDINAL_DIRECTIONS[(direction_index % 4)]
    end

    # This method checks if the Probe is on the edge of the grid. This way we can check if it can move
    # more.
    def out_of_the_edge?(x_axis, y_axis, limits)
      minor, major = *limits.values

      !(x_axis.between?(minor[:x], major[:x])) || !(y_axis.between?(minor[:y], major[:y]))
    end
  end
end
