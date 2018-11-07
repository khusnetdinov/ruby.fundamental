# Variables declared in blocks passed to iterators (e.g., times or each) are
# undefined at the top of each iteration! Iterators call the block repeatedly,
# so vars are out of scope again after each call. Built-in looping constructs
# (e.g., while or for) are OK. (Or declare vars before block.)

3.times do |loop_num|
  sum ||= 0
  sum += 1
  puts sum
end
# 1
# 1
# 1

for loop_num in 1..3
  sum ||= 0
  sum += 1
  puts sum
end
# 1
# 2
# 3
