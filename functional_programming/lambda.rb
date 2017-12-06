# Definition

say_hello = lambda { |name| puts "Hello #{ name }" }
say_hello = ->(name) { puts "Hello #{ name }" }

# Call

say_hello.call("Mark")
say_hello.("Mark")

