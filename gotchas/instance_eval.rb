# ##instance_eval with access to outside scope
# In Ruby, it’s always been a minor annoyance to me that when you’re working with DSL code, you have to choose between
# losing access to the surrounding scope (implemented using `instance_eval`), or prefixing every call with a local
# variable (implemented using `yield self`)
# Turns out there is a way to get the best of both. Which works well, almost all the time. And ends in two rather
# unexpected places: one is a really odd error; and the other is CoffeeScript-style function definition/call syntax. Sortof.
# ###The DSL
class DslObject
  def initialize(&block)
    evaluate &block if block_given?
  end

  def evaluate(&block)
    case block.arity
    when 0
      instance_eval &block
    when 1
      yield self
    else
      raise 'Too many args for block'
    end
  end

  def do_something_useful(rhs)
    puts rhs
  end
end
# ###The Problem
# The `instance_eval` vs `yield(self)` issue is well known. So this section is for you if you’re not already clear on that.
# Use `yield self` and you have to prefix every call with a block variable:

class Other
  def surname
    'de la Grace'
  end

  def yld
    DslObject.new do |dsl|
      dsl.do_something_useful surname
    end
  end
end
# Other.new.yld
de la Grace
#=> #<DslObject:0x9fa554c>
# but prefixing every call with a local variable becomes painful in some cases, for example all the `t.`
# in an ActiveRecord migration. But in order to make the prefix unnecessary you have to use `instance_eval`, and then
# code inside the block can’t access methods defined outside the block:

class Other
  def surname
    'de la Grace'
  end

  def inst
    DslObject.new do
      do_something_useful surname
    end
  end
end
# Other.new.inst
#=> undefined local variable or method `surname' for #<DslObject:0x9ea5390> (NameError)
# Which is quite a severe limitation.
# ###The Solution
# Use a delegator that knows about both the binding for the block, and the dsl object, and can send method calls to
# the right place.

class Combinder < BasicObject
  def initialize(obj, saved_binding)
    @obj = obj
    @saved_binding = saved_binding
  end

  def __bound_self__
    @saved_binding.eval('self')
  end

  def method_missing(meth, *args, &blk)
    # methods in dsl object are called in preference to self outside the block
    if @obj.respond_to?(meth)
      # dsl method, so call it
      @obj.send meth, *args, &blk
    else
      __bound_self__.send meth, *args, &blk
    end
  end

  def respond_to_missing?(meth, _include_all)
    __bound_self__.respond_to?(meth) || @obj.respond_to?(meth)
  end
end

class DslObject
  def initialize(&block)
    evaluate &block if block_given?
  end

  def evaluate(&block)
    case block.arity
    when 0
      Combinder.new(self, block.binding).instance_eval &block
    when 1
      yield self
    else
      raise 'Too many args for block'
    end
  end

  def do_something_useful(rhs)
    puts rhs
  end
end

# Now Other.new.inst will work.
# ###The Problem with The Solution
class Oops < Other
  def takes_args(*args)
    args.join('_')
  end

  def inst
    takes_args = 'four_fice'
    DslObject.new do
      do_something_useful surname
      do_something_useful(takes_args % w[one two three])
    end
  end
end
#=> Oops.new.inst
de la Grace
# NoMethodError: undefined method `w' for #<Oops:0xa7ac54c>
# from combinder.rb:16:in `method_missing'
# This is caused by the way the ruby interpreter distinguishes between a method call and a local variable. In this case,
# the local variable `takes_args` is in the binding for the block, so it’s not treated as a method call. And because
# that happens in the interpreter, there’s no way to hook into it and produce a more meaningful error message.
# >Aside: % is being treated as the sprintf shortcut, and w[one two three] is not syntactically correct.
# Unless w one two and three were defined. And I’ve seen another unexpected syntax error in this situation, when passing
# a literal symbol. Because : has other meanings in Ruby.
# Of course, if you said
# takes_args( %w[one two three] )
# it would all work fine because the `(...)` marks `takes_args` as a method call, and there’s no ambiguity with the local
# variable, so it ends up in `Combinder#method_missing`.
# Another workaround is to define methods in `Combinder` like this:

class Combinder
  def __outside__
    __bound_self__
  end

  def __inside__
    # This is a bit harder than __outside__, but can be done
  end
end
# which would allow explicit access to the binding (__outside__) and the dsl object (__inside__), and those could be used
# to resolve ambiguous naming. Squeel has my{ } which similarly gets through the instance_eval block boundary.
# So seeing as there are at least 3 workarounds, my opinion is that the weirdness of the error message is the biggest drawback.
# ###The CoffeeScript connection
# This part I discovered by accident. In Combinder I had some code for accessing the local variables in the binding.
# This code turned out to be unnecessary because ruby already accesses those. But that code sparked off a realisation
# that since a method call can be ‘forced’ using (), it would be possible in Combinder#method_missing to check if there
# was a callable object with that name (ie respond_to?( :call ) == true), and call it. Resulting in something like this:
fn = ->(*args) { puts "fn gives you: #{args.inspect}" }

functionaliser do
  fn(%w[coffee script style])
end

fn gives you: %w[coffee script style]
#=> #<CoffeeDsl:0xdbfe7e0>
# So the block inserts indirection into the resolution of names so that it’s possible to treat Procs as methods. I didn’t
# go any further down that rabbit hole, mainly because right now I don’t have any sensible use cases for something like that.
