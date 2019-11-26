require 'minitest/autorun'
require_relative '../lib/probe'

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
    assert_equal ({ x: 1, y: 3 }), Probe.new(1, 2, 'N').move_forward(
      minor: { x: 0, y: 0 }, major: { x: 5, y: 5 }
    )
  end

  def test_raises_argument_error_position
    assert_raises ArgumentError do
      Probe.new(3, 'a', 'N')
    end
  end

  def test_raises_argument_error_direction
    assert_raises ArgumentError do
      Probe.new(1, 5, 'X')
    end
  end
end
