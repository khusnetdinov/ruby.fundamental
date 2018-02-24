# In Ruby, throw and catch are NOT for exceptions!
# They are advanced flow control, to exit deep nesting.
# Ruby uses raise and rescue for exceptions.
# /* JAVA: */
try {
  throw new MyException("blah");
} catch(MyException e) {
  fix_it();
}

# RUBY:
index = catch(:idx) {
  arr.each_with_index do |v, i|
    throw :idx, i if v == target
  end
  -1
}

begin
  raise MyException.new "blah"
rescue MyException => e
  fix_it
end
