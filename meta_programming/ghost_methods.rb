# Ghost Methods
# Utilises `method_missing`
class Hai
  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(', ')})"
    puts "You also passed a block" if block_given?
  end
end
Hai.new.yolo # => You called: yolo()
Hai.new.yolo "a", 123, :c # => You called: yolo(a, 123, c)
Hai.new.yolo(:a, :b, :c) { puts "a block" } # => You called: yolo(a, b, c)
# => You also passed a block