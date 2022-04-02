=begin
Given an array, rotate the array to the right by k steps, where k is non-negative.

Input: nums = [1,2,3,4,5,6,7], k = 3
Output: [5,6,7,1,2,3,4]
Explanation:
rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]

Input: nums = [-1,-100,3,99], k = 2
Output: [3,99,-1,-100]
Explanation:
rotate 1 steps to the right: [99,-1,-100,3]
rotate 2 steps to the right: [3,99,-1,-100]
=end

# O(n) time | O(n) space
# def rotate_array(nums, k)
#   return nums if nums.length <= 1

#   rotated = Array.new(nums.length, 0)

#   for i in 0...nums.length do
#     rotated[(i + k) % nums.length] = nums[i]
#   end

#   return rotated
# end

# O(n) time | O(1) space
def rotate_array(nums, k)
  return nums if nums.length <= 1

  k = k % nums.length

  reverse(nums, 0, nums.length - 1)
  reverse(nums, 0, k - 1)
  reverse(nums, k, nums.length - 1)

  return nums
end

def reverse(array, left, right)
  while left < right
    array[left], array[right] = array[right], array[left]
    left += 1
    right -= 1
  end
end

require 'minitest/autorun'

describe 'assertions' do
  it 'case 1' do
    assert_equal(rotate_array([1], 9), [1])
  end

  it 'case 2' do
    assert_equal(rotate_array([1, 2], 1), [2, 1])
  end

  it 'case 3' do
    assert_equal(rotate_array([1, 2], 2), [1, 2])
  end

  it 'case 3' do
    assert_equal(rotate_array([1,2,3,4,5,6,7], 3), [5,6,7,1,2,3,4])
  end

  it 'case 3' do
    assert_equal(rotate_array([-1,-100,3,99], 2), [3,99,-1,-100])
  end
end
