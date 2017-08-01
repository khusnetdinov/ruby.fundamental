# Dynamic Method
# Allows us to dynamically create methods
# define_method :method_name { block that becomes method body }
class Foo
  define_method :bar do
    puts "This is a dynamic method"
  end
end
Foo.new.bar # => "This is a dynamic method"

# Dynamic Method
# Alternative example
class Bar
  # we have to define this method on `self` (see below comment)
  def self.create_method(method)
    define_method "my_#{method}" do
      puts "Dynamic method called 'my_#{method}'"
    end
  end

  # these methods are executed within the definition of the Bar class
  create_method :foo
  create_method :bar
  create_method :baz
end
Bar.new.my_foo # => "Dynamic method called 'my_foo'"
Bar.new.my_bar # => "Dynamic method called 'my_bar'"
Bar.new.my_baz # => "Dynamic method called 'my_baz'"

# Dynamic Method
# Parse another class for data
class AnotherClass
  def get_foo_stuff; end
  def get_bar_stuff; end
  def get_baz_stuff; end
end
class Baz
  def initialize(a_class)
    a_class.methods.grep(/^get_(.*)_stuff$/) { Baz.create_method $1 }
  end
  def self.create_method(method)
    define_method "my_#{method}" do
      puts "Dynamic method called 'my_#{method}'"
    end
  end
end
another_class = AnotherClass.new
Baz.new(another_class).my_foo # => "Dynamic method called 'my_foo'"
Baz.new(another_class).my_bar # => "Dynamic method called 'my_bar'"
Baz.new(another_class).my_baz # => "Dynamic method called 'my_baz'"

class Foo
  def initialize(bar)
    self.class.send(:define_method, bar) { p "hello #{bar}!" }
  end
end
foo = Foo.new("world")
foo.world # => "hello world!"