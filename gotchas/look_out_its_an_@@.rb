# What the fillintheblank?  We didn't change Parent’s @@value before checking it, nor Child’s at all!
# Or did we?
# @@ variables are shared with subclasses -- not just that they exist, but the variables themselves!  Declaring Child’s @@value changed Parent’s, and inc’ing Parent’s changed Child’s.
# IMHO, best just forget them.

class Parent
  @@value = 6
  def self.value
    @@value
  end
  def self.inc_value
    @@value += 1
  end
end

class Child < Parent
  @@value = 42
end

Parent.value
# => 42  # wtf?
Parent.inc_value
Child.value
# => 43  # wtf?!
