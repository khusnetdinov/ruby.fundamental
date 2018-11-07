# The singleton pattern is used to ensure that there is only one instance of a
# class and provides global access to that instance. This pattern is useful when
# you want one instance of a class and many different objects need to access it,
# rather than pass the object around, we can make the object global.

class Singleton
  def self.new
    @instance ||= super
  end
end

# Other example
require 'singleton'

class OtherSingleton
  include Singleton

  # OtherSingleton.new is not allowed
end

# Usage
s1 = Singleton.new
s2 = OtherSingleton.instance
