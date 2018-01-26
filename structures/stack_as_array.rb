# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class StackAsArray < Stack
  def initialize(size = 0)
    super()
    @array = Array.new(size)
  end

  def purge
    while @count > 0
      @count -= 1
      @array[@count] = nil
    end
  end

  def push(obj)
    raise ContainerFull if @count == @array.length
    @array[@count] = obj
    @count += 1
  end

  def pop
    raise ContainerEmpty if @count == 0
    @count -= 1
    result = @array[@count]
    @array[@count] = nil
    result
  end

  def top
    raise ContainerEmpty if @count == 0
    @array[@count - 1]
  end

  def each
    for i in 0...@count
      yield @array[i]
    end
  end

  attr_reader :array

  class Iterator < Opus8::Iterator
    def initialize(stack)
      @stack = stack
      @position = 0
    end

    def more?
      @position < @stack.count
    end

    def succ
      if more?
        assert { more? }
        result = @stack.array[@position]
        @position += 1
      else
        result = nil
      end
      result
    end
  end

  def iter
    Iterator.new(self)
  end
end
