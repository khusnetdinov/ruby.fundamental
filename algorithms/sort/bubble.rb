# Bubble sotr: A very naive sort that keeps swapping elements until the container is sorted.
# Requirements: Needs to be able to compare elements with <=>, and the [] []= methods should
# be implemented for the container.
# Time Complexity: О(n^2)
# Space Complexity: О(n) total, O(1) auxiliary
# Stable: Yes
#
# Algorithms::Sort.bubble_sort [5, 4, 3, 1, 2] => [1, 2, 3, 4, 5]

class Array
  def bubble_sort
    # TODO
  end
end

# Bubble sort has many of the same properties as insertion sort, but has slightly higher overhead. In the case of nearly sorted data, bubble sort takes O(n) time, but requires at least 2 passes through the data (whereas insertion sort requires something more like 1 pass).
