# Allow an object to alter its behavior when its internal state changes.
# The object will appear to change its class.

# Each call to state defines a new subclass of Connection that is stored in a
# hash. Then, a call to transition_to instantiates one of these subclasses and
# sets it to the be the active state. Method calls to Connection are delegated
# to the active state object via method_missing

module StatePattern
  class UnknownStateException < RuntimeError
  end

  def self.included(base)
    base.extend StatePattern::ClassMethods
  end

  module ClassMethods
    attr_reader :state_classes

    def state(state_name, &block)
      @state_classes ||= {}

      new_klass = Class.new(self, &block)
      new_klass.class_eval do
        alias_method :__old_init, :initialize

        def initialize(context, *args, &block)
          @context = context
          __old_init(*args, &block)
        end
      end

      @state_classes[state_name] = new_klass
    end
  end

  attr_accessor :current_state, :current_state_obj

  def transition_to(state_name, *args, &block)
    new_context = @context || self
    klass = new_context.class.state_classes[state_name]
    if klass
      new_context.current_state = state_name
      new_context.current_state_obj = klass.new(new_context, *args, &block)
    else
      raise UnknownStateException, "tried to transition to unknown state,#{state_name}"
    end
  end

  def method_missing(method, *args, &block)
    transition_to :initial unless @current_state_obj

    if @current_state_obj
      @current_state_obj.send(method, *args, &block)
    else
      super
    end
  end
end

class Connection
  include StatePattern

  # you always need a state named initial
  state :initial do
    def connect
      # move to state :connected. all other args to transition_to# are passed
      # to the new state's constructor transition_to:connected, "hello from
      # initial state"
      puts 'connected'
    end

    def disconnect
      puts 'not connected yet'
      end
  end

  state :connected do
    def initialize(msg)
      puts "initialize got msg:#{msg}"
    end

    def connect
      puts 'already connected'
    end

    def disconnect
      puts 'disconnecting'
      transition_to :initial
    end
  end

  def reset
    # you can also change the state from outside of the state objects
    # transition_to:initial
    puts 'resetting outside a state'
  end
end

# Usage
c = Connection.new
c.disconnect        # => not connected yet
c.connect           # => connected, initialize got msg: hello from initial state
c.connect           # => already connected
c.disconnect        # => disconnecting
c.connect           # => connected, initialize got msg: hello from initial state
c.reset             # => reseting outside a state
c.disconnect        # => not connected yet
