# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class QueueAsLinkedList < Queue
  def initialize
    super
    @list = SinglyLinkedList.new
  end

  def purge
    @list.purge
    super
  end

  def head
    raise ContainerEmpty if @count == 0
    @list.first
  end

  def enqueue(obj)
    @list.append(obj)
    @count += 1
  end

  def dequeue
    raise ContainerEmpty if @count == 0
    result = @list.first
    @list.extract(result)
    @count -= 1
    result
  end
end
