# Blank Slate
# Prevents issues when using "Dynamic Proxies"
#
# e.g. user calls a method that exists higher up the inheritance chain
# so your `method_missing` doesn't fire because the method does exist.
#
# To work around this issue, make sure your class starts with a "Blank Slate"
# So you remove any methods you don't want to appear at all in the inheritance chain
# by using `undef_method` (there is also `remove_method` which doesn't remove the named
# method from the inheritance chain but just the current class, but that doesn't help us
# fix the "Dynamic Proxy" scenario so we use `undef_method` instead).
#
# For "Dynamic Proxy" we use the parent `method_missing` so we keep that,
# we also might use `respond_to?` so we keep that (although you can remove it if you don't).
# Also the `__` in the below regex pattern is to prevent Ruby from displaying a warning
# about removing 'reserved' methods such as `__id__` and `__send__`
class ImBlank
  instance_methods.each do |m|
    undef_method m unless m.to_s.match?(/^__|method_missing|respond_to?/)
  end

  # rest of your code (such as your "Dynamic Proxy" implementation)
end
