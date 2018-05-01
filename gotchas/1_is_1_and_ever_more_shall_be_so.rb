# coding: utf-8
# Changing Fixnum to new value means new object. They can't be modified in
# place! So, can’t modify a frozen Array of Fixnums. (Fixnums and Integers have
# no bang-methods to demo trying with). BTW: a Fixnum's object_id is value * 2 + 1

arr = [1, 2, 3, 4]
arr.freeze
# => [1, 2, 3, 4]

arr << 5
# RuntimeError: can't modify frozen Array

arr[0] += 2
# RuntimeError: can't modify frozen Array

1.object_id
# => 3

3.object_id
# => 7
