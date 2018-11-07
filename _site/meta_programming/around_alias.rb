# Around Alias uses the `alias` keyword to store a copy of the original method under a new name,
# allowing you to redefine the original method name and to delegate off to the previous method implementation

class String
  alias orig_length length

  def length
    "Length of string '#{self}' is: #{orig_length}"
  end
end

'abc'.length
#=> "Length of string 'abc' is: 3"
