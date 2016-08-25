# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class BinaryHeap < PriorityQueue

  def enqueue(obj)
    raise ContainerFull if @count == @array.length
    @count += 1
    i = @count
    while i > 1 and @array[i/2] > obj
      @array[i] = @array[i / 2]
      i /= 2
    end
    @array[i] = obj
  end

  def min
    raise ContainerEmpty if @count == 0
    @array[1]
  end

  def dequeueMin
    raise ContainerEmpty if @count == 0
    result = @array[1]
    last = @array[@count]
    @count -= 1
    i = 1
    while 2 * i < @count + 1
      child = 2 * i
      if child + 1 < @count + 1 and @array[child + 1] < @array[child]
        child += 1
      end
      break if last <= @array[child]
      @array[i] = @array[child]
      i = child
    end
    @array[i] = last
    return result
  end

end