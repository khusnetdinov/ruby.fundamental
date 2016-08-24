# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.
class AbstractObject < ::Object

  def initialize
    super
  end

  include ::Comparable

  def <=>(obj)
    if is_a?(obj.type)
      return compareTo(obj)
    elsif obj.is_a?(type)
      return -obj.compareTo(self)
    else
      return type.name <=> obj.type.name
    end
  end

  abstractmethod :compareTo

  protected :compareTo

end