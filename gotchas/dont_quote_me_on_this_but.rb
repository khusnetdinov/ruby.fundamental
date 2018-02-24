# String interpolation (including special chars like \n) fails with 'single' quotes -- it requires "double" quotes.
# (Just like in most languages with string interpolation.)
# To avoid: use doubles whenever practical.

x = 3

puts 'x = #{x}\nx'
x = #{x}\nx

puts "x = #{x}\nx"
x = 3
x
