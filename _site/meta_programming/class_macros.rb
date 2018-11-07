# Class Macros are just regular class methods that are only used in a class definition
# e.g. not used from a new instance of the class (only at the time the class is defined)
#
# Below is an example of a Class Macro that alerts users of a publically available class
# that the methods they've been using are now deprecated and they should use the renamed version.
#
# It uses "Dynamic Method" to help performance by creating the old methods again and delegating off
# to the new methods (rather than using `method_missing` which can be quite slow as it has to spend
# time looking up the inheritance chain)
class Foo
  def get_a
    puts "I'm an A"
  end

  def get_b
    puts "I'm an B"
  end

  def get_c
    puts "I'm an C"
  end

  # Defining our Class Macro
  def self.deprecate(old_method, new_method)
    define_method(old_method) do |*args, &block|
      puts "Warning: #{old_method} is deprecated! Use #{new_method} instead"
      send(new_method, *args, &block) # `self` is assumed when calling `send`
    end
  end

  # Using our Class Macro
  deprecate :a, :get_a
  deprecate :b, :get_b
  deprecate :c, :get_c
end
