# Symbols != strings.
# Even if the same when printed.
# Remember which one to use for what (args).
# Ideally, take either, and use what a method expects: "Be liberal in what you accept, and conservative in what you send."  (Postel's Law)

str = "string"
sym = :string
puts str
string
puts sym
string
str == sym
# => false
