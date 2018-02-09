# Define the skeleton of an algorithm in an operation, deferring some steps to
# subclasses. Template method lets subclasses redefine certain steps of an
# algorithm without changing the algorithm's structure.

module Template
  # mandatory_methods = ["tagname", "content"]
  # optional_methods = ["font_size", "background_color"]

  def generate
    string = "<#{tagname}"
    styles = ''
    styles += "font-size:#{font_size};" if respond_to? :font_size
    styles += "background-color:#{background_color};" if respond_to? :background_color
    string += " style='#{styles}'" unless styles.empty?
    string += ">#{content}</#{tagname}>"
    end
end

class Body
  def tagname
    'body'
  end

  def content
    'hello'
  end

  def font_size
    '18pt'
  end

  include Template
end

# Usage
body = Body.new
body.generate
