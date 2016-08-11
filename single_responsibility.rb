# Read first https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)
# Parts of code were taken from https://robots.thoughtbot.com/back-to-basics-solid

# Single Responsibility Principle
# Hint: The Single Responsibility Principle is the most abstract of the bunch. It helps keep classes and methods small and maintainable. In addition to keeping classes small and focused it also makes them easier to understand.

class DealProcessor
  # Create instance with collection deals should be processed
  def initialize(deals)
    @deals = deals
  end

  # Process each deal
  # Pass calculated commision and deal and create comiision instance
  def process
    @deals.each do |deal|
      Commission.create(deal: deal, amount: calculate_commission)
      mark_deal_processed
    end
  end

  private
  def mark_deal_processed
    # Implementation
  end

  def calculate_commission
    @deal.dollar_amount * 0.05
  end
end

# DealProcessor means Hey I process deal and I don't wan't to do any think.
# Calculate commission method breaks this idea. Just take out it.

class DealProcessor
  # Create instance with collection deals should be processed
  def initialize(deals)
    @deals = deals
  end

  # Process each deal
  # Now we call Class that calculate commision and create commision instance
  # If commision created and marked processed return it
  def process
    @deals.each do |deal|
      commision = CommisionCalcilator.crate_comission(deal)
      commision if mark_deal_processed
    end
  end

  private
  def mark_deal_processed
    # Implementation
  end
end

class CommisionCalculator
  # Now we get deal and calculate amount of commision and return object with it
  def self.create_commision(deal)
    Commision.new(deal: deal, amount: calculate(deal))
  end

  private
  def self.calculate(deal)
    deal.dollar_amount * 0.05
  end
end

