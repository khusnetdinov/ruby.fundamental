# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

module SearchableContainerMethods
  abstractmethod :member?

  abstractmethod :insert

  abstractmethod :withdraw

  abstractmethod :find
end

class SearchableContainer < Container
  include SearchableContainerMethods

  def initialize
    super
  end
end

module SearchTreeMethods
  abstractmethod :min

  abstractmethod :max
end

class SearchTree < Tree
  def initialize
    super
  end

  include SearchableContainerMethods
  include SearchTreeMethods
end
