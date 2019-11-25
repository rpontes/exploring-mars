require 'minitest/autorun'
require_relative '../moves'

class MovesTest < Minitest::Test
  def test_turn_left
    assert_equal ('E'), Moves.left('S')
  end

  def test_turn_right
    assert_equal ('W'), Moves.right('S')
  end

  def test_move_forward
    assert_equal ({ x: 1, y: 3 }), Moves.forward({ x: 1, y: 2 }, 'N')
  end
end
