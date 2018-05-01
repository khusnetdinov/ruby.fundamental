# coding: utf-8
# Variable hoisting in Ruby
# Ruby has an interesting hositing mechanism built-in. Let’s take a dive and see
# how it creates variables and do some experiments with it. Take this code for
# example, and run it in console:

puts x

# We will get an error, obviously. x is not defined therefore you get an error:
# NameError: undefined local variable or method `x' for main:Object. That is
# normal. Next, try this:

x = 1 if true
puts x
# => 1

# Which is expected. Now, let’s try something else:

x = 1 if false
puts x
# => ???

# What should this output? An error? Or nil? Or maybe 1, if somehow we live in a
# parallel universe? If we try to run this code, we will get a nil. You don’t
# believe me? Try adding this to the bottom of the script:

puts x.class
# => NilClass

# You see, if we try to call an undefined variable we will get a NameError. But,
# if we define the variable in a part of the code that will not be run at all we
# will get a nil.

# **Hoisting**
# Well, it’s not that complicated really. But, it’s a quirk that most of us have
# not ran across. The “magic” here is done by Ruby’s parser. Basically, when the
# parser runs over the if-clause (look in weird_3.rb example file) it first
# declares the variable, regardless of whether it will actually be executed. This
# means that when the parser sees x=1, it will actually declare the variable, by
# assigning it to nil and let the interpreter than figure out if the x = 1 line
# will ever get executed. Don’t confuse the parser with the interpreter. The
# parser does not care whether x ever gets a value. The job of the parser is just
# to go over the code, find any local variables and allocate “space” for those
# variables. More specifically, set them to nil. On the other hand, it’s the
# interpreter that will follow the logical path of the program and see if / when
# x will get a value and act on it. Last but not least, if you know about
# hoisting in JavaScript, it’s worth mentioning that Ruby’s hoisting is much
# different. In Ruby every variable is available only after the line where the
# variable has been assigned, regardless if that line will be executed or not.
