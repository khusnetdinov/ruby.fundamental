# ##What Is the Difference Between a Block, a Proc, and a Lambda in Ruby?
# Block Examples
[1, 2, 3].each { |x| puts x * 2 } # block is in between the curly braces
[1, 2, 3].each do |x|
  puts x * 2 # block is everything between the do and end
end
# Proc Examples
p = proc { |x| puts x * 2 }
[1, 2, 3].each(&p) # The '&' tells ruby to turn the proc into a block
proc = proc { puts 'Hello World' }
proc.call # The body of the Proc object gets executed when called
# Lambda Examples
lam = ->(x) { puts x * 2 }
[1, 2, 3].each(&lam)
lam = -> { puts 'Hello World' }
lam.call
# While it looks like these are all very similar, there are subtle differences that I will cover below.
# ##Differences between Blocks and Procs
# 1. ####Procs are objects, blocks are not
# A proc (notice the lowercase p) is an instance of the Proc class.
p = proc { puts 'Hello World' }
# This lets us call methods on it and assign it to variables. Procs can also return themselves.
p.call  # prints 'Hello World'
p.class # returns 'Proc'
a = p   # a now equals p, a Proc instance
p       # returns a proc object '#<Proc:0x007f96b1a60eb0@(irb):46>'
# In contrast, a block is just part of the *syntax* of a method call. It doesn’t mean anything on a standalone basis and can only appear in argument lists.
# { puts "Hello World"}       # syntax error
# a = { puts "Hello World"}   # syntax error
[1, 2, 3].each { |x| puts x * 2 } # only works as part of the syntax of a method call
# 2. ####At most one block can appear in an argument list
# In contrast, you can pass multiple procs to methods.
def multiple_procs(proc1, proc2)
  proc1.call
  proc2.call
end
a = proc { puts 'First proc' }
b = proc { puts 'Second proc' }
multiple_procs(a, b)
# ##Differences between Procs and Lambdas
# Before I get into the differences between procs and lambdas, it is important to mention that they are both Proc objects.
proc = proc { puts 'Hello world' }
lam = -> { puts 'Hello World' }
proc.class # returns 'Proc'
lam.class  # returns 'Proc'
# However, lambdas are a different ‘flavor’ of procs. This slight difference is shown when returning the objects.
proc   # returns '#<Proc:0x007f96b1032d30@(irb):75>'
lam    # returns '<Proc:0x007f96b1b41938@(irb):76 (lambda)>'
# The (lambda) notation is a reminder that while procs and lambdas are very similar, even both instances of the Proc class,
# they are also slightly different. Below are the key differences.
# 1. Lambdas check the number of arguments, while procs do not
lam = ->(x) { puts x } # creates a lambda that takes 1 argument
lam.call(2)                    # prints out 2
lam.call                       # ArgumentError: wrong number of arguments (0 for 1)
lam.call(1, 2, 3) # ArgumentError: wrong number of arguments (3 for 1)
# In contrast, procs don’t care if they are passed the wrong number of arguments.
proc = proc { |x| puts x } # creates a proc that takes 1 argument
proc.call(2)                   # prints out 2
proc.call                      # returns nil
proc.call(1, 2, 3) # prints out 1 and forgets about the extra arguments
# As shown above, procs don’t freak out and raise errors if they are passed the wrong number of arguments.
# If the proc requires an argument but no argument is passed then the proc returns nil.
# If too many arguments are passed than it ignores the extra arguments.
# 2. Lambdas and procs treat the ‘return’ keyword differently
# return inside of a lambda triggers the code right outside of the lambda code
def lambda_test
  lam = -> { return }
  lam.call
  puts 'Hello world'
end
lambda_test # calling lambda_test prints 'Hello World'
# ‘return’ inside of a proc triggers the code outside of the method where the proc is being executed
def proc_test
  proc = proc { return }
  proc.call
  puts 'Hello world'
end
proc_test # calling proc_test prints nothing
# ##Summary Differences
#- Procs are objects, blocks are not
#- At most one block can appear in an argument list
#- Lambdas check the number of arguments, while procs do not
#- Lambdas and procs treat the ‘return’ keyword differently
