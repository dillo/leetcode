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
  i = 0

  while i < nums1.length
    if memo.key?(nums1[i])
      memo[nums1[i]] += 1
    else
      memo[nums1[i]] = 1
    end

    i += 1
  end

  i = 0

  while i < nums2.length
    if memo[nums2[i]] && memo[nums2[i]] > 0
      intersection << nums2[i]

      memo[nums2[i]] -= 1
    end

    i += 1
  end

  return intersection
end

require 'minitest/autorun'

describe 'assertions' do
  it 'should return [] for ([], [])' do
    assert_equal(array_intersection([], []), [])
  end

  it 'should return [] for ([1,2], [])' do
    assert_equal(array_intersection([1, 2], []), [])
  end

  it 'should return [1] for [1]' do
    assert_equal(array_intersection([1], [1]), [1])
  end

  it 'should return [2,2] for ([1,2,2,1], [2,2])' do
    assert_equal(array_intersection([1,2,2,1], [2,2]), [2,2])
  end

  it 'should return [9, 4] for ([4,9,5], [9,4,9,8,4])' do
    assert_equal(array_intersection([4,9,5], [9,4,9,8,4]), [9, 4])
  end
end
