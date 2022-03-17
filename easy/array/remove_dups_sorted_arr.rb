=begin
Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same.

Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.

Return k after placing the final result in the first k slots of nums.

Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.
=end

def remove_duplicates(nums)
  return 0 if nums.empty?
  return 1 if nums.length == 1

  uniq_count = 1
  left_index = 0
  right_index = 1

  while left_index < nums.length - 1 && right_index < nums.length
    if nums[left_index] == nums[right_index]
      nums[right_index] = nil
    else
      nums[left_index + 1] = nums[right_index]
      left_index += 1
      uniq_count += 1
    end

    right_index += 1
  end

  return uniq_count
end

require 'minitest/autorun'

describe 'assertions' do
  it 'returns 0 when empty array' do
    assert_equal(remove_duplicates([]), 0)
  end

  it 'returns the number from a single element array' do
    assert_equal(remove_duplicates([7]), 1)
  end

  it 'returns 1' do
    assert_equal(remove_duplicates([1, 1]), 1)
  end

  it 'returns 1' do
    assert_equal(remove_duplicates([1, 1, 1]), 1)
  end

  it 'returns 2' do
    assert_equal(remove_duplicates([1, 2]), 2)
  end

  it 'returns 2' do
    assert_equal(remove_duplicates([1, 1, 3]), 2)
  end

  it 'returns 3' do
    assert_equal(remove_duplicates([1, 2, 3]), 3)
  end

  it 'returns 2' do
    assert_equal(remove_duplicates([1, 1, 3, 3]), 2)
  end

  it 'returns 8' do
    assert_equal(remove_duplicates([-1, -1, 0, 1, 1, 3, 4, 6, 6, 9, 9, 13]), 8)
  end

  it 'returns 5' do
    assert_equal(remove_duplicates([0,0,1,1,1,2,2,3,3,4]), 5)
  end
end

