# Flattening the Scope (aka Nested Lexical Scopes)
# Where you change the code in such a way that it's easier for you to pass variables through "Scope Gates".
# A scope gate is any block, where normally when you enter its scope the variables outside of it become unreachable.
# This happens in: Class definitions, Module definitions, Method definitions
# I'm not sure what the real life examples are of this, but if you ever wonder why some code does the following,
# then maybe it was that they wanted to flatten the scope so they could more easily pass around variables.
# I guess it's better to do it this way than to define a global variable?
#
# In the following code we want to access `my_var` from inside the method (inner scope gate) that's
# inside the class (outer scope gate).
my_var = "abc"
class OuterScopeGate
  puts my_var

  def inner_scope_gate
    puts my_var
  end
end

# We fix this by flattening the code into method calls (method *calls* aren't scope gates)
# So we turn the class keyword into a method call using `Class.new`
# We also turn the method inside the class from a keyword into a method call using `define_method`
my_var = "abc"
MyClass = Class.new do
  puts "Here is 'my_var' inside my class definition: #{my_var}"

  define_method :my_method do
    puts "Here is 'my_var' inside my class instance method: #{my_var}"
  end
end # => Here is 'my_var' inside my class definition: abc
MyClass.new.my_method # => Here is 'my_var' inside my class instance method: abc