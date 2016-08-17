# The decorator design pattern allows for features to be added dynamically to an
# existing object.

class Decorator
  def initialize(item)
    @item = item
  end

  def use
    item.use
  end

  # Dynamic method that added in decorator
  def another_use
    item.use + "another way"
  end
end

class MagicDecorator < Decorator
  def description
    @item.description + "Magic"
  end
end

class MasterpieceDecorator < Decorator
  def description
    @item.description + "Masterpiece"
  end
end

# Class what should be decorated
class Item
  attr_reader :description

  def initialize
    @description = "Item "
  end

  def use
    "use it"
  end
end

# Usage
item = Item.new
puts item.description # => Item

magic_item = MagicDecorator.new(item)
puts magic_item.description # => Item Magic

masterpiece_item = MasterpieceDecorator.new(item)
puts masterpiece_item.description # => Item Masterpiece

# All next lines puts "use it"
item.use
magic_item.use
masterpiece_item.use