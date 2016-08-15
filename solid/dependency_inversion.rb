# The Dependency Inversion Principle has to do with high-level (think business logic) objects not depending on low-level (think database querying and IO) implementation details. This can be achieved with duck typing and the Dependency Inversion Principle. Often this pattern is used to achieve the Open/Closed Principle that we discussed above. In fact, we can even reuse that same example as a demonstration of this principle.

# Now there is a formatter class, but I've hardcoded it on the Report class, thus creating a dependency from the Report to the JSONFormatter. Since the Report is a more abstract (high-level) concept than the JSONFormatter, we're effectively breaking the DIP.

class Report
  def body
    # Implementation
  end

  def print
    JSONFormatter.new.format(body)
  end
end

class JSONFormatter
  def format(body)
    # Implementation
  end
end

# Solution

# This way the Report does not depend on the JSONFormatter and can use any type of formatter that has a method called format (this is known as duck typing).
# Another thing of note is that we've used, once again, dependency injection to solve a problem. This technique is a very powerful one when our goal is decoupling objects, and even though it has the same initials as the dependency inversion principle (vs dependency injection pattern), they are completely different concepts.

class Report
  def body
    # Implementation
  end

  def print(formatter: JSONFormatter.new)
    formatter.format body
  end
end