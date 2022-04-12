﻿=begin
You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

Increment the large integer by one and return the resulting array of digits.

Example 1:

Input: digits = [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.
Incrementing by one gives 123 + 1 = 124.
Thus, the result should be [1,2,4].
Example 2:

Input: digits = [4,3,2,1]
Output: [4,3,2,2]
Explanation: The array represents the integer 4321.
Incrementing by one gives 4321 + 1 = 4322.
Thus, the result should be [4,3,2,2].
Example 3:

Input: digits = [9]
Output: [1,0]
Explanation: The array represents the integer 9.
Incrementing by one gives 9 + 1 = 10.
Thus, the result should be [1,0].
=end

# O(n) time | O(n) space
def plus_one(digits)
  i = 0

  while i < digits.length
    j = digits.length - 1 - i

    if digits[j] == 9
      digits[j] = 0
    else
      digits[j] += 1

      return digits
    end

    i += 1
  end

  return digits.unshift(1)
end

require 'minitest/autorun'

describe 'assertions' do
  it 'should return [1,2,4] for [1,2,3]' do
    assert_equal([1,2,4], plus_one([1,2,3]))
  end

  it 'should return [4,3,2,2] for [4,3,2,1]' do
    assert_equal([4,3,2,2], plus_one([4,3,2,1]))
  end

  it 'should return [1,0] for [9]' do
    assert_equal([1,0], plus_one([9]))
  end

  it 'should return [1,0,0,0] for [9,9,9]' do
    assert_equal([1,0,0,0], plus_one([9,9,9]))
  end
end
