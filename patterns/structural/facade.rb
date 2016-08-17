# The goal of the Facade Pattern is to provide a unified interface to a set of
# interfaces in a subsystem. This means you'd just have some object that can
# send back other objects.

# Complex Parts
class CPU
  def freeze
    # Implementation
  end

  def jump(position)
    # Implementation
  end

  def execute
    # Implementation
  end
end

class Memory
  def load(position, data)
    # Implementation
  end
end

class HardDrive
  def read(lba, size)
    # Implementation
  end
end

# Facade
class ComputerFacade
  attr_reader :processor, :ram, :hd

  def initialize
    @processor = CPU.new
    @ram = Memory.new
    @hd = HardDrive.new
  end

  def start
    processor.freeze
    processor.jump(BOOT_ADDRESS)
    processor.execute
    ram.load(BOOT_ADDRESS, hd.read(BOOT_SECTOR, SECTOR_SIZE))
  end
end

# Usage
computer_facade = ComputerFacade.new
computer_facade.start
