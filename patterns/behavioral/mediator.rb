# The essence of the Mediator Pattern is to "define an object that encapsulates
# how a set of objects interact". It promotes loose coupling by keeping objects
# from referring to each other explicitly, and it allows their interaction to be
# varied independently. Client classes can use the mediator to send messages to
# other clients, and can receive messages from other clients via an event on the
# mediator class.

# Classes witch interact with mediator
class Buyer
  attr_accessor :balance

  def initialize(balance)
    @balance = balance
  end

  def use_agency_for_buying_house(agency)
    @agency = agency
  end

  def buy(house)
    @agency.purchase(house, self)
  end
end

class Seller
  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def use_agency_for_selling_house(agency, house)
    agency.register house
  end
end

class House
  attr_reader :price, :owner

  def initialize(price, owner)
    @price = price
    @owner = owner
  end

  def new_owner(buyer)
    @owner = buyer
  end
end

# Mediator class
class Agency
  def initialize
    @houses = []
  end

  def register(house)
    @houses << house
  end

  def purchase(house, buyer)
    if can_make_deal? house, buyer
      make_payment house, buyer
      change_owner house, buyer
    end
  end

  private

  def can_make_deal?(house, buyer)
    @houses.include?(house) && buyer.balance >= house.price
  end

  def make_payment(house, buyer)
    house.owner.balance += house.price
    buyer.balance -= house.price
  end

  def change_owner(house, buyer)
    house.new_owner buyer
  end
end

# Usage
buyer = Buyer.new(1000)

seller = Seller.new(0)
house = House.new(100, seller)

agency = Agency.new
buyer.use_agency_for_buying_house agency
seller.use_agency_for_selling_house agency, house

buyer.buy house

puts house.inspect
