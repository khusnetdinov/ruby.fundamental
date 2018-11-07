# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class SinglyLinkedList
  class Element
    attr_accessor :data, :succ

    def initialize(list, data, succ)
      @list = list
      @data = data
      @succ = succ
    end

    def insert_after(item)
      @succ = Element.new(@list, item, @succ)

      @list.tail = @succ if @list.tail.equal?(self)
    end

    def insert_before(item)
      tmp = Element.new(@list, item, self)

      if @list.head.equal?(self)
        @list.head = tmp
      else
        prevElem = @list.head
        while !prevElem.nil? && !prevElem.succ.equal?(self)
          prevElem = prevElem.succ
        end
        prevElem.succ = tmp
      end
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
    temp = Element.new(self, elem, @head)

    @tail = temp if @head.nil?
    @head = temp
  end

  def append(elem)
    temp = Element.new(self, elem, nil)

    if @head.nil?
      @head = temp
    else
      @tail.succ = temp
    end

    @tail = temp
  end

  def clone
    linked_list = SinglyLinkedList.new

    elem = @head
    until elem.nil?
      linked_list.append elem.data
      elem = @head.succ
    end

    linked_list
  end

  def extract
    elem = @head

    prevElem = nil
    while !elem.nil? && !elem.data.equal?(item)
      prevElem = elem
      elem = elem.succ
    end

    raise ArgumentError if elem.nil?

    if elem == @head
      @head = elem.succ
    else
      prevElem.succ = elem.succ
    end

    @tail = prevElem if elem == @tail
  end

  def each
    elem = @head
    until elem.nil?
      yield ptr.data
      elem = elem.succ
    end
  end
end
