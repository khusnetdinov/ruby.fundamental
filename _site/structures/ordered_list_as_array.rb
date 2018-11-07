# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class OrderedListAsArray < OrderedList
  def initialize(size = 0)
    super()
    @array = Array.new(size)
  end

  attr_reader :array

  attr_accessor :count

  def insert(obj)
    raise ContainerFull if @count == @array.length
    @array[@count] = obj
    @count += 1
  end

  def member?(obj)
    for i in 0...@count
      return true if @array[i].equal?(obj)
    end
    false
  end

  def find(obj)
    for i in 0...@count
      return @array[i] if @array[i] == obj
    end
    nil
  end

  def withdraw(obj)
    raise ContainerEmpty if @count == 0
    i = 0
    i += 1 while (i < @count) && !@array[i].equal?(obj)
    raise ArgumentError if i == @count
    while i < @count - 1
      @array[i] = @array[i + 1]
      i += 1
    end
    @array[i] = nil
    @count -= 1
  end

  class Cursor
    def initialize(list, offset)
      super()
      @list = list
      @offset = offset
    end

    def datum
      raise IndexError unless (0...@list.count) === offset
      @list[@offset]
    end
  end

  def findPosition(obj)
    i = 0
    i += 1 while (i < @count) && (@array[i] != obj)
    Cursor.new(self, i)
  end

  def [](offset)
    raise IndexError unless (0...@count) === offset
    @array[offset]
  end

  class Cursor < Cursor
    def insertAfter(obj)
      raise IndexError unless (0...@list.count) === @offset
      raise ContainerFull if	@list.count == @list.array.length
      insertPosition = @offset + 1
      i = @list.count
      while i > insertPosition
        @list.array[i] = @list.array[i - 1]
        i -= 1
      end
      @list.array[insertPosition] = obj
      @list.count += 1
    end

    def withdraw
      raise IndexError unless (0...@list.count) === @offset
      raise ContainerEmpty if @list.count == 0
      i = @offset
      while i < @list.count - 1
        @list.array[i] = @list.array[i + 1]
        i += 1
      end
      @list.array[i] = nil
      @list.count -= 1
    end
  end
end
