#SOLID Principles with ruby examples

##SRP - Single responsibility principle A class should have only a single responsibility.

Every class should have a single responsibility, and that responsibility should be entirely encapsulated. All its services should be narrowly aligned with that responsibility, this embrace the high cohesion.

##OCP - Open/closed principle Software entities should be open for extension, but closed for modification. That is, such an entity can allow its behaviour to be extended without modifying its source code.

##LSP - Liskov substitution principle Objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program.

It states that, in a computer program, if S is a subtype of T, then objects of type T may be replaced with objects of type S (i.e., objects of type S may substitute objects of type T) without altering any of the desirable properties of that program (correctness, task performed, etc.)

##ISP - Interface segregation principle Many client-specific interfaces are better than one general-purpose interface.

States that no client should be forced to depend on methods it does not use. ISP splits interfaces which are very large into smaller and more specific ones so that clients will only have to know about the methods that are of interest to them. Such shrunken interfaces are also called role interfaces. ISP is intended to keep a system decoupled and thus easier to refactor, change, and redeploy.

##DIP - Dependency inversion principle One should Depend upon Abstractions, Do not depend upon concretions.

Refers to a specific form of decoupling software modules. When following this principle, the conventional dependency relationships established from high-level, policy-setting modules to low-level, dependency modules are inverted (i.e. reversed), thus rendering high-level modules independent of the low-level module implementation details.

#Ruby Examples
[https://practicingruby.com/articles/solid-design-principles] (https://practicingruby.com/articles/solid-design-principles)

[https://speakerdeck.com/anildigital/solid-design-principles-in-ruby] (https://speakerdeck.com/anildigital/solid-design-principles-in-ruby)

[http://code.tutsplus.com/courses/ood-in-ruby-solid-principles] (http://code.tutsplus.com/courses/ood-in-ruby-solid-principles)

[http://blog.groupbuddies.com/posts/19-solid-principles-in-ruby] (http://blog.groupbuddies.com/posts/19-solid-principles-in-ruby)

#Resources [http://en.wikipedia.org/wiki/SOLID_%28object-oriented_design%29] (http://en.wikipedia.org/wiki/SOLID_%28object-oriented_design%29)