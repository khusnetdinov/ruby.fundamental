type = "baz"
Foo::Bar.const_get(type.capitalize).new
# => new instance of Foo::Bar::Baz