
class Y
  def a
    x
  end

  private

  def x
    puts 'hi'
  end
end
# Y.new.a
# Running this produces the following error:
# a.rb:3:in a': private method x' called for #<Y:0x7f819a82d548> (NoMethodError)
#    from a.rb:11
# I wasn't immediately able to figure out what was wrong with this code and since access control is one of those
# fundamental things that you should know, if you want to be a decent Ruby developer, I decided to dig a little further
# to figure it out. Here is the scoop.
# ###Private, Protected and Public – Ruby Method Visibility
# The concept of private, protected and public methods in Ruby is somewhat different than it is in languages like Java
# (well, not so much public, that's very similar :)). In Java if a method is declared private, it can only be accessed
# from other methods in the same class. When a method is declared protected it can be accessed by other classes in the
# same package as well as by subclasses of its class in a different package. When a method is public it is – of course
# – always visible to everyone. So, in essence with Java, these keywords protect the various members from access by
# classes, depending on where these classes are in the inheritance/package hierarchy.
# In Ruby, the inheritance hierarchy or the package/module don't really enter into the equation, it is rather all about which object is the receiver of a particular method call. When a method is declared private in Ruby, it means this method can never be called with an explicit receiver. Any time we're able to call a private method with an implicit receiver it will always succeed. This means we can call a private method from within a class it is declared in as well as all subclasses of this class e.g.
class A
  def main_method
    method1
  end

  private

  def method1
    puts "hello from #{self.class}"
  end
end

class B < A
  def main_method
    method1
  end
end
# A.new.main_method
# B.new.main_method
# alan@alan-ubuntu-vm:~/tmp$ ruby a.rb
# hello from A
# hello from B
# However, as soon as we try to use an explicit receiver, even if the receiver is "self", the method call will fail e.g.
class C < A
  def main_method
    method1
  end
end
# C.new.main_method
# alan@alan-ubuntu-vm:~/tmp$ ruby a.rb
# a.rb:36:in `main_method': private method `method1' called for #<C:0x7f67025a0648> (NoMethodError)
#    from a.rb:40
# Do you recognise the error? This was the answer to the quiz that Chad ran. We were trying to call a private method
# with an explicit receiver and even though we were doing it from within the class where our private method was defined,
# it would still fail for that reason. And of course, since you can't call a private method with an explicit receiver,
# you can never call it from outside the class hierarchy where it was defined.
# Protected methods are also a little different. You can always call a protected method with an implicit receiver, just
# like private, but in addition you can call a protected method with an explicit receiver as long as this receiver is
# self or an object of the same class as self. Let's modify our example above and make the method protected:
class A
  def main_method
    method1
  end

  protected

  def method1
    puts "hello from #{self.class}"
  end
end

class B < A
  def main_method
    method1
  end
end

class C < A
  def main_method
    method1
  end
end
# alan@alan-ubuntu-vm:~/tmp$ ruby a.rb
# hello from A
# hello from B
# hello from C
# Now, the call with the implicit receiver in class B succeeds (as before) but the call with the explicit receiver in
# class C also succeeds (unlike when method1 was private). Furthermore, doing the following is also fine:
class D < A
  def main_method
    B.new.method1
  end
end
D.new.main_method
# alan@alan-ubuntu-vm:~/tmp$ ruby a.rb
# hello from B
# Everything works because B.new is the same type of object as self and so the call to method1 succeeds. If however we
# make class D NOT inherit from A, we get the following:
class D
  def main_method
    B.new.method1
  end
end
D.new.main_method
# alan@alan-ubuntu-vm:~/tmp$ ruby a.rb
# a.rb:39:in `main_method': protected method `method1' called for #<B:0x7fe81d00efa8> (NoMethodError)
#    from a.rb:46
# In this case B.new is no longer the same type of object as self and so trying to call a protected method with B.new
# as the receiver – fails. So, I guess the inheritance hierarchy does actually play a role when it comes to access
# control in Ruby, it's just not as big a role as it is in a language like Java.
# Public methods are – of course – accessible with any kind of explicit or implicit receiver from anywhere
# (as the name implies).
# ###It Is All Just A Guideline Anyway
# What if we don't want to obey these access rules? For example, what if I want to test my private method? This is
# reasonably easy to do in Ruby, you simply need to "call" your private method using "send" (I will cover the use of
# "send" in more detail in a subsequent post I am planning to do, on passing methods as arguments in Ruby).
# For example, let's modify our original example as follows:
class A
  private

  def method1
    puts "hello from #{self.class}"
  end
end
A.new.send(:method1)
# alan@alan-ubuntu-vm:~/tmp$ ruby a.rb
# hello from A
# That was just way too easy! It works fine in both Ruby 1.8 and 1.9, it was supposed to disappear in 1.9 but it hasn't
# yet. However even if it does, we can always simply define a public method on the object in question which delegates
# to the private one or redefine our private methods as public and then change them back again when we're done.
# Testing private methods is often frowned upon since we're breaking encapsulation and not testing through the interface.
# However, I do believe that sometimes, it simply makes sense to test private method separately, especially if they are
# used by multiple public methods. You can then simply mock out the private method when testing the public API rather
# than having to indirectly test its functionality over and over again. I think it makes for a better and more terse
# set of tests, which I think is smarter in a TDD context.
