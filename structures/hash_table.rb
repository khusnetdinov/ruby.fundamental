# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class HashTable < SearchableContainer

  def initialize
    super
  end

  abstractmethod :length

  def loadFactor
    return count / length
  end

  def f(obj)
    obj.hash
  end

  def g(x)
    x.abs % length
  end

  def h(obj)
    g(f(obj))
  end

end

class ChainedHashTable < HashTable

  def initialize(length)
    super()
    @array = Array.new(length)
    for i in 0 ... length
      @array[i] = SinglyLinkedList.new
    end
  end

  def length
    @array.length
  end

  def purge
    for i in 0 ... length
      @array[i].purge
    end
    @count = 0
  end

  def insert(obj)
    @array[h(obj)].append(obj)
    @count += 1
  end

  def withdraw(obj)
    @array[h(obj)].extract(obj)
    @count -= 1
  end

  def find(obj)
    ptr = @array[h(obj)].head
    while not ptr.nil?
      return ptr.datum if ptr.datum == obj
      ptr = ptr.succ
    end
    nil
  end

end