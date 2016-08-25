# Insertion sort: Elements are inserted sequentially into the right position.
# Requirements: Needs to be able to compare elements with <=>, and the [] []= methods should
# be implemented for the container.
# Time Complexity: О(n^2)
# Space Complexity: О(n) total, O(1) auxiliary
# Stable: Yes
#
# Algorithms::Sort.insertion_sort [5, 4, 3, 1, 2] => [1, 2, 3, 4, 5]

class Array
  def insertion_sort
    # TODO
  end
end

# Although it is one of the elementary sorting algorithms with O(n2) worst-case time, insertion sort is the algorithm of choice either when the data is nearly sorted (because it is adaptive) or when the problem size is small (because it has low overhead).
# For these reasons, and because it is also stable, insertion sort is often used as the recursive base case (when the problem size is small) for higher overhead divide-and-conquer sorting algorithms, such as merge sort or quick sort.
