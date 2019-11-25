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
end
