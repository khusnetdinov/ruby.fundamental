# coding: utf-8
# .any? does not mean “any elements?”! # With block: “do any make the block true?”
# Without: “are any truthy?” Has implicit block: { |element| element }

[].any?
# => false

[1].any?
# => true

[:foo, :bar].any?
# => true

# ok so far, BUT:

[nil].any?
# => false

[false].any?
# => false

[false, nil].any?
# => false
