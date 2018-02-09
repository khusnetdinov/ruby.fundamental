# Bubble sort: A very naive sort that keeps swapping elements until the container is sorted.
# Requirements: Needs to be able to compare elements with <=>, and the [] []= methods should
# be implemented for the container.
# Time Complexity: О(n^2)
# Space Complexity: О(n) total, O(1) auxiliary
# Stable: Yes
#
# [5, 4, 3, 1, 2].bubble_sort! => [1, 2, 3, 4, 5]

class Array
  def swap(first, second)
    self[first], self[second] = self[second], self[first]
    self
  end

  def bubble_sort!
    loop do
      swapped = false
      (self.size - 1).times do |index|
        if self[index] > self[index + 1]
          swap index, index + 1
          swapped = true
        end
      end
      break unless swapped
    end

    self
  end

  # def bubble_sort!
  #   length.times do |j|
  #     for i in 1...(length - j)
  #       swap i - 1, i if self[i - 1] < self[i]
  #     end
  #   end
  #
  #   self
  # end
  #
  # def bubble_sort!
  #   each_index do |index|
  #     (length - 1).downto( index ) do |i|
  #       swap i - 1, i if self[i - 1] < self[i]
  #     end
  #   end
  #
  #   self
  # end
end
