# Liskov’s principle tends to be the most difficult to understand. The principle
# states that you should be able to replace any instances of a parent class
# with an instance of one of its children without creating any unexpected or
# incorrect behaviors.

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def set_height(height)
    @height = height
  end

  def set_width(width)
    @width = width
  end

  def square
    @width * @height
  end
end

# Solution

# LSP says is if we know the interface of Rectangle, We need to be able to guess
# the interface of subtype class Square
# Square.new(3).square => 9

class Square < Rectangle
  def initialize(side)
    super(side, side)
  end

  def set_height(height)
    super(height)
    @width = height
  end

  def set_width(width)
    super(width)
    @height = width
  end
end

# Another common instance of a Liskov violation is raising an exception for an
# overridden method in a child class. It’s also not uncommon to see methods
# overridden with modified method signatures causing branching on type in
# classes that depend on objects of the parent’s type. All of these either
# lead to unstable code or unnecessary and ugly branching.

class Animal
  def walk
    'walking_as_animal'
  end
end

class Cat < Animal
  def run
    'run_as_cat'
  end
end

# Solution

class Animal
  def walk
    'walking_as_animal'
  end

  def run
    raise NotImplementedError
  end
end

class Cat < Animal
  def run
    'run_as_cat'
  end
end

