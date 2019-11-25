require 'minitest/autorun'
require_relative '../probe'

class ProbeTest < Minitest::Test
  def test_current_position
    assert_equal ({ x: 1, y: 2 }), Probe.new(1, 2, 'N').current_position
  end

  def test_current_direction
    assert_equal ('N'), Probe.new(1, 2, 'N').current_direction
  end
end
