# This file contains the Ruby code from book of
# "Data Structures and Algorithms
# with Object-Oriented Design Patterns in Ruby"
# by Bruno R. Preiss.
#
# Copyright (c) 2004 by Bruno R. Preiss, P.Eng.  All rights reserved.

class PrePostVisitor < Visitor

  abstractmethod :preVisit

  abstractmethod :inVisit

  abstractmethod :postVisit

  alias_method :visit, :inVisit

end

class PreOrder < PrePostVisitor

  def initialize(visitor)
    super()
    @visitor = visitor
  end

  def preVisit(obj)
    @visitor.visit(obj)
  end

  def inVisit(obj)
  end

  def postVisit(obj)
  end

  def done?
    @visitor.done?
  end

end

class InOrder < PrePostVisitor

  def initialize(visitor)
    super()
    @visitor = visitor
  end

  def preVisit(obj)
  end

  def inVisit(obj)
    @visitor.visit(obj)
  end

  def postVisit(obj)
  end

  def done?
    @visitor.done?
  end
end

class PostOrder < PrePostVisitor

  def initialize(visitor)
    super()
    @visitor = visitor
  end

  def preVisit(obj)
  end

  def inVisit(obj)
  end

  def postVisit(obj)
    @visitor.visit(obj)
  end

  def done?
    @visitor.done?
  end
end

class Tree < Container

  def initialize
    super
  end

  abstractmethod :key

  abstractmethod :getSubtree

  abstractmethod :empty?

  abstractmethod :leaf?

  abstractmethod :degree

  abstractmethod :height


  PREVISIT = -1
  INVISIT = 0
  POSTVISIT = +1

  def depthFirstTraversal(&block)
    if not empty?
      yield (key, PREVISIT)
      for i in 0 ... degree
        getSubtree(i).depthFirstTraversal(&block)
      end
      yield (key, POSTVISIT)
    end
  end

  def depthFirstTraversalAccept(visitor)
    assert { visitor.is_a?(PrePostVisitor) }
    depthFirstTraversal do |obj, mode|
      break if visitor.done?
      case mode
      when PREVISIT
        visitor.preVisit(obj)
      when INVISIT
        visitor.inVisit(obj)
      when POSTVISIT
        visitor.postVisit(obj)
      end
    end
  end

  def breadthFirstTraversal
    queue = QueueAsLinkedList.new
    queue.enqueue(self) if not empty?
    while not queue.empty?
      head = queue.dequeue
      yield head.key
      for i in 0 ... head.degree
        child = head.getSubtree(i)
        queue.enqueue(child) if not child.empty?
      end
    end
  end

  def breadthFirstTraversalAccept(visitor)
    breadthFirstTraversal do |obj|
      break if visitor.done?
      visitor.visit(obj)
    end
  end

  def each(&block)
    depthFirstTraversal do |obj, mode|
      block.call(obj) if mode == PREVISIT
    end
  end


  class Iterator < Opus8::Iterator

    def initialize(tree)
      @stack = StackAsLinkedList.new
      @stack.push(tree) if not tree.empty?
    end

    def more?
      not @stack.empty?
    end

    def succ
      if more?
        top = @stack.pop
        i = top.degree - 1
        while i >= 0
          subtree = top.getSubtree(i)
          @stack.push(subtree) if not subtree.empty?
          i -= 1
        end
        result = top.key
      else
        result = nil
      end
      return result
    end

  end

  def iter
    Iterator.new(self)
  end

end