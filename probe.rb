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
    @current_position = { x: initial_x_axis, y: initial_y_axis }
    @current_direction = initial_cardinal_direction
  end

  def turn_left
  end

  def turn_right
  end

  def move_forward
  end

  attr_reader :current_position, :current_direction
end
