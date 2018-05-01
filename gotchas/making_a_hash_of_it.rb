# coding: utf-8
# Mostly same problem (and solution) as Arrays. MORE GOTCHAS: creates new object
# on any access to empty slot! May create excessive number of new objects; ruins
# checking “real” contents or count (nil-checking, .size, etc.).

langs = Hash.new []
langs[:jane] << "Java"
langs[:rachel] << "Ruby"

langs[:jane]
# => ["Java", "Ruby"]

langs[:rachel]
# => ["Java", "Ruby"]

langs = Hash.new { |h, k| h[k] = [] }
langs[:jane] << "Java"
langs[:rachel] << "Ruby"

langs[:jane]
# => ["Java"]

langs[:rachel]
# => ["Ruby"]
