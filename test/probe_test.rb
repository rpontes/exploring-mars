require 'minitest/autorun'
require_relative '../probe'

class ProbeTest < Minitest::Test
  def test_current_position
    assert_equal ({ x: 1, y: 2 }), Probe.new(1, 2, 'N').current_position
  end

  def test_current_direction
    assert_equal ('N'), Probe.new(1, 2, 'N').current_direction
  end

  def test_turn_left
    assert_equal ('W'), Probe.new(1, 2, 'N').turn_left
  end

  def test_turn_right
    assert_equal ('E'), Probe.new(1, 2, 'N').turn_right
  end

  def test_move_forward
    assert_equal ({ x: 1, y: 3 }), Probe.new(1, 2, 'N').move_forward
  end
end
