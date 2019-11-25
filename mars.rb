# Class to represent the Planet Mars setting the values for limit the grid to land Space Probes.
#
# ==== Attributes
#
# * +limit_x_axis+ - limit of X-axis.
# * +limit_y_axis+ - limit of Y-axis.
#
# ==== Examples
#
# # To generate a grid with limit of 5x5:
# Mars.new(5, 5)
#
class Mars
  def initialize(limit_x_axis, limit_y_axis)
    unless (limit_x_axis.is_a? Integer) && (limit_y_axis.is_a? Integer)
      raise ArgumentError, 'Limit must be an integer'
    end

    @limit_x_axis = limit_x_axis
    @limit_y_axis = limit_y_axis
  end

  # Return the minor and the major limits of the grid. We assume that always the minor limit will be
  # x = 0 and y = 0.
  #
  # ==== Examples
  #
  # Mars.new(5, 5).limits
  # # { minor: { x: 0, y: 0 }, major: { x: 5, y: 5 } }
  #
  def limits
    { minor: { x: 0, y: 0 }, major: { x: limit_x_axis, y: limit_y_axis } }
  end

  private

  attr_reader :limit_x_axis, :limit_y_axis
end
