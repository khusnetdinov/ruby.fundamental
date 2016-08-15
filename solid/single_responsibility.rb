# The Single Responsibility Principle is the most abstract of the bunch. It helps keep classes and methods small and maintainable. In addition to keeping classes small and focused it also makes them easier to understand.

# While we all agree that focusing on a single responsibility is important, it’s difficult to determine what a class’s responsibility is. Generally, it is said that anything that gives a class a reason to change can be viewed as a responsibility. By change I am talking about structural changes to the class itself (as in modifying the code in the class’s file, not the object’s in-memory state).
# In the below class we have a single command interface that processes commission payments for deals. At first glance the class seems simple enough, but let’s look at reasons we might want to change this class. Any change in how we calculate commissions would require a change to this class. We could introduce new commission rules or strategies that would cause our calculate_commission method to change. For instance, we might want to vary the percentage based on deal amount. Any change in the steps required to mark a deal as processed in the mark_deal_processed method would result in a change in the file as well. An example of this might be adding support for sending an email summary of a specific person’s commissions after marking a deal processed. The fact that we can identify multiple reasons to change signals a violation of the Single Responsibility Principle.

class DealProcessor
  attr_reader :deals

  def initialize(deals)
    @deals = deals
  end

  def process
    deals.each do |deal|
      # Here we calculate commission and create instance of Commission
      Commission.create(deal: deal, amount: calculate_commission(deal))
      mark_deal_processed
    end
  end

  private

  def mark_deal_processed
    # Implementation
  end

  def calculate_commission(deal)
    deal.amount * 0.05
  end
end

class Commission
  # Implementation
end

# Solution

class DealProcessor
  attr_reader :deals

  def initialize(deals)
    @deals = deals
  end

  def process
    deals.each do |deal|
      # Now we call calculator in one operation, all logic now in it
      CommissionCalculator.create_commission(deal) if mark_deal_processed
    end
  end

  private

  def mark_deal_processed
    # Implementation
  end
end

class CommissionCalculator
  def self.create_commission(deal)
    Commission.new(deal: deal, amount: calculate(deal))
  end

  private

  def self.calculate(deal)
    deal.amount * 0.05
  end
end

class Commission
  # Implementation
end

