# The principle states that a client should not be forced to depend on methods
# that it does not use

# In this example, there are Computer, Programmer and Technician classes. Both,
# Programmer and Technician use the Computer in a different way. The programmer
# uses the computer for typing, but the technician knows how to change the
# computer hard drive. What Interface Segregation Principle (ISP) enforces is
# that one class should not depend on methods it does not use.
# In our case, Programmer is unnecessarily coupled to the
# Computer#change_hard_drive method because it does not use it, but the state
# changes that this method enforces can affect the Programmer. Let's refactor
# the code to obey the LSP.

class Computer
  def turn_on
    # Implementation
  end

  def type
    # Implementation
  end

  def change_hard_drive
    # Implementation
  end
end

class User
  attr_reader :computer

  def initialize(computer)
    @computer = computer
  end
end

class Programmer < User
  def use_computer
    computer.turn_on
    computer.type
  end
end

class Technician < User
  def fix_computer
    computer.change_hard_drive
  end
end

# Solution

# After this refactor the Technician uses a different object from the type
# ComputerInternals which is isolated from the state of the Computer. The state
# of the Computer object can be influenced by the Programmer but the changes
# wont affect the Technician in any way.

class Computer
  def turn_on
    # Implementation
  end

  def type
    # Implementation
  end
end

class ComputerInternals
  def change_hard_drive
    # Implementation
  end
end

class Programmer
  attr_reader :computer

  def initialize(computer)
    @computer = computer
  end

  def use_computer
    computer.turn_on
    computer.type
  end
end

class Technician
  attr_reader :computer_internals

  def initialize(computer_internals)
    @computer_internals = computer_internals
  end

  def fix_computer
    computer_internals.change_hard_drive
  end
end

