# Parent's initialize runs automagically only if child has none.  Else, parent's
# must be called to run.

class Parent
  def initialize
    puts "Parent init"
  end
end

class NoInitChild < Parent
end

NoInitChild.new
# Parent init

class NormalChild < Parent
  def initialize
    puts "NormalChild init"
  end
end

NormalChild.new
# "NormalChild init"

class SuperChild < Parent
  def initialize
    puts "SuperChild"
    super
    puts "init"
  end
end

SuperChild.new
# SuperChild
# Parent init
# init
