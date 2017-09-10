# Without violating encapsulation, capture and externalize an object's internal
# state allowing the object to be restored to this state later.

# The Originator can save and load itself. The Caretaker (the main function in
# this case) never has to touch the memento objects.

# This implementation is a bit naive:
# - saves should be kept in files
# - Marshal will not always work (singleton methods, bindings, etc..)

module Originator
  def saves
    @saves ||= {}
  end

  def save(key)
    puts "saving key: #{key}"
    @saves[key] = Marshal.dump self
  end

  def restore(key)
    puts "restoring key: #{key}"
    include_state Marshal.load(@saves[key])
  end

  private

  def include_state(other)
    other.instance_variables.each { |v| instance_variable_set(v, other.instance_variable_get(v)) unless v == '@saves' }
  end
end

class Example
  include Originator

  attr_accessor :name, :color

  def initialize(name, color)
    @name, @color = name, color
  end
end

# Usage
example = Example.new('Dave', 'blue')
example.save :now # => saving key now
