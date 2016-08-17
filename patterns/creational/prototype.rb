# The prototype pattern is a creational pattern along the lines of the factory.
# The trick with the prototype is that you create new objects by copying a master
# object. Change that master object and all subsequent objects that you create
# will go off into life with a copy of the change.

# Prototypes witch are used for prototyping
class Note
  attr_accessor :duration

  def initialize(duration)
    @duration = duration
  end
end

class Clef
  # Implementation
end


class PrototypeManager
  def initialize
    @prototypes = []
  end

  def set(key, prototype)
    if @prototypes.include? key
      raise IndexError, "A prototype is already assigned to this key: #{key}"
    else
      @prototypes[key] = prototype
    end
  end

  def unset(key)
    if !@prototypes.include? key
      raise IndexError, "This key doesn't exist in prototype: #{key}"
    else
      @prototypes.delete key
    end

  end

  def get(key)
    @prototypes[key].deep_copy
  end
end

# Usage

prototype = PrototypeManager.new
prototype.set :half_note, Note.new(0.5)
prototype.set :full_note, Note.new(1)

note = prototype.get(:full_note)




