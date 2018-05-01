# Naked value becomes a temporary local variable! Solution: remember the @! (Or
# "self.". Or use attr_writer too, or an attr_accessor.) Gets people from
# Java/C++, not so much Python (which needs "self." too). "You keep on using that
# variable. I don't think it means what you think it means.". Not Inigo Montoya.

class Foo
  attr_reader :value
  
  def initialize(v)
    value = v
  end
  
  def set_val(v)
    @value = v
  end
end

f = Foo.new(3)
f.value
# => nil  # not 3?!

f.set_val 5
# => 5

f.value
# => 5
