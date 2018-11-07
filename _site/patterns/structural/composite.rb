# In software engineering, the composite pattern is a partitioning design
# pattern. The composite pattern describes that a group of objects is to be
# treated in the same way as a single instance of an object. The intent of a
# composite is to "compose" objects into tree structures to represent part-whole
# hierarchies. Implementing the composite pattern lets clients treat individual
# objects and compositions uniformly

# Tasks witch are used in composition
class MonsterTask
  attr_reader :reward

  def initialize
    @reward = 100
  end
end

class PuzzleTask
  attr_reader :reward

  def initialize
    @reward = 200
  end
end

# Composer
class Quest
  def initialize
    # Here we use Array as example of data structure for composition. Always is used Tree
    @tasks = []
  end

  def <<(task)
    @tasks << task
  end

  def reward
    @tasks.inject(0) { |sum, task| sum += task.reward }
  end
end

# Usage
quest = Quest.new
quest << MonsterTask.new
quest << PuzzleTask.new
puts quest.reward # => 300
