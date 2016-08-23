# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class Array

  attr_accessor :baseIndex
  alias_method :init, :initialize
  alias_method :getitem, :[]
  alias_method :setitem, :[]=

  def initialize(size = 0, baseIndex = 0)
    init(size, nil)
    @baseIndex = baseIndex
  end

  def length=(value)
    tmp = Array.new(value, nil)

    for i in 0 ... [length, value].min
      tmp.setitem(i, getitem(i))
    end

    clear
    setitem(value - 1, nil) if value > 0

    for i in 0 ... tmp.length
      setitem(i, tmp.getitem(i))
    end
  end

  protected :getitem, :setitem

  def getOffset(index)
    @baseIndex = 0 if @baseIndex.nil?
    raise IndexError if not  (@baseIndex ... @baseIndex + length) === index
    index - @baseIndex
  end

  def [](index)
    getitem(getOffset(index))
  end

  def []=(index, value)
    setitem(getOffset(index), value)
  end
end
