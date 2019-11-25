require 'minitest/autorun'
require_relative '../explore'

class ExploreTest < Minitest::Test
  def test_limit_point_northwest
    asser_equal ({ x: 5, y: 5 }), Explore.new(x_axis, y_axis).limit
  end
end
