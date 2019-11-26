require 'minitest/autorun'
require_relative '../lib/moves'

class MovesTest < Minitest::Test
  def test_turn_left
    assert_equal ('E'), Moves.left('S')
  end

  def test_turn_right
    assert_equal ('W'), Moves.right('S')
  end

  def test_move_forward
    assert_equal ({ x: 1, y: 3 }), Moves.forward(
      { x: 1, y: 2 }, 'N', { minor: { x: 0, y: 0 }, major: { x: 5, y: 5 } }
    )
  end

  def test_exceeded_limit
    exception = assert_raises Moves::OutOfEdge do
      Moves.forward({ x: 1, y: 0 }, 'S', { minor: { x: 0, y: 0 }, major: { x: 5, y: 5 } })
    end

    assert_equal('Houston, we have a problem. We reached our limit.', exception.message)
  end
end
