# Fundamental programming with ruby examples

This is repo keeps examples with description modern principles, patterns.

## Solid
###SRP - Single responsibility principle
A class should have only a single responsibility.
 
Every class should have a single responsibility, and that responsibility should be entirely encapsulated.
All its services should be narrowly aligned with that responsibility, this embrace the high cohesion.

[See example] (https://github.com/evncom/ruby.fundamental/blob/master/solid/single_responsibility.rb)
     
###OCP - Open/closed principle
Software entities should be open for extension, but closed for modification.
That is, such an entity can allow its behaviour to be extended without modifying its source code.

[See example] (https://github.com/evncom/ruby.fundamental/blob/master/solid/open_close.rb)
 
###LSP - Liskov substitution principle
Objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program.

It states that, in a computer program, if S is a subtype of T, then objects of type T may be replaced with objects of type S (i.e., objects of type S may substitute objects of type T) without altering any of the desirable properties of that program (correctness, task performed, etc.)

[See example] (https://github.com/evncom/ruby.fundamental/blob/master/solid/liskov_substitution.rb)

###ISP - Interface segregation principle
Many client-specific interfaces are better than one general-purpose interface.

States that no client should be forced to depend on methods it does not use.
ISP splits interfaces which are very large into smaller and more specific ones so that clients will only have to know about the methods that are of interest to them. Such shrunken interfaces are also called role interfaces. 
ISP is intended to keep a system decoupled and thus easier to refactor, change, and redeploy.

[See example] (https://github.com/evncom/ruby.fundamental/blob/master/solid/interface_segregation.rb)

###DIP - Dependency inversion principle
One should Depend upon Abstractions, Do not depend upon concretions.

Refers to a specific form of decoupling software modules. When following this principle, the conventional dependency relationships established from high-level, policy-setting modules to low-level, dependency modules are inverted (i.e. reversed), thus rendering high-level modules independent of the low-level module implementation details. 

> Code and articles ware taken from this resources:

* [https://gist.github.com/khusnetdinov/9d8f50fdcaab197871b31578f2e14d5d] (https://gist.github.com/khusnetdinov/9d8f50fdcaab197871b31578f2e14d5d) 

* [https://robots.thoughtbot.com/back-to-basics-solid] (https://robots.thoughtbot.com/back-to-basics-solid) 

* [https://subvisual.co/blog/posts/19-solid-principles-in-ruby] (https://subvisual.co/blog/posts/19-solid-principles-in-ruby) 

* [http://blog.siyelo.com/solid-principles-in-ruby/] (http://blog.siyelo.com/solid-principles-in-ruby/)

## Threads

Todo
