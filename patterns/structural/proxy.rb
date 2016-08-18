# When building a proxy, we could implement a method for each method in the
# underlying object. However, this leads to a lot of repeated code and tightly
# couples the proxy with the underlying object. A better alternative is to pass
# method calls direcly to the underlying object. Ruby includes a method that is
# perfect for this situation called method_missing.

# Object witch is decorated
class BankAccount
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    balance += amount
  end

  def withdraw(amount)
    balance -= amount
  end
end

# Proxy
# Do not use attr_reader for accessing to proxy object
class BankAccountProxy
  def initialize(real_object)
    @real_object = real_object
  end

  def balance
    @real_object.balance
  end

  def deposit(amount)
    @real_object.deposit(amount)
  end

  def withdraw(amount)
    @real_object.withdraw(amount)
  end
end

# Protection proxy
# Are you working on an MNC? If so, we might be well aware of the proxy server
# that provides us internet by restricting access to some sort of websites like
# public e-mail, social networking, data storage etc. The management feels that,
# it is better to block some content and provide only work related web pages.
# Proxy server does that job. This is a type of proxy design pattern
class BankAccountProtectionProxy
  def initialize(real_account, owner_name)
    @subject = real_account
    @owner_name = owner_name
  end

  def deposit(amount)
    check_access
    @subject.deposit(amount)
  end

  def withdraw(amount)
    check_access
    @subject.withdraw(amount)
  end

  def balance
    check_access
    @subject.balance
  end

  def check_access
    # Implementation
  end
end

# Virtual proxy
# In place of a complex or heavy object, use a skeleton representation. When an
# underlying image is huge in size, just represent it using a virtual proxy
# object and on demand load the real object. You know that the real object is
# expensive in terms of instantiation and so without the real need we are not
# going to use the real object. Until the need arises we will use the virtual proxy.
class BankAccountVirtualProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def deposit(amount)
    subject.deposit(amount)
  end

  def withdraw(amount)
    subject.withdraw(amount)
  end

  def balance
    subject.balance
  end

  def subject
    @subject ||= @creation_block.call
  end
end

# Remote proxy
# In distributed object communication, a local object represents a remote object
# (one that belongs to a different address space). The local object is a proxy
# for the remote object, and method invocation on the local object results in
# remote method invocation on the remote object. Think of an ATM implementation,
# it will hold proxy objects for bank information that exists in the remote server.

# Server part
class BankAccountRemoteProxy
  # implementation
end

URI = 'druby://path_to_domain:port'
DRb.start_service(URI, BankAccountRemoteProxy.new)
DRb.thread.join

# Client part
URI = 'druby://path_to_domain:port'
proxy = DRbObject.new_with_uri(URI)
proxy.balance
