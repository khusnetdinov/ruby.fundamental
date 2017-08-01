# Dynamic Dispatch
# Allows us to send messages
# object.public_send(message, *arguments)
1.public_send(:+, 2) # => 3
# Even private methods
# object.send(message, *arguments)
1.send(:+, 2) # => 3
