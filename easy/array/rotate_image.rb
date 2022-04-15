=begin
You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

Example 1:

Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]
Example 2:

Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

Constraints:

n == matrix.length == matrix[i].length
1 <= n <= 20
-1000 <= matrix[i][j] <= 1000
=end

def rotate_image(matrix)
  height = matrix.length
  width = matrix[0].length

  return matrix if height == 1 && width == 1

  results = Array.new([height, width].max) { Array.new([height, width].min) }

  for i in 0...height
    for j in 0...width
      results[j][i] = matrix[i][j]
    end
  end

  for i in 0...results.length
    left, right = 0, results[i].length - 1

    while left < right
      results[i][left], results[i][right] = results[i][right], results[i][left]
      left += 1
      right -= 1
    end
  end

  return results
end

require 'minitest/autorun'

describe 'assertions' do
  it 'should return [[1]] for [[1]]' do
    assert_equal([[1]], rotate_image([[1]]))
  end

  it 'should return [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]] for [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]' do
    assert_equal([[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]], rotate_image([[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]))
  end
end
