# Fibers are primitives for implementing light weight cooperative concurrency in Ruby. Basically they are a means of creating code blocks that can be paused and resumed, much like threads. The main difference is that they are never preempted and that the scheduling must be done by the programmer and not the VM.

require 'fiber'

f = Fiber.new do |value|
  first = value
  puts "first call fiber with args: #{first ? first : 'not passed'}"
  second = Fiber.yield
  puts "second call fiber with args: #{second ? second : 'not passed'}"
  other = Fiber.yield
  puts "First: #{first}, Second: #{second}, Other: #{other ? other : 'not passed'}"
  puts "Last call"
end

f.resume('First argument')
f.resume('Second argument')
f.resume
# f.resume call error if try call one more time fiber is dead