# (Initial uppercase means constant, in Ruby.) Try to change a constant. Ooooh,
# you get a WARNING!  BFD.

FOO = 5
# => 5

FOO = 7
# (irb):3: warning: already initialized constant FOO
# => 7

FOO
# => 7

# Even freezing doesn't work for Fixnums. It does work for arrays (sort of) and
# most other objects ... he said foreshadowingly.

FOO
# => 7

FOO.freeze
# => 7

FOO += 2
# (irb):5: warning: already initialized constant FOO
# => 9

FOO
# => 9
