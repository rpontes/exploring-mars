require 'minitest/autorun'
require_relative '../lib/explore'
require_relative '../lib/mars'
require_relative '../lib/probe'

class ExploreTest < Minitest::Test
  def setup
    @mars = Mars.new(5, 5)
    @probe = Probe.new(1, 2, 'N')
  end

  def test_move_probe
    explore = Explore.new(@mars, @probe, 'LMLMLMLMM')
    explore.move

    assert_equal ('1 3 N'), explore.final_coordinate
  end

  def test_exceeded_limit
    explore = Explore.new(@mars, @probe, 'LMMMM')

    exception = assert_raises Moves::OutOfEdge do
      explore.move
    end

    assert_equal('Houston, we have a problem. We reached our limit.', exception.message)

    assert_equal ('0 2 W'), explore.final_coordinate
  end

  def test_wrong_instruction
    explore = Explore.new(@mars, @probe, 'LXMMM')

    assert_raises ArgumentError do
      explore.move
    end
  end
end
