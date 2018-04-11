# Concept
# (The blockquote style does not look so well so I just pasted directly, but these are all quoted from the links in the
# bottom of this page)
# You should not implement `to_str` unless your object acts like a string, rather than just having a string
# *representation*. The only core class that implements `to_str` is String itself.
# [to_i and to_s] are not particularly strict: if an object has some kind of decent representation as a string, for
# example, it will probably have a to_s method… [to_int and to_str] are strict conversion functions: you implement them
# only if you object can naturally be used every place a string or an integer could be used.
# `to_str` is used by methods such as `String#concat` to convert their arguments to a string. Unlike to_s, which is
# supported by almost all classes, `to_str` is normally implemented only by those classes that act like strings. Of the
# built-in classes, only `Exception` and `String` implement `to_str`
# `print`, `puts` and string interpolation(`#{}` syntax) use `to_s`. Mostly everything else (`glob`, `split`, `match`,
# string concatenation) uses `to_str`.
## Simple Summary
# `to_s` is defined on every object and will always return something.
# `to_str` is only defined on objects that are string-like. For example, `Symbol` has `to_str` but `Array` does not.
# Thus, you can use `obj.respond_to?(:to_str)` instead of something like `obj.is_a?(String)` if you want to take
# advantage of duck typing without worrying about whether the class you're working with is a subclass of `String` or not.
# The documentation for `Exception#to_str` reads: "By supplying a `to_str` method, exceptions are agreeing to be used
# where `Strings` are expected." So it's all about expectations.
# `to_s`: Give me a String no matter what!
# `to_str`: I am pretty sure you are String-like. So sure, that I'd prefer to get a NoMethodException in the case where
# you're not.
# Use case?
# Borrowed from Confident Ruby.
# ruby
class ArticleTitle
  def initialize(text)
    @text = text
  end

  def slug
    @text.strip.tr_s('^A-Za-z0-9', '-').downcase
  end

  def to_str
    puts 'to_str called'
    @text
  end
end
title = ArticleTitle.new('A Modest Proposal')
# By defining #to_str, ArticleTitle can be used in places Ruby expects
# a String:
puts 'Today’s Feature: ' + title
# => "to_str called"
# => "Today’s Feature: A Modest Proposal"
