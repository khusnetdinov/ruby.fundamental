# when a client depends upon a class that contains interfaces that the client does not use, but that other clients do use, then that client will be affected by the changes that those other clients force upon the class.

class Computer
  def turn_on
    # turns on the computer
  end
  def type
    # type on the keyboard
  end
  def change_hard_drive
    # opens the computer body
    # and changes the hard drive
  end
end

class Programmer
  def use_computer
    @computer.turn_on
    @computer.type
  end
end

class Technician
  def fix_computer
    @computer.change_hard_drive
  end
end

# Clean code

class Computer
  def turn_on
  end

  def type
  end
end

class ComputerInternals
  def change_hard_drive
  end
end

class Programmer
  def use_computer
    @computer.turn_on
    @computer.type
  end
end

class Technician
  def fix_computer
    @computer_internals.change_hard_drive
  end
end
