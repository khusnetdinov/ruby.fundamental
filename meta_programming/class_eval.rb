# Evaluate a block in the context of a class
# Similar to re-opening a class but more flexible in that it
# works on any variable that references a class, where as re-opening
# a class requires defining a constant.

# Classic class re-opening style
class String
  def m; puts "hello!" end
end

# Class eval style
# The extra code is used to make the example a bit more re-usable/abstracted
def add_method_to_class(the_class)
  the_class.class_eval do
    def m; puts "hello!" end
  end
end

add_method_to_class String
"abc".m # => hello!