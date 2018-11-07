# Only two things are false (falsey): false, and nil. Everything else is true
# (truthy), even 0 (false in C), "" (false in JS), [], etc. (Trips up people
# from C, JS, etc. where some of these are false.)

true    ? "true" : "false"
# => "true"

false   ? "true" : "false"
# => "false"

nil     ? "true" : "false"
# => "false"

1       ? "true" : "false"
# => "true"

0       ? "true" : "false"
# => "true"

"false" ? "true" : "false"
# => "true"

""      ? "true" : "false"
# => "true"

[]      ? "true" : "false"
# => "true"
