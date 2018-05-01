# coding: utf-8
# Bang marks method as dangerous.  Why?  Often, may modify receiver, vs
# non-modding non-bang version. DO NOT RELY ON THEM RETURNING SAME VALUE AS
# NON-BANG VERSION! Many return nil if no change needed!

str = "foo"
str.upcase
# => ”FOO”

str
# => ”foo”

str.upcase!
# => ”FOO”

str
# => ”FOO”
# Now that it’s already FOO:

str.upcase!
# => nil  # ?!

str
# => ”FOO”
