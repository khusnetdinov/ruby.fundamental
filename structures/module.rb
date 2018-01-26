# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class Module
  def abstractmethod(symbol)
    module_eval <<-"end_eval"
	    def #{symbol.id2name}(*args)
		raise MethodNotImplementedError
	    end
    end_eval
  end
end
