# Heap sort: Uses a heap (implemented by the Containers module) to sort the collection.
# Requirements: Needs to be able to compare elements with <=>
# Time Complexity: О(n^2)
# Space Complexity: О(n) total, O(1) auxiliary
# Stable: Yes
#
# [5, 4, 3, 1, 2].heapsort! => [1, 2, 3, 4, 5]

class Array
  def swap(first, second)
    self[first], self[second] = self[second], self[first]
    self
  end

  def heap_sort!
    self.dup.heap_sort
  end

  def heap_sort
    ((length - 2) / 2).downto(0) {|start| sift_down(start, length - 1)}

    (length - 1).downto(1) do |end_|
      swap 0, end_
      sift_down(0, end_ - 1)
    end
    self
  end

  def sift_down(start, end_)
    root = start
    loop do
      child = root * 2 + 1
      break if child > end_
      if child + 1 <= end_ and self[child] < self[child + 1]
        child += 1
      end
      if self[root] < self[child]
        swap child, root
        root = child
      else
        break
      end
    end
  end
end