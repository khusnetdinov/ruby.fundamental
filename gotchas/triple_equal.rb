# Effectively:
# === is "case equality", as in case statements.  A better name (IMHO) might be
# ".describes?", or overload ".includes?"! Again, it's actually much hairier; see
# the docs on class Object. Gets people from languages where === is either object
# identity or same value and class.

1 === 1
# => true

Fixnum === 1
# => true

1 === Fixnum
# => false

Class  === Class
Object === Object
Class  === Object
Object === Class
# => all true

Fixnum === Fixnum
# => false 

(1..3) === 2
# => true

2 === (1..3)
# => false 
