=begin
Given an m x n matrix mat, return an array of all the elements of the array in a diagonal order.

Examples:

Input: mat = [[1,2,3],[4,5,6],[7,8,9]]
Output: [1,2,4,7,5,3,6,8,9]

Input: mat = [[1,2],[3,4]]
Output: [1,2,3,4]

Analysis
matrix = nil

matrix = [
  []
]

matrix = [
  [1]
]

matrix = [
  [1, 2]
]

matrix = [
  [1],
  [2]
]

matrix = [
  [1, 2],
  [3, 4]
]

matrix = [
  [1, 2, 3],
  [4, 5, 6]
]

matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]
=end

def diagonal_traverse(matrix)
  result = []

  return result if matrix.nil? || matrix.empty?

  element_count = matrix.length * matrix[0].length
  row_index = 0
  column_index = 0

  while result.length <= element_count
    if element_count == 1
      result << matrix[row_index][column_index]

      break
    end

    break
  end

  return result
end


require 'minitest/autorun'

describe 'assertions' do
  it 'is []' do
    assert_equal(diagonal_traverse([]), [])
  end

  it 'is [1]' do
    assert_equal(diagonal_traverse([[1]]), [1])
  end

  it 'is [1, 2]' do
    assert_equal(diagonal_traverse([[1, 2]]), [1, 2])
  end

  # it 'is [1, 2, 3, 4]' do
  #   assert_equal(diagonal_traverse([[1, 2], [3, 4]]), [1, 2, 3, 4])
  # end

  # it 'is [1, 2, 4, 5, 3, 6]' do
  #   assert_equal(diagonal_traverse([[1, 2, 3], [4, 5, 6]]), [1, 2, 4, 5, 3, 6])
  # end
end
