require 'minitest/autorun'
require_relative '../explore'
require_relative '../mars'
require_relative '../probe'

class ExploreTest < Minitest::Test
  def test_move_probe
    mars = Mars.new(5, 5)
    probe = Probe.new(1, 2, 'N')
    explore = Explore.new(mars, probe, 'LMLMLMLMM')
    explore.move

    assert_equal ('1 3 N'), explore.final_coordinate
  end

  def test_exceeded_limit
    mars = Mars.new(5, 5)
    probe = Probe.new(1, 2, 'N')
    explore = Explore.new(mars, probe, 'LMMMM')
    explore.move

    assert_equal ('Houston, we have a problem. We lost the Space Probe'), explore.final_coordinate
  end

  def test_wrong_instruction
    mars = Mars.new(5, 5)
    probe = Probe.new(1, 2, 'N')
    explore = Explore.new(mars, probe, 'LXMMM')

    assert_raises ArgumentError do
      explore.move
    end
  end
end
