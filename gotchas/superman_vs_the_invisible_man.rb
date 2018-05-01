# super with no arg list sends what caller got
# super with explicit args sends those args
# to send NO args, use empty parens: super()

class Parent
  def add *args
    args.inject :+
  end
end

class Child2 < Parent
  def add arg1, arg2
    super arg1, arg2
  end
end

class Child4 < Parent
  def add a1, a2, a3, a4
    super  # no args!
  end
end

Child2.new.add 1, 2, 3, 5
# ArgumentError: wrong number of arguments (4 for 2)

Child2.new.add 1, 2
# => 3

Child4.new.add 1, 2, 3, 5
# => 11
