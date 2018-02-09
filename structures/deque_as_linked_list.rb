# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class DequeAsLinkedList < QueueAsLinkedList
  alias queueHead head

  include DequeMethods

  def initialize
    super
  end

  alias head queueHead

  def enqueueHead(obj)
    @list.prepend(obj)
    @count += 1
  end

  alias dequeueHead dequeue

  def tail
    raise ContainerEmpty if @count == 0
    @list.last
  end

  alias enqueueTail enqueue

  def dequeueTail
    raise ContainerEmpty if @count == 0
    result = @list.last
    @list.extract(result)
    @count -= 1
    result
  end
end
