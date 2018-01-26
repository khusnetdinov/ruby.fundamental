# Context Probe
# Execute a code block in the context of another object using `instance_eval`
class Foo
  def initialize
    @z = 1
  end
end
foo = Foo.new
foo.instance_eval do
  puts self # => #<Foo:0x7d15e891>
  puts @z # => 1
end
new_value = 2
foo.instance_eval { @z = new_value }
foo.instance_eval { puts @z } # => 2

# There is also `instance_exec` which works the same way but allows passing arguments to the block
class Foo
  def initialize
    @x = 1
    @y = 2
  end
end
Foo.new.instance_exec(3) { |arg| (@x + @y) * arg } # => 9
