# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

module DequeMethods
  abstractmethod :enqueueHead

  abstractmethod :dequeueHead

  abstractmethod :head

  abstractmethod :enqueueTail

  abstractmethod :dequeueTail

  abstractmethod :tail
end

class Deque < Queue
  def initialize
    super
  end

  alias queueHead head
  include DequeMethods
  alias head queueHead
end
