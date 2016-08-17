# Factory pattern is one of most used design pattern in Object oriented design.
# This type of design pattern comes under creational pattern as this pattern
# provides one of the best ways to create an object. In Factory pattern, we
# create object without exposing the creation logic to the client and refer to
# newly created object using a common interface.

# Classes witch are used in factory
class Rectangle
  # Implementation
end

class Square
  # Implementation
end

class Circle
  # Implementation
end

# Factory
class ShapeFactory
  def get_shape(type)
    case type
    when :rectangle then Rectangle.new
    when :square then Square.new
    when :circle then Circle.new
    end
  end
end

# Usage

shape_factory = ShapeFactory.new
square = shape_factory.get_shape :square

