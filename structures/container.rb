# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class Container < AbstractObject

  include ::Enumerable

  def initialize
    super
    @count = 0
  end

  attr_reader :count

  def purge
    @count = 0
  end

  def empty?
    count == 0
  end

  def full?
    false
  end

  abstractmethod :iter

  def each
    i = iter
    while i.more?
      yield i.succ
    end
  end

  def to_s
    s = ""
    each do |obj|
      s << ", " if not s.empty?
      s << obj.to_s
    end
    type.name + "{" + s + "}"
  end

  def accept(visitor)
    assert { visitor.is_a?(Visitor) }
    each do |obj|
      break if visitor.done?
      visitor.visit(obj)
    end
  end

end

