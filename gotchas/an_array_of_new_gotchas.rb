# Default value given as object is same object for each slot!  Mutating one mutates default for all.
# Initial value given as block gets evaluated separately for each slot.  Use this to create new vars for each.

class Person
  attr_accessor :name
end

people = Array.new(3, Person.new)
people[0].name = "Alice"
people[1].name = "Bob"
people[0].name
# => "Bob"
# should have been "Alice"!

people = Array.new(3) {
  Person.new }
people[0].name = "Alice"
people[1].name = "Bob"
people[0].name
# => "Alice"
