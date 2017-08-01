# Class Extension Mixin allows you to both `include` and `extend` a class
module MyMixin
  def self.included(base) # Hook Method
    base.extend(ClassMethods)
  end

  def a
    puts "I'm A (an instance method)"
  end

  module ClassMethods # "ClassMethods" is a recognised naming pattern
    def x
      puts "I'm X (a class method)"
    end
  end
end

class Foo
  include MyMixin
end

Foo.x # => I'm X (a class method)
Foo.new.a # => I'm A (an instance method)