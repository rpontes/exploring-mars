require_relative './moves'
# Class to represent the Space Probe, set the initial position and direction.
#
# ==== Attributes
#
# * +initial_x_axis+ - initial X-axis position.
# * +initial_y_axis+ - initial Y-axis position.
# * +initial_cardinal_direction+ - initial cardinal direction.
#
# ==== Examples
#
# # To launch a new Probe:
# Probe.new(1, 2, 'N')
#
class Probe
  def initialize(initial_x_axis, initial_y_axis, initial_cardinal_direction)
    unless (initial_x_axis.is_a? Integer) && (initial_y_axis.is_a? Integer)
      raise ArgumentError, 'Position must be an integer'
    end

    unless Moves::CARDINAL_DIRECTIONS.include?(initial_cardinal_direction)
      raise ArgumentError, 'Cardinal direction must be N, S, W or E'
    end

    @current_position = { x: initial_x_axis, y: initial_y_axis }
    @current_direction = initial_cardinal_direction
  end

  def turn_left
    @current_direction = Moves.left(current_direction)
  end

  def turn_right
    @current_direction = Moves.right(current_direction)
  end

  def move_forward
    @current_position = Moves.forward(current_position, current_direction)
  end

  attr_accessor :current_position, :current_direction
end
