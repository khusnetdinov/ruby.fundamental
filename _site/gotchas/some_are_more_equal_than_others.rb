# Effectively:
# == is the usual
# (same value)
# .eql? is value and class
# (1 is Fixnum, 1.0 is Float)
# .equal? is same object
# It's actually much hairier;
# see docs on class Object

1 == 1.0
# => true

1.eql? 1.0
# => false

a = "foo"
b = "foo"
a == b
# => true

a.eql? b
# => true

a.equal? b
# => false

a.equal? a
# => true
