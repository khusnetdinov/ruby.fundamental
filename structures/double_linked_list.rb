# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class DoubleLinkedList < SinglyLinkedList
  class Element < SinglyLinkedList < Element
    attr_accessor :prev

    def initialize(list, data, succ, prev)
      super(list, data, succ)
      @prev = prev
    end

    def insert_after(item)
      # Todo
    end

    def insert_before(item)
      # Todo
    end
  end

  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def purge
    @head = nil
    @tail = nil
  end

  def empty?
    @head.nil?
  end

  def first
    if @head.nil?
      raise Error
    else
      @head.data
    end
  end

  def last
    if @tail.nil?
      raise Error
    else
      @tail.data
    end
  end

  def prepend(elem)
    # Todo
  end

  def append(elem)
    # Todo
  end

  def clone
    # Todo
  end

  def extract
    # Todo
  end

end