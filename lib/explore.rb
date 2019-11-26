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
  def initialize(mars, probe, instructions)
    @mars = mars
    @probe = probe
    @instructions = instructions
  end

  def move
    instructions.chars.each do |instruction|
      case instruction
      when 'L'
        probe.turn_left
      when 'R'
        probe.turn_right
      when 'M'
        probe.move_forward(mars.limits)
      else
        raise ArgumentError, 'An unrecognized instruction was received.'
      end
    end
  end

  def final_coordinate
    "#{probe.current_position.values.join(' ')} #{probe.current_direction}"
  end

  attr_reader :mars, :probe, :instructions
end
