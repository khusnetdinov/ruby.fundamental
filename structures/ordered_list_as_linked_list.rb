# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.
#
# http://www.brpreiss.com/books/opus8/programs/pgm07_11.txt
#
class OrderedListAsLinkedList < OrderedList

  def initialize
    super
    @linkedList = SinglyLinkedList.new
  end

  attr_reader :linkedList

  attr_accessor :count

  def insert(obj)
    @linkedList.append(obj)
    @count += 1
  end

  def [](offset)
    raise IndexError if not (0 ... @count) === offset
    ptr = @linkedList.head
    i = 0
    while i < offset and not ptr.nil?
      ptr = ptr.succ
      i += 1
    end
    ptr.datum
  end

  def member?(obj)
    ptr = @linkedList.head
    while not ptr.nil?
      return true if ptr.datum.equal?(obj)
      ptr = ptr.succ
    end
    false
  end

  def find(arg)
    ptr = @linkedList.head
    while not ptr.nil?
      return ptr.datum if ptr.datum == arg
      ptr = ptr.succ
    end
    nil
  end

  def withdraw(obj)
    raise ContainerEmpty if @count == 0
    @linkedList.extract(obj)
    @count -= 1
  end

  def findPosition(obj)
    ptr = @linkedList.head
    while not ptr.nil?
      break if ptr.datum == obj
      ptr = ptr.succ
    end
    Cursor.new(self, ptr)
  end

  class Cursor

    def initialize(list, element)
      @list = list
      @element = element
    end

    def datum
      @element.datum
    end

    def insertAfter(obj)
      @element.insertAfter(obj)
      @list.count += 1
    end

    def withdraw
      @list.linkedList.extract(@element.datum)
      @list.count -= 1
    end
  end

end