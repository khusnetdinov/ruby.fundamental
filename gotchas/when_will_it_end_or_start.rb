# In "standard" regexps:
# ^ is start and $ is end...
# of the whole string.
# Ruby’s regexes default to multiline, so:
# ^ is start and $ is end...
# of any line!
# \A is start and \Z is end of the whole string.  (Or \z to include any newline… which is another gotcha!)

str = "One\nTwo\nThree"

str =~ /^Two$/
# => 4

str =~ /\ATwo\Z/
# => nil

str =~ /\AOne/
# => 0

str =~ /Three\Z/
# => 8 
