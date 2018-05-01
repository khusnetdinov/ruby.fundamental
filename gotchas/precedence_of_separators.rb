# || has higher precedence
# than =, so
#   x =  false || true
# means
#   x = (false || true)
# or has lower precedence, so
#   x = false  or true
# means
#  (x = false) or true
# Also, && is higher than ||, but and and or are equal, so they are evaluated
# left-to-right!

x = false || true
# => true

x
# => true

# OK so far, but:

x = false or true
# => true

x
# => false

# Return value is true but variable is false! Why the mismatch?!
