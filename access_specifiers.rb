class Rectangle
  def initialize(length, width)
    @length = length
    @width = width
  end

  def calculate_area
    @length * @width
  end

  private
  
  def calculate_perimeter
    2 * (@length + @width)
  end
end

rectangle = Rectangle.new(10, 5)
puts rectangle.calculate_area
puts rectangle.calculate_perimeter #Error - private method `calculate_perimeter' called for an instance of Rectangle