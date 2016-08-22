# 1 - The time required to fetch a reference to an object from memory is a constant,
# T_fetch, and the time required to store a reference to an object in memory is
# a constant, T_store

y = x

# According to Axiom, the assignment statement has running time T_fetch + T_store.
# That is, the time taken to fetch the object reference from variable x is
# T_fetch and the time taken to store that object reference in the variable y is
# T_store.

y = 1

# Also has running time T_fetch + T_store. To see why this should be the case,
# consider that the constant '1' names a Fixnum object with value one. Therefore,
# we can expect the cost of fetching the reference to the object named 1 is the
# same as that of fetching a reference to any other object.


# 2 - The times required to perform elementary arithmetic operations, such as
# addition, subtraction, multiplication, division, and comparison, are all
# constants. These times are denoted by T_+, T_-, T_/, T_*, and T_<, respectively.

y = y + 1

# We can determine time of a statement like is 2 * T_fetch + T_+ + T_store. This
# is because we need to fetch two object references from the variables y and 1;
# perform the addition giving a new object whose value is the sum; and, store
# a reference to the new object in the variable y.
# Ruby syntax provides an alternative way to express the same computation:

y += 1

# We shall assume that the alternative requires exactly the same running time as
# the original statement.


# 3 - The time required to call a method is a constant, T_call, and the time
# required to return from a method is a constant, T_return
# The rationale for making the overhead associated with parameter passing the
# same as the time to store an object reference is that the passing of an
# argument is conceptually the same as assignment of the actual parameter value
# to the formal parameter of the method.

y = f(x)

# According to Axiom, the running time of the statement would be
# T_fetch + 2 * T_store + T_call + T_f(x), where T_f(x) is the running time of
# method f for input x. The first of the two stores is due to the passing of the
# parameter x to the method f; the second arises from the assignment to the variable y.


# 4 - The time required for the address calculation implied by an array
# subscripting operation, e.g., a[i], is a constant, T_[]. This time does not
# include the time to compute the subscript expression, nor does it include the
# time to access the array element.

y = a[i]

# This is 3 * T_fetch Three operand fetches are required: the first to fetch a
# reference to the array object a; the second to fetch a reference to the index
# object i; and, the third to fetch a reference to the array element a[i].


# 5 - The time required to create a new object instance of a class is a constant,
# T_new. This time does not include any time taken to initialize the object.
# By applying Axioms we can determine that the running time of the statement

i = Fixnum.new(0)

# is  T_new + T_fetch + 2 * T_store + T_call + T_fixnum_init, where T_fixnum_init
# is the running time of the initialize method of the class Fixnum.


# Example - In this section we apply Axioms, the analysis of the running time of a
# program to compute the following simple arithmetic series summation

def sum(n)
  result = 0        # T_fetch + T_store
  i = 1             # T_fetch + T_store
  while i <= n      # (2 * T_fetch + T_<) * (n - 1)
    result += i     # (2 * T_fetch + T_+ + T_store) * n
    i += 1          # (2 * T_fetch + T_+ + T_store) * n
  end
  return result     # T_return + T_fetch
end

# Total: (6 * T_fetch + 2 * T_store + T_< + 2 * T_+) * n + (5 * T_fetch + 2 * T_store + T_< + T_return)
# T(n) = t1 * n + t2