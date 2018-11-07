# Lambda's also enforce a closure and so are able to keep their context across
# objects, as demonstrated below:

require 'json'

class Bar
  attr_reader :l

  def initialize(h = {})
    @l = h[:l] || ->(_) { p "no-op"; false }
  end

  def dothing
    result = l.call("Mark")
    p "result = #{ result }"
  end
end

class Foo
  def initialize
    @h = {
      l: ->(name) { p "hello #{ name }"; foo_test }
    }
    @bar = Bar.new(@h) # remove @h to test for defensive behaviour
  end

  def start
    @bar.dothing
  end

  private

  def foo_test
    p "I'm internal to Foo class"
    raise ::JSON::ParserError
    true # never reached due to above line triggering an error
  rescue ::JSON::ParserError
    p "caught an error"
    false
  end
end

foo = Foo.new
foo.start

# => "hello Mark"
# => "I'm internal to Foo class"
# => "caught an error"
# => "result = false"
