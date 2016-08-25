module Swapable
  def swap(first, second)
    self[first], self[second] = self[second], self[first]
    self
  end
end
