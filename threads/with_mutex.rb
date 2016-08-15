# Mutexes provide a mechanism for multiply threads to synchronize access to a critical portion of code. It helps bring some order and some guaranty to the world of multi-threaded chaos.
# In this program, since any thread has to lock the mutex before it can push to the Array, there's a guarantee that no two threads will be performing this operation at the same time. In other words, this operation can no longer be interrupted before it's completed. Once one thread begins pushing to the Array, no other threads will be able to enter that portion of code until the first thread is finished. This operation is now thread-safe.

shared_array = Array.new
# Notice that the mutex is shared among all the threads. The guarantee only works if the threads are sharing the same Mutex instance. In this way, when one thread locks a mutex, others have to wait for it to be unlocked.
mutex = Mutex.new

10.times.map do
  Thread.new do
    1000.times do
      # Thread lock mutex and become owner, could be one one owner
      # Now only one thread can run wrapper code and update
      mutex.lock
      shared_array << nil
      mutex.unlock
      # After unlock mutex other threads can lock mutex

      # Other convenience method to do same
      # mutex.synchronize { shared_array << nil }
    end
  end
end.each(&:join)

# Here you can see that we have 10 * 10000 elements in array

puts shared_array.size

# Now all are same, because of mutex/
# The mutex sets up same boundaries for the thread. The first thread that hits this bit of code will lock the mutex. it then becomes the owner of that mutex.
# Until the owning thread unlocks the mutex, no other thread can lock it.


# $ ruby  => 10000
# $ jruby => 10000
# $ rbx => 1000


