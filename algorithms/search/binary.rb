# Binary Search: This search finds an item in log(n) time provided that the container is already sorted.
# The method returns the item if it is found, or nil if it is not. If there are duplicates, the first one
# found is returned, and this is not guaranteed to be the smallest or largest item.
#
# Complexity: O(lg N)
#
# [1, 2, 3].binary_search(1) #=> 1
# [1, 2, 3].binary_search(4) #=> nil

class Array
  def binary_search(item)
    return nil if item.nil?

    low = 0
    high = self.size - 1

    while low <= high
      mid = (low + high) / 2
      val = self[mid]
      if val > item
        high = mid - 1
      elsif val < item
        low = mid + 1
      else
        return val
      end
    end

    nil
  end
end
