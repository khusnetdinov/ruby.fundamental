# ##Private Class Methods in Ruby
# Every object oriented language has a different take on the rules of methods and objects and classes, and I cut my teeth
# on Java, which means that forever and ever after I’ll assume everything works like Java. That left me writing code
# like the `Apple` class below that has a private class method, but not really. You can still call it.
class Apple
  def self.latin_name
    binomial_name
  end

  private

  def self.binomial_name
    'Malus domestica'
  end
end
puts Apple.latin_name
puts Apple.binomial_name # no error, works fine
# There’s a way to make class methods private in Ruby, you just gotta jump through some hoops. Err, I mean use the
# `class << self` syntax. This oddity pushes an instance singleton onto the class effectively creating class methods.
class Orange
  def self.latin_name
    binomial_name
  end

  class << self
    private def binomial_name
      'Citrus × sinensis'
    end
  end
end
puts Orange.latin_name
puts Orange.binomial_name # ERROR!!! you can't call a private method.
