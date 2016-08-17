# The very simple idea behind the Builder pattern is that you encapsulate object
# construction logic behind a class of its own. The builder class takes charge of
# assembling all the components of a complex object. Each builder has an interface
# that lets you specify the configuration of your new object step by step. In a
# sense, a builder is a sort of like a multipart new method, where objects are
# created in an extended process instead of all in one shot.

# Classes witch are used in builder
class Computer
  # Implementation
end

class TurboCPU
  # Implementation
end

class Drive
  # Implementation
end

# Builder
class ComputerBuilder
  attr_reader :computer

  def initialize
    @computer = Computer.new
  end

  def turbo(has_turbo_cpu = true)
    computer.cpu = TurboCPU.new
  end

  def display=(display)
    computer.display=display
  end

  def memory_size=(size_in_mb)
    computer.memory_size = size_in_mb
  end

  def add_cd(writer=false)
    computer.drives << Drive.new(:cd, 760, writer)
  end

  def add_dvd(writer=false)
    computer.drives << Drive.new(:dvd, 4000, writer)
  end

  def add_hard_disk(size_in_mb)
    computer.drives << Drive.new(:hard_disk, size_in_mb, true)
  end
end

# Usage

computer_builder = ComputerBuilder.new

computer_builder.turbo false
computer_builder.display = 'Monitor'
computer_builder.add_dvd false
computer_builder.add_cd = false
computer_builder.memory_size = '12mb'

computer = computer_builder.computer

