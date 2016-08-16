# This simple fact is what makes threads so powerful, and also what makes them
# difficult to work with. I've already given you an idea of why threads are
# good; here's a simple program to illustrate their difficulty.

shared_array = Array.new

10.times.map do
  Thread.new do
    1000.times do
      shared_array << nil
    end
  end
end.each(&:join)

# Here you can see that we have 10 * 10000 elements in array

puts shared_array.size

# Note that different ruby can show different result
# GIL exist only in MRI ruby

# $ ruby  => 10000
# $ jruby => 7521
# $ rbx => 8541


