# An adapter helps two incompatible interfaces to work together. This is the
# real world definition for an adapter. Interfaces may be incompatible but the
# inner functionality should suit the need. The Adapter design pattern allows
# otherwise incompatible classes to work together by converting the interface
# of one class into an interface expected by the clients.

class Adaptee
  def walk
    'walk_as_adaptee'
  end
end

class Adaptor
  attr_reader :adaptee

  def initialize
    @adaptee = Adaptee.new
  end

  def walk
    adaptee.walk + ' and_sing_song_as_adaptor'
  end
end

# Usage

adaptor = Adaptor.new
adaptor.walk # => walk_as_adaptor and_sing_song_as_adaptor
