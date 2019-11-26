# Class to treat and move the Space Probe.
#
# ==== Attributes
#
# * +mars+ - the planet with the limits.
# * +probe+ - the Space Probe to be moved.
# * +instructions+ - instructions to move the probe.
#
# ==== Examples
#
# # To generate a grid with limit of 5x5:
# Explore.new(mars, probe, 'LMLMLMLMM')
#
class Explore
  INSTRUCTIONS = { 'L' => 'turn_left', 'R' => 'turn_right', 'M' => 'move_forward' }

  def initialize(mars, probe, instructions)
    @mars = mars
    @probe = probe
    @instructions = instructions
  end

  def move
    instructions.chars.each { |instruction| probe.send(INSTRUCTIONS.fetch(instruction)) }
  rescue KeyError
    raise ArgumentError, 'An unrecognized instruction was received.'
  end

  def final_coordinate
    return 'Houston, we have a problem. We lost the Space Probe' if exceeded_limit?

    "#{probe.current_position.values.join(' ')} #{probe.current_direction}"
  end

  attr_reader :mars, :probe, :instructions

  private

  def exceeded_limit?
    minor, major = *mars.limits.values

    !(probe.current_position[:x].between?(minor[:x], major[:x])) ||
    !(probe.current_position[:y].between?(minor[:y], major[:y]))
  end
end
