=begin
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]
=end

def two_sum(nums, target)
  memo = {}
  i = 0

  while i < nums.length
    diff = target - nums[i]

    if memo[diff]
      return [memo[diff], i]
    else
      memo[nums[i]] = i
      i += 1
    end
  end
end

require 'minitest/autorun'

describe 'assertions' do
  it 'should return [0, 1] for ([1, 2], 3)' do
    assert_equal(two_sum([1, 2], 3), [0, 1])
  end

  it 'should return [0, 1] for ([2,7,11,15], 9)' do
    assert_equal(two_sum([2,7,11,15], 9), [0, 1])
  end
end
