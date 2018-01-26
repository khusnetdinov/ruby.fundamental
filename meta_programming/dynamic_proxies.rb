# Dynamic Proxies
# Catching "Ghost Methods" and forwarding them onto another method
# Whilst possibly adding logic around the call.
#
# For example,
# You can provide imaginary methods by utilising `method_missing` to parse
# the incoming message (e.g. `get_name`, `get_age`) and to delegate off to
# another method such as `get(:data_type)` where `:data_type` is `:name` or `:age`.
def method_missing(message, *args, &block)
  return get(Regexp.last_match(1).to_sym, *args, &block) if message.to_s.match?(/^get_(.*)/)
  super # if we don't find a match then we'll call the top level `BasicObject#method_missing`
end

# If (after analysis) you discover a performance issue with using `method_missing`
# you can utilise the "Dynamic Method" technique to create a real method after
# the message has been received by `method_missing` the first time.
