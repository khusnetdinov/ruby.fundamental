# Shell sort: Similar approach as insertion sort but slightly better.
# Requirements: Needs to be able to compare elements with <=>, and the [] []= methods should
# be implemented for the container.
# Time Complexity: О(n^2)
# Space Complexity: О(n) total, O(1) auxiliary
# Stable: Yes
#
# Algorithms::Sort.shell_sort [5, 4, 3, 1, 2] => [1, 2, 3, 4, 5]

class Array
  def swap(first, second)
    self[first], self[second] = self[second], self[first]
    self
  end

  def quick_sort
    h, *t = self
    h ? t.partition { |e| e < h }.inject { |l, r| l.quick_sort + [h] + r.quick_sort } : []
  end
end