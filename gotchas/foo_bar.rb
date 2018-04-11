FOO = 123

module Foo
  FOO = 555
end

module Foo
  class Bar
    def baz
      puts FOO
    end
  end
end

class Foo::Bar
  def glorf
    puts FOO
  end
end
#puts Foo::Bar.new.baz    # -> 555
#puts Foo::Bar.new.glorf  # -> 123
# You can think of each appearance of `module Something`, `class Something` or `def something` as a “gateway” into a new
# scope. When Ruby is searching for the definition of a name that has been referenced it first looks in the current
# scope (the method, class or module), and if it isn’t found there it will go back through each containing “gateway” and
# search the scope there.
# In your example the method `baz` is defined as
module Foo
  class Bar
    def baz
      puts FOO
    end
  end
end
# So when trying to determine the value of `FOO`, first the class `Bar` is checked, and since `Bar` doesn’t contain a
# `FOO` the search moves up through the class Bar "gateway” into the `Foo` module which is the containing scope.
# `Foo` does contain a constant `FOO` (555) so this is the result you see.
# The method `glorf` is defined as:
class Foo::Bar
  def glorf
    puts FOO
  end
end
# Here the “gateway” is class Foo::Bar, so when `FOO` isn’t found inside `Bar` the “gateway” passes through the `Foo`
# module and straight into the top level, where there is another `FOO` (123) which is what is displayed.
# Note how using `class Foo::Bar` creates a single “gateway”, skipping over the scope of `Foo`, but `module Foo;
# class Bar` ... opens two separate “gateways”
