# This pattern provides an interpreter to deal with an abstract language. Using
# classes we can understand the inputs for parse them

# Parsing entity
class Number
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def execute
    value
  end
end

# Operation interface
class Operation
  attr_reader :left, :right

  def initialize(left, right)
    @left = left
    @right = right
  end

  def execute
    raise NotImplementedError
  end
end

# Operations
class Plus < Operation
  def execute
    left.execute + right.execute
  end
end

class Minus < Operation
  def execute
    left.execute - right.execute
  end
end

class Multiply < Operation
  def execute
    left.execute * right.execute
  end
end

class Devide < Operation
  def execute
    left.execute / right.execute
  end
end

# Interpreter class
class Interpreter
  def self.parse(input)
    stack = []

    input.lstrip!
    while input.length > 0
      case input
      when /\A-?\d+(\.\d+)?/
        stack << Number.new($&.to_i)
      else
        second, first = stack.pop(), stack.pop()

        case input
        when /\A\+/
          stack << Plus.new(first, second)
        when /\A\-/
          stack << Minus.new(first, second)
        when /\A\*/
          stack << Multiply.new(first, second)
        else
          raise SyntaxError
        end
      end

      input = $'
      input.lstrip!
    end

    raise SyntaxError unless stack.size == 1

    stack.first.execute
  end
end

# Usage
puts Interpreter.parse('1 + 1 + 2 - 1') # => 3

