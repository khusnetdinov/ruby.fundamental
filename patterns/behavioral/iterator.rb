# Provide a way to access the elements of an aggregate object sequentially
# without exposing its underlying representation.

# Iteration entity
class Account
  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end
end

# Collection class
class Bank
  include Enumerable

  def initialize
    @accounts = []
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add(account)
    @accounts << account
  end
end

# Usage
bank = Bank.new
bank.add Account.new(100)
bank.add Account.new(150)
bank.add Account.new(175)

puts bank.map { |account| account.balance }

# Internal iterator
class Collection
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end

  def iterate(&block)
    while has_next?
      block.call(next_item) if block_given?
    end
  end
end

# Usage
collection = Collection.new([1, 2, 3, 4, 5])
collection.iterate { |elem| puts elem }

# External iterator
class Collection
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

# Usage
collection = Collection.new([1, 2, 3, 4, 5])
puts "Item: #{collection.next_item}" while collection.has_next?

