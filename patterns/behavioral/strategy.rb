# Define a family of algorithms, encapsulate each one, and make them
# interchangeable. Strategy lets the algorithm vary independently from clients that use it.

# Strategies
class StrategyOne
  def use
    puts "Strategy one"
  end
end

class StrategyTwo
  def use
    puts "Strategy two"
  end
end

class StrategyThree
  def use
    puts "Strategy three"
  end
end

# Client
class Context
  @@default_strategy = StrategyOne.new

  def set_strategy(strategy)
    @strategy = strategy
  end

  def use
    @strategy.use
  end
end

# Usage
context = Context.new
context.use # => "Strategy one"

context.set_strategy StrategyTwo.new
context.use # => "Strategy two"

