# && has higher precedence
# than =, so
#   x =  true  && false
# means
#   x = (true  && false)
# and has lower precedence, so
#   x = true  and false
# means
#  (x = true) and false
# Ruby Style Guide: Use && / || for boolean expressions, [use] and / or for control flow. 

x = true && false
# => false 
x
# => false
# OK so far, but:
x = true and false
# => false 
x
# => true
# Return value is false but variable is true!
# Why the mismatch?!
