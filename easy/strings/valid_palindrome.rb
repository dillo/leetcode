=begin
A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters,
it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise.

Example 1:

Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
Example 2:

Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.
Example 3:

Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.
=end

# O(n) time | O(n) space
# def valid_palindrome?(str)
#   return false if str.nil?

#   str.gsub!(/[^a-zA-Z0-9]/, '')

#   return true if str == ''

#   left = 0
#   right = str.length - 1

#   while left < right
#     return false if str[left].downcase != str[right].downcase

#     left += 1
#     right -= 1
#   end

#   return true
# end

# O(n) time | O(1) space
# def valid_palindrome?(str)
#   return false if str.nil?

#   return true if str == ''

#   left = 0
#   right = str.length - 1

#   while left < right
#     while left < right && !str[left].match(/[a-zA-Z0-9]/)
#       left += 1
#     end

#     while right > left && !str[right].match(/[a-zA-Z0-9]/)
#       right -= 1
#     end

#     if str[left].downcase != str[right].downcase
#       return false
#     else
#       left += 1
#       right -= 1
#     end
#   end

#   return true
# end

# O(n) time | O(n) space
def valid_palindrome?(str)
  return false if str.nil?

  str.gsub!(/[^a-zA-Z0-9]/, '')

  return true if str == ''

  left = 0
  right = str.length - 1

  while left < right
    if str[left].downcase != str[right].downcase
      return false
    else
      left += 1
      right -= 1
    end
  end

  return true
end

require 'minitest/autorun'

describe 'assertions' do
  it 'should return false for nil' do
    assert_equal(valid_palindrome?(nil), false)
  end

  it 'should return true for ''' do
    assert_equal(valid_palindrome?(''), true)
  end

  it 'should return true for a' do
    assert_equal(valid_palindrome?('a'), true)
  end

  it 'should return false for ab' do
    assert_equal(valid_palindrome?('ab'), false)
  end

  it 'should return true for aba' do
    assert_equal(valid_palindrome?('aba'), true)
  end

  it 'should return true for `A man, a plan, a[ canal: Panama`' do
    assert_equal(valid_palindrome?('A man, a plan, a[ canal: Panama'), true)
  end

  it 'should return true for .,' do
    assert_equal(valid_palindrome?('.,'), true)
  end

  it 'should return true for a.' do
    assert_equal(valid_palindrome?('a.'), true)
  end

  it 'should return true for ,' do
    assert_equal(valid_palindrome?(','), true)
  end

  it 'should return for ' '' do
    assert_equal(valid_palindrome?(' '), true)
  end
end
