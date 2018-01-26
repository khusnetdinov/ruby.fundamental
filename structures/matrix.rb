# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class Matrix
  def initialize(numberOfRows, numberOfColumns)
    assert { numberOfRows >= 0 }
    assert { numberOfColumns >= 0 }

    @numberOfRows = numberOfRows
    @numberOfColumns = numberOfColumns
  end

  attr_reader :numberOfRows

  attr_reader :numberOfColumns

  abstractmethod :+

  abstractmethod :*

  abstractmethod :transpose
end
