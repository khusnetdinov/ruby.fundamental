# Selection sort: A naive sort that goes through the container and selects the smallest element,
# putting it at the beginning. Repeat until the end is reached.
# Requirements: Needs to be able to compare elements with <=>, and the [] []= methods should
# be implemented for the container.
# Time Complexity: О(n^2)
# Space Complexity: О(n) total, O(1) auxiliary
# Stable: Yes
#
# [5, 4, 3, 1, 2].selection_sort! => [1, 2, 3, 4, 5]

class Array
  def swap(first, second)
    self[first], self[second] = self[second], self[first]
    self
  end

  def selection_sort!
    0.upto(length - 1) do |i|
      min = i
      (i + 1).upto(length - 1) do |j|
        min = j if (self[j] <=> self[min]) == -1
      end
      swap min, i
    end

    self
  end

  # def selection_sort!
  #   for i in 0..length - 2
  #     min = i
  #     for j in (i + 1)...length
  #       min = j  if self[j] < self[min]
  #     end
  #     swap min, i
  #   end
  #
  #   self
  # end
end
