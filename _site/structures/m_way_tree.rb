# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class MWayTree < SearchTree

  def initialize(m)
    assert { m > 2 }
    super()
    @key = Array.new(m - 1, 1)
    @subtree = Array.new(m)
  end

  def m
    @subtree.length
  end

  def depthFirstTraversal(&block)
    if not empty?
      for i in 1 .. @count
        yield (@key[i], PREVISIT)
      end
      @subtree[0].depthFirstTraversal(&block)
      for i in 1 .. @count
        yield (@key[i], INVISIT)
        @subtree[i].depthFirstTraversal(&block)
      end
      for i in 1 .. @count
        yield (@key[i], POSTVISIT)
      end
    end
  end

  def find(obj)
    return nil if empty?
    i = @count
    while i > 0
      diff = obj <=> @key[i]
      return @key[i] if diff == 0
      break if diff > 0
      i = i - 1
    end
    return @subtree[i].find(obj)
  end

  def findIndex(obj)
    return 0 if empty? or obj < @key[1]
    left = 1
    right = @count
    while left < right
      middle = (left + right + 1) / 2
      if obj < @key[middle]
        right = middle - 1
      else
        left = middle
      end
    end
    return left
  end

  def find(obj)
    return nil if empty?
    index = findIndex(obj)
    if index != 0 and @key[index] == obj
      return @key[index]
    else
      return @subtree[index].find(obj)
    end
  end

  def insert(obj)
    if empty?
      @subtree[0] = MWayTree.new(m)
      @key[1] = obj
      @subtree[1] = MWayTree.new(m)
      @count = 1
    else
      index = findIndex(obj)
      raise ValueError if index != 0 and @key[index] == obj
      if not full?
        i = @count
        while i > index
          @key[i + 1] = @key[i]
          @subtree[i + 1] = @subtree[i]
          i = i - 1
        end
        @key[index + 1] = obj
        @subtree[index + 1] = MWayTree.new(m)
        @count = @count + 1
      else
        @subtree[index].insert(obj)
      end
    end
  end

  def withdraw(obj)
    raise ArgumentError if empty?
    index = findIndex(obj)
    if index != 0 and @key[index] == obj
      if not @subtree[index - 1].empty?
        max = @subtree[index - 1].max
        @key[index] = max
        @subtree[index - 1].withdraw(max)
      elsif not @subtree[index].empty?
        min = @subtree[index].min
        @key[index] = min
        @subtree[index].withdraw(min)
      else
        @count = @count - 1
        i = index
        while i <= @count
          @key[i] = @key[i + 1]
          @subtree[i] = @subtree[i + 1]
          i = i + 1
        end
        @key[i] = nil
        @subtree[i] = nil
        if @count == 0
          @subtree[0] = nil
        end
      end
    else
      @subtree[index].withdraw(obj)
    end
  end

end