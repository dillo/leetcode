=begin
Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

A subarray is a contiguous part of an array.

Example 1:

Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
Example 2:

Input: nums = [1]
Output: 1
Example 3:

Input: nums = [5,4,-1,7,8]
Output: 23
=end

def max_subarray(arr)
  return arr.pop if arr.length == 1
end

require 'minitest/autorun'

describe 'assertions' do
  it 'returns the max value 1' do
    assert_equal(max_subarray([10]), 10)
  end

  it 'returns the max value 2' do
    assert_equal(max_subarray([10]), 10)
  end

  it 'returns the max value 3' do
    assert_equal(max_subarray([7, -1]), 7)
  end
end
