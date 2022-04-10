=begin
Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Note that you must do this in-place without making a copy of the array.

Example 1:

Input: nums = [0,1,0,3,12]
Output: [1,3,12,0,0]
Example 2:

Input: nums = [0]
Output: [0]
=end

def move_zeroes(nums)
  return nums if nums.length <= 1

  pointer = 0

  nums.each_with_index do |num, idx|
    if num != 0
      nums[pointer], nums[idx] = nums[idx], nums[pointer]

      pointer += 1
    else
      next
    end
  end

  return nums
end

require 'minitest/autorun'

describe 'assertions' do
  it 'should return [0] for [0]' do
    assert_equal(move_zeroes([0]), [0])
  end

  it 'should return [2] for [2]' do
    assert_equal(move_zeroes([2]), [2])
  end

  it 'should return [0,1] for [1,0]' do
    assert_equal(move_zeroes([0,1]), [1,0])
  end

  it 'should return [0,1,0,3,12] for [1,3,12,0,0]' do
    assert_equal(move_zeroes([0,1,0,3,12]), [1,3,12,0,0])
  end
end
