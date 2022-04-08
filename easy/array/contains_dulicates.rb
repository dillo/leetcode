=begin
Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
=end

def contains_duplicate?(nums)
  return false if nums.length <= 1

  prev_nums = {}

  nums.each_with_index do |num, idx|
    if prev_nums.key?(num)
      return true
    else
      prev_nums[num] = idx
    end
  end

  return false
end

require 'minitest/autorun'

describe 'assertions' do
  it 'case 1' do
    assert_equal(contains_duplicate?([1]), false)
  end

  it 'case 2' do
    assert_equal(contains_duplicate?([]), false)
  end

  it 'case 3' do
    assert_equal(contains_duplicate?([1, 1]), true)
  end

  it 'case 4' do
    assert_equal(contains_duplicate?([1, 2]), false)
  end

  it 'case 5' do
    assert_equal(contains_duplicate?([1, 2, 3, 1]), true)
  end

  it 'case 6' do
    assert_equal(contains_duplicate?([1,2,3,4]), false)
  end

  it 'case 7' do
    assert_equal(contains_duplicate?([1,1,1,3,3,4,3,2,4,2]), true)
  end
end
