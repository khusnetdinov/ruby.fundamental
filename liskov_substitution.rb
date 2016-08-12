
# If S is a subtype of T, then objects of type T may be replaced with objects of type S (i.e., objects of type S may substitute objects of type T) without altering any of the desirable properties of that program (correctness, task performed, etc.).
# This principle applies only to inheritance, so let's look at an example of inheritance that breaks it:

class Animal
  def walk
    "walking_as_animal"
  end
end

class Cat < Animal
  def run
    "run_as_cat"
  end
end

# Subtypes must be substitutable for their base types, so they must have the same interface. Since Ruby does not have abstract methods, we can do it like so:

class Animal
  def walk
    "walking_as_animal"
  end

  def run
    rais NotImplementedError
  end
end

class Cat < Animal
  def run
    "run_as_cat"
  end
end


# One more example of substitution of sublass

class Rectangle
  def initialize(width, height)
    @width = width
    @height = height
  end

  def square
    @width * @height
  end
end

class Square < Rectangle
  def initialize(side)
    super(side, side)
  end
end

# rec = Rectangle.new(3, 4)
# rec.square => 12
# sqr = Square.new(3)
# sqr.square => 9

# If I know the interface of person, I need to be able to guess the interface of student because
# Square class is subtype of Rectangle


