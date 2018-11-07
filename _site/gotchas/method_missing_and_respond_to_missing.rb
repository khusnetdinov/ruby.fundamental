# When overriding #method_missing, remember to override #respond_to_missing? as
# well. When you use method_missing to have an object return something on a
# method call, always make sure you also redefine respond_to_missing?. If you
# don't do it, nothing will break at a first glance, but you will run into trouble
# eventually. Consider this class:

class Dog
  def method_missing(method_name, *args, &block)
    if method_name == :bark
      'woof!'
    else
      super
    end
  end

end


Dog.new.bark
# => "woof!"

Dog.new.respond_to? :bark
# => false

# Lots of code (gems or your own) relies on respond_to? (for a good reason).
# You need to patch respond_to_missing? as well:

class Dog
  def method_missing(method_name, *args, &block)
    if method_name == :bark
      'woof!'
    else
      super
    end
  end

  def respond_to_missing?(method_name, *args)
    method_name == :bark or super
  end
end

Dog.new.bark
# => "woof!"

Dog.new.respond_to? :bark
# => true
