# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class DequeAsArray < QueueAsArray
  alias queueHead head

  include DequeMethods

  def initialize(size = 0)
    super(size)
  end

  alias head queueHead

  def enqueueHead(obj)
    raise ContainerFull if @count == @array.length
    @head = if @head == 0
      @array.length - 1
    else
      @head - 1
    end
    @array[@head] = obj
    @count += 1
  end

  alias dequeueHead dequeue

  def tail
    raise ContainerEmpty if @count == 0
    @array[@tail]
  end

  alias enqueueTail enqueue

  def dequeueTail
    raise ContainerEmpty if @count == 0
    result = @array[@tail]
    @array[@tail] = nil
    @tail = if @tail == 0
      @array.length - 1
    else
      @tail - 1
    end
    @count -= 1
    result
  end
end
