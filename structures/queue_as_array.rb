# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class QueueAsArray < Queue

  def initialize(size = 0)
    super()
    @array = Array.new(size)
    @head = 0
    @tail = size - 1
  end

  def purge
    while @count > 0
      @array[@head] = nil
      @head = @head + 1
      if @head == @array.length
        @head = 0
      end
      @count -= 1
    end
  end

  def head
    raise ContainerEmpty if @count == 0
    @array[@head]
  end

  def enqueue(obj)
    raise ContainerFull if @count == @array.length
    @tail = @tail + 1
    if @tail == @array.length
      @tail = 0
    end
    @array[@tail] = obj
    @count += 1
  end

  def dequeue
    raise ContainerEmpty if @count == 0
    result = @array[@head]
    @array[@head] = nil
    @head = @head + 1
    if @head == @array.length
      @head = 0
    end
    @count -= 1
    result
  end

end