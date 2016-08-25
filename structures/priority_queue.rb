# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

module PriorityQueueMethods

  abstractmethod :enqueue

  abstractmethod :min

  abstractmethod :dequeueMin

end

class PriorityQueue < Container

  def initialize
    super
  end

  include PriorityQueueMethods

end

module MergeablePriorityQueueMethods

  abstractmethod :merge!
end

class MergeablePriorityQueue < PriorityQueue

  def initialize
    super
  end

  include MergeablePriorityQueueMethods

end