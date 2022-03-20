=begin
Write a function that reverses a string. The input string is given as an array of characters s.

You must do this by modifying the input array in-place with O(1) extra memory.

Example 1:

Input: s = ["h","e","l","l","o"]
Output: ["o","l","l","e","h"]
Example 2:

Input: s = ["H","a","n","n","a","h"]
Output: ["h","a","n","n","a","H"]
=end

def reverse_string(str)
  return [] if str.nil? || str.length < 1

  str_arr = str.each_char.to_a

  return str_arr if str_arr.length == 1

  for i in 0...str_arr.length/2 do
    j = str_arr.length - i - 1
    cache_i = str_arr[i]
    str_arr[i] = str_arr[j]
    str_arr[j] = cache_i
  end

  return str_arr
end

require 'minitest/autorun'

describe 'assertions' do
  it 'is an empty array if blank' do
    assert_equal(reverse_string(''), [])
  end

  it "returns ['a']" do
    assert_equal(reverse_string('a'), ['a'])
  end

  it "returns ['d', 'c', 'b', 'a']" do
    assert_equal(reverse_string('abcd'), ['d', 'c', 'b', 'a'])
  end
end
