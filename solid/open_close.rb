# Read first https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)
# Parts of code were taken from https://robots.thoughtbot.com/back-to-basics-solid

# Open / Close Principle
# Hint: The Open/Closed Principle states that classes or methods should be open for extension, but closed for modification.

class FileParser
  # Create instance with file with we are going to parse
  def initialize(file)
    @file = file
  end

  # Now we check format of file and use suitable method
  def parse
    case @file.format
    when :xml
      parse_xml
    when :cvs
      parce_cvs
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
end

# parser = FileParser data.xml
# data = parser.parse

# FileParser check format of file and call suitable method for this file.
# But what if we want to add new couple formats?
# We must to modify this class and it breakes open close principle

class FileParcer
  # Crate instance with parser
  def initialize(parser)
    @parser = parser
  end

  def parse(file)
    Data.new(@parser.parce file)
  end
end

class XmlParser
  def self.parse(file)
    # Implementation
  end
end

class CvsParser
  # Implementation
end

# Now we use it right
# In this example we don't create instance just pass class, but we can also create xml parser instance and pass it to parser

# xml_parser = FileParcer(XmlParser)
# parser.parse file

# Now if we want to pass new data type we just create new parcer and pass it to FileParser class
