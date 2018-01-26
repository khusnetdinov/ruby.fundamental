# An object, called the subject, maintains a list of its dependents, called
# observers, and notifies them automatically of any state changes, usually by
# calling one of their methods.

module Observable
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer unless @observers.include?(observer)
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each { |x| x.update(self) }
  end
end

class Employee
  include Observable

  attr_reader :name
  attr_accessor :title, :salary

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end
end

class BaseObserver
  def update
    raise 'Must be implement "update" function'
  end
end

class Payroll < BaseObserver
  def update(employee)
    p("Cut a new check for #{employee.name}!")
    p("His salary is now #{employee.salary}!")
  end
end

class TaxMan < BaseObserver
  def update(employee)
    p("Send #{employee.name} a new tax bill!")
  end
end

# Usage
mike = Employee.new('Mike', 'project manger', 25_000)

mike.add_observer(Payroll.new)
mike.add_observer(TaxMan.new)

mike.salary = 35_000
mike.title = 'senior project manger'
mike.notify_observers
