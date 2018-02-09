# Shell sort: Similar approach as insertion sort but slightly better.
# Requirements: Needs to be able to compare elements with <=>, and the [] []= methods should
# be implemented for the container.
# Time Complexity: О(n^2)
# Space Complexity: О(n) total, O(1) auxiliary
# Stable: Yes
#
# [5, 4, 3, 1, 2].shell_sort! => [1, 2, 3, 4, 5]

class Array
  def shell_sort!
    inc = length / 2

    while inc != 0
      inc.step(length - 1) do |i|
        el = self[i]
        while i >= inc && self[i - inc] > el
          self[i] = self[i - inc]
          i -= inc
        end
        self[i] = el
      end
      inc = (inc == 2 ? 1 : (inc * 5.0 / 11).to_i)
    end

    self
  end
end
