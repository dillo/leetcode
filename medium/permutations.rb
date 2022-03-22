=begin
Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

Example 1:

Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
Example 2:

Input: nums = [0,1]
Output: [[0,1],[1,0]]
Example 3:

Input: nums = [1]
Output: [[1]]
=end

def permutations(list)
  results = []

  results << list if list.length == 1

  return results
end

require 'minitest/autorun'

describe 'assertions' do
  it 'returns the permutations 1' do
    assert_equal(permutations([7]), [[7]])
  end

  it 'returns the permutations 1' do
    assert_equal(permutations([1, 2]), [[1, 2], [2, 1]])
  end
end
