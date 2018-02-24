bash> irb-1.8
str = "string"
# => "string"
str[2]
# => 114
# ??? ascii code!
str[2..2]
# => "r"
# that's better!
str[2,1]
# => "r"
# works too....
bash> irb-1.9
str = "string"
# => "string"
str[2]
# => "r"
# makes sense *now*
