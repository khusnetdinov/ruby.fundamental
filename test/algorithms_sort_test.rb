require 'test/unit'

require_relative '../algorithms/sort/bubble'
require_relative '../algorithms/sort/heap'
require_relative '../algorithms/sort/insertion'
require_relative '../algorithms/sort/merge'
require_relative '../algorithms/sort/quick'
require_relative '../algorithms/sort/selection'
require_relative '../algorithms/sort/shell'

class AlgorithmsTest < Test::Unit::TestCase
  SORTED = [1, 2, 3, 4, 5].freeze
  UNSORTED = [5, 4, 3, 2, 1].freeze

  def test_bubdle_sort
    assert_equal UNSORTED.dup.bubble_sort!, SORTED
  end

  def test_heap_sort
    assert_equal UNSORTED.dup.heap_sort!, SORTED
  end

  def test_insertion_sort
    assert_equal UNSORTED.dup.insertion_sort!, SORTED
  end

  def test_merge_sort
    assert_equal UNSORTED.dup.merge_sort!, SORTED
  end

  def test_quick_sort
    assert_equal UNSORTED.dup.quick_sort!, SORTED
  end

  def test_selection_sort
    assert_equal UNSORTED.dup.selection_sort!, SORTED
  end

  def test_shell_sort
    assert_equal UNSORTED.dup.shell_sort!, SORTED
  end
end
