=begin
Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

Example 1:

Input: x = 123
Output: 321
Example 2:

Input: x = -123
Output: -321
Example 3:

Input: x = 120
Output: 21

Constraints:

-231 <= x <= 231 - 1
=end

def reverse_integer(num)
  result = 0
  negative = num.negative?
  num = num.abs

  while num > 0
    current = num % 10
    result = result * 10 + current
    num /= 10
  end

  return 0 unless result<2**31

  negative ? -result : result
end

require 'minitest/autorun'

describe 'assertions' do
  it 'should return 1 for 1' do
    assert_equal(reverse_integer(1), 1)
  end

  it 'should return 963 for 369' do
    assert_equal(reverse_integer(369), 963)
  end

  it 'should return -321 for -123' do
    assert_equal(reverse_integer(-123), -321)
  end

  it 'should return 0 for 1534236469' do
    assert_equal(reverse_integer(1534236469), 0)
  end
end
