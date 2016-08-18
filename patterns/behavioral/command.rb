# The command pattern is a behavior design pattern used to store the information
# necessary to call methods at a future time.

# The command is merely a set of actions wrapped in an object. With ruby, we can
# use Procs to do the same thing without the need to create a separate object.
# This is a good option when the action is simple and doesn't require saving
# state information, otherwise, a command class is the better option.

# Invoker
class Switch
  attr_reader :history

  def execute(cmd)
    @history ||= []
    @history << cmd.execute
  end
end

# Command Interface
class Command
  attr_reader :obj

  def initialize(obj)
    @obj = obj
  end

  def execute
    raise NotImplementedError
  end
end

# Command for turning on
class TurnOnCommand < Command
  def execute
    obj.turn_on
  end
end

# Command for turning off
class TurnOffCommand < Command
  def execute
    obj.turn_off
  end
end

# Receiver
class Light
  def turn_on
    'the light is on'
  end

  def turn_off
    'the light is off'
  end
end

# Client
class LightSwitchClient
  attr_reader :switch

  def initialize
    @lamp = Light.new
    @switch = Switch.new
  end

  def switch_for(cmd)
    case cmd
    when 'on'  then @switch.execute(TurnOnCommand.new(@lamp))
    when 'off' then @switch.execute(TurnOffCommand.new(@lamp))
    else puts 'Sorry, I so sorry'
    end
  end
end

client = LightSwitchClient.new
client.switch_for('on')
client.switch_for('off')
client.switch.history #=> ['the light is on', 'the light is off']
