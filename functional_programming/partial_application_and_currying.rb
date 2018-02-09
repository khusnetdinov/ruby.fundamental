# Let’s first understand what these two different applications of functions are.
#
# Partial function application, and currying, are defined as such:
#
# Partial function aplication is calling a function with some number of arguments,
# in order to get a function back that will take that many less arguments.
# Currying is taking a function that takes n arguments, and splitting it
# into n functions that take one argument.
#
# In order to give you a clearer idea of what each of these two things will
# do a function, let’s take an example Proc:

proc { |x, y, z| x + y + z }

# Partial application of this function would return, if we passed in the first
# two arguments, the following nested Procs:

proc { |x, y| proc { |z| x + y + z } }

# On the other hand, currying this function would return the following nested Procs:

proc { |x| proc { |y| proc { |z| x + y + z } } }

# .curry returns a curried proc. If the optional arity argument is given,
# it determines the number of arguments. A curried proc receives some arguments.
# If a sufficient number of arguments are supplied, it passes the supplied arguments
# to the original proc and returns the result. Otherwise, returns another curried proc
# that takes the rest of arguments.

l = ->(x, y, z) { x + y + z }
l.curry[1][2][3]
# => 6

a = l.curry[1]
# => <Proc:0x007fc759a22920 (lambda)>
b = a[2]
#=> <Proc:0x007fc759a68b00 (lambda)>
b[3]
# => 6

apply_math = ->(fn, a, b) { a.send fn, b }
add = apply_math.curry.call(:+)
add.call(1, 2)
# => 3

increment = add.curry.call(1)
increment.call(1)
# => 2
increment.call(5)
# => 6
