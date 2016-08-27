# Knuth-Morris-Pratt Algorithm substring search algorithm: Efficiently finds the starting position of a
# substring in a string. The algorithm calculates the best position to resume searching from if a failure
# occurs.
#
# The method returns the index of the starting position in the string where the substring is found. If there
# is no match, nil is returned.
#
# Complexity: O(n + k), where n is the length of the string and k is the length of the substring.
#
# "ABC ABCDAB ABCDABCDABDE".kmp_search("ABCDABD") #=> 15
# "ABC ABCDAB ABCDABCDABDE".kmp_search("ABCDEF") #=> nil

class Array
  def self.kmp_search(substring)
    return nil if self.nil? or substring.nil?

    pos = 2
    cnd = 0
    failure_table = [-1, 0]
    while pos < substring.length
      if substring[pos - 1] == substring[cnd]
        failure_table[pos] = cnd + 1
        pos += 1
        cnd += 1
      elsif cnd > 0
        cnd = failure_table[cnd]
      else
        failure_table[pos] = 0
        pos += 1
      end
    end

    m = i = 0
    while m + i < self.length
      if substring[i] == self[m + i]
        i += 1
        return m if i == substring.length
      else
        m = m + i - failure_table[i]
        i = failure_table[i] if i > 0
      end
    end

    return nil
  end
end