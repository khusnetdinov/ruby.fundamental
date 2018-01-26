require 'test/unit'

require_relative '../algorithms/search/binary'
require_relative '../algorithms/search/khuth-morris-pratt'

class AlgorithmsTest < Test::Unit::TestCase
  IN_ARRAY  = [1,2,3]
  IN_STRING = "ABC ABCDAB ABCDABCDABDE"

  def test_binary_search
    assert_equal(1, IN_ARRAY.binary_search(1))
    assert_nil(nil, IN_ARRAY.binary_search(4))
  end  

  def test_khuth_morris_pratt_search
    assert_equal(15, IN_STRING.kmp_search("ABCDABD"))
    assert_nil(nil, IN_STRING.kmp_search("ABCDEF"))
  end
end
