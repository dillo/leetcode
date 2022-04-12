=begin
Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
=end

def contains_duplicate?(nums)
  return false if nums.length <= 1

  i = 0
  prev_nums = {}

  while i < nums.length
    if prev_nums.key?(nums[i])
      return true
    else
      prev_nums[nums[i]] = i
      i += 1
    end
  end

  return false
end

require 'minitest/autorun'

describe 'assertions' do
  it 'should return false for [1]' do
    assert_equal(contains_duplicate?([1]), false)
  end

  it 'should return false for []' do
    assert_equal(contains_duplicate?([]), false)
  end

  it 'should return true for [1,1]' do
    assert_equal(contains_duplicate?([1, 1]), true)
  end

  it 'should return false for [1,2]' do
    assert_equal(contains_duplicate?([1, 2]), false)
  end

  it 'should return true for [1,2,3,1]' do
    assert_equal(contains_duplicate?([1, 2, 3, 1]), true)
  end

  it 'should return false for [1,2,3,4]' do
    assert_equal(contains_duplicate?([1,2,3,4]), false)
  end

  it 'should return true for [1,1,1,3,3,4,3,2,4,2]' do
    assert_equal(contains_duplicate?([1,1,1,3,3,4,3,2,4,2]), true)
  end
end
