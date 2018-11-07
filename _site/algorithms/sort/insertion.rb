# coding: utf-8
# Insertion sort: Elements are inserted sequentially into the right position.
# Requirements: Needs to be able to compare elements with <=>, and the [] []=
# methods should be implemented for the container. Time Complexity: О(n^2)
# Space Complexity: О(n) total, O(1) auxiliary
# Stable: Yes
#
# [5, 4, 3, 1, 2].insertion_sort! => [1, 2, 3, 4, 5]

class Array
  def insertion_sort!
    return self if length < 2

    1.upto(length - 1) do |i|
      value = self[i]
      j = i - 1
      while j >= 0 && self[j] > value
        self[j + 1] = self[j]
        j -= 1
      end
      self[j + 1] = value
    end

    self
  end
end
