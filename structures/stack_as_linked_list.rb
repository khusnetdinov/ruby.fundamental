# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class StackAsLinkedList < Stack
  def initialize
    super
    @list = SinglyLinkedList.new
  end

  def purge
    @list.purge
    super
  end

  def push(obj)
    @list.prepend(obj)
    @count += 1
  end

  def pop
    raise ContainerEmpty if @count == 0
    result = @list.first
    @list.extract(result)
    @count -= 1
    result
  end

  def top
    raise ContainerEmpty if @count == 0
    @list.first
  end

  def each(&block)
    @list.each(&block)
  end

  attr_reader :list

  class Iterator < Opus8::Iterator
    def initialize(stack)
      @position = stack.list.head
    end

    def more?
      !@position.nil?
    end

    def succ
      if more?
        result = @position.datum
        @position = @position.succ
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
