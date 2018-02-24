# Ruby can be surprising!
# Though "engineered to maximize programmer happiness", with the "principle of least surprise", Ruby still has gotchas.
# This presentation will proceed from newbie trivial gotchas, to more advanced and confusing gotchas.

We = 2
class Fixnum
  def rb; self; end
end

We <3 .rb
# => true

But = 3
still = 1
perfect = 4

But - still .rb < perfect
# => true
