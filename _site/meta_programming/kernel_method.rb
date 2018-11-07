# Kernel Method
# Add a method that gives the illusion it's a language keyword
# But really it's just added to the `Kernel` module which all other objects inherit from.
# At the top level of a Ruby program `self` is == `main`.
# `self.class` == `Object` and the `Kernel` sits above it in the hierarchy.
# You can see this by running the following code:
class Foo; end
Foo.ancestors # => [Foo, Object, Kernel, BasicObject]

# So we can see we can add what looks to be a language provided feature like so:
module Kernel
  def foobar
    puts "I'm not a language keyword, I'm just a fake"
  end
end

# Now from any where in our program we can call
foobar # => I'm not a language keyword, I'm just a fake