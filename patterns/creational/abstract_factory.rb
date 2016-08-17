# Abstract Factory patterns work around a super-factory which creates other
# factories. This factory is also called as factory of factories. This type of
# design pattern comes under creational pattern as this pattern provides one of
# the best ways to create an object.

# In Abstract Factory pattern an interface is responsible for creating a factory
# of related objects without explicitly specifying their classes. Each generated
# factory can give the objects as per the Factory pattern.

# Classes witch is used in abstract factories

class Frog
end

class Algae
end

class Tiger
end

class Tree
end

# Abstract factory with realization pond environment
class PondFactory
  def new_animal
    Frog.new
  end

  def new_plant
    Algae.new
  end
end

# Abstract factory with realization jungle environment
class JungleFactory
  def new_animal
    Tiger.new
  end

  def new_plant
    Tree.new
  end
end


class EnvironmentFactory
  attr_reader :factories

  def initialize
    @factories = %w(PondFactory JungleFactory)
  end

  def get_factory(method)
    factory_class = get_factory_class method

    if factories.include? factory_class
      self.class.const_get(factory_class).new
    else
      super
    end
  end

  private

  def get_factory_class(method)
    "#{method.to_s.capitalize}Factory"
  end
end

# Usage
environment = EnvironmentFactory.new
jungle = environment.get_factory(:jungle)
jungle.new_animal


