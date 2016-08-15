# The Open/Closed Principle states that classes or methods should be open for extension, but closed for modification. This tells us we should strive for modular designs that make it possible for us to change the behavior of the system without making modifications to the classes themselves. This is generally achieved through the use of patterns such as the strategy pattern.

# In the below example we can see that we’ll have to modify our file parser anytime we add a client that reports usage information to us in a different file format. This violates the Open/Closed Principle.

class FileParser
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def parse
    # If we want add new parser we must to edit this method and in private method
    case file.format
    when :xml
      parse_xml
    when :cvs
      parse_cvs
    # when :json
    #  parse_json
    else
      # Implementation
    end

  end

  private

  def parse_xml
    # Implementation
  end

  def parse_cvs
    # Implementation
  end

  # New parse method
  # def parse_json
  #  # Implementation
  # end
end

# Solution

# With this refactor we’ve made it possible to add new parsers without changing any code. Any additional behavior will only require the addition of a new handler. This makes our FileParser reusable and in many cases will keep us in compliance with the Single Responsibility Principle as well by encouraging us to create smaller more focused classes.

class FileParser
  attr_reader :parser

  def initialize(parser)
    @parser = parser
  end

  def parse(file)
    # Now if we want new parser just write new Class and pass it to method
    Data.new(parser.parse file)
  end
end

class JsonParser
  # We write new class for extension solution.
  def self.parse(file)
    # Implementation
  end
end

class XmlParser
  def self.parse(file)
    # Implementation
  end
end

class CvsParser
  def self.parse(file)
  # Implementation
  end
end
