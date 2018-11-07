# Whitespace-insensitive?
# NOT ALWAYS!
# 
# With multiple args:
# - No parens, no problem.
# - Parens w/o space, OK.
# - Parens and space, NO!
#
# Parser thinks it's an expression, as one arg, but (1, 2) is not a valid Ruby
# expression! (All work fine w/ 1 arg.)

def method(arg1, arg2); end

method 1, 2
# => nil

method(1, 2)
# => nil

method (1, 2)
# syntax error, unexpected ',', expecting ')'
# method (1, 2)

# "method /num" is an unended regex or string!  Ruby thinks you are giving an
# argument to method. General principle: use BALANCED whitespace; both sides or
# neither.

def method; 42; end
num = 21
method/num
# => 2

method / num
# => 2

method/ num
# => 2

method /num
# SyntaxError: unterminated regexp

# "one -2" makes Ruby think you are giving an argument (of -2) to method one.
# (Same for +2 ... or even *2!) Again: use BALANCED whitespace; both sides or
# neither.

def one
  1
end

one - 2
# => -1

one-2
# => -1

one- 2
# => -1

one -2
# ArgumentError: wrong number of arguments (1 for 0)

# "Stabby" lambdas (1.9+)
# Parentheses optional
# Space before/after args without parens,  OK.
# Space after parens, OK.
# Again, space before parens, NO!
# UPDATE: Fixed in 2.0!

dbl = ->(x) { x * 2 }
# => #<Proc:... (lambda)>

dbl = ->x{ x * 2 }
# => #<Proc:... (lambda)>

dbl = -> x { x * 2 }
# => #<Proc:... (lambda)>

two = -> { 2 }
# => #<Proc:... (lambda)>

dbl = -> (x) { x * 2 }
# Syntax error, unexpected tLPAREN_ARG, expecting keyword_do_LAMBDA or tLAMBEG

two = -> () { 2 }
# Same syntax error
