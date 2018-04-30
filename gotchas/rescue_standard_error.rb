# ##Don't rescue Exception, rescue StandardError
# Before
# Explicitly rescuing **Exception** will rescue even not normally recoverable errors such as SyntaxError, LoadError,
# and Interrupt.
begin
  foo
rescue Exception => e
  logger.warn "Unable to foo, will ignore: #{e}"
end
# ##Refactor
# If you omit the **Exception** type qualifier, then Ruby will catch only **StandardError**, which is probably what
# you want:
begin
  foo
rescue StandardError => e
  logger.warn "Unable to foo, will ignore: #{e}"
end
