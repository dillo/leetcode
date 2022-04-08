=begin
Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

Example 1:

Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]
Example 2:

Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
Explanation: [9,4] is also accepted.
=end

def array_intersection(nums1, nums2)
  return [] if nums1.empty? || nums2.empty?

  memo = {}
  intersection = []

  nums1.each do |num|
    if memo.key?(num)
      memo[num] += 1
    else
      memo[num] = 1
    end
  end

  nums2.each do |num|
    if memo[num] && memo[num] > 0
      intersection << num

      memo[num] -= 1
    end
  end

  return intersection
end

require 'minitest/autorun'

describe 'assertions' do
  it 'case 1' do
    assert_equal(array_intersection([], []), [])
  end

  it 'case 2' do
    assert_equal(array_intersection([1, 2], []), [])
  end

  it 'case 3' do
    assert_equal(array_intersection([1], [1]), [1])
  end

  it 'case 4' do
    assert_equal(array_intersection([1,2,2,1], [2,2]), [2,2])
  end

  it 'case 5' do
    assert_equal(array_intersection([4,9,5], [9,4,9,8,4]), [9, 4])
  end
end
