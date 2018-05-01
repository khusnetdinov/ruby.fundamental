# Freezing an array (or a hash) freezes it, not the items it contains.
# Strings can be modified in place.  This way, you can modify a given slot in a
# frozen Array of Strings.

arr = ["one", "two", "three"]
arr.freeze
arr << "four"
# RuntimeError: can't modify frozen Array

arr[0] = "eno"
# RuntimeError: can't modify frozen Array

arr[0].object_id
# => 1234567890

arr[0].reverse!
arr
# => ["eno", "two", "three"]

arr[0].object_id
# => 1234567890
