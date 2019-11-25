class Explore
  INSTRUCTIONS = { 'L': 'left', 'R': 'right', 'M': 'forward' }

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
        probe.move_forward
      end
    end
  end

  def final_coordinate
    "#{probe.current_position.values.join(' ')} #{probe.current_direction}"
  end

  attr_reader :mars, :probe, :instructions
end
