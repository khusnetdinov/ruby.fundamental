# coding: utf-8
# Private methods
# Remember how we said that instance variables store data that is “private” to the
# object? Instance variables are only made accessible to the outside world (we say
# “it is exposed”) if we add attribute accessors to the class. In the same way
# classes sometimes want to keep certain methods private: methods that aren’t
# supposed to be called from outside of the object. Only the object itself is
# supposed to use them internally, from other methods. Imagine I am an instance
# of a class ItalianRestaurant, and I have a method pizza, which is supposed to
# return an instance of the class Pizza. When you approach me, and call the
# method pizza (i.e. ask me to bring a pizza) then I’ll know what to do, and how
# to do it. I’ll get some prepared pizza dough from somewhere, some tomato sauce,
# vegetables and other stuff from somewhere else, prepare the pizza, bake it, put
# it on a nice plate, and finally give (return) it to you. However, you don’t
# really care about any of these details. You are hungry, and just want the pizza.
# All the exact steps involved are something that I keep private to me, and maybe
# they’ve been our family’s best kept secret for generations. This is pretty much
# how objects work, too. The Italian restaurant object exposes some stuff to the
# outer world (you), and keeps other things private. They’ll let you order a pizza,
# and other things. But they won’t tell you the exact ingredients of their tomato
# sauce, or how they manage to make this damn great pizza dough. In our Person
# example it makes sense to make the method encrypt private. Currently, if you
# run the following code it will execute just fine, even though it makes little
# sense:

person = Person.new('Ada')
person.encrypt('some other secret')

# Why would a person encrypt some arbitrary string for someone else, and return
# it? This is something that the person object should keep private. The restaurant
# wouldn’t turn flour, water, olive oil and other ingredients into pizza dough for
# everyone else either. We can make the method encrypt private like so:

module Encryption
  private

  def encrypt(string)
    Digest::SHA2.hexdigest(string)
  end
end

# The keyword private tells Ruby that all methods defined from now on, are
# supposed to be private. They can be called from within the object (from other
# methods that the class defines), but not from outside. If you now try to call
# the method it will raise an error:

person = Person.new('Ada')
p person.encrypt('super secret')
# private method `encrypt' called for #<Person:0x007fa179863770 @name="Ada">
