require 'minitest/autorun'
require_relative '../mars'

class MarsTest < Minitest::Test
  def test_limits_points
    assert_equal ({ minor: { x: 0, y: 0 }, major: { x: 5, y: 5 } }), Mars.new(5, 5).limits
  end

  def test_raises_argument_error
    assert_raises ArgumentError do
      Mars.new(5, 'a')
    end
  end
end
