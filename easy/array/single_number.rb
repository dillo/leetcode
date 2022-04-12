=begin
Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

You must implement a solution with a linear runtime complexity and use only constant extra space.
=end

# O(n) time | O(1) space
# def single_number(nums)
#   i = 0
#   non_dup = 0

#   while i < nums.length
#       non_dup ^= nums[i]
#       i += 1
#   end

#   return non_dup
# end

def single_number(nums)
  return nums.pop if nums.length <= 1

  memo = {}

  nums.each_with_index do |num, i|
    if memo.key?(num)
      memo[num] += 1
    else
      memo[num] = 1
    end
  end

  memo.keys.find { |e| e > 1 }
end

require 'minitest/autorun'

describe 'assertions' do
  it 'should return 1 for [1]' do
    assert_equal(single_number([1]), 1)
  end

  it 'should return 2 for [1,1,2]' do
    assert_equal(single_number([1, 1, 2]), 2)
  end

  it 'should return 4 for [4,1,2,1,2]' do
    assert_equal(single_number([4, 1, 2, 1, 2]), 4)
  end
end
